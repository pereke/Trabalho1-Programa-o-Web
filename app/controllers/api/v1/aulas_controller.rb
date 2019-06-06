module Api
  module V1
    class AulasController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        aulas = Aula.order('id DESC')
        render json: {status: 'SUCCESS', message: 'Aulas carregadas', data: aulas}, status: :ok
      end

      def show
        aulas = Aula.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Aula carregada', data: aula}, status: :ok
      end

      def create
        aula = Aula.new(aula_params)

        if aula.save
          render json: {status: 'SUCCESS', message: 'Aula salva', data: aula}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Aula nao salva', data: aula.errors},
          status: :unprocessable_entity
        end
      end

      def destroy
        aula = Aula.find(params[:id])
        aula.destroy
        render json: {status: 'SUCCESS', message: 'Aula destruida', data: aula}, status: :ok
      end

      def update
        aula = Aula.find(params[:id])
        if aula.update_attributes(aula_params)
          render json: {status: 'SUCCESS', message: 'Aula atualizada', data: aula}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Aula nao atualizada', data: aula.errors},
          status: :unprocessable_entity
        end
      end

      private

      def aula_params
        params.permit(:nomeAula, :categoria, :materialDidatico, :quantidade)
      end
    end
  end
end
