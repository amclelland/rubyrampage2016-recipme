Unit.define('item') do |item|
  item.definition   = Unit.new('1 kilometer')
  item.aliases      = %w{item}
  item.display_name = 'Item'
end

Unit.redefine!('cup') do |cup|
  cup.display_name  = 'cup'
end

Unit.redefine!('tablespoon') do |tbsp|
  tbsp.display_name  = 'tbsp'
end
