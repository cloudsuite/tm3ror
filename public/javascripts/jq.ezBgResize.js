

/******************************************************
	* jQuery plug-in
	* Easy Background Image Resizer
	* Developed by J.P. Given (http://johnpatrickgiven.com)
	* Useage: anyone so long as credit is left alone
******************************************************/
(function($) {
	// plugin definition
	$.fn.ezBgResize = function(options) {
		// First position object
		this.css({position:(jQuery.browser.msie?"absolute":"fixed"),
		top:"0px",
		left:"0px",
		zIndex:"-1",
		overflow:"hidden"});
		
		// Set obj to the width and height of window
		var w=getWindowWidth(),h=getWindowHeight();
		this.css({width:w + "px",height: h + "px"});
		
		// Resize the img object to the proper ratio of the window.
		var childImg = this.children('img');
		var iw = childImg.width();
		var ih = childImg.height();
		var fRatio = ih/iw;				
		var newIh = Math.round(w * fRatio);
		if ((w > h) && (iw > ih) && (newIh >= h)) {
			childImg.css({width:w + "px",height:newIh + "px"});
		} else {
			fRatio = iw/ih;
			childImg.css({height:h +"px",width:Math.round(h * fRatio) +"px"});
		}
	};
	
	// private function for debugging
	function debug($obj) {
		if (window.console && window.console.log) {
			window.console.log('Window Width: ' + $(window).width());
			window.console.log('Window Height: ' + $(window).height());
		}
	};
	
	// Dependable function to get Window Height
	function getWindowHeight() {
		var windowHeight = 0;
		if (typeof(window.innerHeight) == 'number') {
			windowHeight = window.innerHeight;
		}
		else {
			if (document.documentElement && document.documentElement.clientHeight) {
				windowHeight = document.documentElement.clientHeight;
			}
			else {
				if (document.body && document.body.clientHeight) {
					windowHeight = document.body.clientHeight;
				}
			}
		}
		return windowHeight;
	};
	
	// Dependable function to get Window Width
	function getWindowWidth() {
		var windowWidth = 0;
		if (typeof(window.innerWidth) == 'number') {
			windowWidth = window.innerWidth;
		}
		else {
			if (document.documentElement && document.documentElement.clientWidth) {
				windowWidth = document.documentElement.clientWidth;
			}
			else {
				if (document.body && document.body.clientWidth) {
					windowWidth = document.body.clientWidth;
				}
			}
		}
		return windowWidth;
	};
})(jQuery);