module ApplicationHelper
  def event_registration_button(event)
    unless event.attendances.exists?(user_id: current_user.id)
      (link_to 'Attend Event', new_attendance_path(id: event.id), class: 'button is-primary', method: :post).to_s.html_safe
    else
      '<p>You already signed up for this event</p>'.html_safe
    end
  end
end
