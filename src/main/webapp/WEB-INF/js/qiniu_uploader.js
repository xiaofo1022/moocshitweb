/**
 * Qiniu Uploader
 */

function getUploader(tokenUrl) {
	return Qiniu.uploader({
	    runtimes: 'html5,flash,html4',    //上传模式,依次退化
	    browse_button: 'pickfiles',       //上传选择的点选按钮，**必需**
	    uptoken: 'h9PCmkHaG7bpIbhnpDBYeGxFzI8d29Ii_ZnAsldy:HBS33nAf5kYb9CHjrmYuH0DsfvE=:eyJzY29wZSI6Im1vb2NzaGl0IiwiZGVhZGxpbmUiOjE0NTY3MTc1ODN9',
	    domain: 'http://qiniu-plupload.qiniudn.com/',
	    container: 'container',           //上传区域DOM ID，默认是browser_button的父元素，
	    max_file_size: '2048mb',          //最大文件体积限制
	    max_retries: 3,                   //上传失败最大重试次数
	    dragdrop: true,                   //开启可拖曳上传
	    drop_element: 'container',        //拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
	    chunk_size: '4mb',                //分块上传时，每片的体积
	    auto_start: true,                 //选择文件后自动上传，若关闭需要自己绑定事件触发上传
	    init: {
	        'FilesAdded': function(up, files) {
	            plupload.each(files, function(file) {
	                // 文件添加进队列后,处理相关的事情
	            });
	        },
	        'BeforeUpload': function(up, file) {
	            // 每个文件上传前,处理相关的事情
	        },
	        'UploadProgress': function(up, file) {
	            // 每个文件上传时,处理相关的事情
	        	console.log(up);
	        },
	        'FileUploaded': function(up, file, info) {
	           // 每个文件上传成功后,处理相关的事情
	           // 其中 info 是文件上传成功后，服务端返回的json，形式如
	           // {
	           //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
	           //    "key": "gogopher.jpg"
	           // }
	            var domain = up.getOption('domain');
	            var res = jQuery.parseJSON(info);
	            var sourceLink = domain + res.key;
	        },
	        'Error': function(up, err, errTip) {
	            //上传出错时,处理相关的事情
	        	console.log(errTip);
	        },
	        'UploadComplete': function() {
	            //队列文件处理完毕后,处理相关的事情
	        },
	        'Key': function(up, file) {
	            // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
	            // 该配置必须要在 unique_names: false , save_key: false 时才生效
	            var key = "";
	            // do something with key here
	            return key
	        }
	    }
	});
}
