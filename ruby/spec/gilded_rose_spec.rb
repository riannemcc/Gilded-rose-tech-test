require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    context "standard item" do

      before(:each) do
        @item = Item.new("standard", 5, 25)
      end

      it "does not change the name" do
        items = [@item]
        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq "standard"
      end

      it "reduces the quality by 1" do
        items = [@item]
        expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by -1
      end
    end

    context "Aged Brie" do

      before(:each) do
        @item = Item.new("Aged Brie", 15, 5)
      end

      it "increases the quality by one" do
        items = [@item]
        expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 1
      end

      it 'increases Aged Brie by 2 after sell_in date' do
       items = [Item.new("Aged Brie", 0, 15)]
       expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 2
     end

     it 'cannot increase quality above 50' do
       items = [@item]
       100.times { GildedRose.new(items).update_quality() }
       expect(items[0].quality).to eq 50
     end
    end

    context "Sulfuras, Hand of Ragnaros" do

      before(:each) do
        @item = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
      end

      it "does not change the quality of Sulfuras, Hand of Ragnaros" do
        items = [@item]
        expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 0
      end

      it 'does not change Sulfuras sell_in date' do
      items = [@item]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end
    end
  end


    context "Backstage passes" do

      it "increases the quality of Backstage passes to a TAFKAL80ETC concert by 1 if there are more than ten days left" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 5)]
        expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 1
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

    describe "sellin" do

      it "reduces sell_in by 1" do
      items = [Item.new("Elixir of the Mongoose", 10, 8)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

      it "reduces the quality twice as fast if the sellin date has passed" do
        items = [Item.new("Elixir of the Mongoose", 0, 8)]
        expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by -2
      end

      it "will not allow the quality to be negative" do
        items = [Item.new("Elixir of the Mongoose", 15, 0)]
        expect{ GildedRose.new(items).update_quality() }.to change { items[0].quality }.by 0
      end
    end
end
