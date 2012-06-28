module ApplicationHelper

  def salutation
    if current_user
      "Welcome, #{current_user.name}"
    else
      "Welcome, Guest"
    end
  end

  def session_controls
    if current_user
      link_to("Sign Out", session_path, method: :delete).html_safe
    else
      link_to("Sign In", login_path)
    end
  end

  def instruction_links
    if current_user
      [link_to("My Instructions", instructions_path),
      link_to("New Instructions", new_instruction_path)].join(" ").html_safe
    end
  end

end
