module EntryControllerHelper

  def session_check
    user = User.find_by_id(session[:user_id])
    if user
          field1 = "<a href='/user/#{session[:user_id]}/entry'>#{user.username}</a>"
          field2 = '<a href="/logout">logout</a>'
    else
          field1 = '<a href="/register">register</a>'
          field2 = '<a href="/login">login</a>'
    end
    return "<li class='pipe-separate t-light-green left'>#{field1}</li>
    <li class='pipe-separate t-light-green left'>#{field2}</li>"
  end

end

helpers EntryControllerHelper
