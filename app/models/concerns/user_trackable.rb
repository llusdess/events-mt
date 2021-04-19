# frozen_string_literal: true
module UserTrackable
  extend ActiveSupport::Concern

  def update_trackable_fields(request)
    return if new_record?
    update_sign_in_at
    update_sign_in_ip(request)
    self.sign_in_count += 1
    save(validate: false)
  end

  def increment_failed_attempts
    self.class.increment_counter(:failed_attempts, id)
    reload
  end

  private

  def update_sign_in_at
    old_current = current_sign_in_at
    new_current = Time.now.utc
    self.last_sign_in_at     = old_current || new_current
    self.current_sign_in_at  = new_current
  end

  def update_sign_in_ip(request)
    old_current = current_sign_in_ip
    new_current = extract_ip_from(request)
    self.last_sign_in_ip     = old_current || new_current
    self.current_sign_in_ip  = new_current
  end

  def extract_ip_from(request)
    request.remote_ip
  end
end
