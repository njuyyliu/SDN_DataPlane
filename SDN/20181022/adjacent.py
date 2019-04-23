# -*- coding:utf-8 -*-
"""
@author: LIU
@file:processData.py
@time:2018/7/31 10:38
"""
from numpy import *
import sys

def adjoinTable(rfilename, switchId):
    netLink = {}
    switch = []
    fr = open(rfilename)
    for line in fr.readlines():
        temp = line.strip().split('-')
        #print (temp[0])
        port = temp[1][3:len(temp[1])-1]
        edge = temp[2][1:]
        if temp[0] not in switch:
            switch.append(temp[0])
            netLink[temp[0]] = {port:edge}
        else:
            netLink.get(temp[0])[port] = edge
    #print (netLink)
    #print (switch)

    if switchId in switch:
        dataSet = []
        ipAdr = []
        fr = open("/home/yyliu/SDN/20181022/flowTable/FlowTable-final-" + switchId)
        for line in fr.readlines():
            line.strip()
            temp = list(map(float, line.split(' ')))
            ipAdr.append(temp[0:len(temp)-1])
	    print (ipAdr)
        fr.close()
        fw = open("/home/yyliu/SDN/20181022/flowTable/FlowTable-final-" + switchId, 'a')

        adjacent = netLink[switchId]
        for p in adjacent.keys():
                filename_adj='/home/yyliu/SDN/20181022/flowTable/FlowTable-final-'+adjacent[p]
                fr = open(filename_adj)
                for line in fr.readlines():
                    line.strip()
                    temp = list(map(float, line.split(' ')))
                    ip1 = temp[0:len(temp)-1]
                    
                    if ip1 not in ipAdr:
                        fw.write(str(int(ip1[0]))+' '+str(int(ip1[1]))+' '+str(int(ip1[2]))+' '+str(int(ip1[3]))+' '+str(int(p)+1)+'\n')
        fw.close()


def main(switchId):
    linkFilename = '/home/yyliu/SDN/20181022/links'
    adjoinTable(linkFilename, switchId)

if __name__=='__main__':
    
    switchId = sys.argv[1]
    
    main(switchId)

