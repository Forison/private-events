FactoryBot.define do 
  factory :attendance, class: "Attendance" do 
    user_id {1}
    event_id {1}
    invitation{false}
    invited_by {1}
  end
end