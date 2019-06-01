class AddSanear < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :sanear, :string
  end
end
