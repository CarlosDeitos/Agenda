class Contatos < ActiveRecord::Migration
  # def up
  # end

  # def down
  # end

  def change
    create_table :contatos do |t|
      t.string  :nome
      t.string  :email
      t.integer :usuario_id
      t.timestamps 
    end
  end
end
