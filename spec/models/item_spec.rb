require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
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
  
  it 'counts customers' do
    expect(@item_1.customer_count).to eq(2)
    expect(@item_3.customer_count).to eq(2)
    expect(@item_5.customer_count).to eq(0)
  end
end
