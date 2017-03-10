/**
 * 
 */
$(function(){
	
	
	$("#join_btn").click(function(){
		location.href="/user/join.do";
	})
	
	$(".loging").click(function(){
		location.href="/user/info.do";
	})
	
	$("#role_view").change(function(){
		/*var pageNumber = getQuerystring("pageNumber");
		var pageSize= getQuerystring("pageSize");*/
		location.href="/user/userList.do?order=" + this.value + "&pageNumber=1&pageSize=10";
	})
})

function getQuerystring(paramName){

	var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제
	var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기
	
	for(var i = 0; _tempArray.length; i++) {
		var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기
		
		if(_keyValuePair[0] == paramName){ // _keyValuePair[0] : 파라미터 명
			// _keyValuePair[1] : 파라미터 값
			return _keyValuePair[1];
		}
	}
}

