# frozen_string_literal: true
module ApplicationHelper
  # :reek:TooManyStatements
  def flash_messages
    flash_messages = []
    flash.each do |type, message|
      next unless message

      level = case type
              when "alert"  then "warning"
              when "error"  then "danger"
              when "notice" then "primary"
              when "success" then "success"
              else
                "primary"
      end

      elm = content_tag(:div, class: ["alert", "alert-fill", "alert-dismissible", "alert-icon", "alert-#{level}"]) do
        content_tag(:em, nil, class: ["icon", "ni", "ni-cross-circle"]) +
        content_tag(:span, message) +
        content_tag(:button, nil, class: ["close"])
      end

      flash_messages << elm
    end

    flash_messages.join("").html_safe
  end

  def time_ago_or_never(time)
    return "never" if time.blank?
    "#{time_ago_in_words(time)} ago"
  end
end
