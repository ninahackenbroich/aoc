
# (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won)
CHOICES = {
  "A" => 1,
  "B" => 2,
  "C" => 3,
  "X" => "lose",
  "Y" => "draw",
  "Z" => "win",
  1 => 1,
  2 => 2,
  3 => 3
}



require "csv"
csv_file   = File.join(__dir__, 'input.csv')
points = 0
CSV.foreach(csv_file) do |row|
  p_1 = row[0].split(" ")[0]
  p_2 = row[0].split(" ")[1]
  # p p_1
  # p p_2
  unless p_1.nil?
    score_1 = CHOICES[p_1]
    score_2 = CHOICES[p_2]
    # p score_1
    # p score_2
    if p_2 == "Z"
      if p_1 == "A"
        points += (2 + 6)
      elsif p_1 =="B"
        points += (3 + 6)
      else
        points += (1 + 6)
      end
    elsif p_2 == "X"
      if p_1 == "A"
        points += 3
      elsif p_1 == "B"
        points += 1
      else
        points += 2
      end
    else
      points += (score_1 + 3)
    end
  end
end

p points
