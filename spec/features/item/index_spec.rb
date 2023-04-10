require 'rails_helper'

RSpec.describe "item index" do
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

  describe "Story 3" do
    it 'lists items' do
      visit '/items'
      within "#items-#{@item_1.id}"do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.supermarket.name)
        expect(page).to have_content("Customer Count: #{@item_1.customer_count}")
      end
      within "#items-#{@item_2.id}" do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@item_2.supermarket.name)
        expect(page).to have_content("Customer Count: #{@item_2.customer_count}")
      end
      within "#items-#{@item_3.id}" do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_3.price)
        expect(page).to have_content(@item_3.supermarket.name)
        expect(page).to have_content("Customer Count: #{@item_3.customer_count}")
      end
      within "#items-#{@item_4.id}" do
        expect(page).to have_content(@item_4.name)
        expect(page).to have_content(@item_4.price)
        expect(page).to have_content(@item_4.supermarket.name)
        expect(page).to have_content("Customer Count: #{@item_4.customer_count}")
      end
      within "#items-#{@item_5.id}" do
        expect(page).to have_content(@item_5.name)
        expect(page).to have_content(@item_5.price)
        expect(page).to have_content(@item_5.supermarket.name)
        expect(page).to have_content("Customer Count: #{@item_5.customer_count}")
      end
    end
  end

end