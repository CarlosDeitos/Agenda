class LoginController < ApplicationController
    def login
        
    end  
    
    def logar
        usuario = Usuario.find_by_login(params[:login])
        if usuario && "#{usuario.chave1}#{params[:senha]}#{usuario.chave2}" == usuario.senha
           cookies.permanent.signed[:login_agenda] = usuario.login
           redirect_to usuarios_path
        else
            render 'login'    
        end
    end

    def logout
        cookies.delete(:login_agenda)
        render 'login'
    end

end