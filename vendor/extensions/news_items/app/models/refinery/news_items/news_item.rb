module Refinery
  module NewsItems
    class NewsItem < Refinery::Core::BaseModel
      self.table_name = 'refinery_news_items'


      validates :headline, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      extend FriendlyId
      friendly_id :headline, :use => [:slugged]

      scope :published, -> { self.where('publish_on <= ?', Time.zone.now)}

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
