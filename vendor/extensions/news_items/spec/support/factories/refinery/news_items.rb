
FactoryGirl.define do
  factory :news_item, :class => Refinery::NewsItems::NewsItem do
    sequence(:headline) { |n| "refinery#{n}" }
  end
end

