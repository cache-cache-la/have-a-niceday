json.array! @entries do |entry|
  json.id entry.id
  json.title entry.title
  json.text entry.text
  json.image entry.image.url
  json.url entry.url
  json.user_id entry.user_id
  json.name entry.user.name
end