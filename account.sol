pragma solidity >=0.5.0 <0.8.0;
pragma experimental ABIEncoderV2;

contract AccountContract {
	struct Account {
		uint id;
		bool exist;
		bool approved;
		string name;
		string description;
	}

	struct AccountList {
		address[] addrs;
		mapping(address => Account) acc_addr;
	}

	modifier onlyMember {
        require(
            acc_list.acc_addr[msg.sender].exist,
            "Membership required!"
        );
        _;
    }

	modifier notMember {
        require(
            !acc_list.acc_addr[msg.sender].exist,
            "You have already had an account!"
        );
        _;
    }

	modifier onlyAdmin {
        require(
            msg.sender == acc_list.addrs[0],
            "Admin Privilege required!"
        );
        _;
    }

	constructor() public {
		acc_list.addrs.push(msg.sender);
	}

	function applyForAccount(string memory _name, string memory _description)
	public notMember returns (uint) {
		uint id = acc_list.addrs.length;

		acc_list.acc_addr[msg.sender] = Account(
			{
				id : id,
				exist : true,
				approved : false,
				name : _name,
				description : _description
			}
		);
		acc_list.addrs.push(msg.sender);
		return id;
	}

	function getAccount()
	public view onlyMember returns (Account memory) {
		return acc_list.acc_addr[msg.sender];
	}

	function setAccount(string memory _name, string memory _description)
	public onlyMember returns (Account memory) {
		Account storage acc = acc_list.acc_addr[msg.sender];
		if (bytes(_name).length != 0) {
			acc.name = _name;
		}
		if (bytes(_description).length != 0) {
			acc.description = _description;
		}
	}

	function approveAccount(address _addr)
	public onlyAdmin {
		acc_list.acc_addr[_addr].approved = true;
	}

	function approveAccount(uint _id)
	public onlyAdmin {
		acc_list.acc_addr[acc_list.addrs[_id]].approved = true;
	}

	/*function listAccounts(address addr)
	private {
		for (uint16 index = 1; index < acc_list.addrs.length; index++) {
			if (acc_list.accounts[index] == addr) {
				return true;
			}
		}
		return false;
	}*/

	AccountList internal acc_list;
}
