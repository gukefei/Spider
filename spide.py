from listspider import ListSpider
from db import db


class spide:
    def __init__(self):
        self.database = db()

    # 详情页采集
    def detailSpide(self):
        pass

    # 列表页采集
    def listSpide(self, data):
        for p in data:
            spider = ListSpider()
            spider.spide(p['id'])
        pass

    # 根据指定条件检索出需要进行采集的url
    # typical 1-列表页，2-详情页
    def urls(self, typical):
        if typical == 1:
            table = 'sp_list_urls'
        else:
            table = 'sp_detail_urls'
        sql = 'select * FROM %s WHERE id=2' % table
        data = self.database.findall(sql)
        return data

    def __del__(self):
        self.database.conn.close()


if __name__ == '__main__':
    spide = spide()
    urls=spide.urls(1)
    print(urls)
    pass
else:
    pass
