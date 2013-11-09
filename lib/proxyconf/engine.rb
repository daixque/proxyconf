module ProxyConf
  class Engine
    def add(name, proxy)
      # TODO: check ~/.proxyconf
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
    def if_exists(name, &block)
      filepath = File.join(ProxyConf::HOME, ProxyConf::PROXIES_DIR, name)
      if File.exist? filepath
        block.call(filepath)
      else
        puts "no such proxy setting: #{name}"
      end
    end
  end
end