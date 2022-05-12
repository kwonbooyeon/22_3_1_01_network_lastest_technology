//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;
contract etherCasher {
	address payable public owner;	// smart contract 주소
	uint public totalPrice;	// 가격 총합
	address payable public customer;//손님 어드레스
	address payable private admin;
	uint private paing; //지불받은 돈
    uint public totalCount; //총 물건 수
	uint public currCount;  // 현재 추가할 물건 수

	
	/// 생성자
	constructor() payable{
		customer = payable(msg.sender); //사용자
		owner = payable(address(this)); //smart contract
		admin = payable(address(0x2F689aE473AD1163569fdD70BAB799B0Ec67d02c));
		totalPrice = 0;
		totalCount = 0;
		currCount = 1;
		paing = 0;
	}
	
	/// 결제 처리 함수
	function payment() public payable {
		//돈을 미리받고 
		paing = msg.value;
		//충분하지 않으면 거래취소 
		require(paing >= totalPrice, "please, enter more value");
		//넘치면 넘친 만큼 돌려줌.
		if(paing > totalPrice){
			customer.transfer(paing-totalPrice);
		}


		//장바구니 업데이트
		totalPrice = 0;
		totalCount = 0;
	}
	
	function addOrder(uint _price) payable public {

		totalPrice += _price * currCount; // 총액에 새로 입력한 물건 추가
		totalCount += currCount; //물건 총 갯수 추가

	}

	function setCount(uint _count) public {
		//추가할 물건 갯수 설정
		currCount = _count;
	}
	
	//고객의 지갑내 이더 량(wei)
	function getBlance() view public returns(uint){
		return customer.balance;
	}

	//스마트 컨트랙트에 모인 이더 량(wei)
	function thisBlance() view public returns(uint){
		return owner.balance;
	}

	function collect() payable public {
		require(msg.sender == admin,"No permission");
		admin.transfer(owner.balance);
	}

	function init() public{
		totalPrice = 0;
		totalCount = 0;
		currCount = 1;
	}
}