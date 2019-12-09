class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :comments
      t.integer :commentor_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
