require 'rails_helper'

RSpec.describe Attendance, type: :model do

  let(:attendance) { Attendance.create(user_id: 1, event_id: 1) }


  it "has a user_id assigned" do  
    expect(attendance.user_id).not_to be_nil 
  end

  it "has a event_id assigned" do   
    expect(attendance.event_id).not_to be_nil 
  end 



  it "should belong_to user" do
      expect(Attendance.reflect_on_association(:user).macro).to eq :belongs_to
      expect(Attendance.column_names).to include "user_id"
  end



  it "should belong_to event" do
    expect(Attendance.reflect_on_association(:event).macro).to eq :belongs_to
    expect(Attendance.column_names).to include "event_id"
end

end
