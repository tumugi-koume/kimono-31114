class CreateObis < ActiveRecord::Migration[6.0]
  def change
    create_table :obis do |t|

      t.timestamps
    end
  end
end
