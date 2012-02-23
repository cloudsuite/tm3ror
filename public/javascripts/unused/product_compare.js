
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