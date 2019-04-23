#!/usr/bin/python
 
from mininet.topo import Topo
from mininet.net import Mininet
from mininet.util import dumpNodeConnections
from mininet.log import setLogLevel
from mininet.node import RemoteController,CPULimitedHost
from mininet.link import TCLink
import time
import random
 
class MyTopo(Topo):
        def __init__(self, n=10, **opts):

                sw = []
               
                Topo.__init__( self )
                for s in range(n):
                        switch = self.addSwitch('s%s' % (s + 1))  
                        sw.append(switch)
                        time.sleep(2)
                
                for h in range(n):
                        host = self.addHost('h%s' % (h + 1))  
                        self.addLink(host, sw[h])  
                        time.sleep(2)

                #for e in range(n-1):
                #        for ei in range(2):
                #                self.addLink( sw[e], sw[random.randint(e+1,n-1)] )
                
                self.addLink( sw[0], sw[1] )
                self.addLink( sw[0], sw[3] )
                self.addLink( sw[1], sw[2] )
                self.addLink( sw[1], sw[7] )
                self.addLink( sw[2], sw[6] )
                self.addLink( sw[2], sw[8] )
                self.addLink( sw[3], sw[4] )
                self.addLink( sw[3], sw[5] )
                self.addLink( sw[4], sw[9] )
                self.addLink( sw[4], sw[6] )
                self.addLink( sw[5], sw[6] )
                self.addLink( sw[5], sw[7] )
                self.addLink( sw[6], sw[7] )
                self.addLink( sw[6], sw[8] )
                self.addLink( sw[7], sw[9] )
                self.addLink( sw[7], sw[8] )
                self.addLink( sw[0], sw[2] )
                self.addLink( sw[1], sw[8] )
                self.addLink( sw[2], sw[4] )
                self.addLink( sw[3], sw[8] )
topos = { 'mytopo': ( lambda: MyTopo() ) }
                
                
def simpleTest():
        topo = MyTopo(n=10)
        #net = Mininet(topo)  
        net = Mininet( topo, controller=RemoteController, host=CPULimitedHost, link=TCLink )
        net.addController( 'c1', controller=RemoteController, ip='114.212.82.55', port=6633 )  
        time.sleep(30)
        net.start()    
        time.sleep(30)
        print ("Dumping host connections")
        dumpNodeConnections(net.hosts)       
        print ("Testing network connectivity"  )   
        net.pingAll()   
        time.sleep(10)
        net.stop()       
 
if __name__ == '__main__':
        setLogLevel('info')  
        simpleTest()