import re

# a = 'http://www.malama.com/controller/index.php?r=gii&id=1'
# pattern = re.compile(r'(^https?://[\w\.]*).*')
# match = pattern.findall(a)
# print(match)
# p=pattern.search(a)
# print(p.group(1))


# str = 'purple alice-b@google.com monkey dishwasher'
# match = re.search('([\w.-]+)@([\w.-]+)', str)
# if match:
#     print(match.group())   # 'alice-b@google.com' (the whole match)
#     print(match.group(1))  # 'alice-b' (the username, group 1)
#     print(match.group(2))  # 'google.com' (the host, group 2)
#     print(match.groups())

# str = 'purple alice@google.com\kk, blah monkey bob@abc.com blah dishwasher'
# tuples = re.findall(r'([\w\.-]+)@([\w\.-]+)', str)
# print(tuples)  # [('alice', 'google.com'), ('bob', 'abc.com')]
# b='pii23iid323fdf'
# p=re.compile(r'(\d)')
# m=p.search(b)
# if m:
#     print('found')
#     print(m.groups())
# else:
#     print('not found')
from urllib import parse
url = r'https://docs.python.org/3.5/search.html?q=parse&check_keywords=yes&area=default'
r=parse.urlparse(url)
print(r)
print(r.scheme)
a=[1,2,3]
print(str(tuple(a)))
