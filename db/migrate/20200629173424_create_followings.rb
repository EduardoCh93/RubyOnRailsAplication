class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.string :name
      t.integer :id_usuario #id del usuario que comienza a seguir a otro
      t.references :user
      t.timestamps
    end
  end
end
