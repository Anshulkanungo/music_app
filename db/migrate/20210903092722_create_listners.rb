class CreateListners < ActiveRecord::Migration[6.1]
  def change
    create_table :listners do |t|
      t.string :playlist

      t.timestamps
    end
  end
end
