App.categories = App.cable.subscriptions.create('CategoriesChannel', {
  received: function(data) {
    $("#categories").removeClass('hidden')
    return $('#categories-box').append(this.renderMessage(data));
  },

  renderCategory: function(data) {
    return "<p class='p-name'>" + data.title +  "</p>";
  }
});
