require 'rails_helper'

RSpec.describe "customer show" do
  before(:each) do
    @supermarket_1 = Supermarket.create(name: "WalMart", location: "Sam Walton Street")
    @supermarket_2 = Supermarket.create(name: "Kmart", location: "123 main street")
    @supermarket_3 = Supermarket.create(name: "Costco", location: "Dallas")

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
      visit "customers/#{@customer_1.id}"

      expect(page).to have_content(@customer_1.name)
      expect(page).to_not have_content(@customer_2.name)
      
      visit "customers/#{@customer_3.id}"

      expect(page).to have_content(@customer_3.name)
    end

    it 'has a list of customer items' do
      visit "customers/#{@customer_1.id}"
      within "#items-#{@item_1.id}"
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_1.supermarket.name)
      within "#items-#{@item_2.id}"
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@item_2.supermarket.name)
      within "#items-#{@item_3.id}"
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@item_3.price)
      expect(page).to have_content(@item_3.supermarket.name)
      within "#items-#{@item_4.id}"
      expect(page).to have_content(@item_4.name)
      expect(page).to have_content(@item_4.price)
      expect(page).to have_content(@item_4.supermarket.name)
    end
  end

  describe "story 2" do
    
    it 'renders the form' do
      visit "/customers/#{@customer_2.id}"

      expect(find('form')).to have_content('id')
    end
   
    xit 'adds item to customer' do
      visit "/customers/#{@customer_2.id}"
      expect
    end
  end

# User Story 2

# As a visitor,
# When I visit a customer's show page,
# Then I see a form to add an item to this customer.
# When I fill in a field with the id of an existing item,
# And I click submit,
# Then I am redirected back to the customer's show page, 
# And I see the item now listed under this customer's items.
# (You do not have to test for a sad path, for example if the ID submitted is not an existing item)
end