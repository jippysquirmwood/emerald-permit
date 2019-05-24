class CreatePermits < ActiveRecord::Migration[5.2]
  def change
    create_table :permits do |t|
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.string :permit_type
      t.string :level
      t.string :location
      t.string :project_id
      t.string :permit_number
      t.string :method_statement
      t.float :xwidth
      t.float :xlength
      t.float :xdepth
      t.boolean :gas
      t.boolean :fibre_optic
      t.boolean :water
      t.boolean :unknown
      t.boolean :hv_electricity
      t.boolean :bt
      t.boolean :traffic_signal
      t.boolean :signal_cable
      t.boolean :lv_electricity
      t.boolean :drains
      t.boolean :street_lighting
      t.boolean :no_services
      t.boolean :hand_digging
      t.boolean :confirm_work_package_plan
      t.boolean :confirm_machine_operator
      t.boolean :services_protected
      t.boolean :exlusion_zone
      t.boolean :buried_cables_identified
      t.boolean :drawing_updated
      t.boolean :physical_barrier_available
      t.boolean :excavation_undermining_foundations
      t.string :project_manager_phone
      t.string :cat_scan_model
      t.string :genny_model
      t.datetime :calibration_expires
      t.string :cat_scanner_serial
      t.string :genny_serial
      t.string :cat_genny_operator
      t.boolean :cat_mode_power
      t.boolean :cat_mode_radio
      t.boolean :cat_mode_transmitter
      t.text :works_description
      t.references :author
      t.references :approver

      t.timestamps
    end
      add_foreign_key :permits, :users, column: :author_id, primary_key: :id
      add_foreign_key :permits, :users, column: :approver_id, primary_key: :id
  end
end
