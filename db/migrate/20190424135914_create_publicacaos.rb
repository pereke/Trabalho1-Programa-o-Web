class CreatePublicacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :publicacaos do |t|
      t.string :nomePublicacao
      t.string :categoria
      t.string :arquivoBib
      t.string :data

      t.timestamps
    end
  end
end
