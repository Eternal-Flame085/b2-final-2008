require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the patient index page' do
    before(:each) do
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
    end

    it "I see the names of all the patients listed from oldest to youngest" do
      visit '/patients'
      
      expect(page).to have_content("Name: #{@patient_2.name} Age: #{@patient_2.age}")
      expect(page).to have_content("Name: #{@patient_3.name} Age: #{@patient_3.age}")
      expect(page).to have_content("Name: #{@patient_1.name} Age: #{@patient_1.age}")
      expect(page).to have_content("Name: #{@patient_4.name} Age: #{@patient_4.age}")
    end
  end
end
