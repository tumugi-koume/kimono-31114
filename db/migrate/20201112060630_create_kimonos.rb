class CreateKimonos < ActiveRecord::Migration[6.0]
  def change
    create_table :kimonos do |t|
      t.integer    :kimono_name_id, null: false
      t.integer    :kimono_genre_id
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
