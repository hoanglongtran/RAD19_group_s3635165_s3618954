module CoursesHelper

 def gravatar_course(course)
   gravatar_id = Digest::MD5::hexdigest("potato@example.com")
   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
   image_tag(gravatar_url, class: "gravatar")
 end

 def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
