#!/usr/bin/python 
from mininet.net import Mininet
from mininet.node import Node
from mininet.link import Link
from mininet.log import setLogLevel, info
from mininet.util import quietRun
import random
import sys
 
from time import sleep
 
def scratchNet( n, fileName, cname='controller', cargs='-v ptcp:'):
        "Create network from scratch using Open vSwitch."
        sw = []
        host = []
        links = []
        
        info( "*** Creating nodes\n" )
        controller = Node( 'c0', inNamespace=False )

        for s in range(n):
                sw.append( Node( 's%s' % s, inNamespace=False ) )
                host.append( Node( 'h%s' % s ) )
                Link( host[s], sw[s] )
        
        for s in range(n-2):
                randInt = []
                for rand in range(2):
                        randInt.append(random.randint(s+1,n-1))
                randInt = list(set(randInt))
                for rand in range(len(randInt)):
                        links.append(Link( sw[s], sw[randInt[rand]] ))   
        links.append( Link( sw[n-2], sw[n-1] ) )                  
        fw = open(fileName, 'w')
        for lk in links:
                fw.write(str(lk)+'\n')

        fw.close()
        
        info( "*** Configuring hosts\n" )
        for s in range(n):
                host[s].setIP( '192.168.123.%s' % (s+1)+'/24' )
                #info( str( host[s] ) + '\n' )
        
        info( "*** Starting network using Open vSwitch\n" )
        controller.cmd( cname + ' ' + cargs + '&' )
        for s in range(n):
                sw[s].cmd( 'ovs-vsctl del-br dp%s' %s )
                sw[s].cmd( 'ovs-vsctl add-br dp%s' %s  )

        for s in range(n):
                for intf in sw[s].intfs.values():
                        sw[s].cmd( 'ovs-vsctl add-port dp%s %s' % (s,intf) )
                sw[s].cmd( 'ovs-vsctl set-controller dp%s tcp:114.212.82.55:6653' %s )
        
        #switch0.cmd( 'ovs-ofctl add-flow dp0 \"in_port=1 actions=output:2\"' )
        #switch0.cmd( 'ovs-ofctl add-flow dp0 \"in_port=2 actions=output:1\"' )
        #switch1.cmd( 'ovs-ofctl add-flow dp1 \"in_port=1 actions=output:2\"' )
        #switch1.cmd( 'ovs-ofctl add-flow dp1 \"in_port=2 actions=output:1\"' )

        info( '*** Waiting for switch to connect to controller' )
        while 'is_connected' not in quietRun( 'ovs-vsctl show' ):
                sleep( 1 )
                info( '.' )
        info( '\n' )
        for s in range(n):
                print (sw[s].cmd( 'ovs-ofctl dump-flows dp%s' %s ))
        
        info( "*** Running test\n" )
        for h in range(n-1):
                host[h].cmdPrint( 'ping -c3 ' + host[h+1].IP() )
                #for s in range(n):
                #        print (sw[s].cmd( 'ovs-ofctl dump-flows dp%s' %s ))
        print ('input comand')
        comand = input()
        if comand == 1:
                for h in range(n-1):
                        host[h].cmdPrint( 'ping -c3 ' + host[h+1].IP() )
        else:
                info( "*** Stopping network\n" )
                controller.cmd( 'kill %' + cname )
                for s in range(n-1):
                        sw[s].cmd( 'ovs-vsctl del-br dp%s' %s )
                        sw[s].deleteIntfs()
                info( '\n' )
 
if __name__ == '__main__':
        setLogLevel( 'info' )
        info( '*** Scratch network demo (kernel datapath)\n' )
        Mininet.init()
        fileName = '/home/yyliu/SDN/20181022/links'
        scratchNet(10, fileName)