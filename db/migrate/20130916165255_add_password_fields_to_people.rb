class AddPasswordFieldsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :password, :string
    add_column :people, :password_digest, :string
    add_column :people, :password_confirmation, :string

  end
end
