module Api
  module V1
    class AulasController < ApplicationController
      before_action :authorize_access_request!

      def index
        aulas = Aula.order('id DESC')
        render json: {status: 'SUCCESS', message: 'Aulas carregadas', data: aulas}, status: :ok
      end

      def show
        aula = Aula.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Aula carregada', data: aula}, status: :ok
      end

      def create
        aula = Aula.new(aula_params)
        attach_main_material(aula) if aula_params[:materialDidatico].present?

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
          attach_main_material(aula) if aula_params[:materialDidatico].present?
          render json: {status: 'SUCCESS', message: 'Aula atualizada', data: aula}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Aula nao atualizada', data: aula.errors},
          status: :unprocessable_entity
        end
      end

      private

      def attach_main_material(aula)
        aula.materialDidatico.attach(aula_params[:materialDidatico])
      end

      def aula_params
        params.permit(:nomeAula, :categoria, :materialDidatico, :quantidade)
      end
    end
  end
end
