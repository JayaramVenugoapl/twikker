class CreateRetweets < ActiveRecord::Migration[6.0]
  def change
    create_table :retweets do |t|
      t.integer :retweeter_id, null: false, index: true
      t.integer :source_tweet_id, null: false, index: true

      t.timestamps
    end
    add_index :retweets, [:source_tweet_id, :retweeter_id]
  end
end
