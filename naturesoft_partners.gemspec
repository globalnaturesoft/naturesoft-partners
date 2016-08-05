$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "naturesoft/partners/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "naturesoft_partners"
  s.version     = Naturesoft::Partners::VERSION
  s.authors     = ["Luan Pham",
                  "Son Nguyen",
                  "Hung Nguyen"]
  s.email       = ["luanpm@hoangkhang.com.vn",
                  "sonnn@hoangkhang.com.vn",
                  "hungnt@hoangkhang.com.vn"]
  s.homepage    = "http://globalnaturesoft.com/"
  s.summary     = "Partners features of Global Naturesoft."
  s.description = "Partners features of Global Naturesoft."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency "naturesoft_core"
  s.add_dependency "deface"
end
