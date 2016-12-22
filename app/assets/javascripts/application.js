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

	$('a').hover( function(){
		$(this).addClass("hover");
		}, function() {
	    $( this ).removeClass( "hover" );
	  	}

	);
	


	$(function(){
		$.ajax({
      type: 'GET',
      url: "/categories/new.html",//:category_id/product_types.json",
      success: function(data) {
      	$newCat.html('<div> '+ data + '</div>');
      	
	  	}
		});
		
	});

	$(function(){
		$.ajax({
      type: 'GET',
      url: "product_types/new.html",//:category_id/product_types.json",
      success: function(type) {
      	$newType.html('<div> '+ type + '</div>');
      	
	  	}
		});
		
	});

	$(function(){
		$.ajax({
      type: 'GET',
      url: "tags/new.html",//:category_id/product_types.json",
      success: function(tag) {
      	$newTag.html('<div> '+ tag + '</div>');
      	
	  	}
		});$.ajaxstop();
		
	});

	// $("#formSelect").children(".sel1").on('change', function(){
	// 	var sel = $(this).val();
	// 	alert(this.value);
	// 	// $.ajax({
 //  //        type: 'POST'

	// });

	$(".selectable select").on('change', function(){
		var sel = $(this).closest("tr");
		
		$.ajax({
			type: 'GET',
			url: '/select_change?product_id=' + sel.data("product-id"),
			success: function(data){
				alert('Success');
			}
		});
	});



	$(".category-selectable").on('click', function(){

		
		var categoryNav = $(this).data("category-id");
		alert(categoryNav);
		//$('#productType').hide();

		
		$(this).addClass("bold");






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
				
		// 		alert('success');
		// 	}
		// });

	});

	


	














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








});


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




// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require chosen-jquery
//= require scaffold
//= require turbolinks
//= require_tree .
//= require jquery.ui.all
//= require jquery.modal
