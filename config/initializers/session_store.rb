# Be sure to restart your server when you modify this file.

#NetrunnerTracker::Application.config.session_store :cookie_store, key: '_netrunner-tracker_session'

expire_time = Rails.env.production? ? 90.minutes : 24.hours

NetrunnerTracker::Application.config.session_store(
  :active_record_store,
  {:expire_after => expire_time}
)
