module JsonHelpers
  def expect_json_response(path = nil)
    expect(json_response(path))
  end

  def expect_json(json, path = nil)
    expect(parse_json(json, path))
  end

  def json_response(path = nil)
    parse_json(spec_type_agnostic_response_body, path)
  end

  def save_and_open_json
    file_path = Rails.root.join("tmp", "json.rb").to_s
    output = parse_json(spec_type_agnostic_response_body)
    output = PP.pp(output, "")
    File.write(file_path, output, mode: "wb")
    Launchy.open(file_path)
  end

  private

    def spec_type_agnostic_response_body
      if respond_to?(:response_body)
        response_body
      else
        response.body
      end
    end

    # Stolen from https://github.com/collectiveidea/json_spec/blob/00855fdd9c2f8a8794eb418419202dc85ce0fa23/lib/json_spec/helpers.rb
    def parse_json(json, path = nil)
      ruby = MultiJson.decode("[#{json}]").first
      result = value_at_json_path(ruby, path)

      if result.respond_to?(:with_indifferent_access)
        result.with_indifferent_access
      else
        result
      end
    end

    def value_at_json_path(ruby, path)
      return ruby unless path

      path.split("/").inject(ruby) do |value, key|
        case value
        when Hash
          value.fetch(key) { "Couldn't find JSON path #{path}" }
        when Array
          raise "Couldn't find JSON path #{path}" unless key =~ /^\d+$/
          value.fetch(key.to_i) { raise "Couldn't find JSON path #{path}" }
        else
          raise "Couldn't find JSON path #{path}"
        end
      end
    end
end

RSpec.configure do |config|
  config.include JsonHelpers
end
