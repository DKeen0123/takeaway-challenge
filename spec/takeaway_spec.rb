require "takeaway"

describe Takeaway do

  subject(:takeaway) { described_class.new }
  subject(:order) do
    takeaway.new_order(:pizza)
    takeaway.new_order(:red_wine)
    takeaway
  end

  it 'contains a list of dishes' do
    expect(takeaway.menu).to eq({
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     })
  end

  describe '#new_order' do
    it 'creates an order' do
      expect(takeaway.new_order(:pizza)).to eq [{ pizza: 10 }]
    end
  end

  describe '#order_total' do
    it 'feeds back the total owed for the order' do
      order.order_total
      expect(order.total).to eq(order.menu[:pizza] + order.menu[:red_wine])
    end
  end
end