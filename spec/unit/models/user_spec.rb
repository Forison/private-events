require 'rails_helper'

RSpec.describe User, type: :model do

  
  let(:user){User.create(name: "juan", email: "bolo@g.com", password: "123456")}
  let(:event){Event.create(name: "whatever" , date: "10/03/2019",
     description: "whatever whatever", event_title: "ok", user_id: 1)}
  let(:attendance){Attendance.create(user_id: 1 , event_id: 8)}



  it "has a name" do 
    expect(user.name).not_to be_nil
  end

  it "has an email" do 
    expect(user.email).not_to be_nil
  end

  it "has a password" do 
    expect(user.password).not_to be_nil 
  end

  it "creates a new user" do 
    expect{user}.to change{User.count}.by(1)
  end 

  context "When submitting invalid forms" do

    it "doesn't allow names longer than 20 characters" do
      user.name = "a"*21
      user.save
      expect(user.errors.full_messages.include?"Name is too long (maximum is 20 characters)"). to eq(true)
    end

    it "doesn't allow passwords shorter than 3 characters" do
        user.password = 1 
        user.save 
        expect(user.errors.full_messages.include?"Password is too short (minimum is 3 characters)").to eq(true)
    end

    it "doesn't allow emails longer than 255 characters" do
      user.email = "a"*256
      user.save 
      expect(user.errors.full_messages.include?"Email is too long (maximum is 255 characters)").to eq(true)
    end

    it "does not allow incorrect emails" do
      user.email = "aaa.com"
      expect(user.valid?). to eq(false)
    end

  end

  context "When creating a new event" do
    it "increases the number of events associated to an user by one unit" do
      us = User.reflect_on_association(:events)
      expect(us.macro).to eq(:has_many)
    end
  end 


  context "When creating new attendances" do

    it "increases the number of attendances associated to the user by one unit" do
      us = User.reflect_on_association(:attendances)
      expect(us.macro).to eq(:has_many)
    end
  end 



end
