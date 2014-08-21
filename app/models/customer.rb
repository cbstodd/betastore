class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders 
  has_many :products, :through => :line_items

  before_validation :downcase_email
  before_validation :upcase_state

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, 
            uniqueness: true
  validates :zip_code, format: { with: /\d{5,}/, allow_blank: true }
  validates :state, inclusion: %w[AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY] 

  
  def downcase_email
    self.email = email.to_s.downcase    
  end

  def upcase_state
    if state
      self.state = state.upcase 
    end
  end





end
