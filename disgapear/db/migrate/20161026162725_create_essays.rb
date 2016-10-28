class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.integer :user_id
    	t.string :topic
    	t.string :description
    	t.string :content
    	t.string :revision
    	t.integer :word_limit


      t.timestamps null: false
    end
  end
end
