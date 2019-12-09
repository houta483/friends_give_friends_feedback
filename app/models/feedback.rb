class Feedback < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :commentor_id, :presence => true

  validates :comments, :presence => true

  validates :recipient_id, :presence => true

end
