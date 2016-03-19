class CreateNarrators < ActiveRecord::Migration[5.0]
  def change
    create_table :narrators do |t|
      t.string :name
    end
  end
end
