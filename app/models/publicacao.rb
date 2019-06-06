class Publicacao < ApplicationRecord
    validates :nomePublicacao, presence: true
    validates :categoria, presence: true
end
