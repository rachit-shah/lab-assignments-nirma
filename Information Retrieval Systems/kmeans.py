
# coding: utf-8

# In[1]:


get_ipython().magic('matplotlib inline')
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# In[12]:


from sklearn.datasets.samples_generator import make_blobs
X,y = make_blobs(n_samples=300,centers=4,cluster_std=0.60,random_state=0)
plt.scatter(X[:,0],X[:,1],s=50)


# In[7]:


from sklearn.cluster import KMeans
kmeans = KMeans(n_clusters=4)
kmeans.fit(X)
y_kmeans = kmeans.predict(X)


# In[15]:


plt.scatter(X[:,0],X[:,1],c=y_kmeans,s=50,cmap='viridis')
centers = kmeans.cluster_centers_
plt.scatter(centers[:,0],centers[:,1],c='black',alpha=0.5,s=200)


# In[27]:


data = pd.read_csv('AirPassengers.csv',index_col=0)
data


# In[28]:


X = pd.DataFrame.as_matrix(data)
X


# In[30]:


plt.scatter(X[:,0],X[:,1],s=50)


# In[34]:


from sklearn.cluster import KMeans
kmeans = KMeans(n_clusters=2)
kmeans.fit(X)
y_km = kmeans.predict(X)
plt.scatter(X[:,0],X[:,1],c=y_km,s=50)
centers = kmeans.cluster_centers_
plt.scatter(centers[:,0],centers[:,1],c='black',alpha=0.5,s=200)

