json.extract! aluno, :id, :idAluno, :nome, :categoria, :curso, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
