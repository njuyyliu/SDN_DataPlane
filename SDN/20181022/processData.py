# -*- coding:utf-8 -*-
"""
@author: LIU
@file:processData.py
@time:2018/7/31 10:38
"""
from numpy import *
import sys


def processDataSet(filename, trainfile):
    dataMat=[]
    fr = open(filename)
    #f = open(trainfile, 'w') 
    fw = open(trainfile, 'a')
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
                    fw.write(dataMat[index][len(dataMat[index])-1] + '\n')
                   
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
    print (len(dataMat))


def main(switchId):
    filename_pre='/home/yyliu/SDN/20181022/flowTable/FlowTable-'+switchId
    filename_data='/home/yyliu/SDN/20181022/flowTable/FlowTable-final-'+switchId
   
    processDataSet(filename_pre, filename_data)

if __name__=='__main__':
    
    switchId = sys.argv[1]
    
    main(switchId)


