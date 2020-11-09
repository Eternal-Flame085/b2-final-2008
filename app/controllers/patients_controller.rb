class PatientsController < ApplicationController
  def index
    @patients = Patient.patients_by_age
  end
end
