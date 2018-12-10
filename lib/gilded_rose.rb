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

      check_if_sulfuras_sell_in(item)

      if generic_item(item)
        check_min_quality(item)
      else
        check_max_quality(item)
      end

      if item.name == BACKSTAGE_PASS
        increase_if_ten_to_six(item)
        increase_if_five_to_zero(item)
      end


      if expired(item)

        if item.name != AGED_BRIE
          if item.name != BACKSTAGE_PASS

             decrease_if_not_sulfuras(item)


          else
            set_quality_to_zero(item)
          end

        else
          check_max_quality(item)
        end

      end


    end
  end




  def expired(item)
    item.sell_in < 0
  end

  def check_if_sulfuras_sell_in(item)
    item.name == SULFURAS ? item.sell_in : lower_sell_in(item)
  end

  def check_if_sulfuras_quality(item)
    item.name == SULFURAS ? item.quality : decrease_quality(item)
  end

  def decrease_if_not_sulfuras(item)
    item.quality > MIN_QUALITY ? check_if_sulfuras_quality(item) : item.quality
  end

  def lower_sell_in(item)
    item.sell_in -= 1
  end

  def check_max_quality(item)
    item.quality < MAX_QUALITY ? increase_quality(item) : item.quality
  end

  def check_min_quality(item)
    item.quality > MIN_QUALITY ? decrease_quality(item) : item.quality
  end

  def increase_quality(item)
    item.quality += 1
  end

  def decrease_quality(item)
    item.quality -= 1
  end

  def set_quality_to_zero(item)
    item.quality -= item.quality
  end

  def backstage_quality_less_than_ten(item)
    item.sell_in < 11 && item.quality < MAX_QUALITY
  end

  def backstage_quality_less_than_five(item)
    item.sell_in < 6 && item.quality < MAX_QUALITY
  end

  def increase_if_ten_to_six(item)
    backstage_quality_less_than_ten(item) ? increase_quality(item) : item.quality
  end

  def increase_if_five_to_zero(item)
    backstage_quality_less_than_five(item) ? increase_quality(item) : item.quality
  end

  def generic_item(item)
    item.name != AGED_BRIE and item.name != BACKSTAGE_PASS and item.name != SULFURAS
  end




end
