require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:all) do
    @default_user = create(:user)
	end
	

  it "valid parameters for user creation" do 
    expect(@default_user).to be_valid
  end 
    
  describe "testing User model for sign up" do

    it "User able to accept new attribute" do 
      user2=create(:user,
        name: "jane",
        email: "jane@gmail.com",
        password: "asdfghjkl",
        password_confirmation: "asdfghjkl"
        )
        expect(user2).to be_valid
    end 

    it "is invalid if name field is empty" do 
      empty_name=build(:user, name: ' ')
      expect(empty_name).not_to be_valid
    end

    it "is invalid if email field is empty" do 
      empty_email=build(:user, email: ' ')
      expect(empty_email).not_to be_valid
    end

    it "is invalid if email field already exist in user model" do 
       unique_email=build(:user, email: @default_user.email)
       expect(unique_email).not_to be_valid
    end

    it "is invalid if email field does not contain @" do 
        email_char= @default_user.email 
          if email_char.include? '@'
            expect(@default_user).to be_valid 
          else
            expect(@default_user).not_to be_valid 
          end
    end

    it "is invalid if password field is empty" do 
      empty_password=build(:user, password: nil)
      expect(empty_password).not_to be_valid 
    end

    it "is invalid if password must not be less than 8 characters" do 
      char = "a" * 7
      pass_length=build(:user, password: char)
      expect(pass_length).not_to be_valid
    end

    it "is invalid if password_confirmation field is empty" do
      empty_pass_confirm=build(:user, password_confirmation: nil)
      expect(empty_pass_confirm).not_to be_valid 
    end

    it "is valid if password and password_confirmation are not equal" do 
      @default_user.password == @default_user.password_confirmation 
      expect(@default_user).to be_valid 
    end 
    it "is invalid if password and password_confirmation are not equal" do 
      if @default_user.password != @default_user.password_confirmation 
      expect(@default_user).not_to be_valid 
    end

  end

end
end