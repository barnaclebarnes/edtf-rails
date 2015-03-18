# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: edtf-rails 0.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "edtf-rails"
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["masciugo"]
  s.date = "2015-03-18"
  s.description = "An ActiveRecord extension to deal with Extended DateTime Format attributes"
  s.email = "masciugo@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".travis.yml",
    "Appraisals",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "edtf-rails.gemspec",
    "gemfiles/rails_3.gemfile",
    "gemfiles/rails_4.gemfile",
    "lib/edtf-rails.rb",
    "lib/edtf-rails/constants.rb",
    "lib/edtf-rails/edtf-rails.rb",
    "lib/edtf-rails/util.rb",
    "local_history",
    "spec/edtf-rails_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/database.yml",
    "spec/support/edtf_rails_test_model.rb"
  ]
  s.homepage = "http://github.com/masciugo/edtf-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "An ActiveRecord extension to deal with Extended DateTime Format attributes"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["< 5"])
      s.add_runtime_dependency(%q<edtf>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3"])
      s.add_development_dependency(%q<rspec-its>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<awesome_print>, [">= 0"])
      s.add_development_dependency(%q<appraisal>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["< 5"])
      s.add_dependency(%q<edtf>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3"])
      s.add_dependency(%q<rspec-its>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
      s.add_dependency(%q<appraisal>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["< 5"])
    s.add_dependency(%q<edtf>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3"])
    s.add_dependency(%q<rspec-its>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
    s.add_dependency(%q<appraisal>, [">= 0"])
  end
end

