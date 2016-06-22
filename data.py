from db import db

'''
本类主要是通过各种指定的条件从数据库中获取需要采集的url地址的相关信息
'''


class Data:
    def __init__(self):
        self.database = db()

    # 根据指定条件检索出需要进行采集的url
    # typical 1-列表页，2-详情页
    def urls(self, typical):
        if typical == 1:
            table = 'sp_list_urls'
        else:
            table = 'sp_detail_urls'
        sql = 'select * FROM %s WHERE status=1' % table
        data = self.database.findall(sql)
        return data

    def __del__(self):
        self.database.conn.close()


if __name__ == '__main__':
    data = Data()
    urls = data.urls(1)
    print(urls)
