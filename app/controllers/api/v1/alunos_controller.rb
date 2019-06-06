module Api
  module V1
    class AlunosController < ApplicationController
      # before_action :set_aluno, only: [:show, :edit, :update, :destroy]
      skip_before_action :verify_authenticity_token

      def index
        alunos = Aluno.order('id DESC')
        render json: {status: 'SUCCESS', message: 'Alunos carregados', data: alunos}, status: :ok
      end

      def show
        aluno = Aluno.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Aluno carregado', data: aluno}, status: :ok
      end

      def create
        aluno = Aluno.new(aluno_params)

        if aluno.save
          render json: {status: 'SUCCESS', message: 'Aluno salvo', data: aluno}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Aluno nao salvo', data: aluno.errors},
           status: :unprocessable_entity
        end
      end

      def destroy
        aluno = Aluno.find(params[:id])
        aluno.destroy
        render json: {status: 'SUCCESS', message: 'Aluno destruido', data: aluno}, status: :ok
      end

      def update
        aluno = Aluno.find(params[:id])
        if aluno.update_attributes(aluno_params)
          render json: {status: 'SUCCESS', message: 'Aluno atualizado', data: aluno}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Aluno nao atualizado', data: aluno.errors},
          status: :unprocessable_entity
        end
      end

      private

      def aluno_params
        params.permit(:nome, :categoria, :curso)
      end
      
    end
  end
end
