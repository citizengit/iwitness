module ApplicationHelper
  # show corrct user login/account navs in header
  def usernav
    links = ''
    if @current_user
      links += "
        <li class='info'>Welcome back #{@current_user.name}</li>
        <li>#{link_to('my account', user_path(@current_user))}</li>
        <li>#{link_to('sign out', login_path, :method => :delete, :confirm => 'Are you sure you wish to log out?')}</li>
      "
    else
      if flash[:notice].present? 
        links +=  "<li class='info orange'>#{ flash[:notice] }</li>"
      else
        links +=  "<li class='info'>You are not logged in</li>"
      end
      
      links += "
        <li>#{link_to('register', new_user_path)}</li>
        <li class='toggle-holder'><a href='#' onclick=\"toggle_visibility('loginform');return false;\">login</a>
      "  
      links +=
        form_tag("/login", method: "post", class: (flash[:notice].present? ? "toggle-on" : "toggle-off"), id: "loginform") do
          concat text_field_tag(:name)
          concat password_field_tag(:password)
          concat submit_tag("GO")
        end
      links += "</li>"
    end
    #admin
    if @current_user && @current_user.admin
      links += "
        <li>#{link_to("Categories", categories_path)}</li>
        <li>#{link_to("Users", users_path)}</li>
      "
    end
    links
  end

  # show corrct user login/account form or details in sidebar
  def userbox
    if @current_user
      content = "
        <section class='userbox'>
          <img src='#{@current_user.image}'>
          <h2>#{@current_user.name}</h2>
          <p>#{@current_user.posts.count} #{'post'.pluralize(@current_user.posts.count)} | honesty rating #{number_to_percentage(@current_user.rating*100, precision: 0)}</p>
        </section>
      "
    else
      content = ""
    end
    #admin
    if @current_user && @current_user.admin
      stuff = "do admin stuff"
    end
    content 
  end

end
