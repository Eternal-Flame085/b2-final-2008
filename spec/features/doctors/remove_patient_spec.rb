require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a doctors show page' do
    before(:each) do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @alex = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: @hospital)

      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)

      DoctorPatient.create!(doctor_id: @alex.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @alex.id, patient_id: @patient_2.id)
    end

    it "I see a a button to remove that patient from the doctor" do
      visit "/doctors/#{@alex.id}"

      within id="#patient-#{@patient_1.id}" do
        expect(page).to have_button("Remove Patient")
      end

      within id="#patient-#{@patient_2.id}" do
        expect(page).to have_button("Remove Patient")
      end
    end

    it "When I click on the button i am brought back to the doctor show page and the patient is no longer listed" do
      visit "/doctors/#{@alex.id}"

      within id="#patient-#{@patient_1.id}" do
        click_button 'Remove Patient'
      end

      expect(current_path).to eq("/doctors/#{@alex.id}")

      within id="#patients" do
        expect(page).to_not have_css("#patient-#{@patient_1.id}")
      end

      within id="#patients" do
        expect(page).to have_css("#patient-#{@patient_2.id}")
      end
    end
  end
end
