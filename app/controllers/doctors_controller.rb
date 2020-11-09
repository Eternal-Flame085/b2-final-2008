class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:doctor_id])
  end

  def remove_patient
    doctor_patiant_relation = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    doctor_patiant_relation.destroy

    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
