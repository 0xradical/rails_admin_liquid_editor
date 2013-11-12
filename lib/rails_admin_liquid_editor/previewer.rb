module RailsAdminLiquidEditor
  class Previewer

    def initialize(parsed_template)
      @parsed_template = parsed_template
    end

    def render
      @parsed_template.render(@parsed_template.root.nodelist.select do |var|
        var.is_a? Liquid::Variable
      end.map do |var|
        hashify(var.name)
      end.inject({}) do |hsh, memo|
        memo.deep_merge!(hsh)
      end)
    end

    private

    def hashify(str, memo = [])
      if str =~ /\./
        key, value = str.split(/\./,2)
        { key => hashify(value, memo << key) }
      else
        { str => "<i>#{[memo << str].join('.')}</i>" }
      end
    end

  end
end