require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end
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

  it 'joins on customers to pluck customer name' do
    expect(Supermarket.customers_distinct(@supermarket_1.id)).to eq(["Jimmy", "Charles", "Jacob", "Horace"])
    expect(Supermarket.customers_distinct(@supermarket_2.id)).to eq(["Claire", "Jimmy"])
    expect(Supermarket.customers_distinct(@supermarket_3.id)).to eq([])
  end
end