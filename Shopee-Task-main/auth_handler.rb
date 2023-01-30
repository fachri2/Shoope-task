@@ -84,7 +84,11 @@ def auth_string(credentials)
      # Overrides base get_token method to account for the token expiration.
      def get_token(credentials = nil)
        token = super(credentials)
        token = refresh_token! if !@client.nil? && @client.expired?
        #token = refresh_token! if !@client.nil? && @client.expired?
        unless @client.nil?
          @client.issued_at = Time.parse(@client.issued_at) if @client.issued_at.class.name == 'String'
          token = refresh_token! if @client.expired?
        end
        return token
      end
