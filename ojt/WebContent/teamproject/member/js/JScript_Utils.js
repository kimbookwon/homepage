/*--------------------------------------------------------------------------------------*
 *
 * PointShop Plus
 *
 * Copyright (C) 1999~2016 nbizsoft corporation. 
 *          e-mail : service at nbizsoft.com
 *
 * http://www.pointshop.co.kr
 * http://www.nbizsoft.com
 *
 *--------------------------------------------------------------------------------------
 * Registered Program under Korea Computer Program Protection Act.
 * Registered No :: 2001-01-26-1829
 *--------------------------------------------------------------------------------------
 * 저 작 권 :: 포인트샵ASP는 컴퓨터프로그램보호법 제23조 의하여 등록된 프로그램입니다.
 * 등록번호 :: 2001-01-26-1829 
 *--------------------------------------------------------------------------------------*/
var debug = function(){
  if(typeof console != 'undefined'){
  	if(typeof console.dir != 'undefined'){
  		console.dir(arguments[0]);	
  	}else if(typeof console.info != 'undefined'){
    	console.info(arguments); 
   	}
  }
};

var _centerWnd = null;

// 다국어 문자 변수 처리용 함수 
function mgLangParse(msg,params){
	  jQuery.each(params,function(idx,obj){
		  var chk = new RegExp("\\$\\{"+obj["name"]+"\\}","g");
	      msg = msg.replace( chk , obj["value"] );
	  }); 
	  return msg;
}

function isString (obj) {
    return (Object.prototype.toString.call(obj) === '[object String]');
}

if (!String.prototype.trim) {
    String.prototype.trim = function () {
        return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '');
    };
}

// 리턴값을 받을 필요가 없고, 새창에서 opener를 호출할 필요가 없는 경우 사용
// -------------------------------------------------------------------------------
function __getBrowserType()
{
	var userAgent = navigator.userAgent;

	if ( userAgent.indexOf('Opera') > 0 )
        return "OPERA";
    else if ( userAgent.indexOf('Firefox') > 0 )
        return "FIREFOX";
	else if ( userAgent.indexOf('Chrome') > 0 )
        return "Chrome";
	else if ( userAgent.indexOf('Safari') > 0 )
        return "Safari";
    else
        return "MSIE";

}

function __isIE(userAgent) {
  userAgent = userAgent || navigator.userAgent;
  return userAgent.indexOf("MSIE ") > -1 || userAgent.indexOf("Trident/") > -1;
}

function __mgOpenPopup( szHtmlPage, szSetting, nWidth, nHeight )
{
	var browserType = navigator.appName;
	var browserVersion = parseInt(navigator.appVersion);

	if ( browserType == "Microsoft Internet Explorer" && browserVersion >= 4 ) {
		OpenModalDialog( szHtmlPage, szSetting, nWidth+6, nHeight+28 );
	} else {
		WndCenterOpen( szHtmlPage, "_WndPopup", nWidth, nHeight, scroll, szSetting );	
	}

}

function _mgMakeFlashCode(arInfo){
	var aType = {"classid":'clsid:d27cdb6e-ae6d-11cf-96b8-444553540000',
			"codebase":'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0',
			"type":'application/x-shockwave-flash'};
	var sId = (arInfo["id"])?'id="'+arInfo["id"]+'"':'';
	var code = '';
	
	if(!arInfo["width"]){ arInfo["width"] = '100'; }
	if(!arInfo["height"]){ arInfo["height"] = '100'; }
	if(!arInfo["params"]){
		arInfo["params"] = [];
	}
	arInfo["params"].push({name:'wmode',value:'transparent'});
	
	if(navigator.userAgent.indexOf('MSIE') > 0){
		code = '<object '+sId+' classid="'+aType["classid"]+'" codebase="'+aType["codebase"]+'" width="'+arInfo["width"]+'" '
				 + 'height="'+arInfo["height"]+'"'
				 + 'style="width:'+arInfo["width"]+'px;height:'+arInfo["height"]+'px"'+'>';
		arInfo["params"].push({name:'movie',value:arInfo["url"]});
	}else {
		code = '<object '+sId+' type="'+aType["type"]+'" data="'+arInfo["url"]+'" width="'+arInfo["width"]+'" height="'+arInfo["height"]+'"'
		+ 'style="width:'+arInfo["width"]+'px;height:'+arInfo["height"]+'px"'+'>'; 
	}
	
	for(var i=0;i<arInfo["params"].length;i++){
		var arParam = arInfo["params"][i];
		code += '<param name="'+arParam["name"]+'" value="'+arParam["value"]+'" />';
	};
	
	code += '</object>';
	
	return code;
}

function WndCenterOpen(mypage,myname,w,h,scroll,option)
{
    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+option;
    _centerWnd = window.open(mypage,myname,settings);

	return _centerWnd;
}


function OpenModalDialog( HtmlFile, vOptions, nWidth, nHeight )
{
	var browser_type = __getBrowserType();

	if ( browser_type == "MSIE" ) {
		var qResult = top.window.showModalDialog( HtmlFile, vOptions,
          				"dialogWidth:"+nWidth+"px;dialogHeight:"+nHeight+"px;toolbar:no;location:no;help:no;directories:no;status:no;menubar:no;scroll:no;resizable:no");
		return qResult;    	
	} else {
		var qResult = window.open( HtmlFile, vOptions,
          				"Width:"+nWidth+"px;Height:"+nHeight+"px;toolbar:no;location:no;help:no;directories:no;status:no;menubar:no;scroll:no;resizable:no");
		return qResult;
	}

}
 
function mgZipCodeCheck(zipcode,jZip1,jZip2){
	if(!zipcode || zipcode == ''){ return; }
	if(jZip2.length == 0){  // 한자리 스타일 우편번호
		jZip1.val(zipcode);
		return;
	}
	
	// 2스타일 우편번호
	if(!jZip1.attr('data-width')){
		jZip1.attr('data-width',jZip1.width()).prop("max-length",7);
	}
	var width = parseInt(jZip1.attr('data-width'));
	if(zipcode.length == 5){  // 5자리 스타일 
		jZip2.val('').hide();
		jZip1.val(zipcode).width(width*2);
	}else {
		jZip1.width(width).val(zipcode.substr(0,3));
		jZip2.show().val(zipcode.substr(3,3));
	}
}

function __mgCenterLayer(oEl){
	if(typeof(oEl) == 'string'){
		oEl = document.getElementById(oEl);
	}
	var nLayWidth 	= parseInt(oEl.offsetWidth);
	var nLayHeight	= parseInt(oEl.offsetHeight);
	var nWinWidth	= parseInt(document.body.clientWidth);
	var nWinHeight	= parseInt(document.body.clientHeight);
	var nScrollTop	= parseInt(document.body.scrollTop);
	var nScrollLeft	= parseInt(document.body.scrollLeft);
	
	oEl.style.top		= ((nWinHeight / 2) - (nLayHeight / 2) + nScrollTop) + 'px';
	oEl.style.left		= ((nWinWidth / 2) - (nLayWidth / 2) + nScrollLeft) + 'px';
	
} 

// -----------------------------------------
// 숫자만 얻어오기
// -----------------------------------------
function getDigit(No)
{
	var	 x,	ch;
	var	 target_str="";
		
	for(x =	0; x < No.value.length ; x++)
	{
		ch=	No.value.substring(x,x+1);
		if(	ch != ",")	target_str += ch;
	}	  
	return target_str;	
}

function MakePayValue( pValue )
{
	var	strValue = new String( pValue );
	var strDotValue = "";

	if ( strValue.indexOf(".") ) {
		var arString = strValue.split( "." );
		if ( arString.length > 1 )	{
			var strValue = new String( arString[0] );
			strDotValue = "." + arString[1].substring(0,2);		
		}
	}
	var	sLen = strValue.length;
	var	sValue = "";
	var	sVal3  = "";

	if ( sLen <	3 )
		return strValue;

	var	iCnt = 0;
	for	( var i	= sLen;	i >	0 ;	i--	) {

		sValue = sValue	+ strValue.substring( i-1, i );

		if ( ++iCnt	== 3 &&	i >	1 )	{
			sValue = sValue	+ ',';
			iCnt = 0;
		}
	}

	var	sVal2 =	new	String(	sValue );

	for	( i	= sVal2.length ; i > 0;	i--	) {
		sVal3 =	sVal3 +	sVal2.substring( i-1, i	);
	}

	return ( sVal3 + strDotValue );
}

function number_format(number, decimals, dec_point, thousands_sep) 
{
    // http://kevin.vanzonneveld.net
    // +   original by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function (n, prec) {
            var k = Math.pow(10, prec);
            return '' + Math.round(n * k) / k;
        };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);		
}

function isDigit(val, allowable)
{
	var	valid =	true;
	var	cmp	= "0123456789" + allowable;

	for	(var i=0; i<val.length;	i++) {
		if (cmp.indexOf(val.charAt(i)) < 0)	{
			valid =	false;
			break;
		}
	}
	return valid;
}

function strTrim( szString )
{
	var reg = /\s+/g;

	return szString.replace( reg, "" );
}

// ----------------------------------------------
// 숫자만 반환한다.
// ----------------------------------------------
function getNumber( val )
{
	var	cmp	   = "0123456789.";
	var ndigit = "";

	if ( val.length < 4 ) 
		return val;

	for	( var i = 0; i < val.length; i++ ) {
		if (cmp.indexOf(val.charAt(i)) < 0)	{
			continue;
		} else {
			ndigit = ndigit + val.charAt(i);
		}
	}
	
	if ( ndigit.length < 1 ) return 0;

	return parseInt(ndigit);
}

// ----------------------------------------------
// 수치값에 콤마를 입력해준다.
// ----------------------------------------------
function OnChangedNumText( objField )
{
    objField.value = MakePayValue( parseInt( getNumber( objField.value ) ) );
}

// ----------------------------------------------
// 숫자만 입력 받는다.
// ----------------------------------------------
function OnCheckNumber( objText )
{
    var newString = '';
    for ( i = 0; i < objText.value.length; i++ )
        if ( !isNaN( parseInt(objText.value.charAt( i )) ) ) {
            newString = newString + objText.value.charAt(i);
    }
	objText.value = parseInt( newString.length ? newString: 0 );
}


function mgCheckAvailEmail(email, denymails)
{

	var szDomainName = document.domain.substr( document.domain.indexOf('.') + 1 );

    var pattern = new RegExp( "^[a-z0-9_\\-]+(\\.[_a-z0-9\\-]+)*@([_a-z0-9\\-]+\\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$");
    var arr = email.match(pattern);
    if (!arr) {
		psModalAlert({
			  message: {text: '전자우편주소의 형식은 계정@[호스트|도메인]과 같이 구성되어야 하며, 양쪽에 쩜(.)이 기재되어서는 안됩니다. 예) ${sample}', args:{sample: "webmaster@"+szDomainName }}
			, type: BootstrapDialog.TYPE_WARNING
		});  
        return false;
    }

	if ( denymails ) {
		ar_email = email.split( "@" );
		if ( denymails.charAt( ";" ) ) {
			ar_denymail = denymails.split( ";" );
			for ( var i = 0; i < ar_denymail.length; i++ ) {
				if ( ar_email[1].toLowerCase() == ar_denymail[i] ) {
					psModalAlert({
					  message: {text:'${emailList} 이메일 주소는 메일수신이 되지 않습니다. 다른 메일주소를 입력해 주세요.', args:{emaillist: ar_denymail[i]}}
					, type: BootstrapDialog.TYPE_WARNING
					});  
					return false;
				}

			}

		} else {

			if ( ar_email[1].toLowerCase() == denymails ) {
				psModalAlert({
                      message: {text:'${emailList} 이메일 주소는 메일수신이 되지 않습니다. 다른 메일주소를 입력해 주세요.', args:{emaillist: denymails }}
					, type: BootstrapDialog.TYPE_WARNING
				});  
				return false;
			}
		}                                                                                                         
	}                                                                                                             
																											  
	return true;
}

//사업자 등록 번호 검사
function checkbusino(vencod, szError){

    var sum = 0;
    var getlist =new Array(10);
    var chkvalue =new Array("1","3","7","1","3","7","1","3","5");
    var num = vencod.value.replace( /\-/gi, "" );

    for (var i=0;i<10;i++){
        getlist[i] = num.substring(i,i+1);
    }

    for (var i=0;i<9;i++){
        sum += getlist[i]*chkvalue[i];
    }
    sum = sum +parseInt((getlist[8]*5)/10) ;
    sidliy = sum%10;
    sidchk = 0;

    if ( sidliy != 0 ) {
        sidchk = 10 - sidliy;
    } else {
        sidchk = 0;
    }

    if ( (sidchk != getlist[9]) || (num.length != 10 ) || ( num == "") ) {
        alert( szError );
        vencod.focus();
        return false;
    }
    return true;
}

function mgCheckStringLength( objId, iMinLen, szError )
{
	if ( objId === undefined ) return false;
	var szString = mgTrimString( objId.value );

	if ( szString.length < iMinLen ) {
		psModalAlert({
			  message: szError
			, type: BootstrapDialog.TYPE_WARNING
			, fnOnClose:function(){ objId.focus(); }
		});  
		return false;
	}

	return true;
}

function mgTrimString( szString )
{
	var reg = /\s+/g;
	if(typeof(szString) != 'String'){ return szString; }
	return szString.replace( reg, "" );
}

/**
 * 비밀번호가 형식에 맞는가? 
 */
function mgCheckPassword( sString ) 
{ 
	var paswd = /^(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*]{8,16}$/;
	if( sString.match(paswd) )
		return true;
	else
		return false;
}     



// ----------------------------------------------
// SystemErrorWindow
// ----------------------------------------------
function __mgSystemErrorAlert( iErrorMessage )
{
	//OpenModalDialog( "/FrontStore/System/iErrorWindow.phtml", '', 440, 365 );

	objWindow = WndCenterOpen( "/FrontStore/System/iErrorWindow.phtml?iErrMessage="+iErrorMessage, 
							   "ErrorWindow", 440, 365, 0, '' );
	objWindow.focus();
}

function __mgGetPassword( nWidth, nHeight )
{
	if ( parseInt(nWidth)  < 350 ) nWidth  = 350;
	if ( parseInt(nHeight) < 250 ) nHeight = 250;

    var qResult = window.showModalDialog( 
						"/FrontStore/Popup/iGetPassword.phtml?iWndMode=dlg", 
						"",
          				"dialogwidth:"+nWidth+"px;dialogheight:"+nHeight+"px;toolbar:no;location:no;help:no;directories:no;status:no;menubar:no;scroll:no;resizable:no");


	if ( qResult == undefined || qResult == "" ) {
        return "";
    }
	
	return qResult;
}

/**
 * 비밀번호를 입력받아 그 결과를 fnResultProc 에 넘긴다.
 * 
 * @param nWidth 팝업창 가로크기
 * @param nHeight 팝업창 세로크기
 * @param fnResultProc(x) 결과를 처리할 callback function
 */
function showConfirmPassword( nWidth, nHeight, fnResultProc )
{
    if ( parseInt(nWidth)  < 350 ) nWidth  = 350;
    if ( parseInt(nHeight) < 250 ) nHeight = 250;

    WndDialogProc({
          url: '/FrontStore/Popup/iGetPassword.phtml'
        , title: __T('비밀번호')
        , params: null
        , width: nWidth
        , height: nHeight
        , fnCallback: fnResultProc
    });
}

// ----------------------------------------------
// Cookies
// ----------------------------------------------
function getCookieVal (offset) 
{
   var endstr = document.cookie.indexOf (";", offset);
   if (endstr == -1)
      endstr = document.cookie.length;

   return unescape(document.cookie.substring(offset, endstr));
}

function SetCookie(name, value, expire){
	var oDate1 	= new Date();
	var oDate2	= new Date(oDate1.getTime()+(expire*86400000));
	
    document.cookie = name + "=" + escape(value) + "; expires=" + oDate2.toGMTString()+"; path=/"; 
}

function GetCookie (name) 
{
   var arg = name + "=";
   var alen = arg.length;
   var clen = document.cookie.length;
   var i = 0;
   while (i < clen) 
      {
      var j = i + alen;
      if (document.cookie.substring(i, j) == arg)
         return getCookieVal (j);
      i = document.cookie.indexOf(" ", i) + 1;
      if (i == 0) 
         break; 
      }
   return null;
}

function __mgStartPopup( id, sizew, sizeh, scroll, wtype, nx, ny, nposset, nposition )
{
	if ( wtype == 9 ) return;
	
	var szHtmlPage = "/FrontStore/Popup/iStartPopup.phtml?iViewMode=PC&popid="+id;
    var nClientWidth = screen.availWidth;
    var nClientHeight = screen.availHeight;

	// 오늘은 그만보기?
	if ( GetCookie( "__ps_popup_"+id ) ) {
		return;
	}

    if ( nposset == 1 ) {

        if ( nposition == 3 ) {
            nx = -1;
            ny = -1;
        } else {
            //nx = 100;
        	ny = 100;	
            switch ( nposition ) {
                case 0 :
                    //ny = 0;
                	nx = 0;
                    break;
                case 1 :
                    //ny = parseInt( (nClientWidth / 2) - ( sizew / 2 ) );
                	nx = parseInt( (nClientWidth / 2) - ( sizew / 2 ) );
                    break;
                case 2 :
                    //ny = parseInt( nClientWidth - sizew );
                    nx = parseInt( nClientWidth - sizew );
                    break;
            }

        }
    }
    
    

	if ( nx == -1 && ny == -1 ) { // center mode

		if ( wtype == 0 ) { // HtmlWnd
			WndCenterOpen( szHtmlPage, 'iStartPopup_'+id, sizew, sizeh, scroll, '' );
		} else { // Dialog
			OpenModalDialog( szHtmlPage, "", sizew, sizeh );
		}

	} else {

		if ( wtype == 0 ) { // HtmlWnd

    		var settings = 'height='+sizeh+',width='+sizew+',top='+ny+',left='+nx+',scrollbars='+scroll;
		    _centerWnd = window.open( szHtmlPage, 'iStartPopup_'+id, settings );

		} else { // Dialog

    		window.showModalDialog( szHtmlPage, "",
          				"dialogWidth:"+sizew+"px;dialogHeight:"+sizeh+"px;toolbar:no;location:no;help:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;dialogLeft:"+nx+";dialogTop:"+ny );
		}

	}	 
}

function __mgStartLayerPopup( id, sizew, sizeh, scroll, wtype, nx, ny, nposset, nposition, noutline, outlinecolor, ani, laydim )
{
	if ( wtype == 9 ) return;
	
	sizew	= parseInt(sizew) || 0;
    sizeh	= parseInt(sizeh) || 0;
    var szHtmlPage = "/FrontStore/Popup/iStartPopup.phtml?iViewMode=PC&popid="+id;
    var nTop = 0, nLeft = 0, nOutline = 0, nwOutline = sizew, nhOutline = sizeh;
    var nClientWidth = jQuery('body').width();  //document.body.clientWidth;
    var nClientHeight = jQuery(window).height(); //document.body.clientHeight;
    
    
    // 오늘은 그만보기?
    if ( GetCookie( "__ps_popup_"+id ) ) {
        return;
    }

    if ( noutline == 1 ) {
        nOutline = 24;
        nwOutline += 24;
        nhOutline += 24;
    }

    if ( nposset == 0 ) {
        nTop = ny;
        nLeft = nx;
    } else {
        if ( nposition == 3 ) {
            nTop =  (nClientHeight / 2) - (sizeh / 2);
            nLeft = (nClientWidth / 2) - (sizew / 2);
        } else {
            nTop = 100;

            switch ( nposition ) {
                case 0 :
                        nLeft = 0;
                        break;
                case 1 :
                        nLeft = parseInt( (nClientWidth / 2) - ((sizew + nOutline) / 2) );
                        break;
                case 2 :
                        nLeft = parseInt( nClientWidth - (sizew + nOutline) );
                        break;
            }
        }
    }
 
    var szLayerPopupDoc = "";

	if ( ani != "none" )
	    szLayerPopupDoc += "<MARQUEE BEHAVIOR=SLIDE DIRECTION="+ani+" height="+nhOutline+" width="+nwOutline+" scrollamount=20>";

    if ( noutline == 1 ) {
        szLayerPopupDoc += "<table width="+nwOutline+" height="+nhOutline+" border=0 cellpadding=0 cellspacing=1 bgcolor=#000000><tr><td bgcolor="+outlinecolor+" valign=top><table width=100% border=0 cellspacing=0 cellpadding=0><tr><td bgcolor=#FFFFFF width=1 height=1 style='filter:Alpha(opacity=60);'></td><td height=1 bgcolor=#FFFFFF style='filter:Alpha(opacity=60);'></td><td bgcolor=#FFFFFF width=1 height=1 style='filter:Alpha(opacity=60);'></td></tr><tr><td width=1 bgcolor=#FFFFFF style='filter:Alpha(opacity=50);'></td><td valign=top height=100%><table width=100% border=0 cellspacing=0 cellpadding=0><tr><td bgcolor=#FFFFFF width=1 height=1 style='filter:Alpha(opacity=10);'></td><td height=1 bgcolor=#FFFFFF style='filter:Alpha(opacity=10);'></td><td bgcolor=#FFFFFF width=1 height=1 style='filter:Alpha(opacity=10);'></td></tr><tr><td width=1 bgcolor=#FFFFFF style='filter:Alpha(opacity=20);'></td><td style=padding:7px;><table width=100% border=0 cellspacing=0 cellpadding=0><tr><td bgcolor=#000000 width=1 height=1 style='filter:Alpha(opacity=70);'></td><td height=1 bgcolor=#000000 style='filter:Alpha(opacity=70);'></td><td bgcolor=#000000 style='filter:Alpha(opacity=70);' width=1 height=1 ></td></tr><tr><td width=1 bgcolor=#000000 style='filter:Alpha(opacity=70);'></td><td bgcolor=#FFFFFF><table width=100% border=0 cellspacing=0 cellpadding=0><tr><td bgcolor=#000000 width=1 height=1 style='filter:Alpha(opacity=20);'></td><td height=1 bgcolor=#000000 style='filter:Alpha(opacity=20);'></td><td bgcolor=#000000 width=1 height=1 style='filter:Alpha(opacity=20);'></td></tr><tr><td width=1 bgcolor=#000000 style='filter:Alpha(opacity=20);'></td><td align=center>";
    }

    szLayerPopupDoc += "<IFRAME id='__psLayerPopupIFrame_"+id+"' allowTransparency='true' SRC=\""+szHtmlPage+"\" FRAMEBORDER=0 WIDTH="+sizew+" HEIGHT="+sizeh+" ALIGN=CENTER MARGINWIDTH=0 MARGINHEIGHT=0 Scrolling="+scroll+"></IFRAME>";

    if ( noutline == 1 ) {
        szLayerPopupDoc += "</td><td width=1></td></tr><tr><td bgcolor=#000000 style='filter:Alpha(opacity=20);' width=1 height=1></td><td></td><td></td></tr></table></td><td bgcolor=#ffffff width=1></td></tr><tr><td bgcolor=#000000 style='filter:Alpha(opacity=70);' width=1 height=1></td><td bgcolor=#ffffff height=1></td><td bgcolor=#ffffff width=1 height=1 ></td></tr></table></td><td bgcolor=#FFFFFF width=1 style='filter:Alpha(opacity=20);'></td></tr><tr><td bgcolor=#FFFFFF width=1 height=1 style='filter:Alpha(opacity=20);'></td><td bgcolor=#FFFFFF height=1 style='filter:Alpha(opacity=20);'></td><td bgcolor=#FFFFFF width=1 height=1  style='filter:Alpha(opacity=20);'></td></tr></table></td><td bgcolor=#FFFFFF width=1 style='filter:Alpha(opacity=60);'></td></tr><tr><td bgcolor=#FFFFFF width=1 height=1 style='filter:Alpha(opacity=60);'></td><td bgcolor=#FFFFFF height=1 style='filter:Alpha(opacity=60);'></td><td bgcolor=#FFFFFF width=1 height=1  style='filter:Alpha(opacity=60);'></td></tr></table></td></tr></table>";
    }

	if ( ani != "none" )
	    szLayerPopupDoc += "</MARQUEE>";
  
	var oEl = document.createElement('div');
	oEl.id = '__objId_LayerId_' + id;
	oEl.innerHTML = szLayerPopupDoc;
	oEl.style.display = 'block';
	oEl.style.position = 'absolute';
	oEl.style.top	= nTop+'px';
	oEl.style.left	= nLeft+'px';
	oEl.style.zIndex = '9999';
	
	/*
    var oEl = new Element('div', {
          'id': '__objId_LayerId_' + id
    }).update( szLayerPopupDoc ).setStyle({
          display: 'block'
        , position: 'absolute'
        , top: nTop +'px'
        , left: nLeft + 'px'
        , zIndex: 99
    });
	*/
	// 투명 배경 사용함인가
	if(laydim == '1'){
		var oLayDim = jQuery('<div id="__objId_LayerDimId_'+id+'"></div>');
		oLayDim.css({
			"width":"100%",
			"height":jQuery('body').height(),
			"background":"black",
			"opacity":0.6,
			"position":"fixed",
			"top":0,
			"left":0
		});
		jQuery('body').append(oLayDim);
	}
	
    document.body.appendChild(oEl);
}

function __OnEmbedImageDetailViewer( pid , iWndWidth, iWndHeight )
{
	OpenModalDialog( "/FrontStore/Popup/iGoodsImageView.phtml?iGoodsId="+pid, "", iWndWidth+6, iWndHeight+28 );
}

function __OnEmailReject()
{
	var iWndWidth  = 306;
	var iWndHeight = 313;

	WndCenterOpen( "/FrontStore/Popup/iEmailReject.phtml", "_WndPopup", iWndWidth, iWndHeight);	
	//OpenModalDialog( "/FrontStore/Popup/iEmailReject.phtml?close=modal", "", iWndWidth, iWndHeight );
	//window.open( "/FrontStore/Popup/iEmailReject.phtml", '', iWndWidth, iWndHeight, '', '' )
}

function __OnPopupPage(sPageName,width,height)
{
	var iWndWidth  = width || 440;
	var iWndHeight = height || 385;

	OpenModalDialog( "/FrontStore/"+sPageName+".phtml?close=modal", "", iWndWidth, iWndHeight );
}

function __OnKeyDoAction( keyCode, fnAction )
{
	if ( window.event.keyCode == keyCode ) {
		fnAction;
	}
}

// ----------------------------------------------
// 이미지 파일인가?
// ----------------------------------------------
function mgCheckImageFile( szValue )
{
	szValue = szValue.replace(/\?.*$/,'');
    var szExt = szValue.substr( szValue.length - 3, 3 ).toLowerCase();

    switch ( szExt ) {
    case "gif":
    case "jpg":
    case "png":
    case "jpeg":
    case "jpe":
        return true;
        break;
    }

    return false;
}

function mgCheckLength(objInput, len) 
{
  var strValue = objInput.value;
  var iLen = parseInt(len, 10);
  var retCode = 0;
  var countChar = 0;
    
  if ( objInput.value == "" ) {
    return 1;
  }

  for (i=0; i<strValue.length; i++) {
    var retCode = strValue.charCodeAt(i);
    var retChar = strValue.substr(i,1).toUpperCase();
    retCode = parseInt(retCode);
    
    if ((retChar < "0" || retChar > "9") && (retChar < "A" || retChar > "Z") && ((retCode > 255) || (retCode < 0))) {
      countChar = countChar + 2;
    } else {
      countChar = countChar + 1;
    }
  }

  if(countChar > iLen) {
	psModalAlert({
		message:{
			text:"공백포함 ${length}자(한글:${byteLength}자)이내로 입력 하시기 바랍니다. 현재 ${countChar}자(영문/숫자기준) 입력되었습니다.",
			args:{
				length: iLen,
				byteLength: iLen/2,
				countChar: countChar
		}},
		fnOnYes:function(){
			objInput.select();
		}
	});
    return 0;           
  }
        
  return countChar;
} 

function __ps_IsCompleteLoad()
{
	if ( document.readyState == "complete" ) {
		psModalAlert({message:'페이지 로딩중입니다. 잠시만 기다려주십시오.'});
		return true;
	}
	return false;
}

function __ps_documentwrite(src){
	document.write(src);
}

function __OnPopupUrl( $seq, $bbsid, $iArticleId, $nWidth, $nHeight )
{       
    if ( $nWidth == 0 ) $nWidth = "420";
    if ( $nHeight == 0 ) $nHeight = "350";
    WndCenterOpen( "/FrontStore/PointBBS/iBoardPopup.phtml?seq="+ $seq +"&bbsid="+ $bbsid + "&iArticleId="+ $iArticleId, "szPopupUrl", $nWidth, $nHeight, 1, '' );
} 

function __OnIUserIBanking()
{
    WndCenterOpen( '/FrontStore/Popup/iUserIBanking.phtml', 'IUserIBanking', 440, 365, 0, '' );
}

function __OnActiveXEnabler()
{ 
	if ( document.readyState != "complete") 
		return;

    if (navigator.appName == "Microsoft Internet Explorer") { 
         
        var arrElements = new Array(3); 
        arrElements[0] = "object"; 
        arrElements[1] = "embed"; 
        arrElements[2] = "applet"; 
         
        for (n = 0; n < arrElements.length; n++) { 
         
            replaceObj = document.getElementsByTagName(arrElements[n]); 
             
            for (i = 0; i < replaceObj.length; i++ ) { 
                parentObj = replaceObj[i].parentNode; 
                newHTML = parentObj.innerHTML; 
                parentObj.removeChild(replaceObj[i]); 
                parentObj.innerHTML = newHTML; 
             
			} 
		} 
	} 
} 

function __psAttachEvent(o,evt,fn)
{
	if ( o.addEventListener )
		o.addEventListener(evt,fn,false);
	else if ( o.attachEvent )
		o.attachEvent(evt,fn);
}

function __psMainOnLoadProc()
{
	__OnActiveXEnabler();

	/*
	if ( __fnOnLoadProc != null )
		__fnOnLoadProc();
	*/
}

/**
 * 전달된 el 의 절대위치값을 반환한다.
 * @param el
 * @return pos
 */
function __psGetAbsPosition(el) 
{
    var pos = new Object;
    pos.x = 0;
    pos.y = 0;

    if( el ) {
        pos.x = el.offsetLeft;
        pos.y = el.offsetTop;

        if( el.offsetParent ) {
            var parentpos = __psGetAbsPosition(el.offsetParent);
            pos.x += parentpos.x;
            pos.y += parentpos.y;
        }
    }

    pos.cx = el.offsetWidth;
    pos.cy = el.offsetHeight;

    return pos;
}

/**
 * $_GET 값에서 원하는 것을 가져온다.
 * @param name
 * @return name에 해당하는 값, 없으면 null
 */
function getURLParameter(name) {
    return decodeURIComponent(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
    );
}

// OnLoadProc
// --------------------------------------------------------
/*
var __fnOnLoadProc = null;

if ( window.onload )
	__fnOnLoadProc = window.onload;

window.onload = __psMainOnLoadProc;

if ( document.attachEvent ) {
	document.attachEvent('onreadystatechange', __psMainOnLoadProc );
}
*/



/**
 * for bootstrap dialog
 */
if ( typeof(BootstrapDialog) == 'undefined' ) {
	BootstrapDialog = {};
}


/**
 * check bootstrap enable
 */
function psIsBootstrap()
{
	if ( typeof __ps_cfg__ === 'undefined' ) return false;
	
	if (  __ps_cfg__.isMobileDevice && __ps_cfg__.bootstrap_m ) return true;
	if ( !__ps_cfg__.isMobileDevice && __ps_cfg__.bootstrap ) return true;
	
	return false;	
}

/**
 * window.alert()
 */
function psModalAlert( aParams )
{
	var msg = typeof aParams.message == 'string' ? __T(aParams.message): __T( aParams.message.text, typeof aParams.message.args !== 'undefined' ? aParams.message.args: {} );
	if ( psIsBootstrap() && window == parent.window ) {
		BootstrapDialog.show({
			  title: __T(aParams.title || '안내 확인')
			, message: msg
			, nl2br: typeof aParams.nl2br !== 'undefined' ? aParams.nl2br: true			
			, type: aParams.type || BootstrapDialog.TYPE_DEFAULT
			, closable: false
			, buttons: typeof aParams.buttons === 'object' ? aParams.buttons: [{
				  label: typeof aParams.labelOnClose !== 'undefined' ? __T(aParams.labelOnClose): __T('확인')
				, cssClass: typeof aParams.classOnClose !== 'undefined' ? aParams.classOnClose: 'btn-primary'
                , icon: typeof aParams.iconOnClose !== 'undefined' ? aParams.iconOnClose: 'fa fa-check'
				, action: function(dlgRef) {
					if ( typeof aParams.fnOnClose === 'function' ) 
						aParams.fnOnClose(dlgRef);
					dlgRef.close();	
				}
			}]
		});
	} else {
		alert( strip_tags( msg ) );
		if ( typeof aParams.fnOnClose === 'function' ) {
			aParams.fnOnClose();
		}
	}
}

/**
 * window.prompt()
 */
function psModalPrompt( aParams )
{
    var msg = typeof aParams.message == 'string' ? __T(aParams.message): __T( aParams.message.text, typeof aParams.message.args !== 'undefined' ? aParams.message.args: {} );

    if ( psIsBootstrap() ) {

		BootstrapDialog.show({
			  title: __T(aParams.title||'내용 확인')
			, message: msg + '<br /><input type="'+ ( aParams.promptType || 'text' ) +'" name="ps_dlg_prompt" class="form-control" placeholder="'+ ( __T(aParams.promptPlaceHolder) || '' ) +'" />'
			, closable: false
			, nl2br: typeof aParams.nl2br !== 'undefined' ? aParams.nl2br: true			
			, type: aParams.type || BootstrapDialog.TYPE_DEFAULT
			, buttons: typeof aParams.buttons === 'object' ? aParams.buttons: [{
				  label: typeof aParams.labelOnYes !== 'undefined' ? __T(aParams.labelOnYes): __T('확인')
				, cssClass: typeof aParams.classOnYes !== 'undefined' ? aParams.classOnYes: 'btn-primary'
                , icon: typeof aParams.iconOnYes !== 'undefined' ? aParams.iconOnYes: 'fa fa-check'
				, action: function(dlgRef) {
					var v = dlgRef.getModalBody().find('input').val();
					if ( typeof aParams.fnOnYes === 'function' ) 
						aParams.fnOnYes(dlgRef,v);
					dlgRef.close();	
				}
			},{
				  label: typeof aParams.labelOnNo !== 'undefined' ? __T(aParams.labelOnNo): __T('취소')
				, cssClass: typeof aParams.classOnYes !== 'undefined' ? aParams.classOnYes: 'btn-default'
                , icon: typeof aParams.iconOnNo !== 'undefined' ? aParams.iconOnNo: 'fa fa-times'
				, action: function(dlgRef) {
					if ( typeof aParams.fnOnNo === 'function' ) 
						aParams.fnOnNo(dlgRef);
					dlgRef.close();	
				}
			}]
		});
	} else {
		var v = prompt( strip_tags( msg ), __T(aParams.defaultPrompt || '') );

		if ( v ) {
			if ( typeof	aParams.fnOnYes === 'function' )
				aParams.fnOnYes(v);
			else if ( typeof aParams.buttons === 'object' ) {
				aParams.buttons[0].action(v);
			}
		} else {
			if ( typeof aParams.fnOnNo === 'function' ) 
				aParams.fnOnNo(v);
			else if ( typeof aParams.buttons === 'object' ) {
				aParams.buttons[1].action(v);
			}
		}
	}
}

/**
 * window.confirm()
 */
function mgModalConfirm( aParams ) 
{
    var msg = typeof aParams.message == 'string' ? __T(aParams.message): __T( aParams.message.text, typeof aParams.message.args !== 'undefined' ? aParams.message.args: {} );

	if ( psIsBootstrap() ) {
		BootstrapDialog.show({
			  title: __T(aParams.title||'내용 확인')
			, message: msg
			, type: aParams.type || BootstrapDialog.TYPE_DEFAULT
			, closable: false
			, nl2br: typeof aParams.nl2br !== 'undefined' ? aParams.nl2br: true
			, buttons: typeof aParams.buttons === 'object' ? aParams.buttons: [{
				  label: typeof aParams.labelOnYes !== 'undefined' ? __T(aParams.labelOnYes): __T('확인')
				, cssClass: typeof aParams.classOnYes !== 'undefined' ? aParams.classOnYes: 'btn-primary'
                , icon: typeof aParams.iconOnYes !== 'undefined' ? aParams.iconOnYes: 'fa fa-check'
				, action: function(dlgRef){
					if ( typeof aParams.fnOnYes === 'function' ) 
						aParams.fnOnYes(dlgRef);
					dlgRef.close();	
				}
			},{
				  label: typeof aParams.labelOnNo !== 'undefined' ? __T(aParams.labelOnNo): __T('취소')
				, cssClass: typeof aParams.classOnNo !== 'undefined' ? aParams.classOnNo: 'btn-default'
                , icon: typeof aParams.iconOnNo !== 'undefined' ? aParams.iconOnNo: 'fa fa-times'
				, action: function(dlgRef){
					if ( typeof aParams.fnOnNo === 'function' ) 
						aParams.fnOnNo(dlgRef);
					dlgRef.close();	
				}
			}]
		});
	} else {
		if ( confirm( strip_tags( msg ) ) ) {
			if ( typeof aParams.fnOnYes === 'function' ) 
				aParams.fnOnYes(null);
		} else {
			if ( typeof aParams.fnOnNo === 'function' ) 
				aParams.fnOnNo(null);
		}
	}
}

function psModalConfirm( aParams )
{
	return mgModalConfirm( aParams );
}



/**
 * popupAcsUpdate
 */
function mgPopupAcsUpdate(device,popId,slideId)
{
    jQuery.ajax({
          url: '/FrontStore/ajax/axPopupLoader.phtml'
        , data: { 
              oCmd : 'ICmdUpdateAcs'
            , popId: popId
            , slideId: slideId 
            , mtype: device
        }       
        , dataType: 'json'
        , cache: false
        , success: function(r) {}
    });
}

/**
 * popup todayclose 
 */
function mgPopupTodayClose(device,popId)
{
    jQuery.ajax({
          url: '/FrontStore/ajax/axPopupLoader.phtml'
        , data: { 
              oCmd : 'ICmdTodayClose'
            , popId: popId
            , mtype: device
        }       
        , dataType: 'json'
        , cache: false
        , success: function(r) {}
    });
}

function implode (glue, pieces) {
    // Joins array elements placing glue string between items and return one string  
    // 
    // version: 1004.2314
    // discuss at: http://phpjs.org/functions/implode    // +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
    // +   improved by: Waldo Malqui Silva
    // +   improved by: Itsacon (http://www.itsacon.net/)
    // +   bugfixed by: Brett Zamir (http://brett-zamir.me)
    // *     example 1: implode(' ', ['Kevin', 'van', 'Zonneveld']);    // *     returns 1: 'Kevin van Zonneveld'
    // *     example 2: implode(' ', {first:'Kevin', last: 'van Zonneveld'});
    // *     returns 2: 'Kevin van Zonneveld'
    var i = '', retVal='', tGlue='';
    if (arguments.length === 1) {        pieces = glue;
        glue = '';
    }
    if (typeof(pieces) === 'object') {
        if (pieces instanceof Array) {            
        	return pieces.join(glue);
        }
        else {
            for (i in pieces) {
                retVal += tGlue + pieces[i];                
                tGlue = glue;
            }
            return retVal;
        }
    } else {
        return pieces;
    }
}

/**
 * strip html tags
 */
function strip_tags(input, allowed) {
    // http://kevin.vanzonneveld.net
    // +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)	
    allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join(''); 	
    var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
        commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
    return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
        return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
    });
}

/**
 * 전달된 인자가 배열인가 확인
 * 
 * @param o
 * @return bool
 */
function isArray(o)
{
    if ( !o.constructor ) return false;
    if (o.constructor.toString().indexOf("Array") == -1)
    	return false;
    else
    	return true;	
}

/**
 * radio group 에서 선택된 항목이 있는가?
 * @param objItem
 * @param getV
 * @return value or bool
 */
function mgCheckRadioGroup( objItem, getV )
{
    if ( objItem.length > 0 ) { // group 
        for ( var i = 0; i < objItem.length; i++ ) {
            if ( objItem[i].checked )
            	return getV ? objItem[i].value : true;
        }
    } else { // single 
        if ( objItem.checked ) return getV ? objItem[i].value : true;
    }
    return false;
}


/**
 * 숫자를 한글로
 */
function getInt2Hangul(v)
{
    if (v == 0) return '0';
    var phonemic = ['','1','2','3','4','5','6','7','8','9','0'];
    var unit = ['','',__T('십'),__T('백'),__T('천'),__T('만'),__T('십만'),__T('백만'),__T('천만'),__T('억'),__T('십억'),__T('백억'),__T('천억'),__T('조'),__T('십조'),__T('백조')];
    var ret = '';
    var part = new Array();
    for (var x=0; x<String(v).length; x++) part[x] = String(v).substring(x,x+1);
    for (var i=0, cnt = String(v).length; cnt > 0; --cnt,++i) {
        p = phonemic[part[i]];
        p+= (p) ? (cnt>4 && phonemic[part[i+1]]) ? unit[cnt].substring(0,1) : unit[cnt] : '';
        ret+= p;
    }
    return ret;
}

function mgPageingInfo(page,nTotal,nPageDisplay,nPageBlock){
    var sPage     = Math.floor((page-1)/nPageBlock)*nPageBlock+1;
    var ePage        = sPage+nPageBlock-1;
    var tPage        = Math.ceil(nTotal/nPageDisplay);
    var item         = [];
    if(ePage > tPage){ ePage = tPage; }
                  
    for(var i=sPage;i<=ePage;i++){
      item.push(i);
    }
  
      return {
          "prevBlock":(sPage > 1)?sPage-1:null,
          "nextBlock":(ePage < tPage )?ePage+1:null,
          "start":sPage,
          "end":ePage,
          "page":page,
          "pages":item
  	};
  }

// 상품상세 미니보기 팝업
function _onMiniView(pid,width,height){
	var opt		= 'width='+width+', height='+height;
	var szUrl	= '/FrontStore/iGoodsView.phtml?__iViewMode=miniview&iGoodsId='+pid;
	var oWin = window.open(szUrl,'MINIVIEW',opt);
	if(oWin){ 
		oWin.focus();
	}else {
		psModalAlert({message:'팝업차단을 확인해 주세요.'});
	}
}

function _onLayerView(pid,width,height,bBlank,addStyle){
	
	var oFrm 	= jQuery('#ps_id_goods_miniview');
	var oBlank	= jQuery('#ps_id_goods_miniview_blank');
	var szUrl	= '/FrontStore/iGoodsView.phtml?__iViewMode=miniview&iGoodsId='+pid;
	window.name	= 'miniview';
	
	if(oBlank.length == 0){
		jQuery('body').append('<div id="ps_id_goods_miniview_blank"></div>');
		oBlank	= jQuery('#ps_id_goods_miniview_blank');
		oBlank.css({
			'position':'absolute',
			'top':0,
			'left':0,
			'opacity':0.7,
			'background-color':'black',
			'width':'100%'
		}).hide().click(function(){
			oFrm.hide();
			oBlank.hide();
		});
	};
	
	if(oFrm.length == 0){
		jQuery('body').append('<iframe id="ps_id_goods_miniview" frameborder="0"></iframe>');
		oFrm 	= jQuery('#ps_id_goods_miniview');
		oFrm.css({
			'border':0,
			'position':'absolute',
			'background-color':'white',
			'z-index':1000
		}).load(function(evt){
			oFrm.show(0,function(){
				if( bBlank == true ){
					oBlank.show().height(jQuery(document).height());
				}
			});
		});
		
	};
	
	if( bBlank == true ){
		oBlank.show().height(jQuery(document).height());
	}
	
	oFrm.hide();
	if(addStyle){
		oFrm.css(addStyle);
	}else {
		if(width){ oFrm.width(width).css({'left':'50%','margin-left':'-'+(width/2)+'px'}); }
		if(height){
			var nFHeight	=   window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
			var nScrollTop	= jQuery(window).scrollTop() || jQuery('body').scrollTop();
			var nTop = nScrollTop+(nFHeight/2)-(height/2);
			oFrm.height(height).css({'top':nTop+'px'});; 
		}
	}
	oFrm.prop('src',szUrl);
}

function sprintf () {
    // Return a formatted string  
    // 
    // version: 1109.2015
    // discuss at: http://phpjs.org/functions/sprintf    // +   original by: Ash Searle (http://hexmen.com/blog/)
    // + namespaced by: Michael White (http://getsprink.com)
    // +    tweaked by: Jack
    // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
    // +      input by: Paulo Freitas    // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
    // +      input by: Brett Zamir (http://brett-zamir.me)
    // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
    // *     example 1: sprintf("%01.2f", 123.1);
    // *     returns 1: 123.10    // *     example 2: sprintf("[%10s]", 'monkey');
    // *     returns 2: '[    monkey]'
    // *     example 3: sprintf("[%'#10s]", 'monkey');
    // *     returns 3: '[####monkey]'
    var regex = /%%|%(\d+\$)?([-+\'#0 ]*)(\*\d+\$|\*|\d+)?(\.(\*\d+\$|\*|\d+))?([scboxXuidfegEG])/g;    
    var a = arguments,
        i = 0,
        format = a[i++];
 
    // pad()    
    var pad = function (str, len, chr, leftJustify) {
        if (!chr) {
            chr = ' ';
        }
        var padding = (str.length >= len) ? '' : Array(1 + len - str.length >>> 0).join(chr);        
        return leftJustify ? str + padding : padding + str;
    };
 
    // justify()
    var justify = function (value, prefix, leftJustify, minWidth, zeroPad, customPadChar) {        
    	var diff = minWidth - value.length;
        if (diff > 0) {
            if (leftJustify || !zeroPad) {
                value = pad(value, minWidth, customPadChar, leftJustify);
            } else {                value = value.slice(0, prefix.length) + pad('', diff, '0', true) + value.slice(prefix.length);
            }
        }
        return value;
    }; 
    // formatBaseX()
    var formatBaseX = function (value, base, prefix, leftJustify, minWidth, precision, zeroPad) {
        // Note: casts negative numbers to positive ones
        var number = value >>> 0;        prefix = prefix && number && {
            '2': '0b',
            '8': '0',
            '16': '0x'
        }[base] || '';        value = prefix + pad(number.toString(base), precision || 0, '0', false);
        return justify(value, prefix, leftJustify, minWidth, zeroPad);
    };
 
    // formatString()    
    var formatString = function (value, leftJustify, minWidth, precision, zeroPad, customPadChar) {
        if (precision != null) {
            value = value.slice(0, precision);
        }
        return justify(value, '', leftJustify, minWidth, zeroPad, customPadChar);    
    };
 
    // doFormat()
    var doFormat = function (substring, valueIndex, flags, minWidth, _, precision, type) {
        var number;        
        var prefix;
        var method;
        var textTransform;
        var value;
         if (substring == '%%') {
            return '%';
        }
 
        // parse flags        
        var leftJustify = false,
            positivePrefix = '',
            zeroPad = false,
            prefixBaseX = false,
            customPadChar = ' ';        var flagsl = flags.length;
        for (var j = 0; flags && j < flagsl; j++) {
            switch (flags.charAt(j)) {
            case ' ':
                positivePrefix = ' ';                
                break;
            case '+':
                positivePrefix = '+';
                break;
            case '-':                
                leftJustify = true;
                break;
            case "'":
                customPadChar = flags.charAt(j + 1);
                break;            case '0':
                zeroPad = true;
                break;
            case '#':
                prefixBaseX = true;                
                break;
            }
        }
 
        // parameters may be null, undefined, empty-string or real valued        
        // we want to ignore null, undefined and empty-string values
        if (!minWidth) {
            minWidth = 0;
        } else if (minWidth == '*') {
            minWidth = +a[i++];        } else if (minWidth.charAt(0) == '*') {
            minWidth = +a[minWidth.slice(1, -1)];
        } else {
            minWidth = +minWidth;
        } 
        // Note: undocumented perl feature:
        if (minWidth < 0) {
            minWidth = -minWidth;
            leftJustify = true;        
        }
 
        if (!isFinite(minWidth)) {
            throw new Error('sprintf: (minimum-)width must be finite');
        } 
        if (!precision) {
            precision = 'fFeE'.indexOf(type) > -1 ? 6 : (type == 'd') ? 0 : undefined;
        } else if (precision == '*') {
            precision = +a[i++];        } else if (precision.charAt(0) == '*') {
            precision = +a[precision.slice(1, -1)];
        } else {
            precision = +precision;
        } 
        // grab value using valueIndex if required?
        value = valueIndex ? a[valueIndex.slice(0, -1)] : a[i++];
 
        switch (type) {        case 's':
            return formatString(String(value), leftJustify, minWidth, precision, zeroPad, customPadChar);
        case 'c':
            return formatString(String.fromCharCode(+value), leftJustify, minWidth, precision, zeroPad);
        case 'b':            return formatBaseX(value, 2, prefixBaseX, leftJustify, minWidth, precision, zeroPad);
        case 'o':
            return formatBaseX(value, 8, prefixBaseX, leftJustify, minWidth, precision, zeroPad);
        case 'x':
            return formatBaseX(value, 16, prefixBaseX, leftJustify, minWidth, precision, zeroPad);        case 'X':
            return formatBaseX(value, 16, prefixBaseX, leftJustify, minWidth, precision, zeroPad).toUpperCase();
        case 'u':
            return formatBaseX(value, 10, prefixBaseX, leftJustify, minWidth, precision, zeroPad);
        case 'i':        case 'd':
            number = (+value) | 0;
            prefix = number < 0 ? '-' : positivePrefix;
            value = prefix + pad(String(Math.abs(number)), precision, '0', false);
            return justify(value, prefix, leftJustify, minWidth, zeroPad);        case 'e':
        case 'E':
        case 'f':
        case 'F':
        case 'g':        
        case 'G':
            number = +value;
            prefix = number < 0 ? '-' : positivePrefix;
            method = ['toExponential', 'toFixed', 'toPrecision']['efg'.indexOf(type.toLowerCase())];
            textTransform = ['toString', 'toUpperCase']['eEfFgG'.indexOf(type) % 2];            value = prefix + Math.abs(number)[method](precision);
            return justify(value, prefix, leftJustify, minWidth, zeroPad)[textTransform]();
        default:
            return substring;
        }    };
 
    return format.replace(regex, doFormat);
}

/**
 * @param day 14 flat DATETIME string
 * @return UNIXTIMESTAMP format number
 */
function getStrToTime(day)
{   
	if ( day == '' || day == null ) return ''; 
    return Date.parse( sprintf( "%04d/%02d/%02d %02d:%02d:%02d"
						    	, day.substr(0,4)
						        , parseInt( day.substr(4,2) )
						        , day.substr(6,2)
						        , day.substr(8,2)
						        , day.substr(10,2)
						        , day.substr(12,2) 
    		) );
    
}

function date (format, timestamp) {
    // http://kevin.vanzonneveld.net
    // +   original by: Carlos R. L. Rodrigues (http://www.jsfromhell.com)
    // +      parts by: Peter-Paul Koch (http://www.quirksmode.org/js/beat.html)
    // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
    // +   improved by: MeEtc (http://yass.meetcweb.com)
    // +   improved by: Brad Touesnard
    // +   improved by: Tim Wiel
    // +   improved by: Bryan Elliott
    //
    // +   improved by: Brett Zamir (http://brett-zamir.me)
    // +   improved by: David Randall
    // +      input by: Brett Zamir (http://brett-zamir.me)
    // +   bugfixed by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
    // +   improved by: Brett Zamir (http://brett-zamir.me)
    // +   improved by: Brett Zamir (http://brett-zamir.me)
    // +   improved by: Theriault
    // +  derived from: gettimeofday
    // +      input by: majak
    // +   bugfixed by: majak
    // +   bugfixed by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
    // +      input by: Alex
    // +   bugfixed by: Brett Zamir (http://brett-zamir.me)
    // +   improved by: Theriault
    // +   improved by: Brett Zamir (http://brett-zamir.me)
    // +   improved by: Theriault
    // +   improved by: Thomas Beaucourt (http://www.webapp.fr)
    // +   improved by: JT
    // +   improved by: Theriault
    // +   improved by: Rafał Kukawski (http://blog.kukawski.pl)
    // +   bugfixed by: omid (http://phpjs.org/functions/380:380#comment_137122)
    // +      input by: Martin
    // +      input by: Alex Wilson
    // %        note 1: Uses global: php_js to store the default timezone
    // %        note 2: Although the function potentially allows timezone info (see notes), it currently does not set
    // %        note 2: per a timezone specified by date_default_timezone_set(). Implementers might use
    // %        note 2: this.php_js.currentTimezoneOffset and this.php_js.currentTimezoneDST set by that function
    // %        note 2: in order to adjust the dates in this function (or our other date functions!) accordingly
    // *     example 1: date('H:m:s \\m \\i\\s \\m\\o\\n\\t\\h', 1062402400);
    // *     returns 1: '09:09:40 m is month'
    // *     example 2: date('F j, Y, g:i a', 1062462400);
    // *     returns 2: 'September 2, 2003, 2:26 am'
    // *     example 3: date('Y W o', 1062462400);
    // *     returns 3: '2003 36 2003'
    // *     example 4: x = date('Y m d', (new Date()).getTime()/1000); 
    // *     example 4: (x+'').length == 10 // 2009 01 09
    // *     returns 4: true
    // *     example 5: date('W', 1104534000);
    // *     returns 5: '53'
    // *     example 6: date('B t', 1104534000);
    // *     returns 6: '999 31'
    // *     example 7: date('W U', 1293750000.82); // 2010-12-31
    // *     returns 7: '52 1293750000'
    // *     example 8: date('W', 1293836400); // 2011-01-01
    // *     returns 8: '52'
    // *     example 9: date('W Y-m-d', 1293974054); // 2011-01-02
    // *     returns 9: '52 2011-01-02'
    var that = this,
        jsdate, f, formatChr = /\\?([a-z])/gi,
        formatChrCb,
        // Keep this here (works, but for code commented-out
        // below for file size reasons)
        //, tal= [],
        _pad = function (n, c) {
            if ((n = n + '').length < c) {
                return new Array((++c) - n.length).join('0') + n;
            }
            return n;
        },
        //txt_words = ["Sun", "Mon", "Tues", "Wednes", "Thurs", "Fri", "Satur", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        txt_words = [__T("일"), __T("월"), __T("화"), __T("수"), __T("목"), __T("금"), __T("토"), "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    formatChrCb = function (t, s) {
        return f[t] ? f[t]() : s;
    };
    f = {
        // Day
        d: function () { // Day of month w/leading 0; 01..31
            return _pad(f.j(), 2);
        },
        D: function () { // Shorthand day name; Mon...Sun
            //return f.l().slice(0, 3);
            return txt_words[f.w()];
        },
        j: function () { // Day of month; 1..31
            return jsdate.getDate();
        },
        l: function () { // Full day name; Monday...Sunday
            //return txt_words[f.w()] + 'day';
            return txt_words[f.w()] + '요일';
        },
        N: function () { // ISO-8601 day of week; 1[Mon]..7[Sun]
            return f.w() || 7;
        },
        S: function () { // Ordinal suffix for day of month; st, nd, rd, th
            var j = f.j();
            return j < 4 | j > 20 && ['st', 'nd', 'rd'][j%10 - 1] || 'th'; 
        },
        w: function () { // Day of week; 0[Sun]..6[Sat]
            return jsdate.getDay();
        },
        z: function () { // Day of year; 0..365
            var a = new Date(f.Y(), f.n() - 1, f.j()),
                b = new Date(f.Y(), 0, 1);
            return Math.round((a - b) / 864e5) + 1;
        },

        // Week
        W: function () { // ISO-8601 week number
            var a = new Date(f.Y(), f.n() - 1, f.j() - f.N() + 3),
                b = new Date(a.getFullYear(), 0, 4);
            return _pad(1 + Math.round((a - b) / 864e5 / 7), 2);
        },

        // Month
        F: function () { // Full month name; January...December
            return txt_words[6 + f.n()];
        },
        m: function () { // Month w/leading 0; 01...12
            return _pad(f.n(), 2);
        },
        M: function () { // Shorthand month name; Jan...Dec
            return f.F().slice(0, 3);
        },
        n: function () { // Month; 1...12
            return jsdate.getMonth() + 1;
        },
        t: function () { // Days in month; 28...31
            return (new Date(f.Y(), f.n(), 0)).getDate();
        },

        // Year
        L: function () { // Is leap year?; 0 or 1
            var j = f.Y();
            return j%4==0 & j%100!=0 | j%400==0;
        },
        o: function () { // ISO-8601 year
            var n = f.n(),
                W = f.W(),
                Y = f.Y();
            return Y + (n === 12 && W < 9 ? -1 : n === 1 && W > 9);
        },
        Y: function () { // Full year; e.g. 1980...2010
            return jsdate.getFullYear();
        },
        y: function () { // Last two digits of year; 00...99
            return (f.Y() + "").slice(-2);
        },

        // Time
        a: function () { // am or pm
            return jsdate.getHours() > 11 ? "pm" : "am";
        },
        A: function () { // AM or PM
            return f.a().toUpperCase();
        },
        B: function () { // Swatch Internet time; 000..999
            var H = jsdate.getUTCHours() * 36e2,
                // Hours
                i = jsdate.getUTCMinutes() * 60,
                // Minutes
                s = jsdate.getUTCSeconds(); // Seconds
            return _pad(Math.floor((H + i + s + 36e2) / 86.4) % 1e3, 3);
        },
        g: function () { // 12-Hours; 1..12
            return f.G() % 12 || 12;
        },
        G: function () { // 24-Hours; 0..23
            return jsdate.getHours();
        },
        h: function () { // 12-Hours w/leading 0; 01..12
            return _pad(f.g(), 2);
        },
        H: function () { // 24-Hours w/leading 0; 00..23
            return _pad(f.G(), 2);
        },
        i: function () { // Minutes w/leading 0; 00..59
            return _pad(jsdate.getMinutes(), 2);
        },
        s: function () { // Seconds w/leading 0; 00..59
            return _pad(jsdate.getSeconds(), 2);
        },
        u: function () { // Microseconds; 000000-999000
            return _pad(jsdate.getMilliseconds() * 1000, 6);
        },

        // Timezone
        e: function () { // Timezone identifier; e.g. Atlantic/Azores, ...
            // The following works, but requires inclusion of the very large
            // timezone_abbreviations_list() function.
/*              return this.date_default_timezone_get();
*/
            throw 'Not supported (see source code of date() for timezone on how to add support)';
        },
        I: function () { // DST observed?; 0 or 1
            // Compares Jan 1 minus Jan 1 UTC to Jul 1 minus Jul 1 UTC.
            // If they are not equal, then DST is observed.
            var a = new Date(f.Y(), 0),
                // Jan 1
                c = Date.UTC(f.Y(), 0),
                // Jan 1 UTC
                b = new Date(f.Y(), 6),
                // Jul 1
                d = Date.UTC(f.Y(), 6); // Jul 1 UTC
            return 0 + ((a - c) !== (b - d));
        },
        O: function () { // Difference to GMT in hour format; e.g. +0200
            var tzo = jsdate.getTimezoneOffset(),
                a = Math.abs(tzo);
            return (tzo > 0 ? "-" : "+") + _pad(Math.floor(a / 60) * 100 + a % 60, 4);
        },
        P: function () { // Difference to GMT w/colon; e.g. +02:00
            var O = f.O();
            return (O.substr(0, 3) + ":" + O.substr(3, 2));
        },
        T: function () { // Timezone abbreviation; e.g. EST, MDT, ...
            // The following works, but requires inclusion of the very
            // large timezone_abbreviations_list() function.
/*              var abbr = '', i = 0, os = 0, default = 0;
            if (!tal.length) {
                tal = that.timezone_abbreviations_list();
            }
            if (that.php_js && that.php_js.default_timezone) {
                default = that.php_js.default_timezone;
                for (abbr in tal) {
                    for (i=0; i < tal[abbr].length; i++) {
                        if (tal[abbr][i].timezone_id === default) {
                            return abbr.toUpperCase();
                        }
                    }
                }
            }
            for (abbr in tal) {
                for (i = 0; i < tal[abbr].length; i++) {
                    os = -jsdate.getTimezoneOffset() * 60;
                    if (tal[abbr][i].offset === os) {
                        return abbr.toUpperCase();
                    }
                }
            }
*/
            return 'UTC';
        },
        Z: function () { // Timezone offset in seconds (-43200...50400)
            return -jsdate.getTimezoneOffset() * 60;
        },

        // Full Date/Time
        c: function () { // ISO-8601 date.
            return 'Y-m-d\\TH:i:sP'.replace(formatChr, formatChrCb);
        },
        r: function () { // RFC 2822
            return 'D, d M Y H:i:s O'.replace(formatChr, formatChrCb);
        },
        U: function () { // Seconds since UNIX epoch
            return jsdate / 1000 | 0;
        }
    };
    this.date = function (format, timestamp) {
        that = this;
        jsdate = (timestamp == null ? new Date() : // Not provided
        (timestamp instanceof Date) ? new Date(timestamp) : // JS Date()
        new Date(timestamp * 1000) // UNIX timestamp (auto-convert to int)
        );
        return format.replace(formatChr, formatChrCb);
    };
    return this.date(format, timestamp);
}

function getKeyByValue(arr, value)
{
  for(var key in arr){
    if(arr[key] == value){
      return key;
    }
  }
  return null;
}

function tableRowSpan(tblID, rowClass) {

    var cellThis, cellPrev, spanning;

    jQuery("#" + tblID + " ." + rowClass).each(function () {
        cellThis = jQuery(this);
        spanning = 0;

        if (cellPrev) {
            if (jQuery(cellPrev).html() == jQuery(cellThis).html()) {
                jQuery(cellThis).remove();
                jQuery(cellPrev).prop("rowspan", parseInt( jQuery(cellPrev).prop("rowspan")) + 1);
                spanning = 1;
            }
        }

        if (spanning == 0) {
            cellPrev = jQuery(this);
        }
    });
}


function requirejs(script) 
{
    jQuery.ajax({
        url: script,
        dataType: "script",
        async: false,
        success: function () {},
        error: function () {
            throw new Error("Could not load script " + script);
        }
    });
}


/**
 * url,title,params,width,height,scroll,option,closeCallback
 */
function WndDialogProc(opts)
{
	if ( typeof opts.fnCallback !== 'function' ) {
		psModalAlert({message:'fnCallback을 사용하지 않는 경우 WndCenterOpen() 을 사용하십시오.'});
		return false;
	}
	
	var fnNmRandCallback = "fnDlgCallback_" + Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 5); 
	var fnNmRandGet      = "fnDlgCallback_" + Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 5); 
	
	opts.scroll  = ( typeof opts.scroll == 'undefined' ) ? 1: opts.scroll;
	opts.resizable  = ( typeof opts.resizable == 'undefined' ) ? 1: opts.resizable;
	opts.options = ( typeof opts.options == 'undefined' ) ? '': opts.options;
	opts.params  = opts.params  || { TCallType: '', fnCallback: null, fnParamGet: null };
	
	opts.params.TCallType  = 'TWND_OPEN';
	opts.params.fnCallback = fnNmRandCallback;
	opts.params.fnParamGet = fnNmRandGet;

	window[ fnNmRandCallback ] = opts.fnCallback;
	window[ fnNmRandGet ] = function(){
		return opts.params;
	};

	var sParams = jQuery.param( opts.params );
    var LeftPosition = (screen.width) ? (screen.width- opts.width)/2 : 0;
    var TopPosition = (screen.height) ? (screen.height- opts.height)/2 : 0;
    var settings = 'height='+opts.height+',width='+opts.width+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+opts.scroll+",resizable="+opts.resizable+opts.options;

    //_centerWnd = window.open( opts.url + '?' + sParams, opts.title, settings);
    //_centerWnd = window.open( opts.url + '?' + sParams, 'TWndDialog', settings);
    _centerWnd = window.open( opts.url + '?' + sParams, '_blank', settings);
}

function WndDialogChildInit(gval,callType,fnGet) 
{
	if ( callType == 'TWND_OPEN' ) {
		if ( opener.window[fnGet] !== 'undefined' ) {
			window[gval] = opener.window[fnGet]();
		} 
	} else if ( callType == 'TWND_IFRAME' ) {
		if ( parent.window[fnGet] !== 'undefined' ) {
			window[gval] = parent.window[fnGet]();
		} 
	} else if ( typeof window.dialogArguments !== 'undefined' ) {
		window[gval] = window.dialogArguments;
	}
}

function WndDialogChildReturn(cfg,result)
{
	if ( typeof cfg === null || jQuery.isEmptyObject( cfg ) )  {
		window.close();
		return;
	}

	if ( cfg.TCallType == 'TWND_OPEN' ) {
		if ( opener.window[cfg.fnCallback] !== 'undefined' ) {
			opener.window[cfg.fnCallback](result);
			window.close();
		}
	} else if ( cfg.TCallType == 'TWND_IFRAME' ) {
		if ( parent.window[cfg.fnCallback] !== 'undefined' ) {
			opener.window[cfg.fnCallback](result, 'WM_CLOSE');
		}
	}
}

function findByStringIndex(object, reference) {
    if ( typeof reference === 'undefined' ) return '';

    function arr_deref(o, ref, i) {
        if ( typeof ref === 'undefined' || typeof o === 'undefined' ) return '';
        return !ref ? o : (o[ref.slice(0, i ? -1 : ref.length)]);
    }
    function dot_deref(o, ref) {
        if ( typeof ref === 'undefined' || typeof o === 'undefined' ) return '';
        return !ref ? o : ref.split('[').reduce(arr_deref, o);
    }
    return reference.split('.').reduce(dot_deref, object);
}

function __TLang(tmpl)
{
	if ( typeof window._i18n_langs === 'undefined' ) return tmpl;
	if ( window._i18n_langs.locale == '' ) return tmpl;

    //if ( typeof window._i18n_langs[window._i18n_langs.locale][tmpl] === 'undefined' ) return tmpl;
    //return window._i18n_langs[window._i18n_langs.locale][tmpl];

    if ( typeof window._i18n_langs.text[tmpl] === 'undefined' ) return tmpl;
    if ( typeof window._i18n_langs.text[tmpl][window._i18n_langs.locale] === 'undefined' ) return tmpl;
    return window._i18n_langs.text[tmpl][window._i18n_langs.locale];
}

function __T(tmpl,arItem)
{
    return jQuery.tmpl( __TLang( isString(tmpl) ? tmpl.trim(): tmpl ), typeof arItem === 'undefined' ? {}: arItem ).text();
}

