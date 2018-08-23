
# coding: utf-8

# In[1]:

import nltk
import pickle
import math
import string
import operator
import numpy as np
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
file = open("e2.p","rb")
tokens = pickle.load(file)
print(tokens[2])


# In[2]:

s = set( val for dic in tokens for val in tokens[dic])
print(s)


# In[3]:

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
del arr[0]          


# In[4]:

#print(len(arr))
#print(len(s))
d = dict(zip(s,arr))
print(d)


# In[5]:

file = open("dict.p","wb")
pickle.dump(d,file)


# In[6]:

boolean = {}
for k,v in sorted(d.items()):
    boolean[k] = []
    for i in range(10):
        counter=collections.Counter(v)
        if i in v:
            boolean[k].append(counter[i])
        else:
            boolean[k].append(0)
#print(boolean)


# In[7]:

for k in boolean:
    counter=0
    temp=boolean[k]
    for i in range(10):
        if(temp[i]>0):
            counter=counter+1
    boolean[k].append(counter)
print(boolean)


# In[8]:

for k in boolean:
    temp=boolean[k]
    idf=math.log((10/temp[10]),10)
    boolean[k].append(idf)
print(boolean)


# In[9]:

for k in boolean:
    temp=boolean[k]
    for i in range(10):
        if(temp[i]!=0):
            norm = (1+math.log(temp[i],10))*temp[11]
        else:
            norm=0
        boolean[k].append(norm)
print(boolean)


# In[10]:

dictlist=[]
keys=[]
for key, value in boolean.items():
    temp = value
    dictlist.append(temp)
    keys.append(key)
#print(dictlist)
#print(keys)


# In[11]:

import numpy as np
import pandas as pd
names = ['tf1','tf2','tf3','tf4','tf5','tf6','tf7','tf8','tf9','tf10','df','idf','ntf1','ntf2','ntf3','ntf4','ntf5','ntf6','ntf7','ntf8','ntf9','ntf10']
df = pd.DataFrame(dictlist,index=keys,columns=names)
print(df)


# In[12]:

def tokenize_stop(text):
    wordtoken = word_tokenize(text.lower())
    #print(wordtoken)
    stop_words = list(stopwords.words('english'))
    punct = string.punctuation
    temp = word_tokenize(punct)
    temp += ['.','``','...','\'s','--','-','n\'t']
    stop_words += temp
    filtered_sentence = [w for w in wordtoken if not w in stop_words]
    return filtered_sentence

def stem(filtered_sentence):
    ps = PorterStemmer()
    stem = []
    for w in filtered_sentence:
        stem.append(ps.stem(w))
    return stem


# In[13]:

query = input("Enter query:")
filtered = tokenize_stop(query)
stemmed = stem(filtered)

print(stemmed)


# In[14]:

qterm=[]
counter=collections.Counter(stemmed)
print(counter)
for x in keys:
    if x in counter:
        y = counter[x]
        y = 1 + math.log(y,10)
        idf = df['idf'][x]
        y = y * idf
        qterm.append(y)
    else:
        qterm.append(0)
        
print(qterm)
    
        
        
    


# In[15]:

def cosine(x,y):
    summ=0
    sumx=0
    sumy=0
    for i in range(len(keys)):
        summ = summ + x[i]*y[i]
        sumx = sumx + x[i]*x[i]
        sumy = sumx + y[i]*y[i]
    ans = summ / (np.sqrt(sumx)*np.sqrt(sumy))
    return ans


# In[16]:

answer = {}
for x in range(10):
    str1 = 'ntf' + str(x+1)
    answer[x]= cosine(qterm,df[str1])

print(answer)
sorted_d = sorted(answer.items(), key=operator.itemgetter(1),reverse=True)
print(sorted_d)


# In[ ]:



