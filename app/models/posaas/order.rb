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
      :uid => '',
      :restaurant_uid => '',
      :total => 0,
      :time => '',
      :delivery_address => '',
      :order_type_attributes => {
        :uid => ''
      },
      :service_charge_attributes => {
        :uid => '',
        :amount => 0
      },
      :delivery_charge_attributes => {
        :uid => '',
        :amount => 0
      },
      :items_attributes => [{
        :uid => '',
        :price => 0,
        :quantity => 0,
        :special_instructions => '',
        :ingredients_attributes => [{
          :uid => '',
          :price => 0
        }]
      }],
      :discount_attributes => {
        :uid => '',
        :amount => 0
      }
    }
  end
  
end