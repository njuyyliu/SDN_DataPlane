#!/usr/bin/python 
from mininet.net import Mininet
from mininet.node import Node
from mininet.link import Link
from mininet.log import setLogLevel, info
from mininet.util import quietRun
import random
import sys
import time
 
from time import sleep
 
def scratchNet( n, fileName, topoFile, cname='controller', cargs='-v ptcp:'):
        "Create network from scratch using Open vSwitch."
        sw = []
        host = []
        links = []
        
        #read Topo from original file
        switchNo = []
        switch_links = {}
        fr = open(topoFile)
        for line in fr.readlines():
                temp = line.strip().split(' ')   
                link_temp=[]   
                switch_start = temp[0]
                switchNo.append(temp[0])
                for ts in range(len(temp) - 1):
                        if int(temp[ts + 1]) > int(temp[0]):
                                link_temp.append(temp[ts + 1]) 
                switch_links[switch_start] = link_temp
    
        info( "*** Creating nodes\n" )
        controller = Node( 'c0', inNamespace=False )

        for s in range(len(switchNo)):
                sw.append( Node( 's%s' % s, inNamespace=False ) )
                host.append( Node( 'h%s' % s ) )
                Link( host[s], sw[s] )

        
        for swt in switchNo:
                for edge in switch_links[swt]:
                        links.append(Link(sw[switchNo.index(swt)], sw[switchNo.index(edge)]))


        info( "*** Configuring hosts\n" )
        for s in range(len(host)):
                host[s].setIP( '192.168.123.%s' % (s+1)+'/24' )
                #info( str( host[s] ) + '\n' )
        
        info( "*** Starting network using Open vSwitch\n" )
        controller.cmd( cname + ' ' + cargs + '&' )
        for s in range(len(sw)):
                sw[s].cmd( 'ovs-vsctl del-br dp%s' %s )
                sw[s].cmd( 'ovs-vsctl add-br dp%s' %s  )

        for s in range(len(sw)):
                for intf in sw[s].intfs.values():
                        sw[s].cmd( 'ovs-vsctl add-port dp%s %s' % (s,intf) )
                sw[s].cmd( 'ovs-vsctl set-controller dp%s tcp:114.212.82.55:6653' %s )
		sleep(2)
        
        #switch0.cmd( 'ovs-ofctl add-flow dp0 \"in_port=1 actions=output:2\"' )
        #switch0.cmd( 'ovs-ofctl add-flow dp0 \"in_port=2 actions=output:1\"' )
        #switch1.cmd( 'ovs-ofctl add-flow dp1 \"in_port=1 actions=output:2\"' )
        #switch1.cmd( 'ovs-ofctl add-flow dp1 \"in_port=2 actions=output:1\"' )

        info( '*** Waiting for switch to connect to controller' )
        while 'is_connected' not in quietRun( 'ovs-vsctl show' ):
                sleep( 2 )
                info( '.' )
        info( '\n' )
        #for s in range(len(sw)):
        #        print (sw[s].cmd( 'ovs-ofctl dump-flows dp%s' %s ))
        
        info( "*** Running test\n" )
        
        print (' input comand 1:run test  2:print links  3:pingall  0:exit  ')
        comand = raw_input()
                
        while comand != '0':
                if comand == '1':
                        pingNode = {}
                        t1 = time.time()
                        for count in range(5):    
                                start = host[random.randint(0, len(host)-1)]
                                end = host[random.randint(0, len(host)-1)]
                                
                                if start != end:
                                        pingNode[start] = end
                                        start.cmdPrint( 'ping -c3 ' + end.IP() )
                                #for s in range(n):
                                #        print (sw[s].cmd( 'ovs-ofctl dump-flows dp%s' %s ))
                        t2 = time.time()
                        print 'original execute for ', t2 - t1
			print 'input comand 1: continue'
			comanda = raw_input()
                        t1 = time.time()
                        for startNode in pingNode:
                                startNode.cmdPrint( 'ping -c3 ' + pingNode[startNode].IP() )
                        t2 = time.time()
                        print 'decision execute for ', t2 - t1
                elif comand == '2':
                        fw = open(fileName, 'w')
                        for lk in links:
                                fw.write(str(lk)+'\n')
                        fw.close()
                elif comand == '3':
                        for s in range(len(host)-1):
                                for e in xrange(s+1, len(host)):
                                        host[s].cmdPrint( 'ping -c3 ' + host[e].IP() )

                print (' input comand 1:run test  2:print links  3:pingall  0:exit  ')
                comand = raw_input()
          
      

        info( "*** Stopping network\n" )
        controller.cmd( 'kill %' + cname )
        for s in range(len(sw)):
                sw[s].cmd( 'ovs-vsctl del-br dp%s' %s )
                sw[s].deleteIntfs()
        info( '\n' )
                
 
if __name__ == '__main__':
        setLogLevel( 'info' )
        info( '*** Scratch network demo (kernel datapath)\n' )
        Mininet.init()
        fileName = '/home/yyliu/SDN/20181022/links'
        topoFilename = '/home/yyliu/SDN/20181022/smallTopo_50.cch'
        scratchNet(10, fileName, topoFilename)
