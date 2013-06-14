RSpec.configure do |config|
  config.before(:each) do
    OmniAuth.config.test_mode = true
  end
end

module OmniAuthMacros
  def login(user)
    auth = user.authentications.first
    stub_oauth(auth.provider, uid: auth.uid)
    visit logout_path
    visit "/auth/#{auth.provider}"
  end

  def stub_oauth(provider, auth = {})
    auth.reverse_merge!(uid: '123', info: { name: 'Sven', email: 'sven@example.com' })
    OmniAuth.config.add_mock(provider, auth)
  end

  def stub_oauth_error(provider)
    OmniAuth.config.mock_auth[provider] = :invalid_credentials
  end
end

RSpec.configure { |config| config.include(OmniAuthMacros) }
