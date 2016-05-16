
FactoryGirl.define do
  factory :production, :class => Refinery::Productions::Production do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

