class ProductType < ApplicationRecord
  belongs_to :category
  has_many :tags, :dependent => :destroy
  has_many :products, :dependent => :destroy
end
