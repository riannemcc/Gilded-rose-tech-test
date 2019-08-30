require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "reduces the quality by 1" do
      items = [Item.new("Elixir of the Mongoose", 15, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by -1
    end

    it "increases the quality of Aged Brie" do
      items = [Item.new("Aged Brie", 15, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 1
    end

    it "increases the quality of Sulfuras, Hand of Ragnaros" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 15, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 0
    end
  end

end

# things to test
# that item quality doesnt go below 0
# that quality doesnt decrease if three special products
# that special items cant increase more than 50
# that backstage passes if sell less than 11, quality less 50, increase specials by 1
# fir sell in less 6 and quality less 50, increase quality by 1
# for everything but sulfurus, sell in drecrease by 1 in quality is more than 0
#
