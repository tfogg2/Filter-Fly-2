$(document).ready(function () {
	
	$test = $('#test');
	$newCat = $('#newCategory');
	$newType = $('#newType');
	$newTag = $('#newTag');
	$productShow = $('#productShow');
	$categorySelect = $('#product_category_id');
	$typeSelect = $('#product_product_type_id');
	$tagSelect = $('#product_tags');
	//$formSelect = $('#formSelect');
	//MODAL 

	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var $btn = document.getElementsByClassName("modalBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal 
	$('.modalBtn').click( function(){
	    modal.style.display = "block";
	});

	// When the user clicks on <span> (x), close the modal
	$('.close').on('click', function(){
	    modal.style.display = "none";
	});

	// When the user clicks anywhere outside of the modal, close it
	$(window).on('click', function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	});

	$('a').hover( function(){
		$(this).addClass("hover");
		}, function() {
	    $( this ).removeClass( "hover" );
	  	}
	);

	$('.chosen-select').chosen({
	    allow_single_deselect: true,
	    no_results_text: 'No results matched',
	    width: '120px',
	});


	$('.modalBtn').click( function(){
		$.ajax({
	      type: 'GET',
	      url: "/categories/new.html",//:category_id/product_types.json",
	      success: function(data) {
	      	$newCat.html('<div> '+ data + '</div>');
	      	
		  	}
		});

		$.ajax({
	      type: 'GET',
	      url: "product_types/new.html",//:category_id/product_types.json",
	      success: function(type) {
	      	$newType.html('<div> '+ type + '</div>');
	      	
		  	}
		});
		$.ajax({
	      type: 'GET',
	      url: "tags/new.html",//:category_id/product_types.json",
	      success: function(tag) {
	      	$newTag.html('<div> '+ tag + '</div>');
	      	
		  	}
		});
			
	});


	var $leftNav = $('#leftNav')
	var $leftNavHeight = $leftNav.height();
	var $index = $('#index');

	
	 
	

//_SELECT_CHANGE.JS.ERB //
	// $(document).on('change', ".category_select select", function(){
	// 	alert(this.value);
	// 	var categroy_id =
	// });
	// $(document).on('change', ".product_type_select select", function(){
	// 	alert(this.value);
	// });
	// $(document).on('change', ".tag_select select", function(){
	// 	alert(this.value);
	// });
	$(document).on('change', ".selectable select", function(){
		var sel = $(this).closest("tr");
		console.log(sel.data("product-id"));
		var category_id = sel.find("select.category").val();
		sel.find("select.category").attr('selected');
		console.log(category_id);
		var product_type_id = sel.find("select.product_type").val();
		sel.find("select.product_type").attr('selected');
		console.log(product_type_id)
		var tag = sel.find("select.tag").val();
		sel.find("select.tag").attr('selected');
		console.log(tag)

		
		

		$.ajax({
			type: 'GET',
			url: '/select_change?product_id=' + sel.data("product-id") + "&category_id="+category_id + "&product_type_id="+product_type_id + "&tags_ids="+tag,
			success: function(data){
				
			}
		});
		return false;

	});








	// form_element url //

		
	// form_element url //


//_SELECT_CHANGE.JS.ERB //
























});

















	// $(document).on('change', "#renderTest select", function(){
	// 	var sel = $(this).closest("tr");
	// 	console.log(sel);
	// 	var category_id = sel.find("select.category").val();
	// 	console.log(category_id);
	// 	var product_type_id = sel.find("select.product_type").val();
	// 	console.log(product_type_id)
	// 	var tag = sel.find("select.tag").val();
	// 	console.log(tag)

	// 	var inputId = $(this).val();
	// 	console.log(inputId);
	// 	var $tr = $(this).closest("tr");
	// 	console.log($tr);
		

	// 	$.ajax({
	// 		type: 'GET',
	// 		url: '/select_change?product_id=' + productId + "&category_id="+inputId, // + "&product_type_id="+product_type_id, //+ "&tags_ids="+tag,
	// 		success: function(data){
				
	// 		}
	// 	});
	// 	return false;

	// });

	




	//$(".category-selectable").on('click', function(e){

		
		//var categoryNav = $(this).data("category-id");
		
		//$('#productType').hide();

		// e.preventDefault();
		

		// $.ajax({
		// 	type: 'GET',
		// 	url: '/categories/' + categoryNav + '/product_types', 
		// 	success: function(data){
				
		// 		$('#productType').html(data);
				
		// 	}
		// });
		// $.ajax({
		// 	type: 'GET',
		// 	url: '/navbar_select?category_id=' + categoryNav, 
		// 	success: function(data){
				
				
		// 	}
		// });
		// return false;
		

	//});
	


	
	



	
	// Configure Chosen 

	







// $('.modalBtn').click( function(){
	// 	$.ajax({
	//       type: 'GET',
	//       url: "/product_types/new.html",//:category_id/product_types.json",
	//       success: function(type) {
	//       	$newType.html('<div> '+ type + '</div>');
	      	
	// 	  	}
	// 	});
		
	// });

	// $('.modalBtn').click( function(){
	// 	$.ajax({
	//       type: 'GET',
	//       url: "/tags/new.html",//:category_id/product_types.json",
	//       success: function(tag) {
	//       	$newTag.html('<div> '+ tag + '</div>');
	      	
	// 	  	}
	// 	});
		
	// });

	// $("#formSelect").children(".sel1").on('change', function(){
	// 	var sel = $(this).val();
	// 	alert(this.value);
	// 	// $.ajax({
 //  //        type: 'POST'

	// });




	// $(".selectable select").on('change', function(){
	// 	var sel = $(this).val();
	// 	alert(sel);
	// 	$.ajax({
	// 		type: 'GET',
	// 		url: '/categories/' + $(this).val() + '/product_types.json',
	// 		success: function(data){
	// 			alert('Success');
	// 		}
	// 	});
	// });


	// $(function(){
	// 	$.ajax({
 //      type: 'GET',
 //      url: "products/:id",//:category_id/product_types.json",
 //      success: function(data) {
 //      	$productShow.html('<div> '+ data + '</div>');
      	
	//   	}
	// 	});
		
	// });

	// $categorySelect.on('change', function() {
 	  		
 // 	  		$category = $(this).val();

 // 	  		$.ajax({
	//       		type: 'GET',
	//       		url: "/categories/" + $(this).val() + "/product_types",//:category_id/product_types.json"
	// 	      	success: function(data) {
	// 	      		$typeSelect.children().remove();
	// 	      		$(".product_type_select").each(function(){
	// 	      			$typeSelect.append( $(this) ).stop();;
	// 	      		})
	// 	      		$('#productTypeShow').html('<div> '+ data + '</div>');
	// 	      		$('#productTypeShow').hide();
	// 			  	}
	// 			});
 	  		
 	  		
 	  		
 // 	});
	// $('.categorySelect').children().on('change', function() {
	  		
	//   		//$category = $(this).val();
	//   		$.ajax({
 //      		type: 'GET',
 //      		url: "/categories/" + $(this).val() + "/product_types",//:category_id/product_types.json"
	//       	success: function(data) {
	//       		$typeSelect.children().remove();
	//       		$(".product_type_select").each(function(){
	//       			$typeSelect.append( $(this) );
	//       		}).stop();
	//       		$('#productTypeShow').html('<div> '+ data + '</div>');
	//       		$('#productTypeShow').hide();
	// 		  	}

	// 		});
 	  		
	  
 	  		
 // 	});
	
	// $typeSelect.on('change', function() {
 	  		
 // 	  		$typeId = $(this).val();

 // 	  		$.ajax({
	//       		type: 'GET',
	//       		url: "/categories/" + $category + "/product_types/" + $(this).val() + "/tags",//:category_id/product_types.json"
	// 	      	success: function(data) {
	// 	      		$tagSelect.children().remove();
	// 	      		$(".product_tag_select").each(function(){
	// 	      			$tagSelect.append( $(this) );
	// 	      		}).stop();
	// 	      		$('#productTypeShow').html('<div> '+ data + '</div>');
	// 			  	}
	// 			});
 	  	
 // 		});





	//$('#categoryForm').children('button').on('click', function(){

	// 	var newCat = {
	// 		title: $title.val();
	// 		handle: $title.paramaterize();
	// 	}

	// 	$.ajax({
	// 		type: "POST",
	// 		url: '/categories',
	// 		success: function(data) {
	// 			$('#test').append('<li> Title: ' + newCat.title + '</li>');
	// 		}


	// 	});

	// $(function(){
	// 	$.ajax({
	// 	  type: 'GET',
	//       url: "/categories.json",//:category_id/product_types.json",
	//       success: function(data) {
	//       	$.each(data, function(i, item){
	//       		$test.append('<li> ' + item.title + ' </li>');
	//       	});
	//       },
	//       error: function(){
	//       	alert('error loading categories');
	//       }
	//   });
	// });



	
	// $chosen = $('#chosen');
	// $chosen.append( $('#test-chosen'));
	



			
	// $('#product_category').on('change', function() {
 //  		alert( this.value );
 //  		var cat = $(this).val();
 //  		// if ($(this).data('options') == undefined) {
 //  		// 	$(this).data('options', $('#product_product_type option').clone());
 //  		// }
 //  		// var id = $(this).val();
 //  		// var options = $(this).data('options').filter('[value=' + id + ']');
 //  		// $("#product_product_type").html(options);
 //  		$("#product_product_type").children().remove();
 //  		$("#product_product_type").chiledren().append( $(cat));
	// });


	// var cat = $("#product_category").change(function() {
	//     $.ajax({
	//       url: "/categories/:category_id/product_types/:id",
	//       type: "GET",
	//     //   data: {product_type_id: $(this).val()},
	//     //   // Callbacks that will be explained
	//     // }).done(function(){
	//     // 	(this).children().remove();
	//     });
	// });







// if ($(this).data('options') == undefined) {
// 	    /*Taking an array of all options-2 and kind of embedding it on the select1*/
// 	    $(this).data('options', $('.select2 option').clone());
// 	  }
// 	  var id = $(this).val();
// 	  var options = $(this).data('options').filter('[value=' + id + ']');
// 	  $('.select2').html(options);






	




// $(document).ready(function(){
//     $('#product_tags').chosen({
//         allow_single_deselect: true,
//         no_results_text: 'No results matched',
//         width: '400px'
//     });
// });
// $categorySelect.on('change', function() {
 	  		
//  	  		//$category = $(this).val();
//  	  		$.ajax({
// 	      		type: 'GET',
// 	      		url: "/categories/" + $(this).val() + "/product_types",//:category_id/product_types.json"
// 		      	success: function(data) {
// 		      		$typeSelect.children().remove();
// 		      		$(".product_type_select").each(function(){
// 		      			$typeSelect.append( $(this) );
// 		      		}).stop();
// 		      		$('#productTypeShow').html('<div> '+ data + '</div>');

// 				  	}
// 				});$.ajaxstop();
 	  		

 	  		
//  	});