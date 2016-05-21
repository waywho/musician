require 'spec_helper'

module Refinery
  module NewsItems
    describe NewsItem do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:news_item,
          :headline => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:headline) { should == "Refinery CMS" }
      end
    end
  end
end
