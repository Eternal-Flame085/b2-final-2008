class RemoveDoctorPatientFromDoctors < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :doctor_patient_id, :string
  end
end
