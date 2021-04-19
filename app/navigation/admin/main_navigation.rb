# frozen_string_literal: true
class Admin::MainNavigation < ActionNav::Base
  item :dashboard do
    title "Dashboard"
    icon "fal fa-home-alt"
    url { admin_dashboard_path }
  end

  item :main do
    title "Main"
  end

  item :people do
    title "People"
    icon "fal fa-user-circle"
    url { admin_people_path }
  end

  item :events do
    title "Events"
    icon "fal fa-calendar-alt"
    url { admin_dashboard_path }
  end

  item :finances do
    title "Finances"
    icon "fal fa-comment-alt-dollar"
    url { admin_dashboard_path }
  end

  item :utilities do
    title "Utilities"
  end

  item :activity_log do
    title "Activity Log"
    icon "fal fa-list"
    url { admin_dashboard_path }
  end

  item :duplicate_finder do
    title "Duplicate Finder"
    icon "fal fa-retweet-alt"
    url { admin_dashboard_path }
  end

  item :system_management do
    title "System Management"
  end

  item :user_accounts do
    title "User Accounts"
    icon "fal fa-users-cog"
    url { admin_users_path }
  end

  item :taxonomies do
    title "Taxonomies"
    icon "fal fa-database"
    url { admin_dashboard_path }
  end
end
