import configparser


# 解析配置文件
class config:
    def __init__(self):
        cp = configparser.ConfigParser()
        cp.read('./config.conf')
        self.list_spide_pages = cp.getint('default', 'list_spide_pages')
        self.timewait = cp.getint('default', 'timewait')
        self.mysql_host = cp.get('mysql', 'db_host')
        self.mysql_user = cp.get('mysql', 'db_user')
        self.mysql_pwd = cp.get('mysql', 'db_pwd')
        self.mysql_database = cp.get('mysql', 'db_name')
        self.mysql_port = cp.getint('mysql', 'db_port')
        self.mysql_charset = cp.get('mysql', 'db_charset')
        self.phantomjs_path = cp.get('phantomjs', 'path')
