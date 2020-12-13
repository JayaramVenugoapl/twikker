class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :user, index: true, null: false
      t.integer :following_id, index: true, null: false

      t.timestamps
    end

    add_index :follows, [:user_id, :following_id], unique: true
  end
end
