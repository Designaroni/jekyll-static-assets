# jekyll-static-assets

### Purpose

Jekyll Static Assets accomdates alternate source & destination locations of static assets. Source & Destination folder locations can be defined in a Jekyll project outside of the default `assets` directories (pre or post compile).

I built this plugin to accomodate the static assets used in [jekyll-multisites](https://github.com/Designaroni/jekyll-multisites). In that project it copies static assets from a subfolder to Jekyll's default destination for compiled `assets` like sass.

### Usage

To use the plugin two things need to be in place:

1. Place the `jekyll-static-assets.rb` file in the `_plugins` directory of a jekyll build.
2. Define source & destination locations in the config yaml file using `static_assets_source` & `static_assets_destination`.

Example of it's use as a part of my [jekyll-multisites](https://github.com/Designaroni/jekyll-multisites) project:

```
static_assets_source: sites/siteOne/_staticAssets/
static_assets_destination: assets/
```

### 2 Gotcha's

1. Both `yaml` parameters will be stripped of leading & trailing forward slashes from the path so there is no need to include them in the path except for verbosity. 
2. The `static_assets_destination` path is relative to the config.yml `destination` parameter which the `static_assets_source` is relative to the top level project directory.

### Inspiration

Inspiration for this project came from the [jekyll-pages-directory](https://github.com/bbakersmith/jekyll-pages-directory)
