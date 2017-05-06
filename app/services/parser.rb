class Parser
  require 'csv'
  require 'net/http'

  def initialize
    @file_path = '/Users/luisgarate/Test/Prueba-Repo/NaN-Test/app/services/webs.csv'
  end

  def file_parse
    p "Starting Parsing"
    @webs = {}
    @webs_length = {}

    user_path = "/Users/luisgarate/"

    CSV.foreach(@file_path) do |row|
      @webs[row.first.strip] = []
      path = row.last.strip
      if /~/ =~ path
        path[0] = user_path
        @webs_length[row.first.strip] = 0
        File.open(path,"r") do |file|
          file.each_line do |line|
            @webs_length[row.first.strip] += 1
            result = line.scan(/\w+\.js/)
            unless result.empty?
              @webs[row.first.strip] << result
            end
          end
        end
      else
        uri = URI(path)
        response = Net::HTTP.get_response(uri).body
        @webs_length[row.first.strip] = response.length
        result = response.scan(/\w+\.js/)
        unless result.empty?
          @webs[row.first.strip] << result
        end
      end
    end
    @webs.each do |web, js|
      js.flatten!
    end
    p "Parsing finished"
  end
  # 
  # def scan_nan(text, web)
  #   result = text.scan(/\w+\.js/)
  #   @webs[web] << result unless result.empty?
  # end

  def dependencies
    @webs
  end

  def length
    @webs_length
  end

  def frequency

  end
end
