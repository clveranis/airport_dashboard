class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :name, index: true
      t.string :iata_code, index: true
      t.string :description
      t.decimal :temperature, precision: 20, scale: 15
      t.decimal :relative_humidity, precision: 20, scale: 15
      t.decimal :wind_speed, precision: 20, scale: 15
      t.decimal :long, precision: 20, scale: 15
      t.decimal :lat, precision: 20, scale: 15
      t.integer :wind_direction
      t.string :time_zone
      t.string :data_time
      t.boolean :show_on_dashboard
      t.timestamps
    end
  end
end
