<!--  jQuery to support popup menu for non-product categories so far -->
	<script type="text/javascript">

		$(document).ready(function(){
			
			$(".popup_base").hide();
			
			$("#modalities").hover(function(){
				$(".popup_base").hide();	
				$("#popup_modalities").show();
				return false;
			})
			
			$("#clinicalSupplies").hover(function(){
				$(".popup_base").hide();
				$("#popup_clinicalSupplies").show();
				return false;
			})
			$("#tables").hover(function(){
				$(".popup_base").hide();					
				$("#popup_tables").show();
				return false;
			})
			$("#fitness").hover(function(){
				$(".popup_base").hide();
				$("#popup_fitness").show();
				return false;
			})
			$("#orthopedics").hover(function(){
				$(".popup_base").hide();
				$("#popup_orthopedics").show();
				return false;
			})
			$("#taping").hover(function(){
				$(".popup_base").hide();
				$("#popup_taping").show();
				return false;
			})
			$("#evaluation").hover(function(){
				$(".popup_base").hide();
				$("#popup_evaluation").show();
				return false;
			})
			$("#dailyLiving").hover(function(){
				$(".popup_base").hide();
				$("#popup_dailyLiving").show();
				return false;
			})
			$("#lymphedema").hover(function(){
				$(".popup_base").hide();
				$("#popup_lymphedema").show(); /* DEBUG: Why is this one coming up with no content */
				return false;
			})
			$("#woundCare").hover(function(){
				$(".popup_base").hide();
				$("#popup_woundCare").show();
				return false;
			})
								
			$("#trumedical").hover(function(){
				$(".popup_base").hide();
				$("#popup_trumedical").show();
				return false;
			})
			
			$("#patients").hover(function(){
				$(".popup_base").hide();
				$("#popup_patients").show();
				return false;
			})
			
			$("#providers").hover(function(){
				$(".popup_base").hide();
				$("#popup_providers").show();
				return false;
			})
			
			$("#payors").hover(function(){
				$(".popup_base").hide();
				$("#popup_payors").show();
				return false;
			})

		});
	</script>
	
	<script type ="text/javascript">
		$(document).ready(function(){
			/* If mouseover a subcategory block within one of the popup windows, 
			the background of the entire block turns orange. 
			But because top 80px of 120x120 block is covered by 120x80px image, it looks
			like it is just the bottom 40px that turns orange.  
			*/
			$(".subcategory").mouseenter(function(){
				$(this).css("background-color","orange");
			});
			$(".subcategory").mouseleave(function(){
				$(this).css("background-color","#E6E6E6");
			});
			/* If click anywhere on this subcategory div, link to subcategory landing page. 
				How get correct subcategory? 
				Currently using an href within the subcategory div, using Rails to insert the target url. 
				Is there an entirely Rails answer — using a link_to(content_tag ... ? 
			*/
			/*
			$(".subcategory").click(function(){
					window.location.href="http://localhost:3000/categories/2" 
					return false;
			});
			*/

		});

	</script>
