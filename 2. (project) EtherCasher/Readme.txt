project 실행방법
---------------------
실행환경 ubuntu
---------------------
(step1)
필요모듈 
-node.js
	[설치방법]
		sudo apt update
		curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
		sudo apt-get install -y nodejs 
-web3
	[설치방법] (설치전에 폴더를 만들어 그 폴더안에서 실행하는걸 권고드립니다.)
		sudo npm install web3

------------------------
(step2)
위의 과정 후에 생성된 node_modules폴더가 있는 폴더안에서 
	cp node_modules/web3/dist/web3* .
를 통해 일부 파일을 복사해줍니다.
------------------------
(step3)
ethertest.js와 EtherCasher.html파일을 현재 폴더로 가져온 후 
	node ethertest.js
로 서버를 실행합니다.
설정한 포트번호는 8080입니다.
--------------------------
(접속)
http://(현재 컴퓨터의 ip):8080/EtherCasher.html
