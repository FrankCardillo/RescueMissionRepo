class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :asker, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
