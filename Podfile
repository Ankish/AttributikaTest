# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Test' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Test
    pod 'Atributika'

end

post_install do |installer|
    puts("Update debug pod settings to speed up build time")
    Dir.glob(File.join("Pods", "**", "Pods*{develop,Private}.xcconfig")).each do |file|
        File.open(file, 'a') { |f| f.puts "\nDEBUG_INFORMATION_FORMAT = dwarf" }
    end
    installer.pods_project.targets.each do |target|
        enableBitcode = 'NO'
        puts("#{target} enable bitcode: #{enableBitcode}")
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = enableBitcode
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
