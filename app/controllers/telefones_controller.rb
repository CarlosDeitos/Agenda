class TelefonesController < ApplicationController
    def index

    end

    def new
        @telefone = @usuario_logado.contatos.find_by_id(params[:contato_id]).telefones.new
    end

    def show
    end

    def create
        @telefone = @usuario_logado.contatos.find_by_id(params[:contato_id]).telefones.new(params[:telefone])
        if @telefone.save
           redirect_to contato_path(params[:contato_id])
        else
           render 'new'
        end       
    end

    def edit
    end    

    def update
    end

    def destroy
    end
end