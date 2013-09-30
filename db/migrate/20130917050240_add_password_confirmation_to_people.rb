class AddPasswordConfirmationToPeople < ActiveRecord::Migration
  def change
    add_column :people, :password_confirmation, :string
  end
end
