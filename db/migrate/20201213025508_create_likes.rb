class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, index: true
      t.references :tweet, null: false, index: true
      t.timestamps
    end
  end
end
