(function($){
	jQuery.extend({
		validate : function(tag){
			var result = true;
			$.each($('#'+tag+' .required'), function(i, n){
				if(null == n.value || '' == n.value){
					var message = (null == n.title || '' == n.title)?'该项为必填项.':n.title;
					alert(message);
					result = false;
					if(!n.disabled && !n.readonly && !n.type == 'hidden'){
						n.focus();							
					}else if(n.type == 'hidden' && $('#'+n.id+'_Text')){
						$('#'+n.id+'_Text').focus();		
					}else if(n.type == 'hidden' && $('#'+n.id+'Name')){
						$('#'+n.id+'Name').focus();
					}else{
						n.focus();	
					}
					return false;
				}											 
			});
			if(result){
				$.each($('#'+tag+' .number'), function(i, n){
					if(null != n.value && '' != n.value){
						var error =/^[+-]?\d*\.?\d+$/.test(n.value);
						if(!error){
							var message = (null == n.title || '' == n.title)?'该项必须填写数值型.':n.title;
							alert(message);
							result = false;
							if(!n.disabled && !n.readonly && !n.type == 'hidden'){
								n.focus();	
							}else if(n.type == 'hidden' && $('#'+n.id+'_Text')){
								$('#'+n.id+'_Text').focus();		
							}else if(n.type == 'hidden' && $('#'+n.id+'Name')){
								$('#'+n.id+'Name').focus();
							}else{
								n.focus();	
							}
							return false;	
						}
					}											 
				});
			}
			if(result){
				$.each($('#'+tag+' .posnumber'), function(i, n){
					if(null != n.value && '' != n.value){
						var error =/^(0|[1-9]\d*)$|^(0|[1-9]\d*)\.(\d+)$/.test(n.value);
						if(!error){
							var message = (null == n.title || '' == n.title)?'该项必须填写正数值型.':n.title;
							alert(message);
							result = false;
							if(!n.disabled && !n.readonly && !n.type == 'hidden'){
								n.focus();	
							}else if(n.type == 'hidden' && $('#'+n.id+'_Text')){
								$('#'+n.id+'_Text').focus();		
							}else if(n.type == 'hidden' && $('#'+n.id+'Name')){
								$('#'+n.id+'Name').focus();
							}else{
								n.focus();	
							}
							return false;	
						}
					}											 
				});
			}
			if(result){
				$.each($('#'+tag+' .posInteger'), function(i, n){
					if(null != n.value && '' != n.value){
						var error =/^[1-9]\d*$/.test(n.value);
						if(!error){
							var message = (null == n.title || '' == n.title)?'该项必须填写正整数.':n.title;
							alert(message);
							result = false;
							if(!n.disabled && !n.readonly && !n.type == 'hidden'){
								n.focus();	
							}else if(n.type == 'hidden' && $('#'+n.id+'_Text')){
								$('#'+n.id+'_Text').focus();		
							}else if(n.type == 'hidden' && $('#'+n.id+'Name')){
								$('#'+n.id+'Name').focus();
							}else{
								n.focus();	
							}
							return false;	
						}
					}											 
				});
			}
			if(result){
				$.each($('#'+tag+' .integer'), function(i, n){
					if(null != n.value && '' != n.value){
						var error =/^-?[0-9]\d*$/.test(n.value);
						if(!error){
							var message = (null == n.title || '' == n.title)?'该项必须填写整数.':n.title;
							alert(message);
							result = false;
							if(!n.disabled && !n.readonly && !n.type == 'hidden'){
								n.focus();	
							}else if(n.type == 'hidden' && $('#'+n.id+'_Text')){
								$('#'+n.id+'_Text').focus();		
							}else if(n.type == 'hidden' && $('#'+n.id+'Name')){
								$('#'+n.id+'Name').focus();
							}else{
								n.focus();	
							}
							return false;	
						}
					}											 
				});
			}
			return result;
		}			  
	});
	//正数值类型
	jQuery.fn.onlypressPositiveNumber = function() { 
		$(this).css({imeMode:"disabled",'-moz-user-select':"none"}); 
		$(this).bind("keypress",function(e){
			if(e.ctrlKey == true || e.shiftKey == true) {
				return false; 
			}
			if((e.which >= 48 && e.which <= 57 && e.ctrlKey == false && e.shiftKey == false) 
				|| e.which == 0 || e.which == 8 || e.which == 46){ 
				return true; 
			}else if(e.ctrlKey == true && (e.which == 99 || e.which == 118)){
				return false;	
			}else{
				return false;
			}
		}).bind("contextmenu",function(){return false;}) 
		//.bind("selectstart",function(){return false;}) 
		.bind("paste",function(){return false;}); 
	}; 	
	
	
	//数值类型 包括负数
	jQuery.fn.onlypressNumber = function() { 
		$(this).css({imeMode:"disabled",'-moz-user-select':"none"}); 
		$(this).bind("keypress",function(e){ 
			if(e.ctrlKey == true || e.shiftKey == true) {
				return false; 
			}
			if((e.which >= 48 && e.which <= 57 && e.ctrlKey == false && e.shiftKey == false) 
				|| e.which == 0 || e.which == 8 || e.which == 46 || e.which == 45) {
				return true; 
			}else if(e.ctrlKey == true && (e.which == 99 || e.which == 118)) {
				return false; 
			}else{ 
				return false;
			}
		}).bind("contextmenu",function(){return false;}) 
		//.bind("selectstart",function(){return false;}) 
		.bind("paste",function(){return false;}); 
	}; 	
	
	
	//正整型  
	jQuery.fn.onlypressPositiveInteger = function() { 
		$(this).css({imeMode:"disabled",'-moz-user-select':"none"}); 
		$(this).bind("keypress",function(e){ 
			if(e.ctrlKey == true || e.shiftKey == true){ 
				return false; 
			}
			if((e.which >= 48 && e.which <= 57 && e.ctrlKey == false && e.shiftKey == false) || e.which == 0 || e.which == 8){
				return true; 
			}else if(e.ctrlKey == true && (e.which == 99 || e.which == 118)){
				return false; 
			}else {
				return false;
			}
		}).bind("contextmenu",function(){return false;}) 
		//.bind("selectstart",function(){return false;}) 
		.bind("paste",function(){return false;}); 
	};
	
	//整型  包括负数
	jQuery.fn.onlypressInteger = function() { 
		$(this).css({imeMode:"disabled",'-moz-user-select':"none"}); 
		$(this).bind("keypress",function(e){ 
			if(e.ctrlKey == true || e.shiftKey == true){
				return false;
			}
			if((e.which >= 48 && e.which <= 57 && e.ctrlKey == false && e.shiftKey == false) 
				|| e.which == 0 || e.which == 8 || e.which == 45){
				return true; 
			}else if(e.ctrlKey == true && (e.which == 99 || e.which == 118)) {
				return false; 
			}else {
				return false;
			}
		}).bind("contextmenu",function(){return false;}) 
		//.bind("selectstart",function(){return false;}) 
		.bind("paste",function(){return false;}); 
	};
	//身份证限制
	jQuery.fn.onlypressIdCard = function() { 
		$(this).css({imeMode:"disabled",'-moz-user-select':"none"}); 
		$(this).bind("keypress",function(e){ 
			if(e.ctrlKey == true){
				return false;
			}
			if((((e.which >= 48 && e.which <= 57) || e.which == 120) && e.ctrlKey == false && e.shiftKey == false) || (e.shiftKey == true && e.which == 88)){
				return true; 
			}else if(e.ctrlKey == true && (e.which == 99 || e.which == 118)) {
				return false; 
			}else {
				return false;
			}
		});
		//.bind("contextmenu",function(){return false;}) 
		//.bind("selectstart",function(){return false;}) 
		//.bind("paste",function(){return false;}) 
	};
})(jQuery);