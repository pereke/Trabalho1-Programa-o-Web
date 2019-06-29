module Api
  module V1
    class ProjetosController < ApplicationController
      before_action :authorize_access_request!

      def index
        projetos = Projeto.order('id DESC')
        render json: {status: 'SUCCESS', message: 'Projetos de Pesquisa carregados', data: projetos}, status: :ok
      end

      def show
        projeto = Projeto.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Projeto de Pesquisa carregado', data: projeto}, status: :ok
      end

      def create
        projeto = Projeto.new(projeto_params)

        if projeto.save
          render json: {status: 'SUCCESS', message: 'Projeto de Pesquisa salvo', data: projeto}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Projeto de Pesquisa nao salvo', data: projeto.errors},
          status: :unprocessable_entity
        end
      end

      def destroy
        projeto = Projeto.find(params[:id])
        projeto.destroy
        render json: {status: 'SUCCESS', message: 'Projeto de Pesquisa destruido', data: projeto}, status: :ok
      end

      def update
        projeto = Projeto.find(params[:id])
        if projeto.update_attributes(projeto_params)
          render json: {status: 'SUCCESS', message: 'Projeto de Pesquisa atualizado', data: projeto}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Projeto de Pesquisa nao atualizado', data: projeto.errors},
          status: :unprocessable_entity
        end
      end

      private

      def projeto_params
        params.permit(:nomeProjeto, :inicio, :termino, :documento, :resumo)
      end
    end
  end
end
