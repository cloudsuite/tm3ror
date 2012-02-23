

if(language != 'ja') {
	Cufon.replace('.helvetica');
}

// ————— Background Resize ——————————————————————————————————————————

$(window).bind("resize", function(){
	$("#body-background").ezBgResize();
	checkSize();
});

// ————— on document ready —————————————————————————————————————————————

$(document).ready(function() {
	
	// —————  reducing size of text on ? cut.  ————————————————————
	checkSize();
	//curtail encarts content text if needed
	$('.link .text .content').each(function(){
		if (40 < $(this).height() ){
			var deja = false;
			var ett = $(this).text();
			var et = ett.split(" ");
			var ettl = ett.length;
			while(40 < $(this).height() ){
				var ettp = 3;
				if (language != 'ja'){
					ettp = et.pop().length;
				} 
				if (deja == true){
					ettp += 4;
				}
				ettl -= ettp;
				var nett = ett.substr(0, ettl) + "...";
				$(this).text(nett);
				deja = true;
			}
		}
	});	
	//$('a.filters').css({"border":"5px solid red"});
	
	// ————— ezmark replace checkboxes —————————————
	$('input[type="checkbox"]').ezMark();
	$('input[type="radio"]').ezMark();
	
	// ————— activing current nearest separators ——————————
	if( $('#menu a.current').length > 0 ){
		$('#menu a.current').next('.menu_separator').addClass('current');
		//can be a submenu, need another step
		if( $('#menu a.current').prev('.menu_separator').length > 0 ) $('#menu a.current').prev('.menu_separator').addClass('current');
		else $('#menu a.current').prev('.submenu').prev('.menu_separator').addClass('current');
	}

	// —————  mouseenter/mouseleave on menu items  —————————————————————————
	$('#menu .menu_main > a').mouseenter(function(){
		//removing other active links
		$(this).siblings('.active').removeClass('active');

		//hidding other submenu
		$('.submenu:not(#sub'+$(this).attr('id')+')').css('display','none');

		//activing the link
		$(this).addClass('active');

		//activing the nearest separators
		var previous_separator = $(this).prev('.menu_separator');
		//can be a submenu, need another step
		if( $(this).prev('.menu_separator').length > 0 ) $(this).prev('.menu_separator').addClass('active');
		else $(this).prev('.submenu').prev('.menu_separator').addClass('active');

		$(this).next('.menu_separator').addClass('active');

		//showing overlay
		if($('#black_screen').css('display') == 'none')
		{
			if(onHomePage){
				$('#black_screen').css('width', $('#container').width())
					.css('height', $('#container').height());
			}

			$('#black_screen')
				.css('opacity', '0.5')
				.fadeIn(200)
				.unbind('mouseover').mouseover(function(){getOutOfMenu();}); //emulate link "mouseleave"
		}
		$('#black_screen').css('display', 'block');

		//showing submenu
		$('#sub'+$(this).attr('id')).css('display','block').css('top', $(this).position().top);

		//hidding select for ie
		if ($.browser.msie && $.browser.version.substr(0,1)<7)
		{
			$('select').css('visibility','hidden');
		}
	});
	
	$('#menu .menu_separator').mouseenter(function(){
		removeActiveMenu();
	});

	//mousemove behavior
	$("#altpopdisplayer").appendTo('body');
	$('#content_gamme_items').mousemove(function(e){
		if((e.currentTarget.id!=e.target.id)&&(e.target.id!='associated_products')){
			$("#altpopdisplayer").show();

			posX = e.pageX +15;
			posY = e.pageY -$("#altpopdisplayer").height()-30;
			if(posX > 800){posX=posX-270;}

			$("#altpopdisplayer").css({
				top: (posY) + "px",
				left: (posX) + "px"
			});
		}
	});
	
	//same behavior 
	$('#filters_content').mousemove(function(e){

	    $("#altpopdisplayer").show();

	    posX = e.pageX +15;
	    posY = e.pageY ;
	    if(posX > 800){posX=posX-270;}

	    $("#altpopdisplayer").css({
	        top: (posY) + "px",
	        left: (posX) + "px"
	    });
	});
			
			
	//same behavior 
	$('.feature-image').mousemove(function(e){
	    $("#altpopdisplayer").show();
		
	    posX = e.pageX +15;
	    posY = e.pageY ;
	    if(posX > 800){posX=posX-270;}

	
	    $("#altpopdisplayer").css({
	        top: (posY) + "px",
	        left: (posX) + "px"
	    });
	});
	
	//mouse move in product page for associated
	$("#associated_products").mouseout(function(e){
		$("#altpopdisplayer").hide();
	});
	
	//mouse move in product page for technologies
	$(".feature-image").mouseout(function(e){
		$("#altpopdisplayer").hide();
	});

	//search behavior
	if( $('#search_input').length > 0 ){
		$('#search_hint').click(function(){
			$('#search_form .submit').show(); //show ok button
			$(this).hide().next().show().focus(); //hide the hint and show the input and give it focus
		});

		//input leaving
		$('#search_input').blur(function(){
			if( $(this).val() == '' ){
				$('#search_form .submit').hide(); //hide ok button
				$(this).hide().prev().show(); //hide the input and show the hint
			}
		});
	}

	//download list background
	if( $('.download_content').length > 0 ){
		$('.download_content:odd').addClass('odd');
	}
	if( $('.archive_button').length > 0 ){
		$('.archive_button .button_view').click(function(e){
			e.preventDefault;
			$(this).parent().hide().next('.archive_files').fadeIn();
		});
	}

	var closeSelect =  function(){ $('.selectMavicSkin,#list_select,#list_select_langue,#list_select_radius').css({display:'none'});}
	//fixe top google search autocompletion 
	$(document).bind('DOMNodeInserted', function(evt){
		if(evt.target.nodeName == "TABLE"){sgtop();}
	});
	var sgtop = function(){		
		if($('input').hasClass('scroll_autocomplete')){
			var thistop = $('.scroll_autocomplete').offset().top + 24;
			$('.gsc-completion-container').css({top:thistop});
		}
	}
	$('#search_input, #edit-keys').bind('focus blur', function(){$(this).toggleClass('scroll_autocomplete')});
	$('#body').click(closeSelect);
	$('#container').scroll(closeSelect).scroll(sgtop);

});


// ———— linking and scrolling for news in menu —————————————————————————————————————

$(function() {
	$(".scrollable")
	.css('cursor','pointer')
	.click(function() {
        window.location = $('.views-row-1 .link').attr('href');
    })
	.scrollable(
			{
				onSeek: function(){
					i=this.getIndex();
					i++;

					$('#menu_news_more').attr('href',$('.views-row-'+i+' .link').attr("href"));
					$(".scrollable").click(function() {
						window.location = $('.views-row-'+i+' .link').attr('href');
					});
				}
		}
	);
	$('#menu_news_more').attr('href',$('.views-row-1 .link').attr("href"));
});

var onHomePage=false;//this variable is set to true if we are on the home page


// ———— checkSize (used in moving right_content to left if screen is wide enough?  ) ———————————————————

function checkSize( )
{

	$('#container').css("height", ($(window).height()-$('#footer').height())+"px");

	if( $(window).width() <  1270 || onHomePage )
	{
		$('#right_content').detach().appendTo("#menu").addClass("small_size");
	}
	else
	{
		$('#right_content').detach().appendTo("#right_content_container").removeClass("small_size");
	}

	var marge=47;
	if ($.browser.msie && $.browser.version.substr(0,1)<=7){marge=50;}
	$('#black_screen').css('height', Math.max($('#container').height(),$('#subcontainer').height()+marge) )
		.css('width', $('#container').width());
	
	
	positionLogo();
	
	checkContentHeight();
}

// ———— force the height of content in case of short pages ——————————————————————————————

function checkContentHeight(){
	$('#main_content').height('auto');
	h_main = $('#main_content').height();
	h_min = $('#container').height() - parseInt($('#subcontainer').css('padding-bottom').replace(/px/,'')) - parseInt($('#subcontainer').css('margin-top').replace(/px/,''));
	$('#main_content').css('min-height', h_min);
	if (h_min > h_main) {
		$('#main_content').css('height', h_min); // for IE6
	}
	
}

//———— reposition the logo according to scrollbar for content ——————————————————————

function positionLogo() //reposition the logo according to scrollbar for content
{
	if( $(window).width() <  1270) {
		$('#logo_container').css('left', '15px');
		$('#logo_container').css('top', '655px');
		$('#logo_container').css('bottom', 'auto');
		if($('#productCompareContainer').css('display')=='block'){//do not display logo over productcompare screen
			$('#player, #logo_container').css('display','none');
		}
		
	} else {
		$('#logo_container').css('left', ($('#container').get(0).clientWidth - 168)+'px');
		$('#logo_container').css('bottom', '59px');
		$('#logo_container').css('top', 'auto');
	}
}

//———— if mouse over <what>  —————————————————————————————————————————————————————————

var curOverItem=0;
function overItem(index)
{
	if(typeof(itemtimer)!='undefined')clearTimeout(itemtimer[index]);
	outItem(curOverItem);
	$('#compare'+index).css('display', 'block');
	$('#hidder'+index).css('opacity', '0');
	$('#item'+index).addClass('active');
	overImage(index);
	curOverItem = index;
}

function overImage(index)
{
	$('.altpop').css('display', 'none');
	$('.altpop').css('opacity', '1');
	$("div").clearQueue();
	$('#altpop'+index).appendTo('#altpopdisplayer');
	if(curOverItem==index){$('#altpop'+index).css('display','block');}
	else{$('#altpop'+index).delay(200).fadeIn(200);}
	$('#altpopdisplayer').css('height', $('#altpop'+index).height()+'px');
}

function outItem(index)
{
	$("#altpop"+index).clearQueue();
	i = $.inArray(index, productCompare);

	if( i ==-1 )
	{
		$('#compare'+index).css('display', 'none');
		$('#hidder'+index).css('opacity', 1-$('#productImg'+index).css('opacity'));
		$('#item'+index).removeClass('active');
	}
	$('#altpop'+index).css('display', 'none');
}

//———— if mouse over <tab>   ——————————————————————————

function overTab(elem)
{
   $(elem).addClass('tabover');
}

function outTab(elem)
{
   $(elem).removeClass('tabover');
}

function createTabsAction()
{
	$('#tabs_buttons .tab').each(
		function()
		{
			$(this).click(function()
			{
				$('#tabs_buttons .tab').each( function()
				{
					$(this).removeClass('active');
				});
				$(this).addClass('active');
				displayTabs();
				switch($(this).attr('id')) {
					case "technologies" :
						omniture_click(this, "Technologies tab");
					break;
					case "features" :
						omniture_click(this, "Features tab");
					break;
					case "relatednews" :
						omniture_click(this, "related news tab");
					break;
					case "shopfinder" :
						omniture_click(this, "Dealers tab");
					break;
					case "downloads" :
						omniture_click(this, "Manuals tab");
					break;
				}
			});
		}
	);
}

function displayTabs()
{
	$('.tab_content').each(
		function()
		{
			$(this).css('display','none');
		}
	);
	$('#tabs_buttons .tab').each(
		function()
		{
			if( $(this).hasClass('active') )
			{
				id_tab_to_show ='#'+$(this).attr('id')+'_content';
				$( id_tab_to_show ).css('display','block');
			}
		}
	);
	checkContentHeight();
}

// ————— Menu-related ————————————————————————————————————————————————————

function getOutOfMenu()
{
	$('#black_screen').css('display','none');
	if ($.browser.msie && $.browser.version.substr(0,1)<7)
	{
		$('select').css('visibility','visible');
	}

	removeActiveMenu();
}

/*
function display_submenu(id)
{
	removeActiveMenu();

	$('#menu_'+id).addClass("active");

	if($('#black_screen').css('display') == 'none')
	{
		if(onHomePage){
			$('#black_screen').css('width', $('#container').width());
			$('#black_screen').css('height', $('#container').height());
		}

		$('#black_screen').css('opacity','0.5');
		$('#black_screen').fadeIn(200);

	}

	$('#submenu_'+id).css('display','block').css('top',$('#menu_'+id).position().top);

//	$('#submenu_'+id).delay(300).fadeIn(300);

	if ($.browser.msie && $.browser.version.substr(0,1)<7)
	{
		$('select').css('visibility','hidden');
	}

	$('#black_screen').mouseover(function(){getOutOfMenu();});
}
*/

function hideSubmenu()
{
	$('.submenu').css('display','none');
}

function removeActiveMenu()
{
	$('#menu .active').removeClass('active');

	hideSubmenu();
}

// ———— select in breadcrumb ——————————————————————————————————————————————————

function show_hide_select(id)
{
	$(id).slideFadeToggle(250,'easeOutCubic');
}

// ————filters behavior —————————————————————————————————————————————————————

function show_hide_filters()
{
	$('#filters_content').slideFadeToggle(500,'easeOutCubic');
}
jQuery.fn.slideFadeToggle = function(speed, easing, callback) {
  return this.animate({opacity: 'toggle', height: 'toggle'}, speed, easing, callback);
};



//check for every macromodel if it fits on or several filter set
var filters_list = new Array();

function highlightMacroModels()
{

	$('.product_image').each(
			function(){ $(this).css('opacity','0.3'); }
	)
	$('.hidder').each(
			function(){ $(this).css('opacity','0.7'); }
	)

	for(j in macromodels) //each macromodel
	{
		highlightMM = true;

		for( i in filters_list )
		{
			if( !isSelectedByFilterList( macromodels[j], i ) )
			{
				highlightMM = false;
			}
		}

		if(highlightMM)
		{
			$('#hidder'+j).css('opacity','0');
			$('#productImg'+j).css('opacity','1');
		}

		//selected to compare keep opactiy 1 for name
		h = $.inArray(j+'', productCompare);
		if( h != -1)
		{
			$('#hidder'+j).css('opacity','0');
		}
	}

	$('.altpop').each(
			function(){ $(this).css('z-index','3'); }
	)

}

function isSelectedByFilterList(macromodel, flId )
{

	ret = false;
	oneFilterSet = false;

	for(i in filters_list[flId][0])//each filter
	{
		if( filters_list[flId][0][i]  == true )//filter checked
		{
			oneFilterSet = true;
			if( macromodel[ i ] == true )
			{
				ret = true;
			}
		}
	}
	if(oneFilterSet)	return ret;
	else return true;
}


//check or uncheck a button
function checkUncheckButtons(id, flId)
{
	//check or uncheck the filter
	if( filters_list[flId][0][id] )
	{
		filters_list[flId][0][id] = false;
		$('#imgFilter'+id).css('background-position','-11px' );
	}
	else
	{
		filters_list[flId][0][id] = true;
		$('#imgFilter'+id).css('background-position','0px' );
	}

	if( filters_list[flId][1] == 'radiobox') //uncheck all other buttons
	{
		for( var i in filters_list[flId][0] )
		{
			if(i!=id)
			{
				filters_list[flId][0][i] = false;
				$('#imgFilter'+i).css('background-position','-11px' );
			}
		}
	}
}





