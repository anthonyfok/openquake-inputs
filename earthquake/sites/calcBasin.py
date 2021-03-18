import pandas as pd 
import numpy as np
import sys

#USAGE: python3 calcBasin.py INFILE OUTFILE 
#   where INFILE is a  site file with lon, lat, vs30
#   OUTFILE is the name for the csv file that will be produced
#   written by TEHobbs, implementing guidelines from MKolaj (2020)

inName = sys.argv
df = pd.read_csv(inName[1])
#df = pd.read_csv('./sites_CoV_uniq_basin.csv')

#print(df.head())
vs30 = df.loc[:,'vs30']

ASK14 = 1/1000 * np.exp(-7.67/4.*np.log((vs30**4+610.**4) / (1360.**4+610.**4)))
#print('ASK14', ASK14)

CY14 = np.exp((-7.15 / 4.) * np.log(((vs30) ** 4. + 570.94 ** 4.) / (1360 ** 4. + 570.94 ** 4.))) / 1000.
#print('CY14', CY14)

df['z1pt0'] = 1000*((np.array(ASK14) + np.array(CY14)) / 2.0)
df['z2pt5'] = '2.0'
#print(df.head())

### TESTING
testvs30 = 580
TESTASK14 = 1/1000 * np.exp(-7.67/4.*np.log((testvs30**4+610.**4) / (1360.**4+610.**4)))
TESTCY14 = np.exp((-7.15 / 4.) * np.log(((testvs30) ** 4. + 570.94 ** 4.) / (1360 ** 4. + 570.94 ** 4.))) / 1000.
TESTz1 = 1000*(((TESTASK14) + (TESTCY14)) / 2.0)
#print('TESTz1', TESTz1)
### TEST DONE

df.to_csv(inName[2], index=False, float_format='%.6f')
