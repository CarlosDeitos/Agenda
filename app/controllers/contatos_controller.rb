class ContatosController < ApplicationController
    def index
        # @contatos = @usuario_logado.contatos.includes(:telefones).joins(:telefones).where('telefones.principal = true')
        @contatos = @usuario_logado.contatos.select('contatos.id, contatos.nome, contatos.email, telefones.numero as numero').joins('LEFT JOIN telefones ON telefones.contato_id = contatos.id').where(telefones: {principal: true})        

        # Debug
        # binding.pry
    end

    def new
        @contato = @usuario_logado.contatos.new
    end

    def show
        @contato = @usuario_logado.contatos.find_by_id(params[:id])
        @telefones = @contato.telefones.order(:numero)
    end

    def create
        @contato = @usuario_logado.contatos.new(params[:contato])
        if @contato.save
           redirect_to contatos_path
        else
           render 'new'
        end       
    end

    def edit
        @contato = @usuario_logado.contatos.find_by_id(params[:id])
    end    

    def update
        @contato = @usuario_logado.contatos.find_by_id(params[:id])
        if @contato.update_attributes(params[:contato])
            redirect_to contatos_path
        else
            render 'edit'     
        end    
    end

    def destroy
        @contato = @usuario_logado.contatos.find_by_id(params[:id])
        @contato.destroy
        redirect_to contatos_path
    end
end