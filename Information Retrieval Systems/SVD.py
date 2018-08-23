
# coding: utf-8

# In[1]:


import cv2
import numpy as np
from numpy import *
import operator
from os import listdir
import matplotlib
import matplotlib.pyplot as plt
import pandas as pd
from numpy.linalg import *
from scipy.stats.stats import pearsonr
from numpy import linalg as la
# Load an color image in grayscale
data = cv2.imread('abc.jpg',0)
print(data)
samples,features = shape(data)


# In[2]:


def svd(data, S=2):
     
    #calculate SVD
    U, s, V = linalg.svd( data )
    print(U)
    print()
    print(s)
    print()
    print(V)
    return U,s,V


# In[3]:


U,s,V=svd(data,2)


# In[4]:


print(U.shape)
print(s.shape)
print(V.shape)


# In[5]:


intmed=U*s
shape = (287, 287) #This will be some pre-determined size
intmed.resize(shape)
print(intmed.shape)
ans=intmed*V
print(ans.shape)
print(ans)


# In[6]:


cv2.imshow("image", ans);


# In[7]:


for i in range(5, 51, 5):
    reconstimg = np.matrix(U[:, :i]) * np.diag(s[:i]) * np.matrix(V[:i, :])
    plt.imshow(reconstimg, cmap='gray')
    title = "n = %s" % i
    plt.title(title)
    plt.show()

