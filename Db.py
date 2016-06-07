import pymysql
import configparser


# Mysql 数据库连接类
class Db:
    def __init__(self):
        cp = configparser.ConfigParser()
        cp.read('./config.conf')
        self.host = cp.get('mysql', 'db_host')
        self.user = cp.get('mysql', 'db_user')
        self.pwd = cp.get('mysql', 'db_pwd')
        self.database = cp.get('mysql', 'db_name')
        self.port = cp.getint('mysql', 'db_port')
        self.charset = cp.get('mysql', 'db_charset')

    def connect(self):
        conn = pymysql.connect(self.host, self.user, self.pwd, self.database, charset=self.charset, port=self.port)
        return conn
