class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.references :chapter

      t.string :title
      t.string :description
    end
  end
end
