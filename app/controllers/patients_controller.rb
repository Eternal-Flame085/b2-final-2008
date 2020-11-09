class PatientsController < ApplicationController
  def index
    @patients = Patient.patients_by_age
    require "pry"; binding.pry
  end
end
