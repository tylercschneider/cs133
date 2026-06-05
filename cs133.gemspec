# frozen_string_literal: true

require_relative "lib/cs133/version"

Gem::Specification.new do |spec|
  spec.name = "cs133"
  spec.version = Cs133::VERSION
  spec.authors = ["tylercschneider"]
  spec.email = ["tylercschneider@gmail.com"]

  spec.summary = "Timezone-aware time-range value objects with presets and period-over-period comparison"
  spec.description = "Cs133 is the middleman between a UI date filter and the queries it scopes. " \
    "It builds timezone-aware time ranges from presets (this month, last month, last 7/30 days, year to date), " \
    "exposes them as plain start/end pairs any query can consume, and compares two equal-length ranges for " \
    "period-over-period reporting. Pure Ruby value objects — no Rails, no knowledge of where the numbers come from."
  spec.homepage = "https://github.com/tylercschneider/cs133"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["rubygems_mfa_required"] = "true"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/ .rubocop.yml docs/])
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 7.1"
end
