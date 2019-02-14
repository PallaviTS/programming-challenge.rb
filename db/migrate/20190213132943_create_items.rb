class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :read, default: false
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
