import pymysql
from config import config


# Mysql 数据库连接类
class db:
    def __init__(self):
        conf = config()
        self.host = conf.mysql_host
        self.user = conf.mysql_user
        self.pwd = conf.mysql_pwd
        self.database = conf.mysql_database
        self.port = conf.mysql_port
        self.charset = conf.mysql_charset
        self.conn = pymysql.connect(self.host, self.user, self.pwd, self.database, charset=self.charset, port=self.port)
        self.cursor()

    def cursor(self):
        self.cursor = self.conn.cursor(pymysql.cursors.DictCursor)
        return self.cursor

    def insert(self, table, data, cursor=''):
        if cursor == '':
            cursor = self.cursor
        fields = data.keys()
        values = []
        for f in fields:
            values.append(data[f])
        fields = str(tuple(fields))
        values = str(tuple(values))
        sql = 'INSERT INTO %s%s VALUES%s' % table, fields, values
        try:
            cursor.execute(sql)
            insert_id = self.conn.insert_id()
            self.conn.commit()
            return insert_id
        except:
            self.conn.rollback()
            return False

    def findone(self, sql, cursor=''):
        if cursor == '':
            cursor = self.cursor
        cursor.execute(sql)
        data = cursor.fetchone()
        return data

    def findall(self, sql, cursor=''):
        if cursor == '':
            cursor = self.cursor
        cursor.execute(sql)
        data = cursor.fetchall()
        return data
