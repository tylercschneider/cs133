# frozen_string_literal: true

require_relative "reference"

module Cs133
  module Companion
    SCOPE = "timezone-aware time-range value objects, presets, and period-over-period comparison"

    AGENTS = {
      "info" => {
        description: "Use to learn what Cs133 offers — its timezone-aware range presets, " \
                     "query-ready bounds, and period-over-period comparison.",
        tools: "Read",
        body: "You explain what Cs133 does, answering only from your reference — its range " \
              "presets, timezone-aware bounds, to_range for queries, and period-over-period " \
              "comparison. You make no changes and never read Cs133's source."
      },
      "install" => {
        description: "Use to install Cs133 into a host app — adding the gem and wiring " \
                     "timezone-aware ranges. MUST BE USED instead of setting it up by hand.",
        tools: "Read, Edit",
        body: "You set Cs133 up in a host app by following your reference's Install steps " \
              "exactly — add the gem, bundle, and build ranges with an explicit zone. You " \
              "change only what install requires and never read Cs133's source."
      },
      "develop" => {
        description: "Use PROACTIVELY for any work using Cs133 — building range presets, " \
                     "scoping queries with to_range, timezone correctness, and " \
                     "period-over-period comparison.",
        tools: "Read, Write, Edit, Grep",
        body: "You do Cs133 work by following your reference's Interface, Recipe, and " \
              "Conventions exactly — building timezone-aware ranges from presets, dropping " \
              "to_range into queries, and comparing equal-length windows for " \
              "period-over-period reporting. You implement from the reference, never source."
      }
    }.freeze

    def self.register!
      TheLocal.register("cs133", scope: SCOPE, agents_dir: File.expand_path("the_local/agents", __dir__)) do |c|
        AGENTS.each do |name, attributes|
          c.agent name, **attributes, knowledge: Cs133::Reference.content
        end
      end
    end
  end
end

begin
  require "the_local"
  Cs133::Companion.register!
rescue LoadError
  # the_local not installed — cs133 works standalone.
end
