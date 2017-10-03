App.categories = App.cable.subscriptions.create('CategoriesChannel', {
  received: function(data) {
    console.log('received');
    $("#categories").removeClass('hidden');
    return $('#categories-box').append(this.renderCategory(data));
  },

  renderCategory: function(data) {
    return "<p class='p-name'>" + data.title +  "</p>";
  }
});
