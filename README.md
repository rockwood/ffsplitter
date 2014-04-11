# FFSplitter

## Prerequisites

Install [FFMpeg](http://www.ffmpeg.org/)

## Installation

    gem install ffsplitter

## Usage

```
ffsplitter test.mp4 [options]
  -e, --output-extension EXTENSION
  -o, --output-path PATH
```

### Output extension

Output files use the same extension as the input file. For custom output
extensions, pass the `-e` option. For example:

    ffsplitter my-video.mp4 -e .aac

will produce audio-only .aac files for each chapter.

**NOTE:** Codecs are copied from the source file, so you must use a
compatible extension.

## Testing

`bundle exec rspec`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## To Do

1. Handle extensions without a leading `.`
