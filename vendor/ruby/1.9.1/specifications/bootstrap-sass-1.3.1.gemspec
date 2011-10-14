# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bootstrap-sass}
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Thomas McDonald}]
  s.date = %q{2011-10-12}
  s.email = %q{tom@conceptcoding.co.uk}
  s.homepage = %q{http://github.com/thomas-mcdonald/bootstrap-sass}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Twitter's Bootstrap, converted to SASS and ready to drop into Rails}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sass-rails>, ["~> 3.1.0"])
    else
      s.add_dependency(%q<sass-rails>, ["~> 3.1.0"])
    end
  else
    s.add_dependency(%q<sass-rails>, ["~> 3.1.0"])
  end
end
