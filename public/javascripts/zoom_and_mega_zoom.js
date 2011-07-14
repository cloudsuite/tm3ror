
/*
 * MACRO MODEL ZOOM AND MEGAZOOM
 * */
function showZoom(url,title)
{
	$('select, #player').css('visibility','hidden');//hide videoplayer and select for IE bug

	$("#megaZoom").hide();
	
	//$('#zoomBoxImg').attr("src",url);
	$('#zoomBox').empty();
	var img = new Image();
	$(img)
	    // once the image has loaded, execute this code
	    .load(function () {
	      // set the image hidden by default
	      //$(this).hide();
		  $('#zoomBox').empty();
	      $('#zoomBox').append(this);
	      // fade our image in to create a nice effect
	      //$(this).fadeIn();

	      if( $(window).width() > $(window).height() )
	      {
	    	  this.width=this.height=$(window).height();
	      }
	      else
	      {
	    	  this.width=this.height=$(window).width();
	      }
	      $('#zoomBox').css('z-index','101' );
	    });

	    // *finally*, set the src attribute of the new image to our image
	$(img).attr('src', url);


	$('#zoomBox').css('height',$(window).height()+"px");
	$('#zoomBox').css('width',$(window).width()+"px" );
	$('#zoomBox').css('z-index','101' );
	
	if(url.indexOf('_black.jpg')!=-1)
	{
		$('#zoomBox').css('background','#000000');
	}
	else
	{
		$('#zoomBox').css('background','#FFFFFF');
	}
	

	$(window).bind("resize", function(){
		$("#zoomBox").ezBgResize();
		$('#zoomBox').css('z-index','101' );
	});

	$("#zoomBox, #closeZoom_wrapper").appendTo('body').show();
	
	showNavigationBox();
	
	showTitleBox(title);
	
	//
	// omniture event 
	//
	
}

function showTitleBox(title)
{
	if ( $("#title_box_zoom").length < 1 ) 
	{		
		$("<div id='title_box_zoom'></div>").appendTo("body");		
	
		$("#title_box_zoom").css('position', 'absolute');
		$("#title_box_zoom").css('z-index', '20001');
		$("#title_box_zoom").css('top', '22px');
		$("#title_box_zoom").css('left', '22px');
		$("#title_box_zoom").css('padding-left', '12px');
		$("#title_box_zoom").css('padding-right', '12px');
		$("#title_box_zoom").css('height', '40px');
		$("#title_box_zoom").css('background-color', '#ffffff');
		
		//Add text:
		$("<p id='title_text' class='helvetica'>"+title+"</p>").appendTo("#title_box_zoom");		
	
		Cufon.refresh('.helvetica');

		
	}
	else
	{
		//change text:
		$("#title_box_zoom #title_text").html(title);	
		Cufon.refresh('.helvetica');
	}
	
	$("#title_box_zoom").show();
}


function showNavigationBox()
{
	if ( $("#navigation_box_zoom").length < 1 ) 
	{		
		$("<div id='navigation_box_zoom'></div>").appendTo("body");
		
		$("#navigation_box").clone().appendTo("#navigation_box_zoom");
	
		$("#navigation_box_zoom").css('position', 'absolute');
		$("#navigation_box_zoom").css('z-index', '20000');
		$("#navigation_box_zoom").css('bottom', '60px');
		$("#navigation_box_zoom").css('left', '30px');
		$("#navigation_box_zoom").css('background-color', '#ffffff');
		
		
		$('#navigation_box_zoom .feature-image').mousemove(function(e){
			$("#altpopdisplayer").show();
			
			posX = e.pageX +15;
			posY = e.pageY ;
			if(posX > 800){posX=posX-270;}

		
			$("#altpopdisplayer").css({
				top: (posY) + "px",
				left: (posX) + "px"
			});
		});
		
		//mouse move in product page for technologies
		$("#navigation_box_zoom .feature-image").mouseout(function(e){
			$("#altpopdisplayer").hide();
		});
		
		createChangeColor();	
		createChangeView();
		createShowTechnologie();
	}
	
	$("#navigation_box_zoom").show();
}

function createShowTechnologie()
{
	$('#navigation_box_zoom a.feature-image').click(function() 
	{
		showZoom(this.href, $(this).find('img').attr('alt'));
		return false;
	});
	
	$('#navigation_box_zoom a.feature-image-notooltip').click(function() 
	{
		showZoom(this.href, $(this).find('img').attr('alt'));
		return false;
	});

}

function createChangeView()
{
			$('#navigation_box_zoom a.button_view').click(function() {
				$(this).parent().children().removeClass('button-view-active button-view-rear-active button-view-front-active');
			});			
			
			$('#navigation_box_zoom a.button-view-front').click(function() {
				//Get article/color of active image
				
				$('#product a.button-view-front').click();
				$(this).addClass('button-view-active button-view-front-active');
				var $visibleSrc = $('#product img.visuel:visible').attr("src");
				var $visibleTitle = $('#product img.visuel:visible').attr("alt");
	
				showZoom($visibleSrc.replace('normal', 'zoom'),$visibleTitle);	
			});
			
			$('#navigation_box_zoom a.button-view-rear').click(function() {
			
				$('#product a.button-view-rear').click();
			
				$(this).addClass('button-view-active button-view-rear-active');
				var $visibleSrc = $('#product img.visuel:visible').attr("src");
				var $visibleTitle = $('#product img.visuel:visible').attr("alt");
	
				showZoom($visibleSrc.replace('normal', 'zoom'),$visibleTitle);	
		});
}

function createChangeColor()
{
		$('#navigation_box_zoom #change_color a').click(function() {
				//change opacity for others
				$('#navigation_box_zoom .change-color').css('opacity','1');
				$(this).css('opacity','0.3');				
				
		//		$('#change_view a.button_view').show();//Link to change view available
				var articleId = $(this).children(":first").attr("name");
				var articleName =  $(this).attr("name");
				var articleAlt =  $(this).find("img").attr("alt");
				
				$('#product .change-color[name="'+ articleName +'"]').click();
				
						
				$('#zoom').attr("href", $('#product img.visuel-'+articleId).attr("href"));		
				
				$color_href = $("#zoom").attr("href");

				showZoom($color_href.replace('normal', 'zoom'),articleAlt);

				return false;
			});
}




function hideZoom()
{
	$("#zoomBox, #closeZoom_wrapper").hide();
	$('select, #player').css('visibility','visible');//hide videoplayer and select for IE bug
	$("#navigation_box_zoom").hide();
	$("#title_box_zoom").hide();
}

function showMegaZoom()
{
	$("#megaZoom").unbind("mousemove").mousemove(function(e){
		var divWidth = $(window).width();
		var divHeight = $(window).height();
		var igW = $("#megaZoom").width();
		var igH = $("#megaZoom").height();
		var leftPan = (e.pageX ) * (divWidth - igW) / (divWidth);
		var topPan = (e.pageY ) * (divHeight - igH) / (divHeight);

		$("#megaZoom").css({left: leftPan, top: topPan});
	});

	$('#megaZoomImg').attr("src", $('#zoomBox img').attr('src').replace('zoom','megazoom'));

	
	if($('#megaZoomImg').attr("src").indexOf('_black.jpg')!=-1)
	{
		$('#megaZoom').css('background','#000000');
	}
	else
	{
		$('#megaZoom').css('background','#FFFFFF');
	}
	
	$("#megaZoom, #closeZoom_wrapper").appendTo('body').show();
}

function hideMegaZoom()
{
	$("#megaZoom").hide();
}