class CreateUsuarios < ActiveRecord::Migration
  # def up
  #   create_table :usuarios do |t|
  #     t.string :nome
  #     t.string :email
  #     t.string :login
  #     t.string :senha
  #     t.string :chave1
  #     t.string :chave2
  #     t.timestamps 
  #   end
  # end

  # def down
  #   drop_table :usuarios
  # end

  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :login
      t.string :senha
      t.string :chave1
      t.string :chave2
      t.timestamps 
    end
  end

end
