FactoryBot.define do 
  factory :user, aliases: [:host,:guest], class: "User" do 
    name  {"john"}
    sequence(:email) { |n| "john#{n}@gmail.com" }
    password {"qwertyuiop"}
    password_confirmation {"qwertyuiop"}
  end
end

