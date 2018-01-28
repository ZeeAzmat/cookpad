class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :question_id
  end
end
