require 'yaml'

module ProxyConf
  class Mac < ProxyConf::Engine
    private

    def scutil_query(key)
      send_data = <<-"EOF"
open
get #{key}
d.show
close
      EOF
      IO.popen("scutil", "r+") do |io|
        io.puts send_data
        io.close_write
        io.readlines
      end
    end

    def pick_value(lines, key)
      lines.find { |line| line =~ key }.strip.split(':').last.strip
    end

    def get_primary_service_guid
      lines = scutil_query "State:/Network/Global/IPv4"
      pick_value(lines, /PrimaryService/)
    end

    def get_service_name(guid)
      lines = scutil_query "Setup:/Network/Service/#{guid}"
      pick_value(lines, /UserDefinedName/)
    end

    public

    def active_network
      guid = get_primary_service_guid
      get_service_name(guid)
    end

    def proxy_info
      active_service_name = active_network
      src = `networksetup -getwebproxy "#{active_service_name}"`
      info = YAML.load(src)
    end

    def export
      info = proxy_info
      proxy = ""
      if info['Enabled']
        proxy = "#{info['Server']}:#{info['Port']}"
      end
      puts "export http_proxy=#{proxy}"
      puts "export ftp_proxy=#{proxy}"
      puts "export https_proxy=#{proxy}"
    end
  end
end