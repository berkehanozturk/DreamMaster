# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
workspace 'DreamMaster'
use_frameworks!

def service_pods
    pod 'Moya'

end

target 'Service' do
    project 'Service/Service.project'
    service_pods
end


####### define core module #######
def core_pods
end

target 'Core' do
    project 'Core/Core.project'
    core_pods
end

####### define uicomponents module #######
def uicomponents_pods
  pod 'Kingfisher', '~> 6.0'
end

target 'UIComponents' do
    project 'UIComponents/UIComponents.project'
    uicomponents_pods
end

def application_pods
    service_pods


end
target 'Application' do
  # Comment the next line if you don't want to use dynamic frameworks
    project 'Application/Application.project'
    pod 'SwiftLint'
    application_pods
    core_pods
    uicomponents_pods
  # Pods for Application

end


