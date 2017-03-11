// // alert("We made it!");
// // console.log(6*12);
// // var testJava = document.getElementById("testJava");
// // $(testJava).addClass("red");
// // console.log("boom");

// var filters = document.getElementById("filters");
// $(filters).css("min-height", "150px");
// $(filters).css("width", "150px");
// var ul = $(filters).children("ul");
// $(ul).addClass("filter-nav");
// var collections = $(ul).children('li');
// $(collections).addClass("collections");



$(document).ready(function(){
	console.log("No shop id set");
	$.ajax({
		type: 'GET',
		url: '/products',
		success: function(data){
			alert('success');
		}
	});

	//return
});



// var ff_shop_id;
// var domain =  shop.id;
// console.log(myshopify_domain);

// function ff_init(shop_id) {
// 	ff_shop_id = shop_id;
// 	getProducts();
// }


// function getProducts(){
// 	if(!ff_shop_id) {
// 		console.log("No shop id set");
// 		return
// 	}

// 	// Go get products for ff_shop_id
// }


// ff_init({my_shop_id})

// 

