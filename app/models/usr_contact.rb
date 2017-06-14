class UsrContact < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, UsrContactUploader

  # validations for sing in
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:twitter, :facebook, :linkedin, :google_oauth2]
  validate :password_complexity
  def password_complexity
    # if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, one special character and one digit"
    end
  end

  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_create do |usr_contact|
  #     usr_contact.provider = auth.provider
  #     usr_contact.uid = auth.uid
  #     usr_contact.name = auth.info.nickname
  #   end
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |usr_contact|
      usr_contact.skip_confirmation!
      usr_contact.provider = auth.provider
      usr_contact.uid      = auth.uid
      usr_contact.first_name     = auth.info.name
      usr_contact.image = auth.info.image
      usr_contact.save
    end
  end

  def self.new_with_session(params,session)
    if session["devise.usr_contact_attributes"]
      new(session["devise.usr_contact_attributes"]) do |usr_contact|
        usr_contact.attributes = params
        usr_contact.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
      if encrypted_password.balnk?
        update_attributes(params, *options)
      else
        super
      end
  end

   # Relationships for usr_vendors
  has_many :usr_contact_vendors
  has_many :usr_vendor_properties, through: :usr_contact_vendors
  accepts_nested_attributes_for :usr_contact_vendors,
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :usr_vendor_properties

  # Relationships for usr_buyer
  has_many :usr_buyer_billing_addresses
  has_many :usr_buyer_delivery_addresses
  has_many :usr_buyer_payment_methods
  accepts_nested_attributes_for :usr_buyer_billing_addresses,
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :usr_buyer_payment_methods,
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :usr_buyer_delivery_addresses,
                                reject_if: :all_blank,
                                allow_destroy: true

end
