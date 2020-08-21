class Admin < User
  validates :name, :surname, presence: true
end
