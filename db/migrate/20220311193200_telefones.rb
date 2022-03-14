class Telefones < ActiveRecord::Migration
  def change
    create_table :telefones do |t|
      t.string  :numero
      t.string  :principal
      t.integer :contato_id
      t.timestamps 
    end
  end
end
