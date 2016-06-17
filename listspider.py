from selenium import webdriver
from pyquery import PyQuery as pq
from config import config
from db import db
import re


class ListSpider:
    def __init__(self, url_id):
        self.database = db()
        sql = 'SELECT * FROM sp_urls WHERE ID=%d LIMIT 1' % url_id
        data = self.database.findone(sql)
        self.website_id = data['website_id']
        self.url = data['url']
        self.rule_id = data['rule_id']
        sql = 'SELECT * FROM sp_websites WHERE ID=%d LIMIT 1' % self.website_id
        data = self.database.findone(sql)
        self.currency = data['currency']
        sql = 'SELECT * FROM sp_list_pattern WHERE ID=%d LIMIT 1' % self.rule_id
        data = self.database.findone(sql)
        self.pattern = data['pattern']  # 通用采集范围规则
        self.name_pattern = data['name_pattern']  # 商品名称采集规则
        self.price_pattern = data['price_pattern']  # 价格采集规则
        self.img_pattern = data['img_pattern']  # 图片采集规则
        self.img_pattern_attr = data['img_pattern_attr']  # 图片抽取规则
        self.page = data['page']  # 页码变量名称
        self.page_step = data['page_step']  # 页码增幅
        self.detail_url = data['url_pattern']  # 商品详情页的链接地址
        self.detail_url_attr = data['url_pattern_attr']  # 商品详情页的抽取规则
        conf = config()
        self.__phantomjs = conf.phantomjs_path
        self.__list_spide_pages = conf.list_spide_pages

    def spide(self):
        page = 1
        products = dict()
        browser = webdriver.PhantomJS(self.__phantomjs)
        while page <= self.__list_spide_pages:  # 采集页数在配置文件设定的页数范围内时，开始进行采集
            if self.url == False:  # 没有采集url，则直接终止采集
                break
            browser.get(self.url)
            content = browser.page_source
            doc = pq(content)
            goods = doc(self.pattern)
            i = 0
            for p in goods:
                product = pq(p)
                good = dict()
                good['name'] = self.stripHtml(product(self.name_pattern).text())
                good['price'] = product(self.price_pattern).text()
                good['img'] = product(self.img_pattern).attr(self.img_pattern_attr)
                detail_url = product(self.detail_url).attr(self.detail_url_attr)
                detail_url_id = self.saveDetailUrl({"url": detail_url, "website_id": self.website_id})
                if detail_url_id != False:
                    detail_url_id = int(detail_url_id)
                else:
                    continue
                products[i] = good
                i += 1
            page += 1
        return products

    # 保存商品详情页的链接地址，同时返回新增记录的id
    def saveDetailUrl(self, data):
        d = self.database.insert( 'sp_detail_urls', data)
        return d

    # 去除html标签
    def stripHtml(self, html):
        p = re.compile(r'<[^>]+>', re.S)
        html = p.sub('', html)
        return html

    def __del__(self):
        self.database.conn.close()
