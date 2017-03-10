/**
 * 
 */

function role_change(user_idx, user_role){
	$.ajax({
		url : "/user/role_change.do?user_idx=" + user_idx + "&user_role=" + user_role,
		type : "post",
		success : function(result){
			if(result){
				location.reload();
			}
		}
	})
}

function state_change(user_idx, user_state){
	$.ajax({
		url : "/user/state_change.do?user_idx=" + user_idx + "&user_state=" + user_state,
		type : "post",
		success : function(result){
			if(result){
				location.reload();
			}
		}
	})
}