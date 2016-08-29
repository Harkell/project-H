json.array!(@positions) do |position|
  json.extract! position, :id, :ticker, :name, :date, :amount, :active
  json.url position_url(position, format: :json)
end
