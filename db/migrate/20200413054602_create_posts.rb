class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string    :title,        null: false
      t.integer   :duration,     null: false
      t.text      :discription,  null: false
      t.integer   :user_id,      null: false, foreign_key: true, dependent: :destroy
      t.timestamps
    end
  end
end
