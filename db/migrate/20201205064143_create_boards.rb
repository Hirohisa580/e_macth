class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string        :name,           null: false
      t.integer       :genre_one_id,   null: false
      t.text          :explanation,    null: false
      t.boolean       :checked
      t.timestamps
    end
  end
end
