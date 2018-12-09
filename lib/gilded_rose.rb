class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if !aged_brie(item) && !backstage(item)
        if item.quality > 0
          if !sulfuras(item)
            decrease_quality(item)
          end
        end
      else
        if item.quality < 50
          increase_quality(item)
          if backstage(item)
            if item.sell_in < 11
              if item.quality < 50
                increase_quality(item)
              end
            end
            if item.sell_in < 6 && item.quality < 50
              increase_quality(item)
            end
          end
        end
      end
      if !sulfuras(item)
        decrease_sell_in(item)
      end
      if item.sell_in < 0
        if !aged_brie(item)
          if !backstage(item)
            if item.quality > 0
              if !sulfuras(item)
                decrease_quality(item)
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            increase_quality(item)
          end
        end
      end
    end
  end
end


def decrease_quality(item)
  item.quality -= 1
end

def increase_quality(item)
  item.quality += 1
end

def decrease_sell_in(item)
  item.sell_in -= 1
end

def aged_brie(item)
  item.name == "Aged Brie"
end

def backstage(item)
  item.name == "Backstage pass for a Metallica concert"
end

def sulfuras(item)
  item.name == "Sulfuras, Hand of Ragnaros"
end
