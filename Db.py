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
        self.cursor = self.conn.cursor(pymysql.cursors.DictCursor)

    def insert(self, table, data, cursor=''):
        """
        插入成功则返回主键id，否则返回0
        :param table:
        :param data:
        :param cursor:
        :return:
        """
        if cursor == '':
            cursor = self.cursor
        sql = self.insert_sql(table, data)
        try:
            cursor.execute(sql, data)
            insert_id = self.conn.insert_id()
            self.conn.commit()
            return insert_id
        except:
            self.conn.rollback()
            return 0

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

    def insert_sql(self, table, data):
        """
        将字典数据格式化为可插入到数据库中的sql脚本并返回
        :param table:
        :param data: 插入到数据库中的字典数据
        :return:
        """
        fields = data.keys()
        fieldstr = ''
        valuestr = ''
        for f in fields:
            fieldstr += f + ','
            valuestr = valuestr + '%(' + f + ')s,'
        fieldstr = fieldstr[0:-1]
        valuestr = valuestr[0:-1]
        sql = 'INSERT INTO ' + table + '(' + fieldstr + ') VALUES(' + valuestr + ')'
        return sql
