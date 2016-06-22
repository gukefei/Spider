from selenium import webdriver
from pyquery import PyQuery as pq
from config import config
from db import db
import re
from urllib import parse
import time


class ListSpider:
    def __init__(self, url_id):
        self.database = db()
        sql = 'SELECT * FROM sp_list_urls WHERE ID=%d LIMIT 1' % url_id
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
        self.page_step = int(data['page_step'])  # 页码增幅
        self.detail_url_pattern = data['url_pattern']  # 商品详情页的链接地址匹配规则
        self.detail_url_pattern_attr = data['url_pattern_attr']  # 商品详情页的抽取规则
        conf = config()
        self.__phantomjs = conf.phantomjs_path
        self.__list_spide_pages = conf.list_spide_pages
        self.__timewait = conf.timewait

    def spide(self):
        page = 1
        browser = webdriver.PhantomJS(self.__phantomjs)
        counter = 0  # 商品入库计数器
        while page <= self.__list_spide_pages:  # 采集页数在配置文件设定的页数范围内时，开始进行采集
            if self.url == False:  # 没有采集url，则直接终止采集
                break
            browser.get(self.url)
            time.sleep(self.__timewait)
            content = browser.page_source
            # self.import_to_html(page, content)
            doc = pq(content)
            goods = doc(self.pattern)
            for p in goods:
                product = pq(p)
                good = dict()
                good['name_cn'] = self.strip_html(product(self.name_pattern).text())
                price = product(self.price_pattern).text()
                pattern = re.compile(r'(\d+\.\d+)')
                match = pattern.search(price)
                good['price'] = match.group(0)
                good['img'] = product(self.img_pattern).attr(self.img_pattern_attr)
                good['currency'] = self.currency
                good['website_id'] = self.website_id
                detail_url = product(self.detail_url_pattern).attr(self.detail_url_pattern_attr)
                detail_url_id = self.save_detail_url({"url": detail_url, "website_id": self.website_id})  # 保存该商品的详情url
                if detail_url_id != False:
                    detail_url_id = int(detail_url_id)
                    good['url_id'] = detail_url_id
                    self.database.insert('sp_goods', good)
                    counter += 1
                else:
                    continue
            page_step = self.page_step * page
            self.url = self.page_url(self.url, self.page, page_step)
            page += 1
        browser.close()
        return counter

    # 处理翻页url地址
    # pagepara:url中用来标示翻页的变量名称
    # page:翻页变量的具体值
    def page_url(self, url, pagepara, page):
        urlinfo = parse.urlparse(url)
        query = urlinfo.query.split('&')
        p = dict()
        for q in query:
            param = q.split('=')
            p[param[0]] = parse.unquote(param[1])
        p[pagepara] = page
        url = urlinfo.scheme + '://' + urlinfo.netloc + urlinfo.path + '?' + parse.urlencode(p)
        if urlinfo.fragment != '':
            url += '#' + urlinfo.fragment
        return url

    # 保存商品详情页的链接地址，同时返回新增记录的id

    def save_detail_url(self, data):
        d = self.database.insert('sp_detail_urls', data)
        return d

    # 去除html标签
    @staticmethod
    def strip_html(html):
        p = re.compile(r'<[^>]+>', re.S)
        html = p.sub('', html)
        return html

    # 将列表页的html内容存储
    @staticmethod
    def import_to_html(url, html):
        fp = open('./html/' + str(url) + '.html', 'wb+')
        html = html.encode('utf-8')
        fp.write(html)
        fp.close()

    def __del__(self):
        self.database.conn.close()
