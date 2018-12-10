class GildedRose

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage pass for a Metallica concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      if generic_item(item)
        item.quality > MIN_QUALITY ? decrease_quality(item) : item.quality
        else
         check_quality(item)


          if item.name == BACKSTAGE_PASS

            if backstage_quality_less_than_10(item)
              increase_quality(item)
            end

            if backstage_quality_less_than_5(item)
              increase_quality(item)
            end

          end


      end

      if item.name != SULFURAS
        lower_sell_in(item)
      end

      if item.sell_in < 0

        if item.name != AGED_BRIE
          if item.name != BACKSTAGE_PASS

            if item.quality > MIN_QUALITY
              item.name != SULFURAS ? decrease_quality(item) : item.quality
            end

          else
            item.quality -= item.quality
          end

        else
          check_quality(item)
        end

      end


    end
  end


  def lower_sell_in(item)
    item.sell_in -= 1
  end

  def check_quality(item)
    item.quality < MAX_QUALITY ? increase_quality(item) : item.quality
  end

  def increase_quality(item)
    item.quality += 1
  end

  def decrease_quality(item)
    item.quality -= 1
  end

  def backstage_quality_less_than_10(item)
    item.sell_in < 11 && item.quality < MAX_QUALITY
  end

  def backstage_quality_less_than_5(item)
    item.sell_in < 6 && item.quality < MAX_QUALITY
  end

  def generic_item(item)
    item.name != AGED_BRIE and item.name != BACKSTAGE_PASS and item.name != SULFURAS
  end



end
