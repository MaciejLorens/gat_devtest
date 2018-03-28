json.array! @locations do |location|
  json.id location.id
  json.name location.name
  json.external_id location.external_id
end
