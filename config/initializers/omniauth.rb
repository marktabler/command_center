# config/initializers/fix_ssl.rb
# 
# Work around errors that look like:
#
#   SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed (OpenSSL::SSL::SSLError)

require 'open-uri'
require 'net/https'

module Net
  class HTTP
    alias_method :original_use_ssl=, :use_ssl=
    
    def use_ssl=(flag)
      # Ubuntu
      if File.exists?('/etc/ssl/certs')
        self.ca_path = '/etc/ssl/certs'
      
      elsif File.exists?('/ssl/curl-ca-bundle.crt')
      # OS X hack because nobody else knows how the hell to do this
      # withoutMacPorts
        self.ca_file = '/ssl/curl-ca-bundle.crt'

      # MacPorts on OS X
      # You'll need to run: sudo port install curl-ca-bundle
      elsif File.exists?('/opt/local/share/curl/curl-ca-bundle.crt')
        self.ca_file = '/opt/local/share/curl/curl-ca-bundle.crt'
      end

      self.verify_mode = OpenSSL::SSL::VERIFY_PEER
      self.original_use_ssl = flag
    end
  end
end



Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['FERRETY_FACEBOOK_KEY'], ENV['FERRETY_FACEBOOK_SECRET']
end




