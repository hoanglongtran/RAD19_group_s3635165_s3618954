class AddMessageToContacts < ActiveRecord::Migration[5.2]
  def change
	add_column :contacts, :message, :string
  end
end
