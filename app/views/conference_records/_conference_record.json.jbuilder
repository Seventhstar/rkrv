json.extract! conference_record, :id, :name, :description, :parent_id, :user_id, :department_id, :admin, :date_create, :date_update, :created_at, :updated_at
json.url conference_record_url(conference_record, format: :json)
