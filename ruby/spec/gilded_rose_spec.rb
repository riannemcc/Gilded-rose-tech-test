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

    it "will not allow the quality to be negative" do
      items = [Item.new("Elixir of the Mongoose", 15, 0)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 0
    end


    it "increases the quality of Aged Brie" do
      items = [Item.new("Aged Brie", 15, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 1
    end

    it "does not change the quality of Sulfuras, Hand of Ragnaros" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 15, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 0
    end
  end

  describe 'Backstage passes' do

    it "increases the quality of Backstage passes to a TAFKAL80ETC concert by 1 if there are more than ten days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 01
    end

    it "increases the quality of Backstage passes to a TAFKAL80ETC concert by 2 if there are  6-10 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 2
    end

    it "increases the quality of Backstage passes to a TAFKAL80ETC concert by 3 if there are > 5 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 3
    end

    it "reduces the quality of Backstage passes to a TAFKAL80ETC concert to 0 after the concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5)]
      expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by -5
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