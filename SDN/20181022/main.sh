#########################################################################
# File Name: main.sh
# Author: xinge
# mail: xingenju@163.com
# Created Time: Sun 18 Jan 2015 10:51:13 PM CST
#########################################################################
#!/bin/bash
for((possion_mean=90;possion_mean<=390;possion_mean+=30));
do
	pareto_xm=2500
	percent_virtual_link=0.5
	delta=0.1
	rate_path=1
	xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh $pareto_xm $possion_mean $percent_virtual_link $delta $rate_path&
	case $possion_mean in
		90)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 90 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 90 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 90 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 90 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 90 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 90 0.5 0.1 1'&
			;;
		120)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 120 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 120 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 120 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 120 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 120 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 120 0.5 0.1 1'&
			;;
		150)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 150 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 150 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 150 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 150 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 150 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 150 0.5 0.1 1'&
			;;
		180)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 180 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 180 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 180 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 180 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 180 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 180 0.5 0.1 1'&
			;;
		210)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 1'&
			;;
		240)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 240 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 240 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 240 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 240 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 240 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 240 0.5 0.1 1'&
			;;
		270)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 270 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 270 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 270 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 270 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 270 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 270 0.5 0.1 1'&
			;;
		300)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 300 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 300 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 300 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 300 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 300 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 300 0.5 0.1 1'&
			;;
		330)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 330 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 330 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 330 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 330 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 330 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 330 0.5 0.1 1'&
			;;
		360)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 360 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 360 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 360 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 360 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 360 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 360 0.5 0.1 1'&
			;;
		390)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 390 0.5 0.1 1'&
			;;
esac
	sleep 350 #sleep 350seconds
	cd /home/gx/Hieron2
	make removePort
done
for((pareto_xm=1;pareto_xm<=10;pareto_xm+=1));
do
	possion_mean=210
	percent_virtual_link=0.5
	#xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh $pareto_xm $possion_mean $percent_virtual_link&
	case $pareto_xm in
		1)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 10000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 10000 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 10000 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 10000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 10000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 10000 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 10000 210 0.5 0.1 1&
			;;
		2)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 22500 210 0.5 0.1 1&
			;;
		3)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 40000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 40000 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 40000 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 40000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 40000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 40000 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 40000 210 0.5 0.1 1&
			;;
		4)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 62500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 62500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 62500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 62500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 62500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 62500 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 62500 210 0.5 0.1 1&
			;;
		5)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 90000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 90000 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 90000 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 90000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 90000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 90000 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 90000 210 0.5 0.1 1&
			;;
		6)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 122500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 122500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 122500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 122500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 122500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 122500 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 122500 210 0.5 0.1 1&
			;;
		7)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 160000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 160000 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 160000 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 160000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 160000 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 160000 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 160000 210 0.5 0.1 1&
			;;
		8)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 6400 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 6400 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 6400 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 6400 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 6400 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 6400 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 6400 210 0.5 0.1 1&
			;;
		9)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 1&
			;;
		10)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 900 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 900 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 900 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 900 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 900 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 900 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 900 210 0.5 0.1 1&
			;;
esac
	sleep 350 #sleep 350seconds
	cd /home/gx/Hieron2
	make removePort
done

for((possion_mean=90;possion_mean<=390;possion_mean+=30));
do
	pareto_xm=22500
	percent_virtual_link=0.5
	delta=0.1
	rate_path=1
	xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh $pareto_xm $possion_mean $percent_virtual_link $delta $rate_path&
	case $possion_mean in
		90)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 90 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 90 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 90 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 90 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 90 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 90 0.5 0.1 1'&
			;;
		120)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 120 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 120 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 120 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 120 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 120 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 120 0.5 0.1 1'&
			;;
		150)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 150 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 150 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 150 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 150 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 150 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 150 0.5 0.1 1'&
			;;
		180)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 180 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 180 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 180 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 180 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 180 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 180 0.5 0.1 1'&
			;;
		210)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 210 0.5 0.1 1'&
			;;
		240)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 240 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 240 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 240 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 240 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 240 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 240 0.5 0.1 1'&
			;;
		270)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 270 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 270 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 270 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 270 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 270 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 270 0.5 0.1 1'&
			;;
		300)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 300 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 300 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 300 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 300 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 300 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 300 0.5 0.1 1'&
			;;
		330)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 330 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 330 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 330 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 330 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 330 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 330 0.5 0.1 1'&
			;;
		360)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 360 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 360 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 360 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 360 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 360 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 360 0.5 0.1 1'&
			;;
		390)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 390 0.5 0.1 1'&
			;;
esac
	sleep 350 #sleep 350seconds
	cd /home/gx/Hieron2
	make removePort
done
for((pareto_xm=1;pareto_xm<=10;pareto_xm+=1));
do
	possion_mean=390
	percent_virtual_link=0.5
	#xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh $pareto_xm $possion_mean $percent_virtual_link&
	case $pareto_xm in
		1)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 10000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 10000 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 10000 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 10000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 10000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 10000 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 10000 390 0.5 0.1 1&
			;;
		2)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 22500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 22500 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 22500 390 0.5 0.1 1&
			;;
		3)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 40000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 40000 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 40000 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 40000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 40000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 40000 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 40000 390 0.5 0.1 1&
			;;
		4)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 62500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 62500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 62500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 62500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 62500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 62500 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 62500 390 0.5 0.1 1&
			;;
		5)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 90000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 90000 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 90000 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 90000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 90000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 90000 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 90000 390 0.5 0.1 1&
			;;
		6)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 122500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 122500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 122500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 122500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 122500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 122500 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 122500 390 0.5 0.1 1&
			;;
		7)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 160000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 160000 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 160000 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 160000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 160000 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 160000 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 160000 390 0.5 0.1 1&
			;;
		8)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 6400 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 6400 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 6400 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 6400 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 6400 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 6400 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 6400 390 0.5 0.1 1&
			;;
		9)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 390 0.5 0.1 1&
			;;
		10)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 900 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 900 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 900 390 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 900 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 900 390 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 900 390 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 900 390 0.5 0.1 1&
			;;
esac
	sleep 350 #sleep 350seconds
	cd /home/gx/Hieron2
	make removePort
done


for((percent_virtual_link=1;percent_virtual_link<=10;percent_virtual_link+=1));
do
	pareto_xm=2500
	possion_mean = 210;
	#percent_virtual_link=0.5
	delta=0.1
	rate_path=1
#	xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh $pareto_xm $possion_mean $percent_virtual_link $delta $rate_path&
	case $percent_virtual_link in
		1)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.1 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.1 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.1 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.1 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.1 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.1 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.1 0.1 1&
			;;
		2)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.2 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.2 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.2 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.2 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.2 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.2 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.2 0.1 1&
			;;
		3)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.3 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.3 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.3 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.3 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.3 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.3 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.3 0.1 1&
			;;
		4)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.4 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.4 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.4 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.4 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.4 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.4 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.4 0.1 1&
			;;
		5)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 1&
			;;
		6)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.6 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.6 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.6 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.6 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.6 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.6 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.6 0.1 1&
			;;
		7)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.7 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.7 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.7 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.7 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.7 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.7 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.7 0.1 1&
			;;
		8)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.8 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.8 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.8 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.8 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.8 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.8 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.8 0.1 1&
			;;
		9)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.9 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.9 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.9 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.9 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.9 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.9 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.9 0.1 1&
			;;
		10)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 1 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 1 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 1 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 1 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 1 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 1 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 1 0.1 1&
			;;
esac
	sleep 350 #sleep 350seconds
	cd /home/gx/Hieron2
	make removePort
done

for((delta=1;delta<=5;delta+=1));
do
	pareto_xm=2500
	possion_mean = 210;
	percent_virtual_link=0.5
	#delta=0.1
	rate_path=1
#	xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh $pareto_xm $possion_mean $percent_virtual_link $delta $rate_path&
	case $delta in
		1)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.0001 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.0001 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.0001 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.0001 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.0001 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.0001 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.0001 1&
			;;
		2)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.001 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.001 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.001 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.001 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.001 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.001 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.001 1&
			;;
		3)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.01 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.01 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.01 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.01 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.01 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.01 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.01 1&
			;;
		4)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 1&
			;;
		5)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 1 1&
			;;
esac
	sleep 350 #sleep 350seconds
	cd /home/gx/Hieron2
	make removePort
done

for((rate_path=1;rate_path<=10;rate_path+=1));
do
	pareto_xm=2500
	possion_mean = 210;
	percent_virtual_link=0.5
	delta=0.1
#	rate_path=1
#	xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh $pareto_xm $possion_mean $percent_virtual_link $delta $rate_path&
	case $rate_path in
		1)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 0.1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 0.1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 0.1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.1&
			;;
		2)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.2'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.2'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.2'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 0.2'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 0.2'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 0.2'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.2&
			;;
		3)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.3'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.3'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.3'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 0.3'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 0.3'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 0.3'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.3&
			;;
		4)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.4'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.4'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.4'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 0.4'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 0.4'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 0.4'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.4&
			;;
		5)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.5'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.5'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.5'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 0.5'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 0.5'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 0.5'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.5&
			;;
		6)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.6'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.6'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.6'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 0.6'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 0.6'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 0.6'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.6&
			;;
		7)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.7'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.7'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.7'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 0.7'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 0.7'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 0.7'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.7&
			;;
		8)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.8'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.8'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.8'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.8 0.1 0.8'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.8 0.1 0.8'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.8 0.1 0.8'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.8&
			;;
		9)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 0.9'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 0.9'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 0.9'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 0.9'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 0.9'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 0.9'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 0.9&
			;;
		10)
			xterm -e ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/runLocal.sh 2 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/runLocal.sh 3 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/runLocal.sh 4 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/runLocal.sh 5 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.191.111 'sh	/home/gx/Hieron2/src/run/runLocal.sh 1 2500 210 0.5 0.1 1'&
			xterm -e ssh gx@114.212.85.234 'sh	/home/gx/Hieron2/src/run/runComparision.sh 2500 210 0.5 0.1 1'&
			xterm -e sh /home/gx/Hieron2/src/run/runRoot.sh 2500 210 0.5 0.1 1&
			;;
esac
	sleep 350 #sleep 350seconds
	cd /home/gx/Hieron2
	make removePort
done
