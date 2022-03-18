class ChangeColumnPrincipalTelefones < ActiveRecord::Migration
  def up
    remove_column :telefones, :principal
    add_column :telefones, :principal, :boolean
  end

  def down
    remove_column :telefones, :principal
    add_column :telefones, :principal, :string
  end
end
