/*! UEditorPlus v2.0.0*/
!function(){function a(){for(var a=$G("tabHeads").children,b=0;b<a.length;b++)domUtils.on(a[b],"click",function(b){var c,d,e=b.target||b.srcElement;for(c=0;c<a.length;c++)d=a[c].getAttribute("data-content-id"),a[c]==e?(domUtils.addClass(a[c],"focus"),domUtils.addClass($G(d),"focus")):(domUtils.removeClasses(a[c],"focus"),domUtils.removeClasses($G(d),"focus"))});u.disableUpload||($G("tabHeads").querySelector('[data-content-id="upload"]').style.display="inline-block"),u.selectCallback&&($G("videoSelect").style.display="inline-block",domUtils.on($G("videoSelect"),"click",function(a){u.selectCallback(editor,function(a){a&&($G("videoUrl").value=a.path,n(a.path))})}))}function b(){k(["videoFloat","upload_alignment"]),m($G("videoUrl")),c(),function(){var a,b=editor.selection.getRange().getClosedNode();if(b&&b.className){var c="edui-faked-video"==b.className,e=b.className.indexOf("edui-upload-video")!=-1;if(c||e){$G("videoUrl").value=a=b.getAttribute("_url"),$G("videoWidth").value=b.width,$G("videoHeight").value=b.height;var f=domUtils.getComputedStyle(b,"float"),g=domUtils.getComputedStyle(b.parentNode,"text-align");d("center"===g?"center":f)}e&&(t=!0)}n(a)}()}function c(){dialog.onok=function(){$G("preview").innerHTML="";var a=g("tabHeads","tabSrc");switch(a){case"video":return e();case"videoSearch":return f("searchList");case"upload":return o()}},dialog.oncancel=function(){$G("preview").innerHTML=""}}function d(a){for(var b,c=$G("videoFloat").children,d=0;b=c[d++];)b.getAttribute("name")==a?"focus"!=b.className&&(b.className="focus"):"focus"==b.className&&(b.className="")}function e(){var a=$G("videoWidth"),b=$G("videoHeight"),c=$G("videoUrl").value,d=g("videoFloat","name");return!!c&&(!!i([a,b])&&void editor.execCommand("insertvideo",{url:h(c),width:a.value,height:b.value,align:d},t?"upload":null))}function f(a){for(var b,c=domUtils.getElementsByTagName($G(a),"img"),d=[],e=0;b=c[e++];)b.getAttribute("selected")&&d.push({url:b.getAttribute("ue_video_url"),width:420,height:280,align:"none"});editor.execCommand("insertvideo",d)}function g(a,b){for(var c,d,e=$G(a).children,f=0;d=e[f++];)if("focus"==d.className){c=d.getAttribute(b);break}return c}function h(a){return a?a=utils.trim(a).replace(/v\.youku\.com\/v_show\/id_([\w\-=]+)\.html/i,"player.youku.com/embed/$1").replace(/v\.qq\.com\/x\/cover\/[\w]+\/([\w]+)\.html/i,"v.qq.com/iframe/player.html?vid=$1&tiny=0&auto=0").replace(/v\.qq\.com\/x\/page\/([\w]+)\.html/i,"v.qq.com/iframe/player.html?vid=$1&tiny=0&auto=0").replace(/www\.bilibili\.com\/video\/([a-zA-Z0-9]+)\/?.*$/i,"player.bilibili.com/player.html?bvid=$1"):""}function i(a){for(var b,c=0;b=a[c++];){var d=b.value;if(!j(d)&&d)return alert(lang.numError),b.value="",b.focus(),!1}return!0}function j(a){return/(0|^[1-9]\d*$)/.test(a)}function k(a){for(var b,c=0;b=a[c++];){var d=$G(b),e={none:lang["default"],left:lang.floatLeft,right:lang.floatRight,center:lang.block};for(var f in e){var g=document.createElement("div");g.setAttribute("name",f),"none"==f&&(g.className="focus"),g.style.cssText="background:url(images/"+f+"_focus.jpg);",g.setAttribute("title",e[f]),d.appendChild(g)}l(b)}}function l(a){for(var b,c=$G(a).children,d=0;b=c[d++];)domUtils.on(b,"click",function(){for(var a,b=0;a=c[b++];)a.className="",a.removeAttribute&&a.removeAttribute("class");this.className="focus"})}function m(a){browser.ie?a.onpropertychange=function(){n(this.value)}:a.addEventListener("input",function(){n(this.value)},!1)}function n(a){if(a){var b=h(a);b=utils.unhtml(b),$G("preview").innerHTML='<div class="previewMsg"><span>'+lang.urlError+'</span></div><iframe class="previewVideo"  src="'+b+'" width="420" height="280" frameborder=0 allowfullscreen></iframe>'}}function o(){var a=[],b=editor.getOpt("videoUrlPrefix"),c=$G("upload_width").value||420,d=$G("upload_height").value||280,e=g("upload_alignment","name")||"none";for(var f in s){var h=s[f];a.push({url:b+h.url,width:c,height:d,align:e})}var i=r.getQueueCount();return i?($(".info","#queueList").html('<span style="color:red;">'+"还有2个未上传文件".replace(/[\d]/,i)+"</span>"),!1):void editor.execCommand("insertvideo",a,"upload")}function p(){r=new q("queueList")}function q(a){this.$wrap=a.constructor==String?$("#"+a):$(a),this.init()}var r,s=[],t=!1,u={};window.onload=function(){u=editor.getOpt("videoConfig"),$focus($G("videoUrl")),a(),b(),p()},q.prototype={init:function(){this.fileList=[],this.initContainer(),this.initUploader()},initContainer:function(){this.$queue=this.$wrap.find(".filelist")},initUploader:function(){function a(a){var b=h('<li id="'+a.id+'"><p class="title">'+a.name+'</p><p class="imgWrap"></p><p class="progress"><span></span></p></li>'),c=h('<div class="file-panel"><span class="cancel">'+lang.uploadDelete+'</span><span class="rotateRight">'+lang.uploadTurnRight+'</span><span class="rotateLeft">'+lang.uploadTurnLeft+"</span></div>").appendTo(b),d=b.find("p.progress span"),e=b.find("p.imgWrap"),g=h('<p class="error"></p>').hide().appendTo(b),i=function(a){switch(a){case"exceed_size":text=lang.errorExceedSize;break;case"interrupt":text=lang.errorInterrupt;break;case"http":text=lang.errorHttp;break;case"not_allow_type":text=lang.errorFileType;break;default:text=lang.errorUploadRetry}g.text(text).show()};"invalid"===a.getStatus()?i(a.statusText):(e.text(lang.uploadPreview),"|png|jpg|jpeg|bmp|gif|".indexOf("|"+a.ext.toLowerCase()+"|")==-1?e.empty().addClass("notimage").append('<i class="file-preview file-type-'+a.ext.toLowerCase()+'"></i><span class="file-title">'+a.name+"</span>"):browser.ie&&browser.version<=7?e.text(lang.uploadNoPreview):f.makeThumb(a,function(a,b){if(a||!b||/^data:/.test(b)&&browser.ie&&browser.version<=7)e.text(lang.uploadNoPreview);else{var c=h('<img src="'+b+'">');e.empty().append(c),c.on("error",function(){e.text(lang.uploadNoPreview)})}},u,v),x[a.id]=[a.size,0],a.rotation=0,a.ext&&B.indexOf(a.ext.toLowerCase())!=-1||(i("not_allow_type"),f.removeFile(a))),a.on("statuschange",function(e,f){"progress"===f?d.hide().width(0):"queued"===f&&(b.off("mouseenter mouseleave"),c.remove()),"error"===e||"invalid"===e?(i(a.statusText),x[a.id][1]=1):"interrupt"===e?i("interrupt"):"queued"===e?x[a.id][1]=0:"progress"===e&&(g.hide(),d.css("display","block")),b.removeClass("state-"+f).addClass("state-"+e)}),b.on("mouseenter",function(){c.stop().animate({height:30})}),b.on("mouseleave",function(){c.stop().animate({height:0})}),c.on("click","span",function(){var b,c=h(this).index();switch(c){case 0:return void f.removeFile(a);case 1:a.rotation+=90;break;case 2:a.rotation-=90}y?(b="rotate("+a.rotation+"deg)",e.css({"-webkit-transform":b,"-mos-transform":b,"-o-transform":b,transform:b})):e.css("filter","progid:DXImageTransform.Microsoft.BasicImage(rotation="+~~(a.rotation/90%4+4)%4+")")}),b.insertBefore(n)}function b(a){var b=h("#"+a.id);delete x[a.id],c(),b.off().find(".file-panel").off().end().remove()}function c(){var a,b=0,c=0,d=p.children();h.each(x,function(a,d){c+=d[0],b+=d[0]*d[1]}),a=c?b/c:0,d.eq(0).text(Math.round(100*a)+"%"),d.eq(1).css("width",Math.round(100*a)+"%"),e()}function d(a,b){if(a!=w){var c=f.getStats();switch(m.removeClass("state-"+w),m.addClass("state-"+a),a){case"pedding":j.addClass("element-invisible"),k.addClass("element-invisible"),o.removeClass("element-invisible"),p.hide(),l.hide(),f.refresh();break;case"ready":o.addClass("element-invisible"),j.removeClass("element-invisible"),k.removeClass("element-invisible"),p.hide(),l.show(),m.text(lang.uploadStart),f.refresh();break;case"uploading":p.show(),l.hide(),m.text(lang.uploadPause);break;case"paused":p.show(),l.hide(),m.text(lang.uploadContinue);break;case"confirm":if(p.show(),l.hide(),m.text(lang.uploadStart),c=f.getStats(),c.successNum&&!c.uploadFailNum)return void d("finish");break;case"finish":p.hide(),l.show(),c.uploadFailNum?m.text(lang.uploadRetry):m.text(lang.uploadStart)}w=a,e()}g.getQueueCount()?m.removeClass("disabled"):m.addClass("disabled")}function e(){var a,b="";"ready"===w?b=lang.updateStatusReady.replace("_",q).replace("_KB",WebUploader.formatSize(r)):"confirm"===w?(a=f.getStats(),a.uploadFailNum&&(b=lang.updateStatusConfirm.replace("_",a.successNum).replace("_",a.successNum))):(a=f.getStats(),b=lang.updateStatusFinish.replace("_",q).replace("_KB",WebUploader.formatSize(r)).replace("_",a.successNum),a.uploadFailNum&&(b+=lang.updateStatusError.replace("_",a.uploadFailNum))),l.html(b)}var f,g=this,h=jQuery,i=g.$wrap,j=i.find(".filelist"),k=i.find(".statusBar"),l=k.find(".info"),m=i.find(".uploadBtn"),n=(i.find(".filePickerBtn"),i.find(".filePickerBlock")),o=i.find(".placeholder"),p=k.find(".progress").hide(),q=0,r=0,t=window.devicePixelRatio||1,u=113*t,v=113*t,w="",x={},y=function(){var a=document.createElement("p").style,b="transition"in a||"WebkitTransition"in a||"MozTransition"in a||"msTransition"in a||"OTransition"in a;return a=null,b}(),z=editor.getActionUrl(editor.getOpt("videoActionName")),A=editor.getOpt("videoMaxSize"),B=(editor.getOpt("videoAllowFiles")||[]).join("").replace(/\./g,",").replace(/^[,]/,"");return WebUploader.Uploader.support()?editor.getOpt("videoActionName")?(f=g.uploader=WebUploader.create({pick:{id:"#filePickerReady",label:lang.uploadSelectFile},swf:"../../third-party/webuploader/Uploader.swf",server:z,fileVal:editor.getOpt("videoFieldName"),duplicate:!0,fileSingleSizeLimit:A,compress:!1}),f.addButton({id:"#filePickerBlock"}),f.addButton({id:"#filePickerBtn",label:lang.uploadAddFile}),d("pedding"),f.on("fileQueued",function(b){q++,r+=b.size,1===q&&(o.addClass("element-invisible"),k.show()),a(b)}),f.on("fileDequeued",function(a){q--,r-=a.size,b(a),c()}),f.on("filesQueued",function(a){f.isInProgress()||"pedding"!=w&&"finish"!=w&&"confirm"!=w&&"ready"!=w||d("ready"),c()}),f.on("all",function(a,b){switch(a){case"uploadFinished":d("confirm",b);break;case"startUpload":var c=utils.serializeParam(editor.queryCommandValue("serverparam"))||"",e=utils.formatUrl(z+(z.indexOf("?")==-1?"?":"&")+"encode=utf-8&"+c);f.option("server",e),d("uploading",b);break;case"stopUpload":d("paused",b)}}),f.on("uploadBeforeSend",function(a,b,c){z.toLowerCase().indexOf("jsp")!=-1&&(c.X_Requested_With="XMLHttpRequest")}),f.on("uploadProgress",function(a,b){var d=h("#"+a.id),e=d.find(".progress span");e.css("width",100*b+"%"),x[a.id][1]=b,c()}),f.on("uploadSuccess",function(a,b){var c=h("#"+a.id);try{var d=b._raw||b,e=utils.str2json(d);"SUCCESS"==e.state?(s.push({url:e.url,type:e.type,original:e.original}),c.append('<span class="success"></span>'),editor.fireEvent("uploadsuccess",{res:e,type:"video"})):c.find(".error").text(e.state).show()}catch(f){c.find(".error").text(lang.errorServerUpload).show()}}),f.on("uploadError",function(a,b){}),f.on("error",function(b,c){"Q_TYPE_DENIED"!=b&&"F_EXCEED_SIZE"!=b||a(c)}),f.on("uploadComplete",function(a,b){}),m.on("click",function(){return!h(this).hasClass("disabled")&&void("ready"===w?f.upload():"paused"===w?f.upload():"uploading"===w&&f.stop())}),m.addClass("state-"+w),void c()):void h("#filePickerReady").after(h("<div>").html(lang.errorLoadConfig)).hide():void h("#filePickerReady").after(h("<div>").html(lang.errorNotSupport)).hide()},getQueueCount:function(){var a,b,c,d=0,e=this.uploader.getFiles();for(b=0;a=e[b++];)c=a.getStatus(),"queued"!=c&&"uploading"!=c&&"progress"!=c||d++;return d},refresh:function(){this.uploader.refresh()}}}();