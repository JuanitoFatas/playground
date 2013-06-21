def leap?(year)
  ((year % 4).zero?) and
    (((year % 400).zero?) or (!((year % 100).zero?)))
end

def days_in_month(m, y)
  if leap?(y) and m == 2
    29
  else
    [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m]
  end
end

for y in (2011..2013)
  puts "year: #{y}"

  for m in (1..12)
    puts "#{m} #{days_in_month(m, y)}"
  end
end