package net.floodlightcontroller.forwarding;
import java.util.*;
import java.io.*;
import  java.text.DecimalFormat;
//import java.util.Calendar;










import net.floodlightcontroller.core.FloodlightContext;
import net.floodlightcontroller.core.IOFSwitch;
import net.floodlightcontroller.core.internal.IOFSwitchService;
import net.floodlightcontroller.core.types.NodePortTuple;

//import net.floodlightcontroller.routing.IRoutingDecision;
import net.floodlightcontroller.routing.Path;
import net.floodlightcontroller.routing.PathId;
//import net.floodlightcontroller.routing.ForwardingBase;










import org.projectfloodlight.openflow.protocol.OFFlowModCommand;
import org.projectfloodlight.openflow.protocol.OFPacketIn;
import org.projectfloodlight.openflow.protocol.match.Match;
import org.projectfloodlight.openflow.types.DatapathId;
import org.projectfloodlight.openflow.types.OFPort;
import org.projectfloodlight.openflow.types.U64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Graph {
	protected static final Logger log = LoggerFactory.getLogger(Graph.class);
	ArrayList<Node> nodelist=new ArrayList<>();
	ArrayList<DisLink> linklist=new ArrayList<>();
	ArrayList<Flow_request> flowRequestList=new ArrayList<>();
	public ArrayList<Flow_request> crossDomainFlowRequestList=new ArrayList<>();
	public ArrayList<Flow_request> InsideDomainFlowRequestList=new ArrayList<>();
	public static final int st_domain = 2;

    //public static String GraphNodeFile="/home/gx/h123/clusters";
    //public static String GraphLinkFile="/home/gx/h123/links";
    //public static String GraphFlowReuqestListFile="/home/gx/h123/RandomFlowRequest(copy)";
	public static int domain=1;
    public static String GraphFlowReuqestListFile="/home/gx/h123/RandomFlowRequest (copy)";
    public static String crossDomainFlowRequestListFile="/home/gx/h123/singleTopo/cossDomainFlow_"+st_domain;
    public static String InDomainFlowRequestListFile="/home/gx/h123/InDomainFlowRequest";
    //public static String flowBreakDownPath="/home/gx/h123/totalTopology/crossDomainFlow/crossDomainFlow";
	
    public int max_delay=10000000;
	public static int TE_count=0;
	public static String[][] MarginalSwitch={{"00:00:00:00:00:00:00:6c","00:00:00:00:00:00:00:3a"},{"00:00:00:00:00:00:00:9d","00:00:00:00:00:00:00:a0"},{"00:00:00:00:00:00:01:3f","00:00:00:00:00:00:01:43"},{"00:00:00:00:00:00:01:bd","00:00:00:00:00:00:02:12"},{"00:00:00:00:00:00:02:5a","00:00:00:00:00:00:02:5c"}};
	public static String[] localMarginalSwitch={" "," "};
	public static int[][] marginalSwitchDistance=new int[10][10];
	public static float total_bandwith = 0;
	public static float max_fairness=0;


	public Graph(String link_file_path,String clusters_file_path){
		try{
			String encoding="utf-8";
			File file_in1=new File(clusters_file_path);
			if(file_in1.isFile()&&file_in1.exists()){
				InputStreamReader read=new InputStreamReader(new FileInputStream(file_in1),encoding);
				BufferedReader bufferReader=new BufferedReader(read);
				String lineTxt;
				while((lineTxt=bufferReader.readLine())!=null){
					addNode(new Node(lineTxt));
				}
				read.close();
			}

			File file_in2=new File(link_file_path);
			if(file_in2.isFile()&&file_in2.exists()){
				InputStreamReader read2=new InputStreamReader(new FileInputStream(file_in2),encoding);
				BufferedReader bufferReader=new BufferedReader(read2);
				String lineTxt;
				while((lineTxt=bufferReader.readLine())!=null){
					//log.info("---linetxt for links----{}",lineTxt);
					String[] info_temp=lineTxt.split(" ");

					String initial_id=info_temp[0];

					String out_port=info_temp[1];

					String adj_id=info_temp[2];

					String in_port=info_temp[3];

					int adj_delay=Integer.parseInt(info_temp[4],16);

					int adj_bandwidth=Integer.parseInt(info_temp[5], 10);
					

					AdjInfo adj_new=new AdjInfo(adj_id,adj_bandwidth,adj_delay);

					for(Node tmp:this.nodelist){
						if(tmp.ID.equals(initial_id)){
							//int index=nodelist.indexOf(tmp);
							//nodelist.get(index).add_adj_node(adj_new);
							tmp.add_adj_node(adj_new);
						}
					}
					this.linklist.add(new DisLink(initial_id,out_port,adj_id,in_port,adj_delay,adj_bandwidth));
					total_bandwith+=adj_bandwidth;
					}
				read2.close();
			}
		}catch(Exception e){
			System.out.println("Error:read file error");
			e.printStackTrace();
		}
		
		switch(domain){
		case 0:
			localMarginalSwitch[0]="00:00:00:00:00:00:00:6c";
			localMarginalSwitch[1]="00:00:00:00:00:00:00:3a";
			break;
		case 1:
			localMarginalSwitch[0]="00:00:00:00:00:00:00:9d";
			localMarginalSwitch[1]="00:00:00:00:00:00:00:a0";
			break;
		case 2:
			localMarginalSwitch[0]="00:00:00:00:00:00:01:3f";
			localMarginalSwitch[1]="00:00:00:00:00:00:01:43";
			break;
		case 3:
			localMarginalSwitch[0]="00:00:00:00:00:00:01:bd";
			localMarginalSwitch[1]="00:00:00:00:00:00:02:12";
			break;
		case 4:
			localMarginalSwitch[0]="00:00:00:00:00:00:02:5a";
			localMarginalSwitch[1]="00:00:00:00:00:00:02:5c";
			break;
		default:
			break;
	}
	}

	public Node getNode(String node_id){
		for(Node node:this.nodelist){
			if(node.ID.equals(node_id))
				return node;
		}
		return null;
	}

	public DisLink getLink(String start_switch,String end_switch){
		
		for(DisLink tmp:this.linklist){
			if(tmp.getLinkStart().equals(start_switch)&&tmp.getLinkEnd().equals(end_switch)){
				
				return tmp;
			}

		}
		return null;
	}

	public void addNode(Node temp){
		this.nodelist.add(temp);
	}

	public int getDirectDistance(String src,String dst){
		int distance=-1;
		if(getNode(src)!=null){
			for(AdjInfo temp:getNode(src).adjcent_list){
				if(temp.adj_id.equals(dst)){
					distance=temp.adj_delay;
				}
			}
		}
		return distance;
	}

	public String getId(int id_num){
		return nodelist.get(id_num).ID;
	}

	public int getNum(String id){
		int index=-1;

		for(Node temp:nodelist){
			if(temp.ID.equals(id)){
				index=nodelist.indexOf(temp);
				return index;
			}
		}
		return index;
	}


	public int[][] constructDelayAdjMatrix(){
		int[][] matrix=new int[nodelist.size()][nodelist.size()];
		int max_distance=max_delay;

		for(int m=0;m<matrix.length;m++){
			for(int n=0;n<matrix[m].length;n++){
				matrix[m][n]=max_distance;
			}
			matrix[m][m]=0;
		}

		for(Node node:nodelist){
			int start=nodelist.indexOf(node);
			int end;
			for(AdjInfo info:node.adjcent_list){
				end=nodelist.indexOf(getNode(info.adj_id));
				if(end!=-1) {
					matrix[start][end] = info.adj_delay;
				}
			}
		}
		return matrix;
	}

	
	public int[] dijkstra_prototype(int start){
		int[][] mat=this.constructDelayAdjMatrix();
		ArrayList<Integer> output=new ArrayList<>();

		int min;
		int[] dis=new int[mat.length];
		int i,j,u=0;
		int[] v=new int[mat.length];
		int[] prev=new int[mat.length];

		for(i=0;i<mat.length;i++){
			dis[i]=mat[start][i];
			v[i]=0;
			prev[i]=-1;
		}
		v[start]=1;
		dis[start]=0;

		output.add(start);

		for(i=1;i<mat.length;i++){
			min=max_delay;
			for(j=0;j<mat.length;j++){
				if((v[j]==0)&&(dis[j]<min)){
					min=dis[j];
					u=j;
				}
			}
			v[u]=1;
			
			/*if(!output.contains(u)) {
				output.add(u);
			}*/
			for(j=0;j<mat.length;j++){
				int tmp = (mat[u][j]==max_delay ? max_delay : (min + mat[u][j]));
				if(v[j]==0&&dis[j]>tmp){
					dis[j]=dis[u]+mat[u][j];
					prev[j]=u;
				}
			}
		}
		return prev;
	}



	public void printPath(String src,String dst){
		int start=getNum(src);
		int end=getNum(dst);
		
		int[] result=dijkstra_prototype(start);
		ArrayList<Integer> output_result=new ArrayList<>();
//		output_result.add(end);
		int i=end;
		int prev_index=0;
		while(result[i]!=-1){
			prev_index=result[i];
			output_result.add(prev_index);
			i=prev_index;
		}
		if(!output_result.isEmpty()) {
//			output_result.add(start);
			Collections.reverse(output_result);
			System.out.print(src+"==>");
			for (int j = 0; j < output_result.size(); j++) {
				System.out.print(getId(output_result.get(j)) + "==>");
			}
			System.out.print(dst+"||");
		}else{
			System.out.println("Can not find the path from "+src+" to the "+dst);
		}
		//result.add(getNum(dst));
		/*if(result.contains(end)){
			int end_index=result.indexOf(end);
			//result.add(0, start);
			for(int i=0;i<=end_index;i++){
				output_result.add(result.get(i));
			}
			System.out.println("The path from "+"\""+src+"\""+" to \""+dst+"\""+" is:");
			for(int i=0;i<output_result.size();i++){
				System.out.print(getId(output_result.get(i))+"==>");
			}
			System.out.println("End");
		}
		else
			System.out.println("Can not find the path from "+src+" to the "+dst);;*/
	}

	/*public ArrayList<Integer> getIndexPath(String src,String dst){
		int start=getNum(src);
		int end=getNum(dst);
		ArrayList<Integer> result=dijkstra_prototype(start);
		//result.add(getNum(dst));
		if(result.contains(end)){
			int end_index=result.indexOf(end);
			//result.add(0, start);
			for(int i=end_index+1;i<result.size();i++){
				result.remove(i);
			}
			return result;
		}
		else
			System.out.println("Can not find the path from "+src+" to the "+dst);
			return null;
	}*/


	public ArrayList<String> getStringPath(String src,String dst){
		int start=getNum(src);
		int end=getNum(dst);
		//log.info("----------------------start,end ------------{}",src);
		//log.info("----------------------start,end ------------{}",dst);
		int[] result=dijkstra_prototype(start);
		//log.info("----------------------start,end ------------{}",result);
		ArrayList<Integer> output_result=new ArrayList<>();
		ArrayList<String> output_string=new ArrayList<>();
		int i=end;
		int prev_index=0;

		while(result[i]!=-1){
			prev_index=result[i];
			output_result.add(prev_index);
			i=prev_index;
		}
		if(!output_result.isEmpty()) {
			output_result.add(start);
			Collections.reverse(output_result);
			output_result.add(end);
			for (int j = 0; j < output_result.size(); j++) {
				output_string.add(getId(output_result.get(j)));
			}
			//log.info("----------------------output_string ------------{}",output_string);
			return output_string;
		} else if(output_result.isEmpty()&&getLink(src,dst)!=null){
			output_result.add(start);
			output_result.add(end);
			for(int j=0;j<output_result.size();j++){
			    output_string.add(getId(output_result.get(j)));
			   }

			return output_string;
			}else
			return null;


		/*int start=getNum(src);
		int end=getNum(dst);
		ArrayList<Integer> result=dijkstra_prototype(start);
		ArrayList<String> StringResult= new ArrayList<>();
		StringResult.clear();
		//result.add(getNum(dst));
		if(result.contains(end)){
			int end_index=result.indexOf(end);
			//result.add(0, start);
			for(int i=0;i<=end_index;i++){
				StringResult.add(getId(result.get(i)));
			}
			return StringResult;
		}
		else
			System.out.println("Can not find the path from "+src+" to the "+dst);
			return null;*/
	}


	public int getDistance(String src,String dst){
		int distance=0;
		ArrayList<String> path=this.getStringPath(src, dst);
		for(int i=0;i<path.size()-1;i++){
			distance+=this.getDirectDistance(path.get(i), path.get(i+1));
		}
		return distance;
	}
/*
	public ArrayList<Flow_request> collectFlowRequest(String FlowRequestFilePath){
		
		this.flowRequestList.clear();
		log.info("-------collectFlowRequest() --------");
		try{
			String encoding="utf-8";
			File file_in=new File(FlowRequestFilePath);
			if(file_in.isFile()&&file_in.exists()){
				log.info("-------file_in.isFile()&&file_in.exists() --------");
				InputStreamReader read=new InputStreamReader(new FileInputStream(file_in),encoding);
				BufferedReader bufferReader=new BufferedReader(read);
				String lineTxt;
				while((lineTxt=bufferReader.readLine())!=null){
					String[] info_temp=lineTxt.split(" ");
					flowRequestList.add(new Flow_request(info_temp[0],info_temp[1],info_temp[2],Integer.parseInt(info_temp[3],10),Integer.parseInt(info_temp[4],16),Integer.parseInt(info_temp[5],10)));
					log.info("-------collect flow request list --------");
				}
				read.close();
			}
		}catch(Exception e){
			System.out.println("Error:read flowrequest file error ");
			e.printStackTrace();
		}
		return flowRequestList;
	}*/
	
	public int getDelay(String src,String dst){//
		int distance=0;
		ArrayList<String> path=this.getStringPath(src, dst);
		if(path!=null) {
			for (int i = 0; i < path.size() - 1; i++) {
				distance += this.getDirectDistance(path.get(i), path.get(i + 1));
			}
		}else
			distance=99999;
		return distance;
	}
	
	public ArrayList<Flow_request> collectFlowRequest(String FlowRequestFilePath){
		this.flowRequestList.clear();
		this.crossDomainFlowRequestList.clear();
		this.InsideDomainFlowRequestList.clear();
		log.info("-------collect flow request list --------");
		try{
			String encoding="utf-8";
			File file_in=new File(FlowRequestFilePath);
			if(file_in.isFile()&&file_in.exists()){
				InputStreamReader read=new InputStreamReader(new FileInputStream(file_in),encoding);
				BufferedReader bufferReader=new BufferedReader(read);
				String lineTxt;
				while(((lineTxt=bufferReader.readLine())!=null)&&(lineTxt.length()>1)){
					String[] info_temp=lineTxt.split(" ");
					flowRequestList.add(new Flow_request(info_temp[0],info_temp[1],info_temp[2],Float.parseFloat(info_temp[3]),Integer.parseInt(info_temp[4],16),Integer.parseInt(info_temp[5],10),Float.parseFloat(info_temp[6])));
					if(max_fairness<Float.parseFloat(info_temp[6])){
						max_fairness=Float.parseFloat(info_temp[6]);
					}
					
				}
				read.close();
			}
		}catch(Exception e){
			System.out.println("Error:");
			e.printStackTrace();
		}
		return flowRequestList;
	}
	
	public void marginal_distance_init(){
		for(int i=0;i<10;i++){
			for(int j=0;j<10;j++){
				marginalSwitchDistance[i][j]=this.getDelay(MarginalSwitch[(i/2)][(i%2)],MarginalSwitch[(j/2)][(j%2)]);
			}
		}
	}
	/*
	 public ArrayList<Flow_request> crossDomianRequestProcess(){
		for(Flow_request tmp_request:this.flowRequestList){
			if(tmp_request.cross_domain_flag==true){
				int[] dis=new int[4];
				dis[0]=this.getDelay(tmp_request.src_id,localMarginalSwitch[0])+marginalSwitchDistance[tmp_request.src_domain*2][tmp_request.dst_domain*2];
				dis[1]=this.getDelay(tmp_request.src_id,localMarginalSwitch[0])+marginalSwitchDistance[tmp_request.src_domain*2][tmp_request.dst_domain*2+1];
				dis[2]=this.getDelay(tmp_request.src_id,localMarginalSwitch[1])+marginalSwitchDistance[tmp_request.src_domain*2+1][tmp_request.dst_domain*2];
				dis[3]=this.getDelay(tmp_request.src_id,localMarginalSwitch[1])+marginalSwitchDistance[tmp_request.src_domain*2+1][tmp_request.dst_domain*2+1];
				int min_number=0;
				int min_value=dis[0];
				for(int i=1;i<4;i++){
					if(dis[i]<min_value){
						min_number=i;
						min_value=dis[i];
					}
				}
				switch(min_number){
					case 0:
						tmp_request.src_id=MarginalSwitch[tmp_request.src_domain][0];
						tmp_request.dst_id=MarginalSwitch[tmp_request.dst_domain][0];
						break;
					case 1:
						tmp_request.src_id=MarginalSwitch[tmp_request.src_domain][0];
						tmp_request.dst_id=MarginalSwitch[tmp_request.dst_domain][1];
						break;
					case 2:
						tmp_request.src_id=MarginalSwitch[tmp_request.src_domain][1];
						tmp_request.dst_id=MarginalSwitch[tmp_request.dst_domain][0];
						break;
					case 3:
						tmp_request.src_id=MarginalSwitch[tmp_request.src_domain][1];
						tmp_request.dst_id=MarginalSwitch[tmp_request.dst_domain][1];
						break;
					default:
						break;
				}
				this.crossDomainFlowRequestList.add(tmp_request);
			}else if(tmp_request.cross_domain_flag==false){
				this.InsideDomainFlowRequestList.add(tmp_request);
			}
		}

		try {
			File file_out = new File(crossDomainFlowRequestListFile);
			FileWriter file_write = new FileWriter(file_out, false);
			for(Flow_request tmp:this.crossDomainFlowRequestList) {
				String crossDomainFlowRequestString = tmp.fr_id+" "+tmp.src_id + " "+tmp.dst_id+" "+tmp.bandwidth_request+" "+tmp.delay_request+" "+tmp.priority+" "+tmp.dst_id+"\n";
				file_write.write(crossDomainFlowRequestString);
			}
			file_write.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try{
			File file_out_1=new File(InDomainFlowRequestListFile);
			FileWriter file_write_1=new FileWriter(file_out_1,false);
			for(Flow_request tmp_1:this.InsideDomainFlowRequestList){
				String InDomainFlowRequestString=tmp_1.fr_id+" "+ tmp_1.src_id+" "+tmp_1.dst_id+" "+tmp_1.bandwidth_request+" "+tmp_1.delay_request+" "+ tmp_1.priority+"\n";
				file_write_1.write(InDomainFlowRequestString);
			}
			file_write_1.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		return this.InsideDomainFlowRequestList;
	}
	 * */
	public ArrayList<Flow_request> crossDomianRequestProcess(){
		long start=Calendar.getInstance().getTimeInMillis();
		for(Flow_request tmp_request:this.flowRequestList){
			if(tmp_request.cross_domain_flag==true){	
				int[] dis=new int[2];
				dis[0]=this.getDelay(tmp_request.src_id,localMarginalSwitch[0]);
				dis[1]=this.getDelay(tmp_request.src_id,localMarginalSwitch[1]);
				
				tmp_request.src_marg0=dis[0];
				tmp_request.src_marg1=dis[1];
				
				this.crossDomainFlowRequestList.add(tmp_request);
			}else if(tmp_request.cross_domain_flag==false){
				this.InsideDomainFlowRequestList.add(tmp_request);
			}
		}
		long end=Calendar.getInstance().getTimeInMillis();
		try {
			File file_time = new File("/home/gx/h123/TE_run_time");
			FileWriter file_time_write=new FileWriter(file_time,true);
			String fileoutput = "crossDomsinProcess time  : "+ ((double)(end-start)/1000) + "\n";
			file_time_write.write(fileoutput);
			file_time_write.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			File file_out = new File(crossDomainFlowRequestListFile);
			FileWriter file_write = new FileWriter(file_out, false);
			for(Flow_request tmp:this.crossDomainFlowRequestList) {
				String crossDomainFlowRequestString = tmp.fr_id+" "+tmp.src_id +" "+tmp.dst_id+" "+tmp.bandwidth_request+" "+tmp.delay_request+" "+tmp.priority+" "+tmp.src_marg0+" "+tmp.src_marg1+" "+tmp.fairness_value+"\n";
				file_write.write(crossDomainFlowRequestString);
			}
			file_write.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try{
			File file_out_1=new File(InDomainFlowRequestListFile);
			FileWriter file_write_1=new FileWriter(file_out_1,false);
			for(Flow_request tmp_1:this.InsideDomainFlowRequestList){
				String InDomainFlowRequestString=tmp_1.fr_id+" "+ tmp_1.src_id+" "+tmp_1.dst_id+" "+tmp_1.bandwidth_request+" "+tmp_1.delay_request+" "+ tmp_1.priority+" "+tmp_1.fairness_value+"\n";
				file_write_1.write(InDomainFlowRequestString);
			}
			file_write_1.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		return this.InsideDomainFlowRequestList;
	}


	public void dijkstra_flow_request_path_write(Flow_request fr){
		ArrayList<String> path_node=this.getStringPath(fr.src_id, fr.dst_id);
		DisLink tmp;
		if(path_node!=null) {
			for (int i = 0; i < (path_node.size() - 1); i++) {
				tmp = this.getLink(path_node.get(i), path_node.get(i + 1));
				if (tmp != null) {
					fr.AllocatedPath.add(tmp);
				}
				else{
					
				}
			}
		}
	}
	
	 public void localTE() {//域内controller处理数据流请求的TE函数
		 TE_count++;
		 for (Flow_request temp_flow_request : this.InsideDomainFlowRequestList) {
			 int min=9999999;
			 this.dijkstra_flow_request_path_write(temp_flow_request);
			 for (DisLink temp : temp_flow_request.AllocatedPath) {
				 	temp.allocated_bandwidth.put(temp_flow_request, temp_flow_request.bandwidth_request);
				 	if(temp.delay<min){
				 		min=temp.delay;
				 	}
			 }
			 temp_flow_request.min_delay=min;
		 }
		 for (DisLink tmp : this.linklist) {
			 for (Flow_request key : tmp.allocated_bandwidth.keySet()) {
				 if(key.AllocatedPath.size()!=0&&tmp.isAllocated!=true) {
					 float band_width_temp = key.fairness_value*key.priority;
					 if(band_width_temp<=tmp.bandwidth&&band_width_temp<key.min_bandwidth){
						 key.min_bandwidth = band_width_temp;
						 tmp.bandwidth-=band_width_temp;
					 }
				 }
				 if(tmp.bandwidth<=0){
					 tmp.isAllocated=true;
				 }
			 }
		 }
	}


/*
	public void localTE() {
		TE_count++;

		//for (Flow_request temp_flow_request : this.flowRequestList) {
		for (Flow_request temp_flow_request : this.InsideDomainFlowRequestList) {
			log.info("----indomainflow -----{} {}",temp_flow_request.src_id,temp_flow_request.dst_id);
			int min=9999999;
			this.dijkstra_flow_request_path_write(temp_flow_request);
			for (DisLink temp : temp_flow_request.AllocatedPath) {
				temp.allocated_bandwidth.put(temp_flow_request, temp_flow_request.bandwidth_request);
				if(temp.delay<min){
					min=temp.delay;
				}
			}
			temp_flow_request.min_delay=min;
		}

		for (DisLink tmp : this.linklist) {
			int sum_priority = 0;
			for (Flow_request key : tmp.allocated_bandwidth.keySet()) {
				sum_priority += key.priority;
			}
			for (Flow_request key : tmp.allocated_bandwidth.keySet()) {
				if(key.AllocatedPath.size()!=0) {
					float band_width_temp = tmp.bandwidth * ((float) key.priority / sum_priority);
					if (band_width_temp <= key.min_bandwidth&&band_width_temp<=key.bandwidth_request) {
						key.min_bandwidth = band_width_temp;
						tmp.isAllocated = true;
					}
					else if(band_width_temp<=key.min_bandwidth&&band_width_temp>=key.bandwidth_request){
						key.min_bandwidth=key.bandwidth_request;
					}
				}//else{
				//tmp.bandwidth-=band_width_temp;
				//if(tmp.bandwidth<=0){
				//	tmp.isAllocated=true;
				//}
			}
		}
		

	}
 * */
	public void flowMerge(){
		try{
			File crossDomainFlowTEresult=new File("/home/gx/h123/singleTopo/crossDomainFlowTEResult_"+st_domain);
			File intraDomainFlowTEresult=new File("/home/gx/h123/intraDomainFlowTEResult_"+st_domain);
			FileWriter file_write = new FileWriter(crossDomainFlowTEresult);
			FileWriter file_write_in = new FileWriter(intraDomainFlowTEresult);
			for(Flow_request tm:this.InsideDomainFlowRequestList) {
				if (tm.min_bandwidth == 99999.0) {
					tm.min_bandwidth = 0;
				}
				if(tm.fr_id.endsWith("#")){
					String content=tm.fr_id+" "+tm.src_id+" "+tm.dst_id+" "+tm.bandwidth_request+" "+tm.min_bandwidth+" "+tm.delay_request+" "+tm.priority+" "+tm.fairness_value+"\n";
					file_write.write(content);
				}else{
					if(tm.bandwidth_request>tm.min_bandwidth){						
						String content=tm.fr_id+" "+tm.src_id+" "+tm.dst_id+" "+(tm.bandwidth_request-tm.min_bandwidth)+" "+tm.delay_request+" "+tm.priority+" "+tm.fairness_value+"\n";
						file_write_in.write(content);
					}
				}
			}
			file_write.close();
			file_write_in.close();
		}catch (IOException e){
			e.printStackTrace();
		}
	}


	public void printResult(){
		for (Flow_request tm : this.flowRequestList) {
			if(tm.min_bandwidth==99999.0){
				tm.min_bandwidth=0;
			}
			//System.out.print(tm.src_id+" -> "+" "+tm.dst_id+" "+tm.AllocatedPath + " || Allocated Bandwidth: ");
			//System.out.println(tm.min_bandwidth);
//			printPath(tm.src_id,tm.dst_id);
			ArrayList<String> out_for_print=getStringPath(tm.src_id,tm.dst_id);
			System.out.println("The TE result for flow request from "+tm.src_id+" to "+tm.dst_id+" is: ");
			if(out_for_print!=null) {
				for(int index_out=0;index_out<out_for_print.size()-1;index_out++){
					DisLink tmp_out=getLink(out_for_print.get(index_out),out_for_print.get(index_out+1));
					if(tmp_out!=null){
						System.out.println(tmp_out.start_switch+" "+tmp_out.outport);
						System.out.println(tmp_out.end_switch+" "+tmp_out.inport);
//						System.out.println();
					}
				}
			
				System.out.println("Flow request id: "+tm.fr_id);
				System.out.println("Request Bandwidth: "+tm.bandwidth_request);
				System.out.println("Allocated bandwidth: "+tm.min_bandwidth );
				System.out.println("Flowrequest priority: "+tm.priority);
				System.out.println("Delay : "+tm.min_delay);
				System.out.println("Not allocated bandwidth: "+(tm.bandwidth_request-tm.min_bandwidth));
				System.out.println();
			}else{
				System.out.println("TE failed:Can not find a valid path.");
				System.out.println();
			}
			/*int[] tmp=dijkstra_prototype(getNum(tm.src_id));
			System.out.println(getNum(tm.src_id)+"===");
			for(int i=0;i<tmp.length;i++){
				System.out.print(tmp[i]+" ");
			}
			System.out.println();*/
		}
	}

	public void printResult_1(){
		
		
		for (Flow_request tm : this.flowRequestList) {
			if (tm.min_bandwidth == 99999.0) {
				tm.min_bandwidth = 0;
			}
//			String file_TE_out_string="/home/gx/h123/TE/"+tm.src_id+"--"+tm.dst_id;
			String file_syn_out_string="/home/gx/h123/singleTopo/bandwithAllocation";
			ArrayList<String> out_for_print=getStringPath(tm.src_id,tm.dst_id);
			List<NodePortTuple> Link_switchPorts = new ArrayList<NodePortTuple>();
			try {
//				File file_out = new File(file_TE_out_string);
//				FileWriter file_write=new FileWriter(file_out,false);
				if(out_for_print!=null) {
							            	
	            	       	
					//file_write.write(srcTemp+" "+inPort+"\n");
					for (int index_out = 0; index_out < out_for_print.size() - 1; index_out++) {
						DisLink tmp_out = getLink(out_for_print.get(index_out), out_for_print.get(index_out + 1));						
						if (tmp_out != null) {
							//String file_content=tmp_out.start_switch+" "+tmp_out.outport+"\n"+tmp_out.end_switch+" "+ tmp_out.inport+"\n";
							//file_write.write(file_content);
							
			                        
						}
					}
					//file_write.write(dstTemp+" "+outPort);
				       	
				}

				File file_out_1 = new File(file_syn_out_string);
				FileWriter file_write_1=new FileWriter(file_out_1,true);
				String file_syn_content=tm.fr_id+" "+tm.src_id+" "+tm.dst_id+" "+tm.bandwidth_request+" "+tm.min_bandwidth+" "+TE_count+"\n";
				file_write_1.write(file_syn_content);

//				file_write.close();
				file_write_1.close();

			} catch (IOException e) {
			e.printStackTrace();
			}
			
	        
		}
		
	}


	public void printSynchronizationInformation(){
		for (Flow_request tm : this.flowRequestList) {
			if(tm.min_bandwidth==99999.0){
				tm.min_bandwidth=0;
			}
			//System.out.print(tm.src_id+" -> "+" "+tm.dst_id+" "+tm.AllocatedPath + " || Allocated Bandwidth: ");
			//System.out.println(tm.min_bandwidth);
//			printPath(tm.src_id,tm.dst_id);
			ArrayList<String> out_for_print=getStringPath(tm.src_id,tm.dst_id);
			System.out.println(tm.fr_id+" "+tm.src_id+" "+tm.dst_id+" "+tm.bandwidth_request+" "+tm.min_bandwidth+" "+TE_count);
		}
	}
	
	
	
	public void addLink(String src_point,String dst_point,int delay,int bandwidth){
		AdjInfo adj_to_add=new AdjInfo(dst_point,bandwidth,delay);
		for(Node tmp:this.nodelist){
			if(tmp.ID.equals(src_point)){
				int index=nodelist.indexOf(tmp);
				nodelist.get(index).add_adj_node(adj_to_add);
			}
		}
	}
	
	public void addLink(String src_point,AdjInfo adj_info_to_add){
		for(Node tmp:this.nodelist){
			if(tmp.ID.equals(src_point)){
				int index=nodelist.indexOf(tmp);
				nodelist.get(index).add_adj_node(adj_info_to_add);
			}
		}
	}
	
	
	
	public void removeLink(String src_point,String dst_point){
		for(Node tmp:this.nodelist){
			if(tmp.ID.equals(src_point)){
				int index=tmp.has_link_to(dst_point);
				nodelist.remove(index);
			}else{
				System.out.println("Remove Link: "+src_point+"=>"+dst_point+" Failed.");
			}
		}
	}

	public void removeLink(DisLink link_to_remove){//removeLink
		if(this.linklist.contains(link_to_remove)) {
			this.linklist.remove(link_to_remove);
		}else{
			System.out.println("Remove Link: "+link_to_remove.start_switch+"=>"+link_to_remove.end_switch+" Failed.");
		}
	}

	public void topologyUpdate(){
		/*
		for(Flow_request fl:this.flowRequestList){
			for(DisLink link_temp:fl.AllocatedPath){
				link_temp.bandwidth-=fl.min_bandwidth;
				if(link_temp.bandwidth<=0){
					link_temp.isAllocated=true;
				}
			}
		}
		 * */

		for (Iterator<DisLink> it1 = this.linklist.iterator(); it1.hasNext(); ) {
			DisLink link = (DisLink) it1.next();
			if(link.isAllocated==true){
				it1.remove();
			}
		}
	}

	public void flowrequestReGenerate(String GraphFlowReuqestListFile){
		try {
			File file_out = new File(GraphFlowReuqestListFile);
			FileWriter file_write=new FileWriter(file_out,false);
			for(Flow_request fl:this.flowRequestList){
				if(fl.min_bandwidth<fl.bandwidth_request){
					float bandwidth_regenerated=fl.bandwidth_request-fl.min_bandwidth;
					DecimalFormat fnum=new DecimalFormat("##0");
					String bd=fnum.format(bandwidth_regenerated);
					String content=fl.fr_id+" "+fl.src_id+" "+fl.dst_id+" "+bd+" "+fl.delay_request+" "+fl.priority+"\n";
					file_write.write(content);
				}
			}
			file_write.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	
	public void allocateDataFeedback(){
		for(Flow_request fl:this.flowRequestList){
			System.out.println("FlowRequest from "+fl.src_id+" to "+fl.dst_id+" : ");
			System.out.println("Request Bandwidth: "+fl.bandwidth_request);
			System.out.println("Allocated bandwidth: "+fl.min_bandwidth );
			System.out.println("Not allocated bandwidth: "+(fl.bandwidth_request-fl.min_bandwidth));
		}
	}
	


	public void run(String GraphFlowReuqestListFile){
		this.collectFlowRequest(GraphFlowReuqestListFile);
		this.localTE();
		//this.printResult();
//		this.printSynchronizationInformation();
		//this.printResult_1(forw,srcTemp,dstTemp,srcPort,dsPort,sw,pi,cntx,requestFlowRemovedNotifn,cookie,flowSetId,flowSetIdRegistry,switchService,m);
		this.topologyUpdate();
		this.flowrequestReGenerate(GraphFlowReuqestListFile);
	}

	public void test(String GraphFlowReuqestListFile){
		//String GraphFlowReuqestListFile;
		this.collectFlowRequest(GraphFlowReuqestListFile);
//		for(Flow_request tm:this.flowRequestList){
//			System.out.println(getStringPath(tm.src_id, tm.dst_id)+"  ||  "+tm.min_bandwidth);
//		}
		this.printResult();
	}

	
	/*public void FlowRequestFileGenerate_1(int FlowRequestNumber) throws FileNotFoundException {
		Random rand=new Random(43);
		int FlowSize=this.nodelist.size();
		try {
            File file_out = new File(GraphFlowReuqestListFile);
            FileWriter file_write=new FileWriter(file_out,false);
            for (int i = 0; i < FlowRequestNumber; i++) {

                int nodeStartNumber=rand.nextInt(FlowSize);
                int nodeEndNumber=rand.nextInt(nodelist.get(nodeStartNumber).adjcent_list.size());
                String nodeEndId=this.nodelist.get(nodeStartNumber).adjcent_list.get(nodeEndNumber).adj_id;
                int bandwidthRequest=rand.nextInt(500);
                int delayRequest=rand.nextInt(500);
                int priorityRequest=rand.nextInt(10)+1;
                if(nodeStartNumber==nodeEndNumber){
                    nodeEndNumber=rand.nextInt(FlowSize);
                }
                String content=this.nodelist.get(nodeStartNumber).ID+" "+nodeEndId+" "+bandwidthRequest+" "+delayRequest+" "+priorityRequest+"\n";
                file_write.write(content);
            }
            file_write.close();
        }catch(Exception e){
		    e.printStackTrace();
        }

	}*/

	
	public void FlowRequestFileGenerate_2(int FlowRequestNumber,String GraphFlowReuqestListFile) throws FileNotFoundException {
		Random rand=new Random(43);
		int FlowSize=this.nodelist.size();
		int count_num=0;
		try {
			File file_out = new File(GraphFlowReuqestListFile);
			FileWriter file_write=new FileWriter(file_out,false);
			for (int i = 0; i < FlowRequestNumber; i++) {
				count_num++;
				int nodeStartNumber=rand.nextInt(FlowSize);
				int nodeEndNumber=rand.nextInt(FlowSize);
				int bandwidthRequest=rand.nextInt(20)+1;
				int delayRequest=rand.nextInt(500);
				int priorityRequest=rand.nextInt(3)+1;
				if(nodeStartNumber==nodeEndNumber){
					nodeEndNumber=rand.nextInt(FlowSize);
				}
				String content=count_num+" "+this.nodelist.get(nodeStartNumber).ID+" "+this.nodelist.get(nodeEndNumber).ID+" "+bandwidthRequest+" "+delayRequest+" "+priorityRequest+"\n";
				file_write.write(content);
			}
			file_write.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public float calculate_utilization(){
		float remain_bandwith=0;
		for(DisLink temp:this.linklist){
			remain_bandwith+=temp.bandwidth;
		}
		try {
			File file_time = new File("/home/gx/h123/AloocatedBandwitn");
			FileWriter file_time_write=new FileWriter(file_time,true);
			String fileoutput = "allocateBandwith  : "+ (total_bandwith-remain_bandwith) + "\n";
			file_time_write.write(fileoutput);
			fileoutput = " total_bandwith   : "+ total_bandwith + "\n";
			file_time_write.write(fileoutput);
			file_time_write.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return 1-remain_bandwith/total_bandwith;
	}
	
	public void generateDelay_band(){
		for(Node tempnode:nodelist){
			ArrayList<AdjInfo> templink = tempnode.adjcent_list;
			tempnode.linkcount = templink.size();
		}
	}
	
	
//	public static void main(String[] args) throws FileNotFoundException {
//		Graph g1=new Graph(GraphLinkFile,GraphNodeFile);
		
		/*
		for(Node node_print:g1.nodelist){
			System.out.println("Node id:"+node_print.ID+"  "+"Adjcant_Node_Number:"+node_print.adjcent_list.size()+"\n");
			
		}
		if(g1.getNode("00:00:00:00:00:00:00:0a")!=null){
			System.out.println("Find the node.");
		}
		else
			System.out.println("Didn't find the node.\n\n");
		
		
		int[][] output_matrix=g1.constructDelayAdjMatrix();
		for(int m=0;m<output_matrix.length;m++){
			System.out.print("[");
			for(int n=0;n<output_matrix[m].length;n++){
				System.out.print(output_matrix[m][n]+" ");
			}
			System.out.println("]\n");
		}
		
		ArrayList<Integer> out=g1.dijkstra_prototype(3);
		for(Integer i:out){
			System.out.print(i+"->");
			
		}
		System.out.println("End");
		
		g1.printPath("00:00:00:00:00:00:00:03", "00:00:da:c5:01:a3:44:48");
		
		System.out.println("");
		
		
		int t=g1.getDistance("00:00:00:00:00:00:00:03", "00:00:da:c5:01:a3:44:48");
		System.out.println("Distance from source to destination is:"+t);
		*/
		/*
		g1.collectFlowRequest("F:\\java code\\FL_PlugIn Project\\Floodlight_plugin\\src\\Flow Request.txt");
		for(Flow_request t:g1.flowRequestList){
			g1.dijkstra_flow_request_path_write(t);
			t.showAllocatedPath();
		}
		*/
//		long start=Calendar.getInstance().getTimeInMillis();
//		g1.FlowRequestFileGenerate_2(1000);
		//g1.collectFlowRequest("E:\\java\\FloodlightPlugin\\src\\Flow Request.txt");
	 	//g1.localTE();		//for(int i=0;i<10;i++) {
		//	g1.run();
		//	g1.run();
//			g1.run();
		//}
//		long end=Calendar.getInstance().getTimeInMillis();
//		System.out.println("Run time :"+(double)(end-start)/1000);
		//g1.test();
	 	//System.out.println("END NOW");
	 	/*
		for(Flow_request t:g1.flowRequestList){
			System.out.println(t);
		}
		*/
		//g1.localTE();
//	}
	
	
}
