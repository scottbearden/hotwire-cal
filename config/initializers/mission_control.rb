# Configure Mission Control Jobs
# For development, we'll set simple credentials to make it easier to access
# In production, you should use secure environment variables

if Rails.env.development? || Rails.env.test?
  # Simple credentials for development
  MissionControl::Jobs.http_basic_auth_user = "admin"
  MissionControl::Jobs.http_basic_auth_password = "password"
else
  # In production, use secure environment variables
  MissionControl::Jobs.http_basic_auth_user = ENV.fetch("MISSION_CONTROL_USER")
  MissionControl::Jobs.http_basic_auth_password = ENV.fetch("MISSION_CONTROL_PASSWORD")
end
