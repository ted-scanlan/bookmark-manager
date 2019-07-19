require 'uri'

module UrlValidation

def is_valid?(url)

  url=~ /\A#{URI::regexp(['http', 'https'])}\z/


end

end
