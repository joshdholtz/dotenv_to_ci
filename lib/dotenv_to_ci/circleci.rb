require 'dotenv'
require 'json'
require 'rest-client'

module DotenvToCI
  class CircleCI

    attr_accessor :dotenvs
    attr_accessor :provider
    attr_accessor :token
    attr_accessor :vcs
    attr_accessor :username
    attr_accessor :project
    attr_accessor :verbose

    def initialize(options)
      @dotenvs = options[:dotenvs]
      @provider = options[:provider]
      @token = options[:token]
      @vcs = options[:vcs]
      @username = options[:username]
      @project = options[:project]
      @verbose = options[:verbose]

      load_from_env
    end

    def load_from_env
      if @provider == "circleci"
        @token ||= ENV["CIRCLECI_TOKEN"]
      end
    end

    def run!
      verify_options!
      envs = parse_envs(@dotenvs)
      send_to_circleci(envs)
    end

    def verify_options!
      
    end

    def parse_envs(dotenv_paths)
      return Dotenv.parse(dotenv_paths)
    end

    def send_to_circleci(envs)
      envs.each do |k,v|
        payload = {
          name: k,
          value: v
        }

        if $verbose
          puts "Setting key=#{k}} value=#{v}"
        end

        resp = RestClient::Request.execute(
          method: :post,
          url: "https://circleci.com/api/v1.1/project/#{vcs}/#{username}/#{project}/envvar?circle-token=#{@token}",
          payload: payload.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )
      end

      puts "Successfully added: #{envs.keys.join(', ')}"
    end

  end
end
