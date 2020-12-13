class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, index: true
      t.text :message
      t.string :location
      t.integer :parent_id
      t.timestamps
    end
  end
end
