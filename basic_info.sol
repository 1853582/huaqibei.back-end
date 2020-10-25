//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;
pragma experimental ABIEncoderV2;

uint constant INT_DIG_LEN = 78;

/// @author Yan, Z.H.
/// @title Contract that holds companies' basic info.
contract BasicInfoContract {
	/// @dev Consistence with `platform_company.sql`
	struct BasicInfo {
		string com_id;
		string com_name;
		string rep_id;
		int capacity;
		string history;
		string investment;
		string employ_compositon;
		string asset;
		string future_develop;
		string companycol;
		int risk_index;
	}

	struct BasicInfoList {
		BasicInfo[] infos;
		mapping(address => uint) addr_index;
	}

	modifier onlyAdmin{
		require(
			msg.sender == admin,
			"Admin Privilege Required!"
			);
		_;
	}

	constructor() {
		admin = msg.sender;
		info_list.infos.push();
	}

	/// Add or modify basic info of SELF.
	/// @param _info The BasicInfo struct contains new info.
    /// @return index Index of info_list.infos[],
    ///	unchanged if modifying existing info.
	function addOrModifyInfo(BasicInfo memory _info)
	public returns (uint index) {
		index = info_list.addr_index[msg.sender];

		if (index == 0) {
			info_list.infos.push(_info);
			index = info_list.infos.length - 1;
			info_list.addr_index[msg.sender] = index;
		} else {
			info_list.infos[index] = _info;
		}
	}

	/// Add or modify ANY basic info.
	/// @notice This function can only be used by admin.
	/// @param _index The index of info_list.infos[]
	/// where holds the info to be modified.
	/// 0 for ADD a piece of basic info.
	/// @param _info The BasicInfo struct contains new info.
    /// @return index Index of info_list.infos[],
    ///	unchanged if modifying existing info.
	function addOrModifyInfo(uint _index, BasicInfo memory _info)
	public onlyAdmin returns (uint index) {
		if (_index == 0) {
			info_list.infos.push(_info);
			index = info_list.infos.length - 1;
			info_list.addr_index[msg.sender] = index;
		} else {
			info_list.infos[_index] = _info;
			index = _index;
		}
	}

	/// Get basic info of SELF.
	/// @return json string of JSON data.
	function getInfoJSON()
	public view returns (string memory json) {
		BasicInfo storage info =
			info_list.infos[info_list.addr_index[msg.sender]];
		bytes storage b_com_id = bytes(info.com_id);
		bytes storage b_com_name = bytes(info.com_name);
		bytes storage b_rep_id = bytes(info.rep_id);
		bytes storage b_history = bytes(info.history);
		bytes storage b_investment = bytes(info.investment);
		bytes storage b_employ_compositon = bytes(info.employ_compositon);
		bytes storage b_asset = bytes(info.asset);
		bytes storage b_future_develop = bytes(info.future_develop);
		bytes storage b_companycol = bytes(info.companycol);
		uint len = TOT_FORMAT_BYTES;
		len += b_com_id.length;
		len += b_com_name.length;
		len += b_rep_id.length;
		len += intLength(info.capacity);
		len += b_history.length;
		len += b_investment.length;
		len += b_employ_compositon.length;
		len += b_asset.length;
		len += b_future_develop.length;
		len += b_companycol.length;
		len += intLength(info.risk_index);
		
		bytes memory b_json = new bytes(len);
		uint ijson = 1;

		startJson(b_json);
		ijson = addStorageAttrbJson(
			b_json, "com_id", b_com_id, ijson, true
			);
		ijson = addStorageAttrbJson(
			b_json, "com_name", b_com_name, ijson, true
			);
		ijson = addStorageAttrbJson(
			b_json, "rep_id", b_rep_id, ijson, true
			);
		ijson = addIntAttrbJson(
			b_json, "capacity", info.capacity, ijson, true
			);
		ijson = addStorageAttrbJson(
			b_json, "history", b_history, ijson, true
			);
		ijson = addStorageAttrbJson(
			b_json, "investment", b_investment, ijson, true
			);
		ijson = addStorageAttrbJson(
			b_json, "employ_compositon", b_employ_compositon, ijson, true
			);
		ijson = addStorageAttrbJson(
			b_json, "asset", b_asset, ijson, true
			);
		ijson = addStorageAttrbJson(
			b_json, "future_develop", b_future_develop, ijson, true
			);
		ijson = addStorageAttrbJson(
			b_json, "companycol", b_companycol, ijson, true
			);
		ijson = addIntAttrbJson(
			b_json, "risk_index", info.risk_index, ijson, false
			);
		endJson(b_json, ijson);
		json = string(b_json);
	}

	function estimateJSONLen(BasicInfo memory _info)
	public pure returns (uint len) {
		len = TOT_FORMAT_BYTES;
		len += bytes(_info.com_id).length;
		len += bytes(_info.com_name).length;
		len += bytes(_info.rep_id).length;
		len += intLength(_info.capacity);
		len += bytes(_info.history).length;
		len += bytes(_info.investment).length;
		len += bytes(_info.employ_compositon).length;
		len += bytes(_info.asset).length;
		len += bytes(_info.future_develop).length;
		len += bytes(_info.companycol).length;
		len += intLength(_info.risk_index);
	}

	uint constant TOT_FORMAT_BYTES = 170;
	BasicInfoList internal info_list;
	address internal admin;
}


function addIntAttrbJson(
	bytes memory json,
	bytes memory name,
	int attrb,
	uint from,
	bool comma
	) pure returns (uint) {
	uint index = from;
	bytes memory b_int = int2bytes(attrb);

	json[index] = '\"';
	index++;
	for (uint i = 0; i < name.length; i++) {
		json[index] = name[i];
		index++;
	}
	json[index] = '\"';
	index++;
	json[index] = ':';
	index++;
	json[index] = '\"';
	index++;
	for (uint i = 0; i < b_int.length; i++) {
		json[index] = b_int[i];
		index++;
	}
	json[index] = '\"';
	index++;
	if (comma) {
	json[index] = ',';
	index++;
	}
	return index;
}

function addStorageAttrbJson(
	bytes memory json,
	bytes memory name,
	bytes storage attrb,
	uint from,
	bool comma
	) view returns (uint) {
	uint index = from;

	json[index] = '\"';
	index++;
	for (uint i = 0; i < name.length; i++) {
		json[index] = name[i];
		index++;
	}
	json[index] = '\"';
	index++;
	json[index] = ':';
	index++;
	json[index] = '\"';
	index++;
	for (uint i = 0; i < attrb.length; i++) {
		json[index] = attrb[i];
		index++;
	}
	json[index] = '\"';
	index++;
	if (comma) {
	json[index] = ',';
	index++;
	}
	return index;
}

function startJson(bytes memory json) pure {
	json[0] = '{';
}

function endJson(bytes memory json, uint index) pure {
	json[index] = '}';
}


function intLength(int i) pure returns (uint len) {
	len = 0;
	if (i < 0) {
		len++;
	}
	do {
		i /= 10;
		len++;
	} while (i != 0);
}

function int2bytes(int i) pure returns (bytes memory int_b) {
	uint index = intLength(i);
	int_b = new bytes(index);

	index--;
	if (i < 0) {
		int_b[0] = '-';
		i = -i;
	}
	do {
		int_b[index] = byte(uint8(48 + i % 10));
		i /= 10;
		index--;
	} while (i != 0);
}
