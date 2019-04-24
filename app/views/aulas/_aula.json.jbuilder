json.extract! aula, :id, :nomeAula, :categoria, :quantidade, :created_at, :updated_at
json.url aula_url(aula, format: :json)
