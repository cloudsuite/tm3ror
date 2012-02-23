
/*****************************
HOMEPAGE FUNCTIONS
******************************/
function repositionDescription()
{
	var tmp;
	width = $('#img_'+slides[activeSlide]).width();
	switch(slides[activeSlide])
	{
		case 'wheel1':
			right = Math.floor(width-(width/3.8));
			$('#homedescription_wheel1').css({right:right+'px',left:''});

			break;
		case 'wheel2':
			right = Math.floor(width-(width/5));
			$('#homedescription_wheel2').css({right:right+'px',left:''});
			break;
		case 'pant':
			right = Math.floor(width-(width/5));
			$('#homedescription_pant').css({right:right+'px',left:''});
			break;
		case 'computer':
			left = Math.floor(width/2);
			$('#img_computer').css({marginLeft:-left+'px'});
			$('#homedescription_computer').css({left:'66%'});
			break;
		case 'pedal':
			left = Math.floor(width/2);
			$('#img_pedal').css({marginLeft:-left+'px'});
			$('#homedescription_pedal').css({left:'70%'});
			break;
		case 'footwear':
			left = Math.floor(width/2);
			$('#img_footwear').css({marginLeft:-left+'px'});
			$('#homedescription_footwear').css({left:'58%'});
			break;
		case 'apparel2011-1':
			right = Math.floor(width-(width/5));
			tmp=$('#homedescription_apparel2011-1').css({right:right+'px',left:''});
			$('h1 span.nextline canvas,h1 span.nextline cufoncanvas',tmp).css({top:'-9px'});	
			break;
		case 'apparel2011-2':
			left = Math.floor(width*.75)+$('#img_'+slides[activeSlide]).position().left;
			tmp=$('#homedescription_apparel2011-2').css({left:left+'px'});
			$('h1 span.nextline canvas,h1 span.nextline cufoncanvas',tmp).css({top:'-9px'});
			break;
		case 'roubaix':
			right = Math.floor(width-(width/6));
			$('#homedescription_roubaix').css({right:right+'px',left:''});
			break;
	}


	if($('#homedescription_'+slides[activeSlide]).length>0)
	{
		p=$('#homedescription_'+slides[activeSlide]).position().left;
		if(p< 250)
		{
			$('#homedescription_'+slides[activeSlide]).css('left','250px');
		}
	}
}


function homeShowSlide(id)
{
	$("#homeslide_"+slides[oldSlide]).css('display','none');

	oldSlide = activeSlide;
	activeSlide = id;
	$("#homeslide_"+slides[oldSlide]).stop(true,true);

	$("#homeslide_"+slides[id]).appendTo('#container');
	$("#homeslide_"+slides[id]).css('opacity','0');
	$("#homeslide_"+slides[id]).css('left','100px');
	$("#homeslide_"+slides[id]).css('display','block');


	$("#homeslide_"+slides[id]).animate({
				opacity: 1,
				left: '0'
			},500,'easeOutCubic');


	$("#homeslide_"+slides[id]).ezBgResize();
	repositionDescription();
	homeCheckSize();
	$("#homeslide_"+slides[id]).css('z-index','2');
	$('.homebutton').css('background','orange'); /*FFE%00 */
	$("#homebutton_"+id).css('background', $("#homedescription_"+slides[id]).css('color'));



}

function homeCheckSize()
{
	$("#homeslide_"+slides[activeSlide]).ezBgResize();


	//handle homeslide on homepage
	$(".homeslide").css('z-index','-1');
	$("#homeslide_"+slides[activeSlide]).css('z-index','2');

	if( $(window).height()<600  )
	{
		$("#container").css('height','600px');
	}
	else
	{
		$("#container").css('height',$(window).height()-$('#footer').height());
	}

	if( $(window).width()<1024  )
	{
		$("#container").css('width','1024px');
	}
	else
	{
		$("#container").css('width',$(window).width());
	}

}


function homeAutoDefil()
{
	nxt = activeSlide+1;
	if(nxt>7)nxt=0;
	homeShowSlide(nxt);
	homeTimer = setTimeout("homeAutoDefil()",6000);
}


/* Uncomment this code to be notified of playback errors in JavaScript:*/
function onMediaPlaybackError(playerId, code, message, detail)
{
	alert(playerId + "\n\n" + code + "\n" + message + "\n" + detail);
}

/*NEWS functions */
function showMoreNews( n )
{
	for(i=0;i<n;i++)$('#list_nextnews .news-preview:first').appendTo($('#list_morenews'));
//	$('#list_morenews').animate({height: '+=120'} , 500);
}

/* ************************
 *roll over red within sub menu mavic 
 */
function switch_menu_color_red (menu_id) {
	black = document.getElementById(menu_id);
	red = document.getElementById(menu_id+"_red");
	black.style.display = 'none';
	red.style.display = 'block';
}

function switch_menu_color_black (menu_id) {
	black = document.getElementById(menu_id);
	red = document.getElementById(menu_id+"_red");
	red.style.display = 'none';
	black.style.display = 'block';
}

function skinSelect(name){
	var obj= $("#"+name), first=obj.children('option').eq(0);
	obj.css({opacity: 0}).wrap('<div class="customselect-wrap"></div>').before('<div class="customselect-text">'+first.css({color:"#808080"}).html()+'</div>').change(function(){
		$(this).prev().html(this.options[this.selectedIndex].innerHTML).css({color:(this.selectedIndex==0)?"#808080":"#000"});
	}).keyup(function(){
		$(this).prev().html(this.options[this.selectedIndex].innerHTML).css({color:(this.selectedIndex==0)?"#808080":"#000"});
	}).focus(function(){
		$(this).prev().addClass("customselect-focus");
	}).blur(function(){
		$(this).prev().removeClass("customselect-focus");
	});
}

/* ************************
 *newsletter subscription pop-up
 */
 function popupnewslettersubscript(){
	 if ( $('#nlfirstvisit').length > 0){
		var footerheight = $('#footer').height() - 12;
		 var nlv = $('#nlfirstvisit').css({bottom:footerheight}).slideDown(2000).delay(7000).slideUp(2000);
		 };
	 }


