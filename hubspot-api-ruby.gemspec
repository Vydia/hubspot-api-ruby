Gem::Specification.new do |s|
  s.name = "hubspot-api-ruby"
  s.version = "0.16.0"
  s.require_paths = ["lib"]
  s.authors = ["Jonathan"]
  s.email = ["jonathan@hoggo.com"]
  s.description = "hubspot-api-ruby is a wrapper for the HubSpot REST API"
  s.licenses = ["MIT"]
  s.files = [".rspec", "Gemfile", "Guardfile", "LICENSE.txt", "README.md", "RELEASING.md", "Rakefile", "hubspot-api-ruby.gemspec"]
  s.files += Dir["lib/**/*.rb"]
  s.files += Dir["spec/**/*.rb"]
  s.homepage = "https://github.com/captaincontrat/hubspot-api-ruby"
  s.summary = "hubspot-api-ruby is a wrapper for the HubSpot REST API"
  s.metadata = {
    "changelog_uri" => "https://github.com/captaincontrat/hubspot-api-ruby/blob/master/History.md"
  }

  s.required_ruby_version = ">= 2.7"

  # Add runtime dependencies here
  s.add_runtime_dependency "activesupport", ">= 4.2.2"
  s.add_runtime_dependency "httparty", ">= 0.10"

  # Add development-only dependencies here
  s.add_development_dependency("dotenv")
  s.add_development_dependency("rake", "~> 11.0")
  s.add_development_dependency("rspec", "~> 3.8")
  s.add_development_dependency("rspec-its", "~> 1.2")
  s.add_development_dependency("webmock")
  s.add_development_dependency("vcr")
  s.add_development_dependency("rdoc")
  s.add_development_dependency("bundler")
  s.add_development_dependency("simplecov")
  s.add_development_dependency("awesome_print")
  s.add_development_dependency("timecop")
  s.add_development_dependency("guard-rspec")
  s.add_development_dependency("byebug")
  s.add_development_dependency("faker")
  s.add_development_dependency("factory_bot")
end
