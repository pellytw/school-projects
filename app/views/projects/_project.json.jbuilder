json.extract! project, :id, :title, :description, :category, :status, :starts_on, :ends_on, :school_id, :created_at, :updated_at
json.url project_url(project, format: :json)
