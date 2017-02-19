module Jekyll
  class AssetsDirGenerator < Generator

    def self.priority
      :highest
    end

    def generate(site)
      static_assets_source_directory = site.config['static_assets_source']
      clean_static_assets_source_directory = clean_leading_trailing_forward_slash(static_assets_source_directory)
      all_raw_paths = Dir["#{static_assets_source_directory}/**/*"]
      all_raw_paths.each do |f|
        if File.file?(File.join(site.source, '/', f))
          directory_path = File.dirname(f)
          directory_path_to_delete = "#{clean_static_assets_source_directory}"
          if directory_path != directory_path_to_delete
            sub_directory_path = '/' + directory_path.sub(/^#{directory_path_to_delete}\//, '').to_s + '/'
          else
            sub_directory_path = '/'
          end
          filename = File.basename(f)
          site.static_files << AssetsDirAsset.new(site, site.source, clean_static_assets_source_directory, filename, collection = nil, sub_directory_path)
        end
      end
    end

  class AssetsDirAsset < StaticFile

    def initialize(site, base, dir, name, collection = nil, subDestination)
      @site = site
      @base = base
      @dir  = dir.to_s + subDestination.to_s
      @name = name
      @collection = collection
      @relative_path = File.join(*[@dir, @name].compact)
      @extname = File.extname(@name)
      @subDestination = subDestination
    end

    def write(dest)
      clean_static_assets_destination_directory = clean_leading_trailing_forward_slash("#{@site.config['static_assets_destination']}")
      dest_path = "#{dest}/#{clean_static_assets_destination_directory}#{@subDestination}#{@name}"
      FileUtils.mkdir_p(File.dirname(dest_path))
      FileUtils.rm(dest_path) if File.exist?(dest_path)
      copy_file(dest_path)
      true
    end
  end
end
end

def clean_leading_trailing_forward_slash(directory_string)
  directory_string.gsub(/^\/|\/$/, '')
end
