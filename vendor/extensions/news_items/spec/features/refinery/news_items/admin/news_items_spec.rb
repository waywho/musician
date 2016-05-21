# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "NewsItems" do
    describe "Admin" do
      describe "news_items", type: :feature do
        refinery_login

        describe "news_items list" do
          before do
            FactoryGirl.create(:news_item, :headline => "UniqueTitleOne")
            FactoryGirl.create(:news_item, :headline => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.news_items_admin_news_items_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.news_items_admin_news_items_path

            click_link "Add New News Item"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Headline", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::NewsItems::NewsItem, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::NewsItems::NewsItem, :count)

              expect(page).to have_content("Headline can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:news_item, :headline => "UniqueTitle") }

            it "should fail" do
              visit refinery.news_items_admin_news_items_path

              click_link "Add New News Item"

              fill_in "Headline", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::NewsItems::NewsItem, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:news_item, :headline => "A headline") }

          it "should succeed" do
            visit refinery.news_items_admin_news_items_path

            within ".actions" do
              click_link "Edit this news item"
            end

            fill_in "Headline", :with => "A different headline"
            click_button "Save"

            expect(page).to have_content("'A different headline' was successfully updated.")
            expect(page).not_to have_content("A headline")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:news_item, :headline => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.news_items_admin_news_items_path

            click_link "Remove this news item forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::NewsItems::NewsItem.count).to eq(0)
          end
        end

      end
    end
  end
end
