
# coding: utf-8

# In[33]:

import nltk
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
file = open("essay.txt","r")


# In[28]:

text = file.read()
print(text)


# In[29]:

senttoken = sent_tokenize(text)
print(senttoken)


# In[30]:

wordtoken = word_tokenize(text)
print(wordtoken)


# In[31]:

stop_words = set(stopwords.words('english'))

filtered_sentence = [w for w in wordtoken if not w in stop_words]
      
print(filtered_sentence)


# In[32]:

removed = [w for w in wordtoken if not w in filtered_sentence]
print(removed)


# In[40]:

#print(wordtoken)
ps = PorterStemmer()
stem = []
for w in filtered_sentence:
    stem.append(ps.stem(w))
    
print(stem)
    
import pickle
file = open("exp2.pickle","wb")
pickle.dump(stem,file)


# In[44]:

load_stem = pickle.load( open( "exp2.pickle", "rb" ) )

print(load_stem)


# In[ ]:



