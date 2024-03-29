class User
  include Mongoid::Document

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  field :email, type: String
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String

  ## Confirmable
  # field :confirmation_token, type: String
  # field :confirmed_at, type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email, type: String

  ## unique oauth id
  field :provider, type: String
  field :uid, default: ""

  ## Tokens
  field :tokens, type: Hash, default: { }

  ## Index
  index({email: 1, uid: 1, reset_password_token: 1}, {unique: true})

  ## Validation
  validates_uniqueness_of :email, :uid
end
