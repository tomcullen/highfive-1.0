module ApplicationHelper
  
  def logged_in?
    session[:user_id]  
  end
  def google_analytics_js
   '<script type="text/javascript"> var _gaq = _gaq || []; _gaq.push(['_setAccount', 'UA-28050929-1']); _gaq.push(['_trackPageview']); (function() { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })(); </script>' 
   end
end
