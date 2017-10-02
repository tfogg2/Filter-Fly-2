class CategoriesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'categories'
  end
end
