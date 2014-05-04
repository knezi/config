#!/bin/env python3
from os import listdir
import sys
import subprocess
import os

#pr = subprocess.Popen(["filmovnicek"])
#pr.wait()


dir = "/home/pi/Filmovnicek/filmy"
i = 1
filmy=[""]
print('''
Vyber si film který chceš (napiš jeho číslo a potvrď klávesou enter):
           Pro vypnutí počítače napiš "vyp" (bez uvozovek)           
====================================================================''');
#|  1 | Hobit neočekávaná cesta tohle je opravdu dlouhý text ahojaa |
#|  2 | Hobit neočekávaná cesta tohle je opravdu dlouhý text ahojaa |
#| 10 | Hobit neočekávaná cesta tohle je opravdu dlouhý text ahojaa |

for x in listdir(dir):
	filmy.append(x)
	if len(x)>59:
		x = x[:59]
	else:
		for y in range(59-len(x)):
			x+=" "
		
	print("| " + (" " if i < 10 else "") + str(i) + " | " + x + " |")
	i+=1

print('''====================================================================''')

def pust_film(prikaz):
	print("Pouštím film " + str(prikaz))
	print("mplayer" + os.path.join(dir, filmy[prikaz], "*"))
	pr = subprocess.Popen(["omxplayer", os.path.join(dir, filmy[prikaz], "*")])
	pr.wait()

while True:	
#if True:
	print("Zadej příkaz:")
	prikaz=sys.stdin.readline()[:-1]
	if prikaz.isdigit() and int(prikaz) <= i:
		pust_film(int(prikaz))
	else:
		if prikaz=="vyp":
			break
		else:
			print("Neplatný příkaz.")
