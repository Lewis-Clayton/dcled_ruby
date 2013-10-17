require 'yaml'


class Font
  
  def initialize(fontfile)
    definition = YAML.load_file(fontfile) # based on fonts/ascii.yml.example
    
    @name    = definition['name']
    @version = definition['version']
    @width   = definition['width'].to_i
    @height  = definition['height'].to_i
    
    @dots = @width * @height
    
    @grids = build(definition['characters'])
    
    @cache = { # to cache core output formats
      :text  => {},
      :dcled => {},
    }
  end
  
  def text(char)
    @cache[:text][char] ||= if grid = @grids[char.to_sym]
      o = grid_def(grid).map { |e| e == 0 ? " " : "*" } # 0 -> space, 1 -> *
      
      o.each_slice(@width).to_a.flat_map { |e| e.join + $/ }.join
    end
  end
  
  def dcled(char)
    @cache[:dcled][char] ||= if grid = @grids[char.to_sym]
      o = grid_def(grid).map { |e| (e + 1) % 2 } # flip bits
      
      [[1] * 8] + o.each_slice(@width).to_a.transpose.map { |e| e << 1 }
    end
  end
  
  def dcled_hash(char)
    h = {}
    
    if dcled_o = dcled(char)
      dcled_o.each_with_index { |k, i| h[i + 1] = k }
    end
    
    h
  end
  
  private
  
  def build(chars)
    assembled = {}
    aliases   = {}
    
    chars.each do |k, v|
      if v.length == 1
        aliases[k] = v # skip aliases until rest assembled
      else
        assembled[k.to_sym] = v.join.tr('.', '0').tr('*', '1').to_i(2)
      end
    end
    
    aliases.each do |k, v| # assemble aliases, following redirects
      assembled[k.to_sym] = assembled[v[0].to_sym]
    end
    
    assembled
  end
  
  def grid_def(grid)
    ("%0#{@dots}b" % grid).split('').map(&:to_i) # to binary array of chars
  end
  
end
