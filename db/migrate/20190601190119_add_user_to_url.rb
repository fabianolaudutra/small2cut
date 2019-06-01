class AddUserToUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :userId, :string
  end
end
