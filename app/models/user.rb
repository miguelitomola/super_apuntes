class User < ActiveRecord::Base
	acts_as_authentic do |c|
    c.merge_validates_length_of_password_field_options({:minimum => 3})
  end

  def admin?
  	username == User.admin_name
  end
  
  def self.admin_name
  	'admin'
  end
end
