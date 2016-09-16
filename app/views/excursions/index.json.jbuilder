json.array!(@excursions) do |excursion|
  json.extract! excursion, :id
  json.url excursion_url(excursion, format: :json)
end
