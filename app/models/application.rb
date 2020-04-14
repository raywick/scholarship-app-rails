class Application < ApplicationRecord
    validates :user_id, :career_id, :scholarship_id, :period, :date_of_application, presence: true
    belongs_to :user
    belongs_to :career
    belongs_to :scholarship
end
