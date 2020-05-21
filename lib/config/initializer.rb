require 'config/environment'
require 'oj'

Oj.default_options = {
  mode: :custom, time_format: :xmlschema, use_as_json: true
}
