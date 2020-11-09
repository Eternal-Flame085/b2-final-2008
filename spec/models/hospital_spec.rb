require 'rails_helper'

RSpec.describe Hospital, type: :model do
  it {should have_many :doctors}

  describe 'instance-methods' do
    before(:each) do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @alex = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: @hospital)
      @miranda = Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital: @hospital)
      @derek = Doctor.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania', hospital: @hospital)
      @meredith = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: @hospital)
    end

    it ".doctor_count" do
      expect(@hospital.doctor_count).to eq(4)
    end

    it ".universities" do
      uniqness_check = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: @hospital)
      expect(@hospital.doctor_count).to eq(5)

      expected = [@alex.university, @miranda.university,@derek.university,@meredith.university]
      expect(@hospital.universities).to eq(expected)
      expect(@hospital.universities.count).to eq(4)
    end
  end
end
