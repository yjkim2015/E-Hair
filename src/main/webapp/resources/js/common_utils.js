<script type="text/javascript">
	function goAjaxForm(form, callback) {
	form.ajaxForm({
        dataType: "json",
        async: true,
        success: callback,
        error : function(data) {
        	errorMsg(data.responseJSON.reason);
        }
    }).submit();
}

function goAjaxGet(url, param, callback, layout) {
	var data = goAjaxMethod('GET', url, param, callback != null, callback, layout); //비동기 사용
	return data;
}

function goAjaxPost(url, param, callback, layout) {
	var data = goAjaxMethod('POST', url, param, callback != null, callback, layout); //비동기 사용
	return data;
}

function goAjaxMethod(method, url, param, async, callback, layout) {
	var response 		= null;
	var ajaxOption 		= {};
	ajaxOption.url 		= getContextPath + url;
	ajaxOption.type 	= method;
	ajaxOption.dataType = 'json';
	ajaxOption.async 	= async;
	ajaxOption.statusCode = {500:internarErrorHandler, 302:redirectErrorHandler, 403:authorizationErrorHandler};
	ajaxOption.beforeSend = function() {
		if (layout != null) {
			// start progress 
			layout.progressOn();
		}
	} 
	ajaxOption.complete = function() {
		if (layout != null) {
			// end progress 
			layout.progressOff();
		}
	}
	
	if ( method == 'GET' ) {
		if ( param != null ) {
			ajaxOption.data = param;	
		}
	}
	else {
		ajaxOption.contentType 	= 'application/json; charset=UTF-8';
		if ( param != null ) {
			ajaxOption.data = JSON.stringify(param);	
		}	
	}
	
	if (callback != null) {
		$.ajax(ajaxOption).done(callback).fail(function(data) {
			console.log()
		});;
	}
	else {
		$.ajax(ajaxOption).done(function(data) {
			response = data;
		}).fail(function(data) {
			
		});	

		return response;
	}
}
function internarErrorHandler(result) {
	errorMsg(result.responseJSON.reason);
	//alert('Fail to Ajax. (' + url + ')(' + param + ')');
}

function redirectErrorHandler(a,b,c,d,e) {
	console.log(a);
	console.log(b);
	console.log(c);
	console.log(d);
	console.log(e);
}

function authorizationErrorHandler(a,b,c,d,e) {
	console.log(a);
	console.log(b);
	console.log(c);
	console.log(d);
	console.log(e);
}
	

</script>
