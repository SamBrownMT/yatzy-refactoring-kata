class Yatzy

  def initialize(d1, d2, d3, d4, d5)
    @dice = [d1, d2, d3, d4, d5]
  end
  
  def chance
    @dice.sum
  end

  def yatzy
    @dice.uniq.length == 1 ? 50 : 0
  end

  def ones
    @dice.count(1)
  end

  def twos
    @dice.count(2) * 2
  end

  def threes
    @dice.count(3) * 3
  end

  def fours
    @dice.count(4) * 4
  end

  def fives
    @dice.count(5) * 5
  end

  def sixes
    @dice.count(6) * 6
  end

  def score_pair
    [6,5,4,3,2,1].each do |at|
      return at * 2 if @dice.count(at) >= 2
    end
    0
  end

  def two_pair
    n = 0
    score = 0
    [6,5,4,3,2,1].each do |at|
      if @dice.count(at) >= 2
        n += 1
        score += at * 2
      end
    end
    n == 2 ? score : 0
  end

  def three_of_a_kind
    [6,5,4,3,2,1].each do |at|
      return at * 3 if @dice.count(at) >= 3
    end
    0
  end

  def four_of_a_kind
    [6,5,4,3,2,1].each do |at|
      return at * 4 if @dice.count(at) >= 4
    end
    0
  end

  def smallStraight
    @dice.sort == [1,2,3,4,5] ? 15 : 0
  end

  def largeStraight
    @dice.sort == [2,3,4,5,6] ? 20 : 0
  end

  def fullHouse
    _2 , _3 = false
    _2_at , _3_at = 0

    [6,5,4,3,2,1].each do |at|
      _2 , _2_at = true , at if @dice.count(at) == 2
    end

    [6,5,4,3,2,1].each do |at|
      _3 , _3_at = true , at if @dice.count(at) == 3
    end

    (_2 and _3) ? _2_at * 2 + _3_at * 3 : 0
  end
end