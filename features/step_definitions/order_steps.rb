Given /the following items in session/ do |items_table|
  session[:items] = {}
  items_table.hashes.each_with_index do |item, index|
    session[:items][index.to_s] = item
  end
  # fail "Unimplemented"
end

Then /^(\d?[1-9]|[1-9]0) items should exist/ do |num|
  vals = session[:items].values
  count = 0
  vals.each do |val|
    count += val['quantity'].to_i
  end
  expect(count).to eq num
end
