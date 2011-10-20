# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tilt-jade}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{David Haslem}]
  s.date = %q{2011-09-23}
  s.description = %q{Jade is a high performance template engine heavily influenced by Haml and implemented with JavaScript for node.}
  s.email = [%q{therabidbanana@gmail.com}]
  s.homepage = %q{}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{tilt-jade}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Tilt engine to compile Jade templates into JS closures via ExecJS}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jade-js-source>, [">= 0"])
      s.add_runtime_dependency(%q<execjs>, [">= 0"])
      s.add_runtime_dependency(%q<tilt>, [">= 0"])
      s.add_runtime_dependency(%q<sprockets>, [">= 0"])
    else
      s.add_dependency(%q<jade-js-source>, [">= 0"])
      s.add_dependency(%q<execjs>, [">= 0"])
      s.add_dependency(%q<tilt>, [">= 0"])
      s.add_dependency(%q<sprockets>, [">= 0"])
    end
  else
    s.add_dependency(%q<jade-js-source>, [">= 0"])
    s.add_dependency(%q<execjs>, [">= 0"])
    s.add_dependency(%q<tilt>, [">= 0"])
    s.add_dependency(%q<sprockets>, [">= 0"])
  end
end
