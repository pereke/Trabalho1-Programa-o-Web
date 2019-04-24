json.extract! publicacao, :id, :nomePublicacao, :categoria, :arquivoBib, :created_at, :updated_at
json.url publicacao_url(publicacao, format: :json)
