require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a hospitals show page' do
    before(:each) do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @alex = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: @hospital)
      @miranda = Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital: @hospital)
      @derek = Doctor.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania', hospital: @hospital)
      @meredith = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: @hospital)
    end

    it "I see the hospitals name" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content(@hospital.name)
    end

    it "I see the number of doctors that work at this hospital" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content(@hospital.doctors.count)
    end

    it "I see a list of uniq university's that this hospital" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content(@alex.university)
      expect(page).to have_content(@miranda.university)
      expect(page).to have_content(@derek.university)
      expect(page).to have_content(@meredith.university)
    end
  end
end
