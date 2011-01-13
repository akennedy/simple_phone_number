# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simple_phone_number}
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Kennedy"]
  s.cert_chain = ["/Users/andrew/gems/gem-public_cert.pem"]
  s.date = %q{2011-01-13}
  s.description = %q{Validate and set phone number format}
  s.email = %q{andrew@jackrussellsoftware.com}
  s.extra_rdoc_files = ["README.md", "lib/simple_phone_number.rb"]
  s.files = ["Manifest", "README.md", "Rakefile", "init.rb", "lib/simple_phone_number.rb", "simple_phone_number.gemspec"]
  s.homepage = %q{http://github.com/akennedy/simple_phone_number}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Simple_phone_number", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{simple_phone_number}
  s.rubygems_version = %q{1.3.6}
  s.signing_key = %q{/Users/andrew/gems/gem-private_key.pem}
  s.summary = %q{Validate and set phone number format}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
