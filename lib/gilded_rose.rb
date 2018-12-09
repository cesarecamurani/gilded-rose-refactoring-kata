class GildedRose
  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage pass for a Metallica concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_generic_item_quality(item)
    if item.quality > MIN_QUALITY
      expired(item) ? item.quality -= 2 : item.quality -= 1
    end
  end

  def update_aged_brie(item)
    if item.quality < 49 && expired(item)
      item.quality += 2
    elsif item.quality < 50
      item.quality += 1
    end
  end

  def update_sulfuras(item)
    return item.quality, item.sell_in
  end

  def update_backstage_pass(item)
    if expired(item)
      item.quality -= item.quality
    elsif item.quality < (MAX_QUALITY - 2) && item.sell_in < 6
      item.quality += 3
    elsif item.quality < (MAX_QUALITY - 1) && item.sell_in <= 10
      item.quality += 2
    elsif item.quality < MAX_QUALITY && item.sell_in > 10
      item.quality += 1
    end
  end

  def expired(item)
    item.sell_in <= 0
  end

  #   @items.each do |item|
  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end
end
