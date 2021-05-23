class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :title,       null: false
      t.text       :content,     null: false
      t.integer    :category_id, null: false
      t.text       :url,         null: false
      t.text       :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
