Pod::Spec.new do |s|
  s.name         = "BOAPI"
  s.version      = "0.0.1"
  s.summary      = "Back office API"
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/dpostigo/BOAPI.git", :commit => '7619fcc206a73f44c2da8937763a8e80f83e2a51'}
  s.requires_arc = true


  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'

  s.exclude_files = "BOAPI/Exclude/**/*.{h,m}"
  # s.source_files  = 'BOAPI/*.{h,m}', 'BOAPI/{Models,Utils}/**/*.{h,m}'


  s.subspec 'Core' do |core|
    # core.dependency  'BOAPI/Models'
    # core.source_files = 'BOAPI/*.{h,m}', 'BOAPI/Core/**/*.{h,m}', 'BOAPI/Utils/**/*.{h,m}'
    core.source_files = 'BOAPI/*.{h,m}', 'BOAPI/{Core,Models,Utils}/**/*.{h,m}', 'BOAPI/Operations/*.{h,m}'
  end



  # s.subspec 'Utils' do |utils|
  #   utils.source_files = 'BOAPI/Utils/**/*.{h,m}'
  # end

  s.subspec 'Operations' do |operations|
    operations.dependency  'BOAPI/Core'

    operations.subspec 'account' do |account|
      account.source_files = 'BOAPI/Operations/account/*.{h,m}'
    end

    operations.subspec 'tasks' do |tasks|
      tasks.source_files = 'BOAPI/Operations/tasks/*.{h,m}'
    end

    operations.subspec 'logs' do |logs|
      logs.source_files = 'BOAPI/Operations/logs/*.{h,m}'
    end

    operations.subspec 'base' do |base|
      base.source_files = 'BOAPI/Operations/base/*.{h,m}'
    end
  end

  s.dependency   'AFNetworking/Serialization'
  s.dependency   'AFNetworking/Security'
  s.dependency   'AFNetworking/Reachability'
  s.dependency   'AFNetworking/NSURLConnection'
  s.dependency   'AutoCoding'
  s.dependency   'DPStorage'
  s.dependency   'NSObject+AutoDescription'
  s.dependency   'NSDictionary-Deserialize'
  s.dependency   'NSObject-UserDefaults'
  s.dependency   'DPKit', '~> 0.0.6'


  s.frameworks   = 'Foundation', 'AppKit'


end
