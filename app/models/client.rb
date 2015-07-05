class Client < ActiveRecord::Base
  validates :description, presence: true, uniqueness: true
  has_many :sales
  before_destroy :ensure_not_referenced_by_any_sale

  private

  def ensure_not_referenced_by_any_sale
      if sales.empty?
        return true
      else
        errors.add(:base, 'There is sale')
        return false
      end
  end

end
