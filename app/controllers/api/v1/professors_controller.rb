module Api
  module V1
    class ProfessorsController < ApplicationController
      before_action :authorize_access_request!

      def index
        professors = Professor.order('id DESC')
        render json: {status: 'SUCCESS', message: 'Professores carregados', data: professors}, status: :ok
      end

      def show
        professor = Professor.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Professor carregado', data: professor}, status: :ok
      end

      def create
        professor = Professor.new(professor_params)

        if professor.save
          render json: {status: 'SUCCESS', message: 'Professor salvo', data: professor}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Professor nao salvo', data: professor.errors},
           status: :unprocessable_entity
        end
      end

      def destroy
        professor = Professor.find(params[:id])
        professor.destroy
        render json: {status: 'SUCCESS', message: 'Professor destruido', data: professor}, status: :ok
      end

      def update
        professor = Professor.find(params[:id])
        if professor.update_attributes(professor_params)
          render json: {status: 'SUCCESS', message: 'Professor atualizado', data: professor}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Professor nao atualizado', data: professor.errors},
           status: :unprocessable_entity
        end

      end

      private

      def professor_params
        params.require(:professor).permit(:nomeProfessor, :formacao, :sala, :email, :telefone, :password, :id, :grupoPesquisa)
      end
    end
  end
end
