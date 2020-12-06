class CreateProfileBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_boards do |t|
      t.references         :profile,         foreign_key: true
      t.references         :board,           foreign_key: true
      t.timestamps
    end
  end
end
