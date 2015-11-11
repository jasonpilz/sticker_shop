class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_sticker(sticker_id)
    contents[sticker_id.to_s] ||= 0
    contents[sticker_id.to_s] += 1
  end

  def total_quantity
    contents.values.sum
  end

  def total_price
    stickers = contents.keys.map do |k|
      Sticker.where(id: k.to_i)
    end
  end

  def count_of(sticker_id)
    contents[sticker_id.to_s]
  end
end