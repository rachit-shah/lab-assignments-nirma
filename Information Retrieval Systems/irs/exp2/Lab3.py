
# coding: utf-8

# In[66]:

import nltk
import pickle
import math
import string
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
file = open("e2.p","rb")
tokens = pickle.load(file)
print(tokens[2])


# In[38]:

s = set( val for dic in tokens for val in tokens[dic])
print(s)


# In[47]:

import collections
arr = [[]]
for x in s:
    temp = []
    for y in tokens:
        counter=collections.Counter(tokens[y])
        if(x in tokens[y]):
            for z in range(0,counter[x]):
                temp.append(y)
    print(temp)
    arr.append(temp)
            


# In[43]:

print(tokens[0])


# In[48]:

del arr[0]



# In[49]:

print(arr)


# In[50]:

print(len(arr))
print(len(s))
d = dict(zip(s,arr))
print(d)


# In[6]:

file = open("dict.p","wb")
pickle.dump(d,file)


# In[7]:




# In[24]:




# In[25]:

def intersect(lists):
    return list(set.intersection(*map(set, lists)))
def union(lists):
    return list(set.union(*map(set, lists)))


# In[26]:




# In[28]:




# In[29]:

print(ll)
print(intersect(ll))
print(union(ll))


# In[37]:

print(d.items())


# In[58]:

boolean = {}
for k,v in sorted(d.items()):
    boolean[k] = []
    for i in range(10):
        counter=collections.Counter(v)
        if i in v:
            boolean[k].append(counter[i])
        else:
            boolean[k].append(0)


# In[59]:

print(boolean)


# In[64]:

for k in boolean:
    counter=0
    temp=boolean[k]
    for i in range(10):
        if(temp[i]>0):
            counter=counter+1
    boolean[k].append(counter)
print(boolean)


# In[68]:

for k in boolean:
    temp=boolean[k]
    idf=math.log((10/temp[10]),10)
    boolean[k].append(idf)
print(boolean)


# In[73]:

for k in boolean:
    temp=boolean[k]
    for i in range(10):
        if(temp[i]!=0):
            norm = (1+math.log(temp[i],10))*temp[11]
        else:
            norm=0
        boolean[k].append(norm)
print(boolean)


# In[92]:

dictlist=[]
keys=[]
for key, value in boolean.items():
    temp = value
    dictlist.append(temp)
    keys.append(key)
#print(dictlist)
#print(keys)


# In[94]:

import numpy as np
import pandas as pd
names = ['tf1','tf2','tf3','tf4','tf5','tf6','tf7','tf8','tf9','tf10','df','idf','ntf1','ntf2','ntf3','ntf4','ntf5','ntf6','ntf7','ntf8','ntf9','ntf10']
df = pd.DataFrame(dictlist,index=keys,columns=names)
print(df)


# In[ ]:



