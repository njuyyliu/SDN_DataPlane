#!/bin/bash

for((switch=0;switch<30;switch+=1));
do
    echo 'yyl' | sudo -S ovs-ofctl dump-flows dp$switch >> /home/yyliu/SDN/20181022/flowTable/FlowTable-s$switch
    python ~/SDN/20181022/processData-copy.py s$switch
    #python ~/SDN/20181022/decisionTree-copy.py $switch
done

