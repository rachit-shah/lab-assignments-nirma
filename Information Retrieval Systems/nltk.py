
# coding: utf-8

# In[1]:


import nltk

from nltk.tokenize import word_tokenize,sent_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
import string


# In[2]:


file = open('1.txt','r')


# In[3]:


file.read()


# In[4]:


data = []
for x in range(1,11):
    f = str(x)+'.txt'
    file = open(f,'r')
    data.append(file.read())


# In[5]:


global stopw
def token_stop(text):
    words = word_tokenize(text)
    stopw = list(stopwords.words('english'))
    punct = string.punctuation
    punct = word_tokenize(punct)
    punct += ['.','``','...','\'s','--','-','n\'t']
    stopw += punct
    filtered = [w for w in words if not w in stopw]
    return filtered

def stemm(text):
    ps = PorterStemmer()
    stem = []
    for w in text:
        stem.append(ps.stem(w))
    return stem    
    
    


# In[6]:


textall = []
tokens = {}
for x in range(0,10):
    filtered = token_stop(data[x])
    stemmed = stemm(filtered)
    textall.append(stemmed)
    tokens[x] = stemmed


# In[7]:


wordcounts = []
for x in range(0,10):
    wordcounts.append(len(tokens[x]))


# In[8]:


get_ipython().magic('matplotlib inline')
from matplotlib import pyplot as plt
plt.bar(list(range(10)),wordcounts)
plt.title('WordCounts')


# In[9]:


from wordcloud import WordCloud

for x in range(0,10):
    wordcloud = WordCloud(stopwords=stopwords.words('english'),background_color='white').generate(data[x])
    plt.imshow(wordcloud)
    plt.show()


# # Posting List

# In[10]:


s = set( val for dic in tokens for val in tokens[dic])


# In[11]:


arr =[[]]
for x in s:
    temp = []
    for i in range(0,10):
        if x in tokens[i]:
            temp.append(i)
    arr.append(temp)
del arr[0]


# In[12]:


arr = dict(zip(s,arr))


# In[13]:


arr


# # Query

# In[14]:


query = input('Enter query:')
query = token_stop(query)
query = stemm(query)
query


# In[15]:


def intersection(lists):
    return list(set.intersection(*map(set,lists)))
def union(lists):
    return list(set.union(*map(set,lists)))


# In[16]:


quer = []
for x in query:
    if x in arr:
        quer.append(arr[x])


# In[17]:


print(intersection(quer))
print(union(quer))


# # Boolean

# In[21]:


boolean = {}
for k,v in sorted(arr.items()):
    boolean[k] = []
    for i in range(0,10):
        if i in v:
            boolean[k].append(1)
        else:
            boolean[k].append(0)


# In[22]:


boolean


# # TFIDF

# In[23]:


for x in boolean:
    counter = 0
    temp = boolean[x]
    for i in range(10):
        if(temp[i]>0):
            counter = counter + 1
    boolean[x].append(counter)


# In[26]:


import math
for x in boolean:
    temp = boolean[x]
    idf = math.log((10/temp[10]),10)
    boolean[x].append(idf)


# In[28]:


for x in boolean:
    temp = boolean[x]
    for i in range(10):
        if(temp[i]!=0):
            norm = (1+math.log(temp[i],10))*temp[11]
        else:
            norm=0
        boolean[x].append(norm)


# In[30]:


dictlist = []
keys = []
for k,v in boolean.items():
    dictlist.append(v)
    keys.append(k)


# In[35]:


import pandas as pd
names = ['tf1','tf2','tf3','tf4','tf5','tf6','tf7','tf8','tf9','tf10','df','idf','ntf1','ntf2','ntf3','ntf4','ntf5','ntf6','ntf7','ntf8','ntf9','ntf10']
df = pd.DataFrame(dictlist,index=keys,columns=names)


# In[36]:


df


# # Query

# In[46]:


query = input("Enter query:")
filtered = token_stop(query)
stemmed = stemm(filtered)

print(stemmed)
import collections
qterm = []
counter = collections.Counter(stemmed)
for x in keys:
    if x in counter:
        idf = df['idf'][x]
        y = counter[x]
        y = (1 + math.log(y,10))*idf
        qterm.append(y)
    else:
        qterm.append(0)


# In[51]:


import numpy as np
def cosine(x,y):
    sumx=0
    sumy=0
    summ=0
    for i in range(len(keys)):
        summ = summ + (x[i]*y[i])
        sumx = sumx + (x[i]*x[i])
        sumy = sumy + (y[i]*y[i])
    ans = summ/(np.sqrt(sumx)*np.sqrt(sumy))
    return ans


# In[53]:


answer = {}
for x in range(10):
    str1 = 'ntf'+ str(x+1)
    answer[x] = cosine(qterm,df[str1])


# In[60]:


answer
import operator
sorted_d = sorted(answer.items(), key=operator.itemgetter(1),reverse=True)
print(sorted_d)


# In[61]:


relevant = []
n = input("Enter no. of relevant docs:")
for x in range(int(n)):
    relevant.append(int(input("Enter next relevant doc")))

retrieved = []
for key,value in sorted_d:
    if(value!=0):
        retrieved.append(key)


# In[62]:


list.sort(retrieved)
print(retrieved)


# In[64]:


ans=[[]]
ans.append(relevant)
ans.append(retrieved)
del ans[0]
ans = intersection(ans)
print(ans)


# In[65]:


print("Precision = ", (len(ans)/len(retrieved))*100, "%")
print("Recall = ", (len(ans)/len(relevant))*100, "%")


# In[71]:


data = df.as_matrix()


# In[72]:


print(data)


# #  SVD

# In[73]:


from numpy import linalg as la


# In[74]:


u,s,v = la.svd(data)


# In[78]:


k=5


# In[87]:


recons = np.matrix(u[:,:k])*np.diag(s[:k])*np.matrix(v[:k,:])


# In[85]:


print(u[:,:k].shape)
print(np.diag(s[:k]).shape)
print(np.matrix(v[:k,:]).shape)


# In[89]:


print(data.shape)
print(recons.shape)

