
# coding: utf-8

# In[47]:

import nltk
import pickle
import string
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
file = open("e2.p","rb")
tokens = pickle.load(file)
print(tokens[2])


# In[32]:

s = set( val for dic in tokens for val in tokens[dic])
print(len(s))


# In[41]:

arr = [[]]
for x in s:
    temp = []
    for y in tokens:
        print(y)
        if(x in tokens[y]):
            temp.append(y)
    arr.append(temp)
            


# In[42]:

del arr[0]



# In[43]:

print(len(arr))
print(len(s))
d = dict(zip(s,arr))
print(d)


# In[45]:

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


# In[49]:

query = input("Enter query:")
filtered = tokenize_stop(query)
stemmed = stem(filtered)

print(stemmed)


# In[65]:

def intersect(lists):
    return list(set.intersection(*map(set, lists)))
def union(lists):
    return list(set.union(*map(set, lists)))


# In[63]:

ll =[]
for x in d:
    if x in stemmed:
        ll.append(d[x])


# In[67]:

print(ll)
print(intersect(ll))
print(union(ll))


# In[70]:

boolean = {}
for k,v in sorted(d.items()):
    boolean[k] = []
    for i in range(10):
        if i in v:
            boolean[k].append(1)
        else:
            boolean[k].append(0)


# In[71]:

print(boolean)


# In[ ]:



