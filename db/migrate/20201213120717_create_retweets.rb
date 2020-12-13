class CreateRetweets < ActiveRecord::Migration[6.0]
  def change
    create_table :retweets do |t|
      t.references :user, null: false, index: true
      t.references :tweet, null: false, index: true
      t.timestamps
    end
    add_index :retweets, [:tweet_id, :user_id]
  end
end
