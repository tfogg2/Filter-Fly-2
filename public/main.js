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



function getProducts(){
	console.log("No shop id set");
	$.ajax({
		type: 'GET',
		url: '/products.json',
		success: function(data){
			alert('success');
		}
	});

	return
};



