$(document).on('turbolinks:load', function() {
  submitNewCategory();
});

function submitNewCategory(){
  $('input#category_title').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="category"]').click();
        $('[data-input="category"]').val(" ");

        return false;
     }
  });
}
