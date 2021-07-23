/**
 * validationScript.js
 */

function getData(url) {
	return new Promise(function(resolve, reject) {
		$.get(url, function(response) {
			if (response) {
				resolve(response);
			}
			reject(new Error("Request is failed"));
		});
	});
}

function validateAcdIdForm(receivedData) {
	let acd_code_id = $("#acd_code_id").val();
	arrAcdCode = [];

	$.each(receivedData, function name(index, value) {
		arrAcdCode.push(value.acd_code_id);
	});
	let result = arrAcdCode.includes(parseInt($("#acd_code_id").val()));
	// console.log("포함여부" + result);

	if (result == false) {
		$("#acd_code_id").val("사고 코드를 확인해 주세요");
		let getResult = false;
		// console.log("getResult : " + getResult);
		return getResult;
	} else if (result == true) {
		let getResult = true;
		// console.log("getResult : " + getResult);
		return getResult;
	}
}

function validateShipIdForm(receivedData) {
	let sh_id = $("#sh_id").val();
	arrShId = [];

	$.each(receivedData, function name(index, value) {
		arrShId.push(value.sh_id);
	});
	let result = arrShId.includes(parseInt($("#sh_id").val()));
	// console.log("포함여부" + result);

	if (result == false) {
		$("#sh_id").val("선박 코드를 확인해 주세요");
		let getResult = false;
		// console.log("getResult : " + getResult);
		return getResult;
	} else if (result == true) {
		let getResult = true;
		// console.log("getResult : " + getResult);
		return getResult;
	}
}


