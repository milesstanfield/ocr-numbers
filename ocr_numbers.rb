class OCR
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert
    codes_array(text).inject('') do |char, code|
      char << (number_codes.key(code) || '?')
    end
  end

  private

  def number_codes
    {
      '0' => " _ \n| |\n|_|\n   ",
      '1' => "   \n  |\n  |\n   ",
      '2' => " _ \n _|\n|_ \n   ",
      '3' => " _ \n _|\n _|\n   ",
      '4' => "   \n|_|\n  |\n   ",
      '5' => " _ \n|_ \n _|\n   ",
      '6' => " _ \n|_ \n|_|\n   ",
      '7' => " _ \n  |\n  |\n   ",
      '8' => " _ \n|_|\n|_|\n   ",
      '9' => " _ \n|_|\n _|\n   "
    }
  end

  def codes_array(text)
    rows = text.split("\n")
    font_count = rows[0].size / 3
    numbers_array = font_count.times.inject([]) do |array, index|
      line = rows.map {|row| row.chars.each_slice(3).map(&:join)[index] }.join("\n")
      array << line
    end
  end
end
