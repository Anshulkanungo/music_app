class AddUserReferencesToMusics < ActiveRecord::Migration[6.1]
  def change
    add_reference :musics, :user, foreign_key: true
  end
end
