class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates_format_of :zip_code, with: /\A\d{5}-\d{4}|\A\d{5}\z/, message: "is not a valid zip code."
    validates :zip_code, presence: true

    geocoded_by :zip_code

    after_validation :geocode, if: ->(obj){ obj.full_address.present? and obj.street_address_changed? or obj.zip_code.present? and obj.zip_code_changed? }
    after_create :associate_city_state_to_user

    def full_address
        [self.street_address, self.city, self.state].compact.join(', ')
    end

    def associate_city_state_to_user
        location = ZipCodes.identify(self.zip_code)
        self.update_attributes(city: location[:city], state: location[:state_code])
    end

end
