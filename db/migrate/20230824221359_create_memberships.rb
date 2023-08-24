class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.string :gym_id
      t.string :client_id
      t.integer :charge

      t.timestamps
    end
  end
end
