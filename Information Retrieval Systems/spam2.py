import os
import numpy as np
from tqdm import tqdm
import re
from nltk.tokenize import sent_tokenize,word_tokenize
from nltk.corpus import stopwords
import nltk
import pickle
from nltk.stem import PorterStemmer
from sklearn.metrics import accuracy_score
import math
import operator
from sklearn.model_selection import train_test_split
from collections import Counter
from sklearn.naive_bayes import GaussianNB

def tokanize(f):
	data = f.lower()
	token = nltk.word_tokenize(data)
	return token

def stopWordsRemoval(token):
	stop_words = set(stopwords.words('english'))
	remove_stop = []
	for tkn in token:
		if tkn not in set(stopwords.words('english')):
			remove_stop.append(tkn)
	return remove_stop

def punctuationRemoval(remove_stop):
	puncList = [",",".","?","'",":",";"]
	puncRemoval = []
	for tkn in remove_stop:
		if tkn not in puncList:
			puncRemoval.append(tkn)
	return puncRemoval

def Stemmer(puncRemoval):
	terms = []
	ps = PorterStemmer()
	temp_final = set()
	for tkn in puncRemoval:	
		terms.append(ps.stem(tkn))
		final.add(ps.stem(tkn))
	return terms,temp_final

ham_dir = "ham\\"
spam_dir = "spam\\"

def preprocess_data(data,label,final,main_dir,lab):
	
	for subdir in tqdm(os.listdir(main_dir)):
		f = open(os.path.join(main_dir,subdir),"r")
		# Tokanization.
		token = tokanize(f.read())


		# Stop Words Removal.
		remove_stop = stopWordsRemoval(token)

		# Punctuation Removal.
		puncRemoval = punctuationRemoval(remove_stop)

		# Stemming.
		terms, temp_final = Stemmer(puncRemoval)
		final = final.union(temp_final)
		data.append(terms)
		label.append(lab)
		
	return data,label,final
	
'''
data = []
label = []
final = set()
data,label,final = preprocess_data(data,label,final,ham_dir,0)
data,label,final = preprocess_data(data,label,final,spam_dir,1)

final = list(final)
freq_count = []

i = 0
for word in final:
	freq_count.append(0)
	for oneMsg in data:
		freq_count[i] += oneMsg.count(word)
	i += 1

freq_count, final = (list(t) for t in zip(*sorted(zip(freq_count, final))))
freq_count.reverse()
final.reverse()

# Take top 300 most frequent words.
final = final[:300]
print(final)

X = []
Y = label

for oneMsg in data:
	temp = []
	for word in final:
		if(word in oneMsg):
			temp.append(1)
		else:
			temp.append(0)
	X.append(temp)

X = np.asarray(X)
Y = np.asarray(Y)

np.save('x.npy',X)
np.save('y.npy',Y)
'''
X = np.load('x.npy')
Y = np.load('y.npy')

print(X.shape)
print(Y.shape)


gnb = GaussianNB()
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.20, random_state=42)
gnb.fit(X_train,y_train)

y_ans = gnb.predict(X_test)
acc = accuracy_score(y_test,y_ans)

print("Accuracy : ",acc)

