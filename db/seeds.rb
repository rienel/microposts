require "csv"

# pref
CSV.foreach('db/pref.csv') do |row|
  Prefectural.create(:id => row[0], :name => row[1])
end