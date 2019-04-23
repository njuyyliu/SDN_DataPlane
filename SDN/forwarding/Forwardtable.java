package net.floodlightcontroller.forwarding;

import java.util.ArrayList;

public class Forwardtable {
	public String ft_id;
	public String src_node;
	public String dst_node;
	public ArrayList<DisLink> ft_link=new ArrayList<DisLink>();
	
	public Forwardtable(){
		
	}
	
	public ArrayList<DisLink> getFt_link(){
		return this.ft_link;
	}


}
