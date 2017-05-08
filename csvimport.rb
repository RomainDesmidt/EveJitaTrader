require 'csv'
buyorder = []
sellorder = []
csv_text = File.read('data.txt')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  if row[7] == "True"
    buyorder << row.to_hash
  else
    sellorder << row.to_hash
  end
end

# puts "----------------------"
# puts "SELL ORDER"
# puts "----------------------"
# puts sellorder.first
# puts ""
# puts "----------------------"
# puts "BUY ORDER"
# puts "----------------------"
# puts buyorder.first
firstsellorder = sellorder.first['price'].to_f
firstbuyorder = buyorder.first['price'].to_f
#puts firstsellorder
#puts firstbuyorder
range = firstsellorder - firstbuyorder
#puts (range / firstbuyorder) * 100
buywithtax = (firstbuyorder + 0.01) + (firstbuyorder * 0.0238)
puts "premier BO : #{firstbuyorder} \nachat avec buy tax : #{buywithtax}"
puts ""
sellwithtax = (firstsellorder - 0.01) - (firstsellorder * 0.0338)
puts "premier SO : #{firstsellorder} \nvente avec sell tax : #{sellwithtax}"
#puts big_array
mil = 1000000
roi = sellwithtax - buywithtax
roilisible = (roi/mil).round(2)
if roi < 0
  puts "ce produit n'est pas rentable : #{roilisible} mil"
else
  puts "ce produit est rentable : #{roilisible} mil"
end
