
Pod::Spec.new do |s|
    
    s.name         = "PTEHorizontalTableView"
    s.version      = "1.0.1"
    s.summary      = "Horizontal UITableView inspired by EasyTableView."
    s.homepage     = "https://github.com/PTEz/PTEHorizontalTableView"
    
    s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
    s.author       = { "Ernesto Rivera" => "rivera.ernesto@gmail.com" }
    s.source       = { :git => "https://github.com/PTEz/PTEHorizontalTableView.git", :tag => "#{s.version}" }
    
    s.platform     = :ios, '5.0'
    s.requires_arc = true
    s.preserve_paths = "README.md", "NOTICE"
    
    s.source_files = 'PTEHorizontalTableView.{h,m}'
    
end

