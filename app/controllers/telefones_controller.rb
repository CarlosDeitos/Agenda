class TelefonesController < ApplicationController
    def index
        @contato = @usuario_logado.contatos.find_by_id(params[:contato_id])
        @telefones = @contato.telefones.order(:numero)
        @escondeEditarExcluir = 0
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
        @telefone = @usuario_logado.contatos.find_by_id(params[:contato_id]).telefones.find_by_id(params[:id])
    end    

    def update
        @telefone = @usuario_logado.contatos.find_by_id(params[:contato_id]).telefones.find_by_id(params[:id])
        if @telefone.update_attributes(params[:telefone])
           redirect_to contato_path(params[:contato_id]) 
        else
           render 'edit' 
        end    
    end

    def destroy
        @telefone = @usuario_logado.contatos.find_by_id(params[:contato_id]).telefones.find_by_id(params[:id])
        @telefone.destroy
        redirect_to contato_path(params[:contato_id]) 
    end
end