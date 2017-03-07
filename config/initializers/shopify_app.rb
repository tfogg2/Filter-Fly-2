ShopifyApp.configure do |config|

  config.api_key = "ef2b4e3a8c09d66e0eece4c732b271fb"
  config.secret = "d866681c45bd81e34296d70d6f9d786b"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.scripttags = [
  {event:'onload', src: 'https://filterfly2.herokuapp.com/main.js'}
  ]
end
