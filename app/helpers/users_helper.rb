module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = 'user.png'
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
