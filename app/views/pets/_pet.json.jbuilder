json.extract! pet, :id, :name, :alive, :date_of_death, :user_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
