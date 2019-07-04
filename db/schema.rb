# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_02_194620) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "categoria"
    t.string "curso"
    t.string "matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alunos_projetos", id: false, force: :cascade do |t|
    t.integer "aluno_id"
    t.integer "projeto_id"
    t.index ["aluno_id"], name: "index_alunos_projetos_on_aluno_id"
    t.index ["projeto_id"], name: "index_alunos_projetos_on_projeto_id"
  end

  create_table "aulas", force: :cascade do |t|
    t.string "nomeAula"
    t.string "categoria"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "nomeProfessor"
    t.text "formacao"
    t.string "password_digest"
    t.string "sala"
    t.string "email"
    t.string "telefone"
    t.string "grupoPesquisa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projetos", force: :cascade do |t|
    t.string "nomeProjeto"
    t.integer "inicio"
    t.integer "termino"
    t.text "resumo"
    t.text "documento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publicacaos", force: :cascade do |t|
    t.string "nomePublicacao"
    t.string "categoria"
    t.string "arquivoBib"
    t.string "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
