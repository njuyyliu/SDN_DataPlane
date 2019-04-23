package net.floodlightcontroller.forwarding;
import java.util.ArrayList;

class Node{
		public String ID;
		public int linkcount;
		public ArrayList<AdjInfo> adjcent_list=new ArrayList<AdjInfo>();
		
		public Node(String id){
			this.ID=id;	
		}
		
		public void add_adj_node(AdjInfo id){
			this.adjcent_list.add(id);
		}
		
		public int has_link_to(String dst_node){
			for(AdjInfo node_temp :adjcent_list){
				if(node_temp.adj_id.equals(dst_node)){
					return adjcent_list.indexOf(node_temp);
				}
			}
			return 0;
		}
		
		
}
