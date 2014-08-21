User.create!(email: 'cbstodd@gmail.com', password: 'Damntone8')

test = Customer.create(name: 'John Doe', email: 'test@example.com')
Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com')
Customer.create(name: 'Tommy Bradel', email: 'tommy@gmail.com')

muffin = Product.create(name: 'Muffin', price: 2.99)
smoothie = Product.create(name: 'Smoothie', price: 3.75)
coffee = Product.create(name: 'Coffee', price: 3.99)

order = Order.create(customer: test, placed_at: '2013-09-27')
LineItem.create(order: order, quantity: 1, product: muffin)
LineItem.create(order: order, quantity: 1, product: smoothie)

order = Order.create(customer: test, placed_at: Time.current)
LineItem.create(order: order, quantity: 1, product: smoothie)

order = Order.create(customer: test, placed_at: Time.current)
LineItem.create(order: order, quantity: 1, product: muffin)
LineItem.create(order: order, quantity: 1, product: coffee)