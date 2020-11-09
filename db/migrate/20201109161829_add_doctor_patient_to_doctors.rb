class AddDoctorPatientToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :doctor_patient, foreign_key: true
  end
end
