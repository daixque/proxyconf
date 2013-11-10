require 'uri'

module ProxyConf
  class Engine
    def add(name, proxy)
      validate_name name
      validate_uri proxy
      filepath = File.join(ProxyConf::HOME, ProxyConf::PROXIES_DIR, name)
      File.open(filepath, "w") do |file|
        file.puts "export http_proxy=#{proxy}"
        file.puts "export ftp_proxy=#{proxy}"
        file.puts "export https_proxy=#{proxy}"
      end
    end

    def remove(name)
      if_exists(name) do |filepath|
        File.delete(filepath)
      end
    end

    def info(name)
      if_exists(name) do |filepath|
        puts File.read(filepath)
      end
    end

    def list
      path = File.join(ProxyConf::HOME, ProxyConf::PROXIES_DIR, "*")
      Dir.glob(path).each do |filepath|
        puts File.basename(filepath)
      end
    end

    protected

    def validate_name(name)
      unless name =~ /^[0-9a-zA-Z_\-]*$/
        $stderr.puts "invalid name: #{name}"
        exit 1
      end
    end

    def validate_uri(uri)
      begin
        URI.parse(uri)
      rescue URI::InvalidURIError
        $stderr.puts "invalid proxy uri: #{uri}"
        exit 1
      end
    end

    def if_exists(name, &block)
      filepath = File.join(ProxyConf::HOME, ProxyConf::PROXIES_DIR, name)
      if File.exist? filepath
        block.call(filepath)
      else
        $stderr.puts "no such proxy name: #{name}"
      end
    end
  end
end