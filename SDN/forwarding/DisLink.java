package net.floodlightcontroller.forwarding;
import java.util.*;

public class DisLink{
	public String start_switch;
	public String end_switch;
	public String outport;
	public String inport;
	public int delay;
	public float bandwidth;
	public boolean isAllocated;
	public HashMap<Flow_request,Float> allocated_bandwidth=new HashMap<Flow_request,Float>();
	
	
	public DisLink(String start_id,String out_port,String end_id,String in_port,int link_delay,int bandwidth){
		this.start_switch=start_id;
		this.outport=out_port;
		this.end_switch=end_id;
		this.inport=in_port;
		this.delay=link_delay;
		this.bandwidth=bandwidth;
		this.isAllocated=false;
		
		allocated_bandwidth.clear();
	}
	
	public DisLink(){
		this.start_switch="";
		this.outport="0";
		this.end_switch="";
		this.inport="0";
		this.delay=0;
		this.bandwidth=0;
		this.isAllocated=false;
		allocated_bandwidth.clear();
	}
	
	public String getLinkStart(){
		return this.start_switch;
	}
	
	public String getLinkEnd(){
		return this.end_switch;
	}
	
	public int getLinkDelay(){
		return this.delay;
	}
	
	public void setStartSwitch(String str){
		this.start_switch=str;
	}
	
	public void setEndSwitch(String str){
		this.end_switch=str;
	}
	
	public void setLinkDelay(int delay_add){
		this.delay=delay_add;
	}

	public String toString(){
		return this.start_switch+" "+this.outport+" "+this.end_switch+" "+this.inport+" "+this.delay+" "+this.bandwidth+"\n";
	}
	
}
