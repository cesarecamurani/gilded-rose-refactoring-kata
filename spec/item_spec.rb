require 'item'

describe Item do
  describe '#to_s' do
    it 'stringifies name, sell_in, quality' do
      item = Item.new("Nutella", 10, 40)
      expect(item.stringify).to eq("Nutella, 10, 40")
    end
  end

end
