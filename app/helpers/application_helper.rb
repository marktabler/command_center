module ApplicationHelper

  def salutation
    if current_user
      "<li><a href='#' class='pull-right'>Welcome, #{current_user.name}</a></li>".html_safe
    else
      "<li>Welcome, Guest</li>".html_safe
    end
  end

  def session_controls
    if current_user
      content_tag(:li, link_to("Sign Out", session_path, method: :delete)).html_safe
    else
      content_tag(:li, link_to("Sign In", login_path)).html_safe
    end
  end

  def instruction_links
    if current_user
      [content_tag(:li, link_to("My Instructions", instructions_path)),
        content_tag(:li, link_to("New Instructions", new_instruction_path))].join("").html_safe
    end
  end

  def report_links
    if current_user
      links = [content_tag(:li, link_to("My Reports", reports_path))]
      if current_user.latest_report
        links << content_tag(:li, link_to("My Latest Report", current_user.latest_report))
      end
      links.join("").html_safe
    end
  end

end
