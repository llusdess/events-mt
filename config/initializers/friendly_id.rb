# frozen_string_literal: true
FriendlyId.defaults do |config|
  config.use(:reserved)
  config.reserved_words =
    %w(new edit index session login logout signin signout users admin stylesheets assets javascripts images)

  config.treat_reserved_as_conflict = true
end
