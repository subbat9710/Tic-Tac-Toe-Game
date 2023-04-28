Gem::Specification.new do |spec|
    spec.name          = "my_gem"
    spec.version       = "0.1.0"
    spec.authors       = ["subbat9710"]
    spec.email         = ["your-email@example.com"]
    spec.summary       = "A brief description of my gem"
    spec.description   = "A longer description of my gem"
    spec.homepage      = "https://github.com/your-username/my_gem"
    spec.license       = "MIT"
  
    spec.files         = Dir["lib/**/*.rb", "bin/*"]
    spec.require_paths = ["lib"]
  
    spec.add_dependency "some_other_gem", "~> 1.0"
  
    spec.metadata = {
      "foo" => "bar",
      "baz" => "qux"
    }
  end
  