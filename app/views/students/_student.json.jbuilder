json.extract! student, :id, :name, :lastname, :profile_image, :cover_photo, :description, :university, :career, :year, :country, :region, :commune, :phono, :state, :created_at, :updated_at
json.url student_url(student, format: :json)
