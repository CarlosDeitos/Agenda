class UsuariosController < ApplicationController
    def index
        @usuarios = Usuario.order(:nome)
    end    

    def new
        @usuario = Usuario.new
    end

    def create
        @usuario = Usuario.new(params[:usuario])
        if @usuario.save
           redirect_to usuarios_path
        else
           render 'new'
        end       
    end

    def show
        @usuario = Usuario.find_by_id(params[:id])
        redirect_to usuarios_path unless @usuario #o mesmo que if not (if !)
    end

    def edit
        @usuario = Usuario.find_by_id(params[:id])
        redirect_to usuarios_path unless @usuario
    end

    def update
        @usuario = Usuario.find_by_id(params[:id])
        if @usuario.update_attributes(params[:usuario])
            redirect_to usuarios_path
        else
            render 'edit'     
        end    
    end

    def destroy
        @usuario = Usuario.find_by_id(params[:id])
        @usuario.destroy
        redirect_to usuarios_path
    end

end

