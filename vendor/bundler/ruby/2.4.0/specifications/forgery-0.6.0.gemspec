# -*- encoding: utf-8 -*-
# stub: forgery 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "forgery".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nathan Sutton".freeze, "Brandon Arbini".freeze, "Kamil Kieliszczyk".freeze]
  s.date = "2014-04-20"
  s.description = "Easy and customizable generation of forged data. Can be used as a gem or a rails plugin. Includes rails generators for creating your own forgeries.".freeze
  s.email = ["nate@zencoder.com".freeze, "brandon@zencoder.com".freeze, "kamil@kieliszczyk.net".freeze]
  s.homepage = "http://github.com/sevenwire/forgery".freeze
  s.rubyforge_project = "forgery".freeze
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Easy and customizable generation of forged data.".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
  end
end
