module Refinery
  module Productions
    class Production < Refinery::Core::BaseModel
      self.table_name = 'refinery_productions'


      validates :title, :presence => true, :uniqueness => true

      belongs_to :feature_image, :class_name => '::Refinery::Image'

      has_many :image_pages, as: :page

      extend FriendlyId
      friendly_id :title, :use => [:slugged]

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
