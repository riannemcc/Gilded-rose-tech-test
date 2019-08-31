require 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      if item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in == 0
        item.quality = 0
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 6
        item.quality += 3
      end

      unless item.name == "Sulfuras, Hand of Ragnaros" || item.quality == 0 || item.quality == 50
        item.sell_in -= 1
        item.sell_in < 0 ? item.quality -= 2 : item.quality -= 1
      end

    #
    #   if item.quality > 0 && item.quality < 50
    #
    #     if item.name == "Aged Brie" && item.sell_in < 0
    #       item.quality += 2
    #     elsif item.name == "Aged Brie" && item.sell_in > 0
    #       item.quality += 1

    #     elsif item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in > 10
    #       item.quality += 1
    #     elsif item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 11
    #       item.quality += 2
    #     elsif item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 6
    #       item.quality += 3
    #     elsif item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in == 0
    #       item.quality = 0
    #     else
          # item.quality -= 1
    #     end
    #
    #   end
    end
  end
end
