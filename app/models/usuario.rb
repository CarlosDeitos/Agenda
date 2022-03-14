class Usuario < ActiveRecord::Base
    #Quando está no banco, caso o dado não estive usa-se attr_accessor
    attr_accessible :nome, :email, :login, :senha, :chave1, :chave2, :nova_senha, :confirma_senha
    #não será gravado no banco
    attr_accessor :nova_senha, :confirma_senha 

    #Validação de campos com preenchimento orbigatório
    validates :nome, :email, :login, presence: true
    #Validação que o campo login deve ser único na tabela de usuários (BD)
    validates :login, uniqueness: true

    validates :email, format: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

    validate :valida_senha

    before_save :criptografa_senha

    has_many :contatos, dependent: :destroy  #relação entre os modelos

    private

    def criptografa_senha
        return if self.nova_senha.blank?
        self.chave1 = rand(9999)
        self.chave2 = rand(9999)
        self.senha  = "#{self.chave1}#{self.nova_senha}#{self.chave2}"
    end

    def valida_senha
        return if self.nova_senha == self.confirma_senha
        self.errors.add(:nova_senha, 'Senha e confirmação devem ser iguais.')
    end
end
