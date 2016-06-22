from listspider import ListSpider
from data import Data


class Spide:
    # 详情页采集
    def detailspide(self):
        pass

    # 列表页采集
    def list_spide(self, data):
        spider = ListSpider(data['id'])
        return spider.spide()


if __name__ == '__main__':
    data = Data()
    urls = data.urls(1)
    spide = Spide()
    spide.list_spide(urls)
    pass
