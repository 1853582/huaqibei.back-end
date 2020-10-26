//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;
pragma experimental ABIEncoderV2;
import "./IntLib.sol";

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

	constructor() public {
		admin = msg.sender;
		info_list.infos.push(BasicInfo({
			com_id : "",
			com_name : "",
			rep_id : "",
			capacity : 0,
			history : "",
			investment : "",
			employ_compositon : "",
			asset : "",
			future_develop : "",
			companycol : "",
			risk_index : 0
		}));
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
	/// @param _addr The address.
	/// where holds the info to be modified.
	/// 0 for ADD a piece of basic info.
	/// @param _info The BasicInfo struct contains new info.
    /// @return index Index of info_list.infos[],
    ///	unchanged if modifying existing info.
	function addOrModifyInfo(address _addr, BasicInfo memory _info)
	public onlyAdmin returns (uint index) {
		index = info_list.addr_index[_addr];

		if (index == 0) {
			info_list.infos.push(_info);
			index = info_list.infos.length - 1;
			info_list.addr_index[msg.sender] = index;
		} else {
			info_list.infos[index] = _info;
		}
	}
	
    function getInfo()
	external view returns (BasicInfo[] memory infs){
	    infs = info_list.infos;
	}

	/// Get basic infos.
	/// @return json string of JSON data.
	function getInfoJson(bool onlySelf, bool full, uint _index)
	public view returns (string memory) {
		uint ijson = 0;
		uint len = 0;
		uint lindex = 1;
		uint rindex = info_list.infos.length;

		if (onlySelf) {
			lindex = info_list.addr_index[msg.sender];
			rindex = lindex + 1;
		} else if (_index != 0) {
			lindex = _index;
			rindex = lindex + 1;
		}
		
		for (uint index = lindex; index < rindex; index++) {
			len += estimateJsonLen(index, full) + 1;
		}
		if (!onlySelf && _index == 0) {
			len += 2;
		} else {
			len--;
		}

		bytes memory b_json = new bytes(len);

		if (!onlySelf && _index == 0) {
			b_json[0] = '[';
			ijson++;
		}
		for (uint index = lindex; index < rindex; index++) {
			BasicInfo storage info = info_list.infos[index];
			bytes[11] memory attr_bytes = [
				bytes(info.com_id),
				bytes(info.com_name),
				bytes(info.rep_id),
				bytes(info.rep_id),
				bytes(info.history),
				bytes(info.investment),
				bytes(info.employ_compositon),
				bytes(info.asset),
				bytes(info.future_develop),
				bytes(info.companycol),
				bytes(info.companycol)
			];
			bytes memory attr = bytes("");
			bytes[11] memory attr_name = [
				bytes("com_id"),
				bytes("com_name"),
				bytes("rep_id"),
				bytes("capacity"),
				bytes("history"),
				bytes("investment"),
				bytes("employ_compositon"),
				bytes("asset"),
				bytes("future_develop"),
				bytes("companycol"),
				bytes("risk_index")
			];
			uint nattr = 3;
			if (full) {
				nattr = 11;
			}

			b_json[ijson] = '{';
			ijson++;
			for (uint iattr = 0; iattr < nattr; iattr++) {
				b_json[ijson] = '\"';
				ijson++;
				for (uint i = 0; i < attr_name[iattr].length; i++) {
					b_json[ijson] = attr_name[iattr][i];
					ijson++;
				}
				b_json[ijson] = '\"';
				ijson++;
				b_json[ijson] = ':';
				ijson++;
				b_json[ijson] = '\"';
				ijson++;
				if (iattr == 3) {
					attr = IntLib.int2bytes(info.capacity);
					for (uint i = 0; i < attr.length; i++) {
					b_json[ijson] = attr[i];
					ijson++;
					}
				} else if (iattr == 10) {
					attr = IntLib.int2bytes(info.risk_index);
					for (uint i = 0; i < attr.length; i++) {
					b_json[ijson] = attr[i];
					ijson++;
					}
				} else {
					attr = attr_bytes[iattr];
					for (uint i = 0; i < attr.length; i++) {
					b_json[ijson] = attr[i];
					ijson++;
					}
				}
				b_json[ijson] = '\"';
				ijson++;
				if (iattr != nattr - 1) {
				b_json[ijson] = ',';
				ijson++;
				}
			}
			b_json[ijson] = '}';
			ijson++;
			if (!onlySelf && _index == 0){
				b_json[ijson] = ',';
				ijson++;
			}
		}
		if (!onlySelf && _index == 0){
			b_json[ijson] = ']';
			ijson++;
		}
		return string(b_json);
	}

	function estimateJsonLen(uint index, bool full)
	public view returns (uint len) {
		BasicInfo storage info = info_list.infos[index];

		if (full) {
			len = FULL_FORMAT_BYTES;
		} else {
			len = BREIF_FORMAT_BYTES;
		}
		len += bytes(info.com_id).length;
		len += bytes(info.com_name).length;
		len += bytes(info.rep_id).length;
		if (full) {
			len += IntLib.intLength(info.capacity);
			len += bytes(info.history).length;
			len += bytes(info.investment).length;
			len += bytes(info.employ_compositon).length;
			len += bytes(info.asset).length;
			len += bytes(info.future_develop).length;
			len += bytes(info.companycol).length;
			len += IntLib.intLength(info.risk_index);
		}
	}

	uint constant FULL_FORMAT_BYTES = 168;
	uint constant BREIF_FORMAT_BYTES = 39;
	BasicInfoList internal info_list;
	address internal admin;
}
