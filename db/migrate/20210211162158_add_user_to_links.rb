class AddUserToLinks < ActiveRecord::Migration[6.1]
  def change
    add_reference :links, :user
  end
end
