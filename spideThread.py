import threading
import time
from data import Data
from spide import Spide


class SpideThread(threading.Thread):
    def __init__(self, urldata, threadid):
        threading.Thread.__init__(self)
        self.urls = urldata
        self.threadID = threadid
        self.interval = 1

    def run(self):
        print('开始采集线程：' + '-' + str(self.threadID))
        self.spide(self.urls)
        print('退出线程' + '-' + str(self.threadID))

    def spide(self, urldata):
        length = len(urldata)
        i = 0
        while i < length:
            time.sleep(self.interval)
            print('正在采集中：%s' % urldata[i]['url'])
            spide = Spide()
            counter = spide.list_spide(urldata[i])
            print("商品入库总数：%d(%s)" % (int(counter), urldata[i]['url']))
            i += 1


if __name__ == '__main__':
    threads_num = 5  # 线程数目
    threads_url_num = 1  # 每个线程处理的url数目
    threadings = []  # 存储创建的线程列表
    data = Data()
    urls = data.urls(1)  # 需要采集的url
    urls_len = len(urls)
    i = 0
    while i < urls_len:
        start = i
        i = end = start + threads_num * threads_url_num
        indices = urls[start:end]  # 每次取出5个url地址进行采集
        for j in range(threads_num):  # 创建线程
            indices_start = j * threads_url_num
            indices_end = indices_start + threads_url_num
            thread = SpideThread(indices[indices_start:indices_end], j)
            threadings.append(thread)
        for j in threadings:  # 启动线程
            j.start()
        for j in threadings:  # 等待直到线程结束
            j.join()
        threadings.clear()
        i += 1
    print('退出主线程')
