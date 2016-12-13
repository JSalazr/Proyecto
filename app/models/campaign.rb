class Campaign < ApplicationRecord
  scope :active, ->{where(["finalizado_en >= ?", Date.today])}

  def self.categories
    ["Category1", "Category2", "Category3", "Category4", "Category5"]
  end

  has_many :comments
  has_many :donations

  belongs_to :user

  validates :titulo, presence: true
  validates :resena, presence: true, length: {maximum: 140}
  validates :meta, presence: true, numericality: {greater_than: 0}
  validates :category, presence: true
  validate :date_is_before_six_months

  def date_is_before_six_months
    if self.finalizado_en.present? && (self.finalizado_en > (Date.today + 6.months))
      errors.add(:finalizado_en, 'No puede durar mas de 6 meses')
    end
  end

  before_create :default_image
  before_update :default_image

  before_create :default_date
  before_update :default_date

  protected

  def default_image
    if image == ""
      self.image='https://upload.wikimedia.org/wikipedia/commons/d/d1/Black_circle.png'
    end
  end

  def default_date
    if finalizado_en == nil
      self.finalizado_en = Date.today + 6.months
    end
  end

end
