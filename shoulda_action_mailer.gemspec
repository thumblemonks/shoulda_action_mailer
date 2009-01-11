Gem::Specification.new do |s|
  s.name     = "shoulda_action_mailer"
  s.version  = "0.1.0"
  s.date     = "2009-01-10"
  s.summary  = "Shoulda macros and more assertions for Action Mailer and ActionMailer::TestCase"
  s.email    = %w[gus@gusg.us]
  s.homepage = "http://github.com/thumblemonks/shoulda_action_mailer"
  s.description = "Shoulda macros and more assertions for Action Mailer and ActionMailer::TestCase"
  s.authors  = %w[Justin\ Knowlden]

  s.rubyforge_project = %q{load_model}

  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Load Model", "--main", "README.markdown"]
  s.extra_rdoc_files = ["HISTORY.markdown", "README.markdown"]
  
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to?(:required_rubygems_version=)
  s.rubygems_version = "1.3.1"
  s.require_paths = ["lib"]

  # run git ls-files to get an updated list
  s.files = %w[
    HISTORY.markdown
    LICENSE
    README.markdown
    lib/shoulda_action_mailer.rb
    shoulda_action_mailer.gemspec  ]
  
  s.test_files = %w[
  ]

  s.post_install_message = %q{Choosy free loaders choose Thumble Monks}
end
