class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :description
      t.string :title

      t.timestamps null: false
    end
  end
end
