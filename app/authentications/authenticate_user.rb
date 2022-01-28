class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JwtService.encode(payload: { user_id: user.id }) if user
  end

  private

  attr_reader :email, :password

  def user
    if (user = User.find_by(email: email)).present? && user.authenticate(password)
      user
    else
      errors.add(:user_authentication, "Invalid Credentials")
    end
  end
end
