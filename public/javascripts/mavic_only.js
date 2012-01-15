
	/* Cross-browser dynamic CSS creation
		- Based on Bobby van der Sluis' solution: http://www.bobbyvandersluis.com/articles/dynamicCSS.php
	*/	
	function createCSS(sel, decl, media, newStyle) {
		if (ua.ie && ua.mac) { return; }
		var h = doc.getElementsByTagName("head")[0];
		if (!h) { return; } // to also support badly authored HTML pages that lack a head element
		var m = (media && typeof media == "string") ? media : "screen";
		if (newStyle) {
			dynamicStylesheet = null;
			dynamicStylesheetMedia = null;
		}
		if (!dynamicStylesheet || dynamicStylesheetMedia != m) { 
			// create dynamic stylesheet + get a global reference to it
			var s = createElement("style");
			s.setAttribute("type", "text/css");
			s.setAttribute("media", m);
			dynamicStylesheet = h.appendChild(s);
			if (ua.ie && ua.win && typeof doc.styleSheets != UNDEF && doc.styleSheets.length > 0) {
				dynamicStylesheet = doc.styleSheets[doc.styleSheets.length - 1];
			}
			dynamicStylesheetMedia = m;
		}
		// add style rule
		if (ua.ie && ua.win) {
			if (dynamicStylesheet && typeof dynamicStylesheet.addRule == OBJECT) {
				dynamicStylesheet.addRule(sel, decl);
			}
		}
		else {
			if (dynamicStylesheet && typeof doc.createTextNode != UNDEF) {
				dynamicStylesheet.appendChild(doc.createTextNode(sel + " {" + decl + "}"));
			}
		}
	}
	
	function setVisibility(id, isVisible) {
		if (!autoHideShow) { return; }
		var v = isVisible ? "visible" : "hidden";
		if (isDomLoaded && getElementById(id)) {
			getElementById(id).style.visibility = v;
		}
		else {
			createCSS("#" + id, "visibility:" + v);
		}
	}




$(window).bind("resize", function(){
	$("#body-background").ezBgResize();
	checkSize();
});

$(document).ready(function() {
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
	//ezmark replace checkboxes
	$('input[type="checkbox"]').ezMark();
	$('input[type="radio"]').ezMark();
	
	//activing current nearest separators
	if( $('#menu a.current').length > 0 ){
		$('#menu a.current').next('.menu_separator').addClass('current');
		//can be a submenu, need another step
		if( $('#menu a.current').prev('.menu_separator').length > 0 ) $('#menu a.current').prev('.menu_separator').addClass('current');
		else $('#menu a.current').prev('.submenu').prev('.menu_separator').addClass('current');
	}


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
//linking and scrolling for news in menu
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

//force la hauteur du contenu en cas de page courte
function checkContentHeight(){
	$('#main_content').height('auto');
	h_main = $('#main_content').height();
	h_min = $('#container').height() - parseInt($('#subcontainer').css('padding-bottom').replace(/px/,'')) - parseInt($('#subcontainer').css('margin-top').replace(/px/,''));
	$('#main_content').css('min-height', h_min);
	if (h_min > h_main) {
		$('#main_content').css('height', h_min); // for IE6
	}
	
	/*$('#main_content').height(function(index,value){
		if(isNaN(value)) return '';
		if(typeof shopfinderpage!='undefined' ) return '';//no check on shopfinder node page (node-shopfinder.tpl.php)
		var h = $('#container').height() - parseInt($('#subcontainer').css('padding-bottom').replace(/px/,'')) - parseInt($('#subcontainer').css('margin-top').replace(/px/,''));
		if( isNaN(h) )return '';
		if(h < 500 ) return '';
		if(value < h || $(this).hasClass('hforced')) {
			$('#main_content').addClass('hforced');
			return h;
		}
		return ''; //ne force rien, laisse la main a la feuille de style
	}); */
}

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

/*
 * select in breadcrumb
 *
 */
function show_hide_select(id)
{
	$(id).slideFadeToggle(250,'easeOutCubic');
}

/*
 * FILTERS BEHAVIOR
 *
 * */
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



/************************************************

PRODUCT COMPARE FUNCTIONS
**************************************************/
//used in node-family.tpl.php
var productCompare = new Array();

function storeToCompare(id)
{
	$('#product_compare_block').css('display','block');
	i = $.inArray(id, productCompare);
	if( i != -1 )
	{
		productCompare.splice(i,1);
		$('#imgCompare'+id).attr('src','/sites/default/themes/mavic/images/select_to_compare_off.gif');
	}
	else
	{
		productCompare.unshift( id );
		$('#imgCompare'+id).attr('src','/sites/default/themes/mavic/images/select_to_compare_on.gif');
	}

	while(productCompare.length > 3 )
	{
		index = productCompare[productCompare.length-1]
		$('#imgCompare'+index).attr('src','/sites/default/themes/mavic/images/select_to_compare_off.gif');
		productCompare.pop();
		outItem(index);
	}

	//update session
	$.cookie('product_compare_'+activeFamily, productCompare.join('-'), {path: '/', expires: 10 } );

	if( productCompare.length <= 0 ){$('#product_compare_block').css('display','none');}
	$('#product_compare_title').html(t_compare+' ('+productCompare.length+')');

}

function storeOneProductToCompare(nid)
{
	i = $.inArray(nid, productCompare);
	if( i != -1 )
	{
		productCompare.splice(i,1);
	}
	productCompare.unshift( nid );

	while(productCompare.length > 3 )
	{
		index = productCompare[productCompare.length-1]
		productCompare.pop();
	}
	openProductCompare();
	//update session
	$.cookie('product_compare_'+activeFamily, productCompare.join('-'), {path: '/', expires: 10 } );
}

function getSessionProductCompare()
{
	data = $.cookie('product_compare_'+activeFamily);
	if(data!=null){
	if(data != '' ){
		productCompare = data.split('-');
		var prodtitle = $('#product_compare_title');
		if(prodtitle.length>0){
			prodtitle.html(t_compare+' ('+productCompare.length+')');
			for(i in productCompare)
			{
				$('#imgCompare'+productCompare[i]).attr('src','/sites/default/themes/mavic/images/select_to_compare_on.gif');
				overItem(productCompare[i]);
			}
			$('#product_compare_block').css('display','block');
		}
	}}
}

/* call product compare*/
function openProductCompare()
{
	bgi=0;
	$(".compareBit").remove();

	$('#productCompareContainer').css('display','block');
	$('#productCompareContainer').css('height',$(window).height()+'px');
	$('#productCompareContainer').css('background','white');

	$('#loader').show();

	$('#menu').css('visibility','hidden');
	if($('#logo_container').css('left')=='15px'){$('#logo_container').css('display','none');$('#player').css('display','none');}
	setTimeout("pcShowProducts()",1);
}
function pcShowProducts()
{
	
	for(i =0 ; i<3;i++)//in productCompare)
	{
		bit = $('<div></div>');
		bit.addClass('compareBit');
		content = $.ajax({
					async: false,
					url: basePath+'/productcompare/'+productCompare[i]
					}).responseText;

		bit.html(content);
		bit.appendTo($("#productCompareContainer"));
	}


	pcCreateImgeRow();//specific row creation for imageand select first row
	$('.pcblockimage').each(
			function()
			{
				column = $(this).attr('title');
				$(this).appendTo('#pc_image'+column);
			});

	$('.pcblockweight').each(
			function()
			{
				column = $(this).attr('title');
				if( $('#pc_weight').length==0){ pcCreateFeatureRow('pc_weight', 0);}
				$(this).appendTo('#pc_weight'+column);
			});

	$('.pcblockfeatures').each(
			function()
			{
				ttitle = $(this).attr('title').split('|');
				featureType= ttitle[0];
				column = ttitle[1];
				order= ttitle[2];
				if( $('#'+featureType).length==0){ pcCreateFeatureRow(featureType, order);}
				//$(this).appendTo('#'+featureType+column);
				$('#'+featureType+column).html($(this).html());
			});
	
	$('.pcblocktechnos').each(
			function()
			{
				column = $(this).attr('title');
				if( $('#pc_technologies').length==0){ pcCreateFeatureRow('pc_technologies', 100);}
				$(this).appendTo('#pc_technologies'+column);
			});

	//disable option contained in productcompare table
	$('option').each(function(){
		i=$.inArray(this.value, productCompare);
		if(i!=-1){$(this).attr('disabled','disabled');}
	});

	bgi=0;
	for(i in tRows)
	{
		tRows[i].appendTo('#productCompareTable');
		if(bgi%2 != 0){tRows[i].addClass('odd');}
		bgi++;
	}

	$('#main_content').css('visibility','hidden');
	$('#loader').hide();
	positionLogo();
	


}

var tRows = new Array();

function pcCreateFeatureRow(featureType, order)
{
	row = $('<tr></tr>');
	row.attr('id',featureType);
	

	for(i in productCompare)
	{
		col = $('<td valign="top"></td>');
		col.attr('id',featureType+productCompare[i]);
		col.attr('valign','top');
		col.appendTo(row);
	}
	row.appendTo('#productCompareTable')
	tRows[order]=row;
}

function pcCreateImgeRow()
{
	row = $('<tr></tr>');
	row.attr('id','pc_image');

	for(i in productCompare)
	{
		col = $('<td valign="top" align="right"></td>');
		col.attr('id','pc_image'+productCompare[i]);
		col.attr('valign','top');
		col.appendTo(row);
	}
	//fill empty cells
	if(productCompare.length < 3 )
	{
			col = $('<td valign="top" align="right"></td>');
			col.attr('id','pc_image'+i);
			col.attr('valign','top');

			col.html('<img src="/sites/default/themes/mavic/images/pc_noimage.jpg"/>');
			select= $('<select onchange="updateProductCompare(this,this.options[this.selectedIndex].value);" ></select>');
			select.attr('id','pc_select_'+i);
			select.addClass('pc_select_empty');
			select.html($('.pc_select_page').html());
			select.appendTo(col);

			col.appendTo(row);
			if(productCompare.length==1)//empty col for ie display
			{
				col = $('<td></td>');
				col.appendTo(row);
			}
	}
	row.appendTo('#productCompareTable');
	$('.pc_select_empty').each(function (){this.selectedIndex=0});
}

function updateProductCompare( elt, newNid )
{
	oldNid = elt.parentNode.getAttribute('title') ;

	//test if new id already in product compare (IE6 does not support disabled option)
	i = $.inArray(newNid, productCompare);
	if(i!=-1){return false;}

	if(newNid==0)//remove the nid from productcompare
	{
		i = $.inArray(oldNid, productCompare);
		if(i!=-1){productCompare.splice(i,1);}
	}
	else
	{
		i = $.inArray(oldNid, productCompare);
		if(i!=-1){productCompare[i]=newNid;}
		else{productCompare[productCompare.length]=newNid;}
	}

	//switch off the old nid
	$('#imgCompare'+oldNid).attr('src','/sites/default/themes/mavic/images/select_to_compare_off.gif');
	outItem(oldNid);

	//switch on the new nid
	$('#imgCompare'+newNid).attr('src','/sites/default/themes/mavic/images/select_to_compare_on.gif');
	overItem(newNid);

	//closeProductCompare();
	$('#productCompareTable').empty();

	if(productCompare.length<=0){
		$('#product_compare_block').css('display','none');
		closeProductCompare();

	}
	else
	{
		$('#product_compare_title').html('COMPARE ('+productCompare.length+')');
		openProductCompare();
	}
	//update session
	$.cookie('product_compare_'+activeFamily, productCompare.join('-'), {path: '/', expires: 10 } );
}

function closeProductCompare()
{
	$('#productCompareContainer').css('display','none');
	$('#menu').css('visibility','visible');
	$('#main_content').css('visibility','visible');

	positionLogo();

	$('#productCompareTable').empty();
	$('#logo_container').css('display','block');
	$('#player').css('display','block');
}


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
	/*
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
	*/

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
 *roll over rouge dans sous menu mavic 
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

