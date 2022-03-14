class Telefone < ActiveRecord::Base
    #Quando está no banco, caso o dado não estive usa-se attr_accessor
    attr_accessible :numero, :principal, :contato_id

    #Validação de campos com preenchimento orbigatório
    validates :numero, :principal, :contato_id, presence: true

    belongs_to :contato #relação entre os modelos
end