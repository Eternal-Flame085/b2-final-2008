require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a doctors show page' do
    before(:each) do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @alex = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: @hospital)
      @miranda = Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital: @hospital)
      @derek = Doctor.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania', hospital: @hospital)
      @meredith = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: @hospital)

      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)

      DoctorPatient.create!(doctor_id: @alex.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @alex.id, patient_id: @patient_2.id)
      DoctorPatient.create!(doctor_id: @miranda.id, patient_id: @patient_2.id)
      DoctorPatient.create!(doctor_id: @derek.id, patient_id: @patient_3.id)
      DoctorPatient.create!(doctor_id: @meredith.id, patient_id: @patient_4.id)
    end

    it "I see all of that doctors information(name, specialty, university, hospital)" do

      visit "/doctors/#{@alex.id}"

      within id="#doctor-info" do
        expect(page).to have_content(@alex.name)
        expect(page).to have_content(@alex.specialty)
        expect(page).to have_content(@alex.university)
        expect(page).to have_content(@hospital.name)
      end

      visit "/doctors/#{@miranda.id}"

      within id="#doctor-info" do
        expect(page).to have_content(@miranda.name)
        expect(page).to have_content(@miranda.specialty)
        expect(page).to have_content(@miranda.university)
        expect(page).to have_content(@hospital.name)
      end
      visit "/doctors/#{@derek.id}"

      within id="#doctor-info" do
        expect(page).to have_content(@derek.name)
        expect(page).to have_content(@derek.specialty)
        expect(page).to have_content(@derek.university)
        expect(page).to have_content(@hospital.name)
      end

      visit "/doctors/#{@meredith.id}"

      within id="#doctor-info" do
        expect(page).to have_content(@meredith.name)
        expect(page).to have_content(@meredith.specialty)
        expect(page).to have_content(@meredith.university)
        expect(page).to have_content(@hospital.name)
      end
    end

    it "I see all the patients the doctors have" do
      visit "/doctors/#{@alex.id}"

      within id="#patients" do
        expect(page).to have_content(@patient_1.name)
        expect(page).to have_content(@patient_2.name)
      end

      visit "/doctors/#{@miranda.id}"

      within id="#patients" do
        expect(page).to have_content(@patient_2.name)
      end

      visit "/doctors/#{@derek.id}"

      within id="#patients" do
        expect(page).to have_content(@patient_3.name)
      end

      visit "/doctors/#{@meredith.id}"

      within id="#patients" do
        expect(page).to have_content(@patient_4.name)
      end
    end
  end
end
