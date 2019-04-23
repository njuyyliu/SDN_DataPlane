# -*- coding:utf-8 -*-
"""
@author: LIU
@file:processData.py
@time:2018/7/31 10:38
"""
from numpy import *
import sys


def processDataSet(filename, trainfile):
    dataMat={}
    fr = open(filename)
    fw = open(trainfile, 'w')
    for line in fr.readlines():
        temp = line.strip().split(',')
        
        for ts in temp[:]:
            if 'nw_dst' in ts:
                continue
            else:
                temp.remove(ts)   
	
	if 'nw_dst' in line: 
        #dataMat.append(temp[0][7:len(temp[0])-17]+'.'+temp[0][len(temp[0])-1:len(temp[0])]
            dataMat[temp[0][7:len(temp[0])-17]] = temp[0][len(temp[0])-1:len(temp[0])]
	   
    #print(dataMat)
    #dataMat = list(set(dataMat))   
    #print(dataMat)
    for key in dataMat:
        tempdata = key.strip().split('.')
        fw.write(tempdata[0]+' '+tempdata[1]+' '+tempdata[2]+' '+tempdata[3]+' '+dataMat[key]+'\n')
    
    fw.close()
    

def main(switchId):
    filename_pre='/home/yyliu/SDN/20181022/flowTable/FlowTable-'+switchId
    filename_data='/home/yyliu/SDN/20181022/flowTable/FlowTable-final-'+switchId
   
    processDataSet(filename_pre, filename_data)

if __name__=='__main__':
    
    switchId = sys.argv[1]
    
    main(switchId)

