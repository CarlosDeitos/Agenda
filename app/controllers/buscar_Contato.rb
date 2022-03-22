class BuscarContatoController < ApplicationController
    def pesquisar
        @pesquisaConatatos = @usuario_logado.contatos.find_by_nome(params[:contato_nome])
    end
end