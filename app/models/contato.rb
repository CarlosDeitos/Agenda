class Contato < ActiveRecord::Base
    #Quando está no banco, caso o dado não estive usa-se attr_accessor
    attr_accessible :nome, :email, :usuario_id

    #Validação de campos com preenchimento orbigatório
    validates :nome, :email, :usuario_id, presence: true

    validates :email, format: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

    belongs_to :usuario #relação entre os modelos

    has_many :telefones, dependent: :destroy  #relação entre os modelos        

    before_save :upper_campos

    validate :nomes_invalidos

    scope :join_telefone_principal, select('contatos.id, contatos.nome, contatos.email, telefones.numero').joins('LEFT JOIN telefones ON telefones.contato_id = contatos.id and telefones.principal = true').order(:nome)
    scope :pesquisa_por_nome, -> (contato_nome) { where('contatos.nome = ?', contato_nome)}
    scope :pesquisa_por_nome_parcial, -> (contato_nome) { where('contatos.nome like ?',  '%' + contato_nome + '%' )}

    # scope :ordenar_por_id, order(:id)

    def upper_campos
        self.nome = self.nome.upcase
    end

    def nomes_invalidos
        return if (self.nome != 'TESTE')
        self.errors.add(:nome, 'Nome inválido.')        
    end

end

