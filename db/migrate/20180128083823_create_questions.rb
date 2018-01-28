class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :user_id

      t.timestamps
    end
    add_index :questions, :user_id
  end
end
