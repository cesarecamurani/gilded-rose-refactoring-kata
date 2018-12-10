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
      lower_sell_in(item)
      check_general_quality(item)
      check_if_backstage(item)
      check_is_aged_brie(item)
    end
  end

  def check_if_backstage(item)
    if item.name == BACKSTAGE_PASS
      increase_if_ten_to_six(item)
      increase_if_five_to_zero(item)
    end
  end

  def expired(item)
    item.sell_in < 0
  end

  def is_backstage_pass?(item)
    item.name == BACKSTAGE_PASS ? set_quality_to_zero(item) : decrease_if_not_sulfuras(item)
  end

  def check_is_aged_brie(item)
    if expired(item)
      item.name == AGED_BRIE ? reached_max_quality?(item) : is_backstage_pass?(item)
    end
  end

  def lower_sell_in(item)
    item.name == SULFURAS ? item.sell_in : decrease_sell_in(item)
  end

  def sulfuras_quality(item)
    item.name == SULFURAS ? item.quality : decrease_quality(item)
  end

  def check_general_quality(item)
    generic_item(item) ? reached_min_quality?(item) : reached_max_quality?(item)
  end

  def decrease_if_not_sulfuras(item)
    item.quality > MIN_QUALITY ? sulfuras_quality(item) : item.quality
  end

  def decrease_sell_in(item)
    item.sell_in -= 1
  end

  def reached_max_quality?(item)
    item.quality < MAX_QUALITY ? increase_quality(item) : item.quality
  end

  def reached_min_quality?(item)
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
    item.sell_in <= 10 && item.quality < MAX_QUALITY
  end

  def backstage_quality_less_than_five(item)
    item.sell_in <= 5 && item.quality < MAX_QUALITY
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
