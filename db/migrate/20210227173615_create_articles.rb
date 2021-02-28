class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end