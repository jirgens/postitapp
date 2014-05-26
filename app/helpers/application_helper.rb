module ApplicationHelper

	def facebook_like
    content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=standard&show_faces=true&width=450&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
  end
	
	def fix_url(str)
		str.starts_with?('http://') ? str : "http://#{str}"
	end

	def display_datetime(dt)
		if logged_in? && !current_user.time_zone.blank?
			dt = dt.in_time_zone(current_user.time_zone)
		end
		dt.strftime("%m/%d/%y 1:%M%P %Z")
	end
end
