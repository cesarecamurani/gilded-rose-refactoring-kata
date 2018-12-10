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
      if item.name != AGED_BRIE and item.name != BACKSTAGE_PASS and item.name != SULFURAS

        if item.quality > MIN_QUALITY
          decrease_quality(item)
        end

      else
        if item.quality < MAX_QUALITY
          increase_quality(item)

          if item.name == BACKSTAGE_PASS

            if backstage_quality_less_than_10(item)
              increase_quality(item)
            end

            if backstage_quality_less_than_5(item)
              increase_quality(item)
            end

          end

        end
      end

      if item.name != SULFURAS
        lower_sell_in(item)
      end

      if item.sell_in < MIN_QUALITY
        if item.name != AGED_BRIE
          if item.name != BACKSTAGE_PASS
            if item.quality > MIN_QUALITY
              if item.name != SULFURAS
                decrease_quality(item)
              end
            end
          else
            item.quality -= item.quality
          end
        else
          if item.quality < MAX_QUALITY
            increase_quality(item)
          end
        end
      end
    end
  end


def lower_sell_in(item)
  item.sell_in -= 1
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





end
