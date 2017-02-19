# jekyll-static-assets

This plugin allows you to define source and destination paths for static assets in Jekyll.

### Purpose

The purpose of this plugin is to allow the source & destination locations of static assets to be defined in a Jekyll site project. I built this to accomodate a build directory that lives deeper than the root level of a build. In the [jekyll-multisites](https://github.com/Designaroni/jekyll-multisites) project I use it to copy local static assets into the same destination folder as globally available `assets`.

### Usage

To use the plugin two things need to be in place:

1. Place the `jekyll-static-assets.rb` file in the `_plugins` directory of a jekyll build
2. Define two locations in the config file for the build `static_assets_source` & `static_assets_destination`

Example of it's use in a `_config.yml` as a part of my [jekyll-multisites](https://github.com/Designaroni/jekyll-multisites) project:

```
static_assets_source: sites/siteOne/_staticAssets/
static_assets_destination: assets/
```

Both 'yaml' parameters will be stripped of leading & trailing forward slashes from the path so there is no need to include them in the path except for verbosity. An additional note: the `static_assets_destination` path is relative to the config.yml `destination` parameter which the `static_assets_source` is relative to the top level project directory.

### Inspiration

Inspiration for this project came from the [jekyll-pages-directory](https://github.com/bbakersmith/jekyll-pages-directory)
