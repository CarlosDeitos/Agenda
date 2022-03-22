class ContatosController < ApplicationController
    def index
        @contatos = @usuario_logado.contatos.join_telefone_principal
        @via_pesquisa = 0
        # Debug
        # binding.pry
    end

    def pesquisar
        if params[:contato_nome] != ''
            if params[:contato_nome].include?(' ')
               @contatos = @usuario_logado.contatos.join_telefone_principal.pesquisa_por_nome(params[:contato_nome].upcase)
            else   
               @contatos = @usuario_logado.contatos.join_telefone_principal.pesquisa_por_nome_parcial(params[:contato_nome].upcase) 
            end  
        else
            @contatos = @usuario_logado.contatos.join_telefone_principal
        end    
        @via_pesquisa = 1
        render "index"
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