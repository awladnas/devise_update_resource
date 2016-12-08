class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #,:confirmable

  validates :email, confirmation: true



  # devise required current password for updating user attributes
  # we have to update user attributes without providing password
  # we have to override devise method `update_without_password`
  def update_without_password(params, *options)
    # password blank means user do not want to update password
    # in this case delete password, password_confirmation from the params hash
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    # update attributes and return the result
    self.update_attributes(params, *options)
  end

end
