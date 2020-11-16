class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer    :item_name_id, null: false
      t.integer    :tpo_id
      t.text       :color_pattern
      t.string     :season
      t.integer    :material_id
      t.date       :wore_date
      t.date       :cleaned_date
      t.text       :memo
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
