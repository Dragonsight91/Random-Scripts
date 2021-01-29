#!/usr/bin/python
import random, string

"""
this one was simply a joke about people correcting "Linux" with 
"Oh but it is actually GNU/Linux or GNU+Linux"
so i present to you, THIS. GNU{punctuation}Linux

I added this script to my neofetch config to make it show the output as OS 
"""

print(random.choice(string.punctuation).join(['GNU','Linux']))