
FactoryGirl.define do
  factory :contact, :class => Refinery::Contacts::Contact do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

