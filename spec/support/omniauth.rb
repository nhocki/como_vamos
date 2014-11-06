def mock_omniauth!(**args)
  OmniAuth.config.test_mode = true
  mock_github_omniauth(**args)
end

def mock_github_omniauth(info: {}, credentials: {})
  info = {
    nickname: "nhocki",
    email: "nhocki@gmail.com",
    name: "Nicolás Hock Isaza",
    image: "https://avatars.githubusercontent.com/u/17035?v=2",
    urls: {
      GitHub: "https://github.com/nhocki",
      Blog: "http://blog.nhocki.com/"
    }
  }.merge(info)

  credentials = {
    token: "token",
    expires: false
  }.merge(credentials)

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: "github",
    uid: "123",
    info: info,
    credentials: credentials,
    extra: {
      raw_info: {
        login: "nhocki",
        id: 17035,
        avatar_url: "https://avatars.githubusercontent.com/u/17035?v=2",
        gravatar_id: "",
        url: "https://api.github.com/users/nhocki",
        html_url: "https://github.com/nhocki",
        followers_url: "https://api.github.com/users/nhocki/followers",
        following_url: "https://api.github.com/users/nhocki/following{/other_user}",
        gists_url: "https://api.github.com/users/nhocki/gists{/gist_id}",
        starred_url: "https://api.github.com/users/nhocki/starred{/owner}{/repo}",
        subscriptions_url: "https://api.github.com/users/nhocki/subscriptions",
        organizations_url: "https://api.github.com/users/nhocki/orgs",
        repos_url: "https://api.github.com/users/nhocki/repos",
        events_url: "https://api.github.com/users/nhocki/events{/privacy}",
        received_events_url: "https://api.github.com/users/nhocki/received_events",
        type: "User",
        site_admin: false,
        name: "Nicolás Hock Isaza",
        company: "We Heart It",
        blog: "http://blog.nhocki.com/",
        location: "San Francisco, CA",
        email: "nhocki@gmail.com",
        hireable: true,
        bio: nil,
        public_repos: 62,
        public_gists: 110,
        followers: 72,
        following: 193,
        created_at: "2008-07-14T18:04:54Z",
        updated_at: "2014-10-19T13:12:36Z"
      }
    }
  })
end
