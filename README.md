# Cs133

Timezone-aware time-range value objects — the middleman between a UI date
filter and the queries it scopes.

Cs133 builds time ranges from presets (this month, last month, last 7/30 days,
year to date) in a given timezone, exposes them as plain start/end pairs any
query can consume, and compares two equal-length ranges for period-over-period
reporting. Pure Ruby value objects — no Rails, and no knowledge of where the
numbers come from.

## Why

A stat's time range is an **input** that flows from the UI down to wherever the
numbers originate. Cs133 owns the hard part of that input — getting period
boundaries right in the account's timezone — without coupling to any storage,
metric, or UI layer. A range scopes a query the same way regardless of the app.

## Usage

```ruby
range = Cs133::Range.this_month(zone: "America/Los_Angeles")
range.start_time # => beginning of this month, in that zone
range.end_time   # => end of this month, in that zone
range.to_range   # => start_time..end_time  (drop straight into a where(...))

# Period-over-period: the immediately preceding window of the same length.
previous = range.previous
```

## Installation

```ruby
gem "cs133", github: "tylercschneider/cs133", branch: "main"
```

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
