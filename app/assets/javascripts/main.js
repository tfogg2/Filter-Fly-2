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

	// $('a').hover( function(){
	// 	$(this).addClass("hover");
	// 	}, function() {
	//     $( this ).removeClass( "hover" );
	//   	}
	// );

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
	      url: "tags/new",//:category_id/product_types.json",
	      success: function(tag) {
	      	$newTag.html('<div> '+ tag + '</div>');

		  	}
		});

	});


	var $leftNav = $('#leftNav')
	var $leftNavHeight = $leftNav.height();
	var $index = $('#index');


	//
	// Ajax product form submission
	//

	$(document).on("submit", 'form.ajax-form', function(e){
		var form_values = $(this).serializeArray();
		console.log("Submitting form with values!", form_values);

		$.ajax({
			type: 'PUT',
			data: form_values,
			url: '/products/'+$(this).data("product-id"),
			success: function(data){

			}
		});

		return false;
	});


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
	$(document).on('change', "select.selectable", function(){
		var sel = $(this).closest("form");
		console.log("selector", sel);
		console.log(sel.data("product-id"));
		var category_id = sel.find("select.category").val();
		//sel.find("select.category").attr('selected');
		console.log(category_id);
		var product_type_id = sel.find("select.product_type").val();
		//sel.find("select.product_type").attr('selected');
		console.log(product_type_id)
		var tag = sel.find("select.tag").val();
			// $(tag).each(function(i, selected){
			// 	tag[i] = $(selected).val();
			// })
		//sel.find("select.tag").attr('selected');
		console.log(tag);
		// var foo = [];
		// 	$(tag).each(function(i, selected){
  // 			foo[i] = $(selected).val();
		// });



		$.ajax({
			type: 'GET',
			url: '/select_change?product_id=' + sel.data("product-id") + "&category_id="+category_id + "&product_type_id="+product_type_id + "&tags_ids="+tag,
			success: function(data){

			}
		});
		return false;

	});

	$(document).load(function(){
		$.ajax({
			type: "POST",
			url: '/admin/script_tags.json',
			success: function(data){

			}

		});
	});

	$('.clear').hide();
	$('#collections_search').mouseenter( function(){
		$('.clear').show();
		$(this).mouseleave(function(){
			$('.clear').hide();
		})
	});

	$('.id').on('click', function(){
		$(this).addClass('selected');
		var collection_id = $(this).data('collection-id');
		$.ajax({
			type: 'GET',
			data: $(),
			url: '/collections/' + collection_id + '/categories/new',
			success: function(data){
				form = $(data).find('#newForm');
				$('.conversation-header').html(form);
				$('.create_messages').hide();
			}
		});

		// $getScript('categories/form.js.erb', function(script){
		//
		// })
		//
		return false;
	});




//_SELECT_CHANGE.JS.ERB //




	// TEST DATA TABLE //
	// '.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
		// $(window).on("load resize ", function() {
		//   var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
		//   $('.tbl-header').css({'padding-right':scrollWidth});
		// }).resize();




	// var testJava = getElementById("testJava");
	// alert(testJava.value);
	// console.log("success");

	// TEST DATA TABLE //


});












/* Sample JavaScript file added with ScriptTag resource.
This sample file is meant to teach best practices.
Your app will load jQuery if it's not defined.
Your app will load jQuery if jQuery is defined but is too old, e.g. < 1.7.
Your app does not change the definition of $ or jQuery outside the app.
Example: if a Shopify theme uses jQuery 1.4.2, both of these statements run in the console will still return '1.4.2'
once the app is installed, even if the app uses jQuery 1.9.1:
jQuery.fn.jquery => "1.4.2"
$.fn.jquery -> "1.4.2"
*/

/* Using a self-executing anonymous function - (function(){})(); - so that all variables and functions defined within
aren’t available to the outside world. */

// (function(){

// /* Load Script function we may need to load jQuery from the Google's CDN */
// /* That code is world-reknown. */
// /* One source: http://snipplr.com/view/18756/loadscript/ */

// var loadScript = function(url, callback){

//   var script = document.createElement("script");
//   script.type = "text/javascript";

//   // If the browser is Internet Explorer.
//   if (script.readyState){
//     script.onreadystatechange = function(){
//       if (script.readyState == "loaded" || script.readyState == "complete"){
//         script.onreadystatechange = null;
//         callback();
//       }
//     };
//   // For any other browser.
//   } else {
//     script.onload = function(){
//       callback();
//     };
//   }

//   script.src = url;
//   document.getElementsByTagName("head")[0].appendChild(script);

// };

// /* This is my app's JavaScript */
// var myAppJavaScript = function($){
















//   // $ in this scope references the jQuery object we'll use.
//   // Don't use jQuery, or jQuery191, use the dollar sign.
//   // Do this and do that, using $.
//   $('body').append('<p>Your app is using jQuery version '+$.fn.jquery+'</p>');
// };

// /* If jQuery has not yet been loaded or if it has but it's too old for our needs,
// we will load jQuery from the Google CDN, and when it's fully loaded, we will run
// our app's JavaScript. Set your own limits here, the sample's code below uses 1.7
// as the minimum version we are ready to use, and if the jQuery is older, we load 1.9. */
// if ((typeof jQuery === 'undefined') || (parseFloat(jQuery.fn.jquery) < 1.7)) {
//   loadScript('//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js', function(){
//     jQuery191 = jQuery.noConflict(true);
//     myAppJavaScript(jQuery191);
//   });
// } else {
//   myAppJavaScript(jQuery);
// }

// })();



//End of  sample js for shopify












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
