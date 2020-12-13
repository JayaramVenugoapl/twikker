class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, :default => "", :null => false
      t.string :username, :default => "", :null => false
      t.string :email, :default => "", :null => false, index: true
      t.string :password_digest, :default => "", :null => false
      t.string :about
      t.string :location
      t.string :website
      t.date :date_of_birth
      t.integer :tweets_count, :default => 0, :null => false
      t.integer :followers_count, :default => 0, :null => false
      t.integer :following_count, :default => 0, :null => false
      t.timestamps
    end
  end
end
