# -*- coding: utf-8 -*-
#/usr/bin/python2
'''
June 2017 by kyubyong park. 
kbpark.linguist@gmail.com.
https://www.github.com/kyubyong/transformer
'''
from __future__ import print_function
import tensorflow as tf
import numpy as np
import codecs
import os
import regex
from collections import Counter

def make_vocab(fpath, fname):
    '''Constructs vocabulary.
    
    Args:
      fpath: A string. Input file path.
      fname: A string. Output file name.
    
    Writes vocabulary line by line to `preprocessed/fname`
    '''  
    text = codecs.open(fpath, 'r', 'utf-8').read()
    #text = regex.sub("[^\s\p{Latin}']", "", text)
    words = text.split()
    word2cnt = Counter(words)
    if not os.path.exists('datas'): os.mkdir('datas')
    with codecs.open('datas/{}'.format(fname), 'w', 'utf-8') as fout:
        fout.write("{}\n{}\n{}\n{}\n".format("<PAD>", "<UNK>", "<S>", "</S>"))
        for word, cnt in word2cnt.most_common(len(word2cnt)):
            fout.write(u"{}\n".format(word))

if __name__ == '__main__':
    make_vocab('datas/train.clean.mo', "vocab.mo")
    make_vocab('datas/train.clean.ch', "vocab.ch")
    print("Done")
