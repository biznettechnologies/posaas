class Posaas::Order < ActiveResource::Base
  self.site = Posaas::Base.service_url
  # self.format = :json
  
  def self.submit(order_uid, restaurant_uid, items, discount, total)
    order = Posaas::Order.new do |order| 
      order.uid = order_uid
      order.restaurant_uid = restaurant_uid
      order.total = total 
      order.items_attributes = items_attributes(items)
      order.discount_attributes = {:uid => discount[:uid], :amount => discount[:amount] }
    end
    order.save
  end

private

  def items_attributes(items)
    attributes = []
    items.each do |item|
      attribute = {:uid => item[:id], :price => item[:price], :quantity => item[:quantity], :ingredients_attributes => []}
      item[:ingredients].each do |ingredient|
        attribute[:ingredients_attributes] < {:uid => ingredient[:id], :price => ingredient[:price]}
      end
      attributes << attribute
    end
    attributes
  end

  def posaas
    {
      :uid => 0,
      :restaurant_uid => 0,
      :total => 0,
      :items_attributes => [{
        :uid => 0,
        :price => 0,
        :quantity => 0,
        :ingredients_attributes => [{
          :uid => 0,
          :price => 0
        }]
      }],
      :discount_attributes => {
        :uid => 0,
        :amount => 0
      }
    }
  end
  
end