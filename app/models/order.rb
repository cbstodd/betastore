class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card
  belongs_to :shipping_address
  has_many :line_items
  has_many :products, :through => :line_items

  accepts_nested_attributes_for :line_items,
    :credit_card,
    :shipping_address

  def self.from_cart(cart)
    order = new
    cart.each do |product_id, quantity|
      order.line_items.build(product: Product.find(product_id),quantity: quantity)
    end
    order
  end


  def total_price
    # line_items.to_a.sum(&:total_price)
          # ...First way to do it

    
    line_items.to_a.sum{ |item| item.total_price }
          # .... Second way to to it

    # sum = 0
    # for line_item in line_items
    #   sum += line_item.total_price
    # end
    # sum
        # .... Third way to do it
  end

end
