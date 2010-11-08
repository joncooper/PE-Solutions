# PE#54

@hands = File.open("pe-54.txt").readlines().map(&:chop)

def player_hands(hands_string)
  hands_a = hands_string.split(" ")
  p1 = hands_a[0,5]
  p2 = hands_a[5,5]
  return p1, p2
end

@cards_order = (2..9).to_a << "T" << "J" << "Q" << "K"<< "A"
