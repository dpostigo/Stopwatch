Pod::Spec.new do |s|
  s.name         = "WDCountdownFormatter"
  s.version      = "0.0.1"
  s.summary      = "An NSFormatter that formats NSTimeIntervals into a countdown of the format HH:mm:ss."
  s.homepage     = "https://github.com/dpostigo/WDCountdownFormatter"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/dpostigo/WDCountdownFormatter.git", :tag => s.version.to_s }
  s.source_files = 'WDCountdownFormatter/*.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '4.3'
  s.osx.deployment_target = '10.8'

end
