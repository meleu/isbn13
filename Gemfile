# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.1'

gem 'rake', '~> 13.0'
gem 'rspec', '~> 3.12'
gem 'simplecov', '~> 0.22.0'

# this is needed due to a small bug in simplecov-lcov.
# PR with the fix:
# https://github.com/fortissimo1997/simplecov-lcov/pull/28
gem 'simplecov-lcov', require: false, github: 't-mario-y/simplecov-lcov', branch: 'feature/write-LF-LH'
