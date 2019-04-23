push:
	svn add --force *
	svn commit -m "commit"

allpull:
	ssh gx@114.212.191.111 'sh /home/gx/Hieron2/src/run/svnpull.sh'
	ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/svnpull.sh'
	ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/svnpull.sh'
	ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/svnpull.sh'
	ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/svnpull.sh'
	ssh gx@114.212.85.234 'sh /home/gx/Hieron2/src/run/svnpull.sh'
rootpull:
	ssh gx@114.212.191.112 'sh /home/gx/Hieron2/src/run/svnpull.sh'

allmake:
	ssh gx@114.212.191.111 'sh /home/gx/Hieron2/src/run/makelocal.sh'
	ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/makelocal.sh'
	ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/makelocal.sh'
	ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/makelocal.sh'
	ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/makelocal.sh'
	ssh gx@114.212.85.234 'sh /home/gx/Hieron2/src/run/makecomparision.sh'
	sh /home/gx/Hieron2/src/run/makeroot.sh

rootmake:
	sh /home/gx/Hieron2/src/run/makeroot.sh

removePort:
	sh /home/gx/Hieron2/src/run/removePort.sh 8880
	ssh gx@114.212.191.111 'sh /home/gx/Hieron2/src/run/removePort.sh 8881'
	ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/removePort.sh 8886'
	ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/removePort.sh 8883'
	ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/removePort.sh 8884'
	ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/removePort.sh 8885'
	ssh gx@114.212.85.234 'sh /home/gx/Hieron2/src/run/removePort.sh 8887'
chmod:
	ssh gx@114.212.191.111 'sh /home/gx/Hieron2/src/run/chmod.sh'
	ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/chmod.sh'
	ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/chmod.sh'
	ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/chmod.sh'
	ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/chmod.sh'
	ssh gx@114.212.85.234 'sh /home/gx/Hieron2/src/run/chmod.sh'
	sh /home/gx/Hieron2/src/run/chmod.sh


allremove_data:
	ssh gx@114.212.191.111 'sh /home/gx/Hieron2/src/run/removeAllData.sh'
	ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/removeAllData.sh'
	ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/removeAllData.sh'
	ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/removeAllData.sh'
	ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/removeAllData.sh'
	ssh gx@114.212.85.234 'sh /home/gx/Hieron2/src/run/removeAllData.sh'
	sh /home/gx/Hieron2/src/run/removeAllData.sh

allrun:
	bash /home/gx/Hieron2/src/run/main.sh
allrun_extension:
	bash /home/gx/Hieron2/src/run/main_extension.sh

runtest:
	bash /home/gx/Hieron2/src/run/runTest.sh

copyProject:
	ssh gx@114.212.191.111 'sh /home/gx/Hieron2/src/run/copyProject.sh'
	ssh gx@114.212.189.60 'sh /home/gx/Hieron2/src/run/copyProject.sh'
	ssh gx@172.28.12.223 'sh /home/gx/Hieron2/src/run/copyProject.sh'
	ssh gx@172.28.15.48 'sh /home/gx/Hieron2/src/run/copyProject.sh'
	ssh gx@114.212.191.116 'sh /home/gx/Hieron2/src/run/copyProject.sh'
	ssh gx@114.212.85.234 'sh /home/gx/Hieron2/src/run/copyProject.sh'
	#bash /home/gx/Hieron2/src/run/copyProject.sh
	

