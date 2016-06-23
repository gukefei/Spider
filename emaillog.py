import smtplib
from email.mime.text import MIMEText
from email.header import Header
from email.utils import parseaddr, formataddr


class Email:
    def __init__(self, host, user, passwd, sender, port=25):
        self.host = host
        self.user = user
        self.passwd = passwd
        self.sender = sender
        self.port = port
        self.smtp = smtplib.SMTP()
        self.smtp.connect(self.host, self.port)
        self.smtp.login(self.user, self.passwd)

    def send_email(self, receiver, subject, content, ):
        """
        发送邮件
        :param receiver: 收件地址，列表类型，可以是多个
        :param subject: 邮件主题
        :param content: 邮件内容
        :return:
        """
        msg = MIMEText(content, 'html', 'utf-8')
        msg['From'] = self.__format_addr('%s <%s>' % (self.sender, self.sender))
        split = ','
        receiver_emails = split.join(receiver)
        msg['To'] = self.__format_addr('收件人 <%s>' % receiver_emails)
        msg['Subject'] = Header(subject, 'utf-8')
        try:
            self.smtp.sendmail(self.sender, receiver, msg.as_string())
            # self.smtp.set_debuglevel(1)  # 显示与邮件服务器交互的信息
            print("邮件发送成功")
        except smtplib.SMTPException:
            print("Error: 无法发送邮件")

    @staticmethod
    def __format_addr(s):
        """
        格式化邮件头部信息
        :return:
        """
        name, addr = parseaddr(s)
        return formataddr((Header(name, 'utf-8').encode(), addr))