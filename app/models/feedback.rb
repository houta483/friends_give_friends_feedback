class Feedback < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :comments, :presence => true

  validates :recipient_id, :presence => true

end
