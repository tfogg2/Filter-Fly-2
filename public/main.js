// alert("We made it!");
// console.log(6*12);
// var testJava = document.getElementById("testJava");
// $(testJava).addClass("red");
// console.log("boom");

var filters = document.getElementById("filters");
$(filters).css("min-height", "150px");
$(filters).css("width", "150px");
var ul = $(filters).children("ul");
$(ul).addClass("collections");
$(filters).replaceWith("<%= j render('shared/filters', {product: @product, category: @category, product_type: @product_type, tags: @tags}) %>"))
