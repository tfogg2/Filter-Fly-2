// alert("We made it!");
// console.log(6*12);
// var testJava = document.getElementById("testJava");
// $(testJava).addClass("red");
// console.log("boom");

var filters = document.getElementById("filters");
$(filters).css("min-height", "150px");
$(filters).css("width", "100px");
$(filters).html(" {% for collection in collections %}<ul><li style='font-size: 18px;'><strong>{{ collection.title }}</strong></li></ul>{% endfor %}");
