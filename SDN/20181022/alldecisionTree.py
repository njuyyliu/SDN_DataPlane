# coding=utf-8
import sys
import os
import operator
from math import log
import time
import random


def createDataSet(switchId):    # 创造示例数据
    dataSet = []

    fr = open("/home/yyliu/SDN/20181022/flowTable/FlowTable-final-" + switchId)
    for line in fr.readlines():
        line.strip()
        temp = list(map(float, line.split(' ')))
        dataSet.append(temp)

    return dataSet


# 计算香农熵
def calcShannonEnt(dataSet):
    numEntries = len(dataSet)
    labelCounts = {}
    for feaVec in dataSet:
        currentLabel = feaVec[-1]
        if currentLabel not in labelCounts:
            labelCounts[currentLabel] = 0
        labelCounts[currentLabel] += 1
    shannonEnt = 0.0
    for key in labelCounts:
        prob = float(labelCounts[key]) / numEntries
        shannonEnt -= prob * log(prob, 2)
    return shannonEnt


def splitDataSet(dataSet, axis, value):
    retDataSet = []
    for featVec in dataSet:
        if featVec[axis] == value:
            reducedFeatVec = featVec[:axis]
            reducedFeatVec.extend(featVec[axis + 1:])
            retDataSet.append(reducedFeatVec)
    return retDataSet


def chooseBestFeatureToSplit(dataSet):
    numFeatures = len(dataSet[0]) - 1  # 因为数据集的最后一项是标签
    baseEntropy = calcShannonEnt(dataSet)
    bestInfoGain = 0.0
    bestFeature = -1
    for i in range(numFeatures):
        featList = [example[i] for example in dataSet]
        uniqueVals = set(featList)
        newEntropy = 0.0
        for value in uniqueVals:
            subDataSet = splitDataSet(dataSet, i, value)
            prob = len(subDataSet) / float(len(dataSet))
            newEntropy += prob * calcShannonEnt(subDataSet)
        infoGain = baseEntropy - newEntropy
        if infoGain > bestInfoGain:
            bestInfoGain = infoGain
            bestFeature = i
    return bestFeature


# 因为我们递归构建决策树是根据属性的消耗进行计算的，所以可能会存在最后属性用完了，但是分类
# 还是没有算完，这时候就会采用多数表决的方式计算节点分类
def majorityCnt(classList):
    classCount = {}
    for vote in classList:
        if vote not in classCount.keys():
            classCount[vote] = 0
        classCount[vote] += 1
    return max(classCount)


def createTree(dataSet, labels):
    classList = [example[-1] for example in dataSet]
    if classList.count(classList[0]) == len(classList):  # 类别相同则停止划分
        return classList[0]
    if len(dataSet[0]) == 1:  # 所有特征已经用完
        return majorityCnt(classList)
    bestFeat = chooseBestFeatureToSplit(dataSet)
    bestFeatLabel = labels[bestFeat]
    myTree = {bestFeatLabel: {}}

    del (labels[bestFeat])

    featValues = [example[bestFeat] for example in dataSet]

    uniqueVals = set(featValues)

    for value in uniqueVals:
        subLabels = labels[:]  # 为了不改变原始列表的内容复制了一下
        myTree[bestFeatLabel][value] = createTree(splitDataSet(dataSet,bestFeat, value), subLabels)
    #print(myTree)
    return myTree


def classify(inputTree,featNames,testVec):

    firstStr = inputTree.keys()[0]  # 当前树的根节点的特征名称
    secondDict = inputTree[firstStr]  # 根节点的所有子节点
    featIndex = featNames.index(firstStr)  # 找到根节点特征对应的下标
    key = testVec[featIndex]  # 找出待测数据的特征值
   
    if secondDict.has_key(key):
        valueOfFeat = secondDict[key]  # 拿这个特征值在根节点的子节点中查找，看它是不是叶节点
        if isinstance(valueOfFeat, dict):  # 如果不是叶节点
            classLabel = classify(valueOfFeat, featNames, testVec)  # 递归地进入下一层节点
        else:
            classLabel = valueOfFeat  # 如果是叶节点：确定待测数据的分类
    else:
        isFind = False
        uniqKey = secondDict.keys()
        uniqKey.sort()
        for indexkey in uniqKey:
            if indexkey > key:
                isFind = True
                valueOfFeat = secondDict[indexkey]
                if isinstance(valueOfFeat, dict):  # 如果不是叶节点
                    classLabel = classify(valueOfFeat, featNames, testVec)  # 递归地进入下一层节点
                else:
                    classLabel = valueOfFeat  # 如果是叶节点：确定待测数据的分类
                break
        if not isFind:
            valueOfFeat = secondDict[uniqKey[len(uniqKey)-1]]
            if isinstance(valueOfFeat, dict):  # 如果不是叶节点
                classLabel = classify(valueOfFeat, featNames, testVec)  # 递归地进入下一层节点
            else:
                classLabel = valueOfFeat  # 如果是叶节点：确定待测数据的分类

    #return classLabel
    print ("%d" % (classLabel))

def treeToFlowtable(inputTree,featNames,ipAdress,switchNo):
    
    firstStr = inputTree.keys()[0]  # 当前树的根节点的特征名称
    secondDict = inputTree[firstStr]  # 根节点的所有子节点
    for sDict in secondDict:
        if isinstance(secondDict[sDict], dict):  # 如果不是叶节点
            ipAdress[firstStr]=int(sDict)
            treeToFlowtable(secondDict[sDict],featNames,ipAdress,switchNo)
        else:
            ipAdress[firstStr]=int(sDict)
            ipAdress['outPort']=int(secondDict[sDict])
            #print (ipAdress)
            #os.system("echo \"Hello World\"")
            
            nw_dst = str(ipAdress['s0'])+'.'+str(ipAdress['s1'])+'.'+str(ipAdress['s2'])+'.'+str(ipAdress['s3'])
            outport = str(ipAdress['outPort'])

            os.system("echo 'yyl' | sudo ovs-ofctl add-flow dp"+switchNo+" ip,idle_timeout=240,nw_dst="+nw_dst+",actions=output:"+outport)

def treeToFlowtable_ALL(inputTree,featNames,ipAdress,switchNo,n):
    if type(inputTree) == float:
        return 0
    ipDict = {}
    firstStr = inputTree.keys()[0]  # 当前树的根节点的特征名称
    secondDict = inputTree[firstStr]  # 根节点的所有子节点
    for sDict in secondDict:
        ipDict[int(sDict)] = int(secondDict[sDict])
        
    keys = ipDict.keys() 
    keys.sort() 
    
    low = 0
    outport = ipDict[keys[0]]
    for sIP in keys:

        mid = (low + sIP)/2

        for tempIP in xrange(low + 1, mid + 1):
            ipAdress['s3']=tempIP
            ipAdress['outPort']=outport

            nw_dst = str(ipAdress['s0'])+'.'+str(ipAdress['s1'])+'.'+str(ipAdress['s2'])+'.'+str(ipAdress['s3'])
            outport = str(ipAdress['outPort'])

            os.system("echo 'yyl' | sudo ovs-ofctl add-flow dp"+switchNo+" ip,idle_timeout=180,nw_dst="+nw_dst+",actions=output:"+outport)

        for tempIP in xrange(mid + 1, sIP + 1):
            ipAdress['s3']=tempIP
            ipAdress['outPort']=ipDict[sIP]

            nw_dst = str(ipAdress['s0'])+'.'+str(ipAdress['s1'])+'.'+str(ipAdress['s2'])+'.'+str(ipAdress['s3'])
            outport = str(ipAdress['outPort'])

            os.system("echo 'yyl' | sudo ovs-ofctl add-flow dp"+switchNo+" ip,idle_timeout=180,nw_dst="+nw_dst+",actions=output:"+outport)

        low = sIP
        outport = ipDict[low]
    for tempIP in xrange(low + 1, n + 1):
        ipAdress['s3']=tempIP
        ipAdress['outPort']=ipDict[low]

        nw_dst = str(ipAdress['s0'])+'.'+str(ipAdress['s1'])+'.'+str(ipAdress['s2'])+'.'+str(ipAdress['s3'])
        outport = str(ipAdress['outPort'])

        os.system("echo 'yyl' | sudo ovs-ofctl add-flow dp"+switchNo+" ip,idle_timeout=180,nw_dst="+nw_dst+",actions=output:"+outport)




def storeTree(inputTree,filename):
    import json
    fw = open(filename, 'w')   #只需要'w'
    fw.write( json.dumps(inputTree) )
    fw.close()
 
def grabTree(filename):
    import json
    fr = open(filename, 'r')   #只需要'r'
    data = json.loads( fr.read() )
    fr.close()
    return data


def main(n, switchId='s1'):
    data = createDataSet('s'+switchId)
    labels = ['s0','s1', 's2', 's3']  # 两个特征
    if data:
        #t1 = time.clock()
        myTree = createTree(data, labels)
        
        #t2 = time.clock()
        # print 'execute for ', t2 - t1
        
        storeTree(myTree, "/home/yyliu/SDN/20181022/flowTable/testPara")
        labels = ['s0','s1', 's2', 's3'] 
        # classify(myTree, labels, destination)
        
        ipAdress = {'s0':192,'s1':168,'s2':123,'s3':1,'outPort':1}
        #treeToFlowtable(myTree, labels,ipAdress,switchId)

        treeToFlowtable_ALL(myTree, labels,ipAdress,switchId,n)
    

if __name__ == '__main__':
    switchId = sys.argv[1]
    n = int(sys.argv[2])
    main(n, switchId = switchId)




