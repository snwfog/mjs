class CreateTutorlines < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorlines do |t|

      t.timestamps
    end
  end
end
