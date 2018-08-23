
# coding: utf-8

# In[425]:


get_ipython().magic('matplotlib inline')
import matplotlib
import pandas as pd
import numpy as np


df = pd.read_csv("dataset.csv", encoding = "ISO-8859-1")


# In[426]:


temp = df['Lyrics']
temp2 = df['Genre']
df = pd.DataFrame(df.SongInfo.str.split(' - ',1).tolist(),columns=['Artist','SongTitle'])
df['SongTitle'] = df.SongTitle.str.replace(" LYRICS","")
df = df.join(temp)
df = df.join(temp2)
df['Genre'] = df.Genre.str.replace("Country Music","Country")
df['Genre'] = df.Genre.str.replace("Hip Hop/Rap","Rap")


# In[427]:


df


# In[428]:


df= df.drop_duplicates(subset="SongTitle")
df['Genre'].value_counts()


# In[429]:


wordcounts = df.Lyrics.str.split().apply(len)
df['WordCounts'] = wordcounts
df


# In[430]:


stats = df.groupby('Genre',as_index=False)['WordCounts'].mean()
stats = stats.rename(columns = {'WordCounts':'Mean'})
median = df.groupby('Genre')['WordCounts'].median()
minvalue = df.groupby('Genre')['WordCounts'].min()
maxvalue = df.groupby('Genre')['WordCounts'].max()
stats['Median'] = median.get_values()
stats['Min'] = minvalue.get_values()
stats['Max'] = maxvalue.get_values()


# In[431]:


stats


# In[432]:


stats.plot(kind="bar",x="Genre")


# # WORDCLOUDS

# In[433]:


from wordcloud import WordCloud
import matplotlib.pyplot as plt
from sklearn.feature_extraction import text 
from wordcloud import WordCloud, STOPWORDS
genres = df['Genre'].unique()

for i in range(0,len(genres)):
    words = ' '.join(df.loc[df['Genre']==genres[i], 'Lyrics'])

    wordcloud = WordCloud( 
                          stopwords=STOPWORDS,
                          background_color='white',
                          width=800,
                          height=400
                ).generate(words)
    print(genres[i])
    plt.figure(figsize=(10, 5))
    plt.imshow(wordcloud)
    plt.axis('off')
    plt.show()

words = ' '.join(df.loc[:, 'Lyrics'])

wordcloud = WordCloud( 
                      stopwords=STOPWORDS,
                      background_color='white',
                      width=800,
                      height=400
            ).generate(words)
print("ALL GENRES:")
plt.figure(figsize=(10, 5))
plt.imshow(wordcloud)
plt.axis('off')
plt.show()


# In[434]:


from sklearn.preprocessing import LabelEncoder
import pickle
import numpy as np
from sklearn.model_selection import train_test_split
train, test = train_test_split(df, test_size=0.4, random_state=0)
X_train = train['Lyrics'].values
y_train = train['Genre'].values
X_test = test['Lyrics'].values
y_test = test['Genre'].values

print('before: %s ...' %y_train[:5])

le = LabelEncoder()
le.fit(y_train)
y_train = le.transform(y_train)

print('after: %s ...' %y_train[:5])


# In[435]:


# Porter Stemmer

import nltk
import string
import re
from nltk.stem.snowball import EnglishStemmer
snowball = EnglishStemmer()
porter_stemmer = nltk.stem.porter.PorterStemmer()

def porter_tokenizer(text, stemmer=porter_stemmer):
    lower_txt = text.lower()
    tokens = nltk.wordpunct_tokenize(lower_txt)
    stems = [porter_stemmer.stem(t) for t in tokens]
    no_punct = [s for s in stems if re.match('^[a-zA-Z]+$', s) is not None]
    return no_punct

def snowball_tokenizer(text, stemmer=snowball):
    lower_txt = text.lower()
    tokens = nltk.wordpunct_tokenize(lower_txt)
    stems = [snowball.stem(t) for t in tokens]
    no_punct = [s for s in stems if re.match('^[a-zA-Z]+$', s) is not None]
    return no_punct


# In[436]:


porter_tokenizer("One foot on the brake and one on the gas, hey...	")


# In[437]:


import nltk.corpus
# Commented out to prevent overwriting files:
#
stp = nltk.corpus.stopwords.words('english')
with open('./stopwords_eng.txt', 'w') as outfile:
    outfile.write('\n'.join(stp))
    

with open('./stopwords_eng.txt', 'r') as infile:
    stop_words = infile.read().splitlines()
print('stop words %s ...' %stop_words[:5])

#stop_words = []


# In[438]:


from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.naive_bayes import BernoulliNB
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.cluster import KMeans
from sklearn.pipeline import Pipeline
from mlxtend.preprocessing import DenseTransformer
import seaborn as sns

from sklearn import metrics

final_clf = Pipeline([
                ('vect', CountVectorizer(
                                        encoding='utf-8',
                                        decode_error='replace',
                                        strip_accents='unicode',
                                        analyzer='word',
                                        stop_words=stop_words,
                                        tokenizer=porter_tokenizer,
                                        binary=True,
                                        ngram_range=(1,1),
                                         )
                ),
                #('dense', DenseTransformer()),
                #('clf', MultinomialNB(alpha=0.1,fit_prior=False)),
                ('clf', BernoulliNB(alpha=0.001,fit_prior=False)),
                #('clf', DecisionTreeClassifier(criterion="gini",random_state=0,splitter="best",min_samples_split=2)),
                #('clf', RandomForestClassifier(criterion="entropy",random_state=0,oob_score=False,max_depth=40,n_estimators=500)),
                #('clf', KNeighborsClassifier(weights="distance",algorithm="auto",p=2,n_neighbors=6)),

               ])
final_clf.fit(X_train, y_train)


# In[439]:


'''
from sklearn.model_selection import GridSearchCV
pipe_1 = Pipeline([
                ('vect', CountVectorizer(
                                        encoding='utf-8',
                                        decode_error='replace',
                                        strip_accents='unicode',
                                        analyzer='word',
                                        stop_words=stop_words,
                                        tokenizer=porter_tokenizer,
                                        binary=True,
                                        ngram_range=(1,1),
                                         )
                ),
                ('dense', DenseTransformer()),
                #('clf', MultinomialNB(alpha=0.1,fit_prior=False)),
                #('clf', BernoulliNB(alpha=0.001,fit_prior=False)),
                #('clf', DecisionTreeClassifier(criterion="gini",random_state=0,splitter="best",min_samples_split=2)),
                ('clf', RandomForestClassifier(max_depth=40)),
                #('clf', KNeighborsClassifier(n_neighbors=6)),
                #('clf', KMeans(n_clusters=6, random_state=0)),

               ])
parameters_1 = dict(
    clf__n_estimators=[50, 100, 200, 500],
    clf__max_features=['sqrt', 'log2', None],)

grid_search_1 = GridSearchCV(pipe_1, 
                             parameters_1, 
                             n_jobs=1, 
                             verbose=1,
                             scoring='accuracy',
                             cv=2)


print("Performing grid search...")
print("pipeline:", [name for name, _ in pipe_1.steps])
print("parameters:")
grid_search_1.fit(X_train, y_train)
print("Best score: %0.3f" % grid_search_1.best_score_)
print("Best parameters set:")
best_parameters_1 = grid_search_1.best_estimator_.get_params()
for param_name in sorted(parameters_1.keys()):
    print("\t%s: %r" % (param_name, best_parameters_1[param_name]))
    
final_clf = pipe_1
final_clf.fit(X_train, y_train)
'''


# In[440]:


#import matplotlib as plt
import numpy as np
from matplotlib import pyplot as plt
from sklearn.metrics import accuracy_score
print(accuracy_score(y_train, final_clf.predict(X_train)))
plt.figure(figsize=(5, 5))
cm = metrics.confusion_matrix(y_train, final_clf.predict(X_train))

np.set_printoptions(suppress=True)

hm = sns.heatmap(cm, 
            cbar=False,
            annot=True, 
            square=True,
            fmt='d',
            yticklabels=['christian','country','rock','pop','rap','r&b'],
            xticklabels=['christian','country','rock','pop','rap','r&b'],
            cmap='Blues'
            )
plt.title('Confusion matrix - Training dataset')
plt.ylabel('actual class')
plt.xlabel('predicted class')
plt.tight_layout()
plt.show()


# In[441]:


y_test = le.transform(y_test)
print(accuracy_score(y_test, final_clf.predict(X_test)))
plt.figure(figsize=(5, 5))
cm = metrics.confusion_matrix(y_test, final_clf.predict(X_test))

np.set_printoptions(suppress=True)

hm = sns.heatmap(cm, 
            cbar=False,
            annot=True, 
            square=True,
            fmt='d',
            yticklabels=['christian','country','rock','pop','rap','r&b'],
            xticklabels=['christian','country','rock','pop','rap','r&b'],
            cmap='Blues'
            )
plt.title('Confusion matrix - Training dataset')
plt.ylabel('actual class')
plt.xlabel('predicted class')
plt.tight_layout()
plt.show()

