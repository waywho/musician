Refinery::PageImages.configure do |config|
  # config.captions = false
  config.enable_for = [{:model=>"Refinery::Page", :tab=>"Refinery::Pages::Tab"}, {:model=>"Refinery::Productions::Production", :tab=>"Refinery::Productions::Tab"}]
  # config.wysiwyg = true
end
