class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :pizza, counter_cache: true
end
