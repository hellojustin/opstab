require 'digest/md5'

module UsersHelper

  def gravatar_url( user, size_in_px=nil )
    
    hash       = Digest::MD5.hexdigest( user.email )
    size_param = ( size_in_px ) ? "?s=#{size_in_px}" : ''

    "http://www.gravatar.com/avatar/#{hash}#{size_param}"

  end

end
