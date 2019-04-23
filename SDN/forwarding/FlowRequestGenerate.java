package net.floodlightcontroller.forwarding;

import java.util.*;
import java.io.*;

public class FlowRequestGenerate {
    public static String Flow_Request_File_path = "/home/gx/h123/clusters";
    public static int Flow_Request_Number = 100;

    public static void main(String[] args) {
        int lineCount = 0;

        Random rand = new Random(47);
        try {
            String encoding = "utf-8";
            File file_in1 = new File(Flow_Request_File_path);
            if (file_in1.isFile() && file_in1.exists()) {
                InputStreamReader read = new InputStreamReader(new FileInputStream(file_in1), encoding);
                BufferedReader bufferReader = new BufferedReader(read);
                while (bufferReader.readLine() != null) {
                    lineCount++;
                }
                read.close();
            }
            FileInputStream file_output = new FileInputStream(new File(Flow_Request_File_path));
            FileOutputStream file_input = new FileOutputStream(new File("/home/gx/h123/RandomFlowRequest"));
            for (int i = 0; i < Flow_Request_Number; i++) {
                int line_num = rand.nextInt(lineCount);
                for (int m = 0; m < line_num; m++) {
                    InputStreamReader read = new InputStreamReader(new FileInputStream(file_in1), encoding);
                    BufferedReader bufferReader = new BufferedReader(read);
                    while (bufferReader.readLine() != null) {
                        m++;
                    }
                }

            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
