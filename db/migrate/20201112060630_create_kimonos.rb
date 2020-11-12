class CreateKimonos < ActiveRecord::Migration[6.0]
  def change
    create_table :kimonos do |t|

      t.timestamps
    end
  end
end
