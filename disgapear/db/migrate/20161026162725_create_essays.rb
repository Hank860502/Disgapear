class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
    	t.string :topic
    	t.string :description
    	t.string :original
    	t.string :revision
    	t.integer :word_limit


      t.timestamps null: false
    end
  end
end
