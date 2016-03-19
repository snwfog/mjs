class CreateTutorlines < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorlines do |t|
      t.references :narrator

      t.integer :num
      t.string :audio
      t.text :english_1
      t.text :english_2
      t.text :foreign_1
      t.text :foreign_2
    end
  end
end
