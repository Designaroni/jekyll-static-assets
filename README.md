# jekyll-static-assets-image-paths

This plugin allows you to define source and destination paths for static assets in Jekyll.

### Purpose

The purpose of this plugin is to allow the source & destination locations of static assets to be defined in a Jekyll site project. I built this to accomodate a directory that lives outside of the root level of a builds source files and to place contents of that location into an `assets` directory within . It really works as a tool that can define source & destination folders for certain assets, therefore I am not sure what to call it.

As the ruby language is not my main tool for conquering the web I look forward to any feedback I can get on this.

### Usage

To use the plugin two things need to happen

1. Place the `jekyll-static-assets-image-paths.rb` file in the `_plugins` directory of a jekyll build
2. Define two locations in the config file for the build `static_assets_images_source` & `static_assets_images_destination`

Example of it's use in a `_config.yml` as a part of my jekyll-multisites project:

```
static_assets_images_source: sites/siteOne/_staticAssets/images
static_assets_images_destination: assets/images
```

Both parameters will strip beginning & trailing forward slashes from the path. The `static_assets_images_destination` path is relative to the config.yml `destination` parameter.

### Inspiration

Inspiration for this project came from [jekyll-pages-directory](https://github.com/bbakersmith/jekyll-pages-directory)
