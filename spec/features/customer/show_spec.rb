require 'rails_helper'

RSpec.describe "customer show" do
  before(:each) do
    @supermarket_1 = Supermarket.create(name: "WalMart", lcoation: "Sam Walton Street")
    @supermarket_2 = Supermarket.create(name: "Kmart", lcoation: "123 main street")
    @supermarket_3 = Supermarket.create(name: "Costco", lcoation: "Dallas")

    @item_1 = @supermarket_1.items.create(name: "Banana", price: 1)
    @item_2 = @supermarket_1.items.create(name: "Orange", price: 1)
    @item_3 = @supermarket_2.items.create(name: "Toothbrush", price: 2)
    @item_4 = @supermarket_2.items.create(name: "Shoes", price: 15)
    @item_5 = @supermarket_3.items.create(name: "Nilla Wafers", price: 6)

    @customer_1 = @item_1.customers.create(name: "Jimmy")
    @customer_2 = @item_1.customers.create(name: "Charles")
    @customer_3 = @item_2.customers.create(name: "Jacob")
    @customer_4 = @item_2.customers.create(name: "Horace")
    @customer_5 = @item_3.customers.create(name: "Claire")

    CustomerItem.create(customer: @customer_1, item: @item_2)
    CustomerItem.create(customer: @customer_1, item: @item_3)
    CustomerItem.create(customer: @customer_1, item: @item_4)

  end

  describe "story 1" do
    it 'has customer name' do
      visit "customer/#{customer_1.id}"

      expect(page).to have_content(@customer_1.name)
      expect(page).to_not have_content(@customer_2.name)
      
      visit "customer/#{customer_3.id}"

      expect(page).to have_content(@customer_3.id)
    end
  end
# User Story 1

# As a visitor, 
# When I visit a customer show page,
# I see the customer's name,
# And I see its a list of its items
# including the item's name, price, and the name of the supermarket that it belongs to.
end