class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.string :name
      t.integer :id_usuario #id del usuario al que comienzan a seguir
      t.references :user
      t.timestamps
    end
  end
end
