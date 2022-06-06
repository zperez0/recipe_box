class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredient
      t.string :instruction
      t.string :content_body
      t.integer :rating

      t.timestamps
    end
  end
end