class Inquiry < ActiveRecord::Base
  # ------------------------------------------------------------------
  # Validation
  # ------------------------------------------------------------------
  before_validation :ensure_hankaku
  validates :name, presence: true, length: { maximum: 256 }
  validates :email, length: { maximum: 256 }, format: { with: /@/ }, allow_blank: true
  validates :phone, length: { maximum: 32 }, format: { with: /\A[0-9 \+\-\(\)]+\z/ }, allow_blank: true
  validates :message, presence: true, length: { maximum: 4096 }
  validate :ensure_email_or_phone

  private
    def ensure_hankaku
      self.email = email.try(:hankaku)
      self.phone = phone.try(:hankaku)
    end

    def ensure_email_or_phone
      if self.email.blank? && self.phone.blank?
        errors.add(:email, 'どちらか入力してください')
        errors.add(:phone, 'どちらか入力してください')
      end
    end
end
