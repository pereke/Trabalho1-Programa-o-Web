module Api
  module V1
    class PublicacaosController < ApplicationController
      # before_action :set_aluno, only: [:show, :edit, :update, :destroy]
      skip_before_action :verify_authenticity_token

      def index
        publicacoes = Publicacao.order('id DESC')
        render json: {status: 'SUCCESS', message: 'Publicacoes carregadas', data: publicacoes}, status: :ok
      end

      def show
        publicacao = Publicacao.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Publicacao carregada', data: publicacao}, status: :ok
      end

      def create
        publicacao = Publicacao.new(publicacao_params)

        if publicacao.save
          render json: {status: 'SUCCESS', message: 'Publicacao salva', data: publicacao}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Publicacao nao salva', data: publicacao.errors},
           status: :unprocessable_entity
        end
      end

      def destroy
        publicacao = Publicacao.find(params[:id])
        publicacao.destroy
        render json: {status: 'SUCCESS', message: 'Publicacao destruida', data: publicacao}, status: :ok
      end

      def update
        publicacao = Publicacao.find(params[:id])
        if publicacao.update_attributes(publicacao_params)
          render json: {status: 'SUCCESS', message: 'Publicacao atualizada', data: publicacao}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Publicacao nao atualizada', data: publicacao.errors},
          status: :unprocessable_entity
        end
      end

      private

      def publicacao_params
        params.permit(:nomePublicacao, :categoria, :arquivoBib)
      end
      
    end
  end
end
