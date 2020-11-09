class AddDoctorPatientToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :doctor_patient, foreign_key: true
  end
end
