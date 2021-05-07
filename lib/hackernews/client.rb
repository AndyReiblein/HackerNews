module Hackernews
    class Client
      def initialize
        @host = 'GhostdimasV1.p.radidapi.com'
        @key = '415a3184cfmsh621a361ff9aeac0p1f1940jsnf5325f93394'
      end
      def item(id)
        get("item/#{id}")
      end
      def topstories(start = 0, per_page = 10, expand = true)
        stories = get('topstories')[start...start + per_page]
        if expand
          stories.map! do |story|
            item(story)
          end
        end
        stories
      end
      private
      def get(path)
        response = Excon.get(
          'https://' + @host + '/' + path + '.json?print=pretty',
          headers: {
            'x-rapidapi-host' => @host,
            'x-rapidapi-key' => @key,
          }
        )
        return false if response.status != 200
        JSON.parse(response.body)
      end
    end
  end