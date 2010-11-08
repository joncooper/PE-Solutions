# PE#17

@words = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",
}

# Break down into thousands, hundreds, tens, and units

def stringify(i)  
  last_two_digits = i % 100
  hundreds_part = (i / 100.0).truncate
  tens_part = ((i % 100) / 10.0).truncate
  ones_part = i % 10
  
  ret = ""
  case i
    when 1000  
      return "one thousand"
    when 1..20  
      return @words[i]
    when 21..99
      ret << "#{@words[tens_part*10]}"
      ret << "-" if ones_part != 0
      ret << "#{stringify(ones_part)}" if ones_part != 0
    when 100..999
      ret << "#{@words[hundreds_part]} hundred"
      ret << " and " if i % 100 != 0
      ret << stringify(i - (hundreds_part * 100))
  end
  return ret
end

def strip_non_characters(s)
  return s.gsub(/\W/, '')
end

def go
  (1..1000).each { |x| p stringify(x) }
  p (1..1000).inject(0) { |sum, x| sum += strip_non_characters(stringify(x)).length }
end

def s(i)
  p i
  p stringify(i)
  p strip_non_characters(stringify(i))
  p strip_non_characters(stringify(i)).length
end

def l
  load 'pe-17.rb'
end

go