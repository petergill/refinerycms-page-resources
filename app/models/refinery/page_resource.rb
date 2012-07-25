module Refinery
  class PageResource < Refinery::Core::BaseModel

    belongs_to :resource
    belongs_to :page, :polymorphic => true

    attr_accessible :resource_id, :position, :locale
  end
end
