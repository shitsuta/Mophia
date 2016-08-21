class CreateSubAnswers < ActiveRecord::Migration
  def change
    create_table :sub_answers do |t|
      t.integer :user_id
      t.integer :answer_id
      t.text 	:subAnswer
      t.timestamps
    end
  end
end
