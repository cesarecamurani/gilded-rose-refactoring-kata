class GildedRose

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage pass for a Metallica concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(inventory)
    @inventory = inventory
  end

  def update_quality
    @inventory.each do |item|
      lower_sell_in(item)
      update_item(item)
      update_backstage_pass(item)
      update_aged_brie(item)
    end
  end

  def lower_sell_in(item)
    item.name == SULFURAS ? item.sell_in : item.sell_in -= 1
  end

  def update_item(item)
    item(item) ? above_min_quality?(item) : below_max_quality?(item)
  end

  def update_backstage_pass(item)
    (increase_if_ten_to_six(item) && increase_if_five_to_zero(item)) if item.name == BACKSTAGE_PASS
  end

  def update_aged_brie(item)
    (item.name == AGED_BRIE ? below_max_quality?(item) : backstage_pass?(item)) if expired(item)
  end

  def expired(item)
    item.sell_in < 0
  end

  def backstage_pass?(item)
    item.name == BACKSTAGE_PASS ? set_quality_to_zero(item) : above_min_quality?(item)
  end

  def above_min_quality?(item)
    item.quality > MIN_QUALITY ? lower_quality(item) : item.quality
  end

  def below_max_quality?(item)
    item.quality < MAX_QUALITY ? increase_quality(item) : item.quality
  end

  def lower_quality(item)
    item.name == SULFURAS ? item.quality : item.quality -= 1
  end

  def increase_quality(item)
    item.quality += 1
  end

  def set_quality_to_zero(item)
    item.quality -= item.quality
  end

  def backstage_sell_in_less_than_ten(item)
    item.sell_in <= 10 && item.quality < MAX_QUALITY
  end

  def backstage_sell_in_less_than_five(item)
    item.sell_in <= 5 && item.quality < MAX_QUALITY
  end

  def increase_if_ten_to_six(item)
    backstage_sell_in_less_than_ten(item) ? increase_quality(item) : item.quality
  end

  def increase_if_five_to_zero(item)
    backstage_sell_in_less_than_five(item) ? increase_quality(item) : item.quality
  end

  def item(item)
    item.name != AGED_BRIE && item.name != BACKSTAGE_PASS && item.name != SULFURAS
  end

end
