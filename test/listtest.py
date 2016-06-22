from selenium import webdriver
from pyquery import PyQuery as pq
import re


class spideTest:
    phantomjs_path = r'C:\Users\malama_sz01\Desktop\phantomjs-2.1.1-windows\bin\phantomjs.exe'

    # 去除html标签
    def __init__(self, url):
        self.url = url
        self.browser = webdriver.PhantomJS(self.phantomjs_path)
        self.browser.get(url)
        self.content = self.browser.page_source
        self.doc = pq(self.content)

    '''
    抽取规则，1-text,2-attr,3-html
    属性方式抽取时的属性名称
    '''

    def detail(self, pattern, pattern_detail, rule=1, attrbute='src'):
        # 商品各种详细数据的分析
        goods = self.doc(pattern)
        i = 0
        products = dict()
        for p in goods:
            product = pq(p)
            if rule == 1:
                data = product(pattern_detail).text()
            elif rule == 2:
                data = product(pattern_detail).attr(attrbute)
            else:
                data = product(pattern_detail).html()
            print(str(i) + '---' + data)
            i += 1

    def stripHtml(html):
        p = re.compile(r'<[^>]+>', re.S)
        html = p.sub('', html)
        return html


if __name__ == '__main__':
    url = 'https://www.amazon.com/b/ref=s9_acss_bw_cg_BeautCat_2a1?node=11060451&pf_rd_m=ATVPDKIKX0DER&pf_rd_s='
    pattern = 'ul.s-result-list li'
    pattern_detail = '.s-consumables-image a'
    rule = 2  # 抽取规则，1-text,2-attr,3-html
    attr = 'href'
    test = spideTest(url)
    test.detail(pattern, pattern_detail, rule, attr)
