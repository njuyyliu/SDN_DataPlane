# -*- coding:utf-8 -*-
"""
@author: LIU
@file:processData.py
@time:2018/7/31 10:38
"""
from numpy import *


def processDataSet(filename, trainfile):
    dataMat=[]
    fr = open(filename)
    #f = open(trainfile, 'w') 
    fw = open(trainfile, 'w')
    for line in fr.readlines():
        temp = line.strip().split(',')
	
        for ts in temp[:]:

            if 'dl_dst' in ts:
		if 'actions' not in ts:
                	continue
            elif 'nw_dst' in ts:
                continue
            else:
                temp.remove(ts)   
	 
	if 'nw_dst' in line:
	    dataMat.append(temp[0][7:len(temp[0])])
	    dataMat.append(temp[1][7:16])
	    dataMat.append(temp[1][17:len(temp[1])])
       
    for index in range(0,len(dataMat)): 
            if ':' in dataMat[index]:
              
                if '=' in dataMat[index]:
                    fw.write(dataMat[index][len(dataMat[index])-1])
                    fw.write('\n')
                else:
                    tempdata = dataMat[index].strip().split(':')
                   
                    for dsa in tempdata:
                        high = int(dsa, 16)
                        fw.write(str(high)+' ')
            elif '.' in dataMat[index]:
                tempdata = dataMat[index].strip().split('.')
                for dsa in tempdata:
                    fw.write(dsa + ' ')

    fw.close()


def main():
    filename_pre='/home/haven2/20181022/FlowTable-s1'
    filename_data='/home/haven2/20181022/FlowTable-final'
   
    processDataSet(filename_pre, filename_data)

if __name__=='__main__':
    main()


