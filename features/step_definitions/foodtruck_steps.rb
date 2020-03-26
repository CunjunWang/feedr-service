Given(/^There are following menu items$/) do |menu_item_table|
  menu_item_table.hashes.each_with_index do |item, index|
    Menuitem.new(item).save
  end
end