#!/usr/bin/python
from mininet.topo import Topo
from mininet.net import Mininet
from mininet.node import RemoteController,CPULimitedHost
from mininet.link import TCLink
from mininet.util import dumpNodeConnections
from mininet.log import setLogLevel
 
class MyTopo( Topo ):
    "Simple topology example."
 
    def __init__( self ):
        "Create custom topo."
 
        # Initialize topology
        Topo.__init__( self )

        rightSwitch = self.addSwitch( 's4' )
        rightSwitch2 = self.addSwitch( 's5' )

        leftHost = self.addHost( 'h1' )
        rightHost = self.addHost( 'h2' )
        leftSwitch = self.addSwitch( 's3' )
        
        # Add links
        self.addLink( leftHost, leftSwitch )
        self.addLink( leftSwitch, rightSwitch )
	self.addLink( rightSwitch, rightSwitch2 )
        self.addLink( rightSwitch2, rightHost )


def simpleTest():
        "Create and test a simple network"
        topo = MyTopo()
        net = Mininet( topo, controller=RemoteController, host=CPULimitedHost, link=TCLink )
        net.addController( 'c1', controller=RemoteController, ip='114.212.82.55', port=6653 )
        net.start()       
        dumpNodeConnections(net.hosts )       
        #net.pingAll()     
        h1, h2 = net.get( 'h1', 'h2' )
        net.iperf( ( h1, h2 ) )
        h1, h3 = net.get( 'h1', 'h3' )
        net.iperf( ( h1, h3 ) )
        h1, h5 = net.get( 'h1', 'h5' )
        net.iperf( ( h1, h5 ) )
        #net.stop()
        
if __name__ == '__main__':
        # Tellmininet to print useful information
        setLogLevel( 'info' )
        simpleTest()
