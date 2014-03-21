# FFSplitter

## Installation

    brew install ffmpeg
    gem install ffsplitter

## Usage

`ffsplitter my-video.mp4`

or

`ffsplitter my-video.mp4 output-directory/`

Output files will use the same extension as the input file. For custom output
extensions, pass the -e option

`ffsplitter my-video.mp4 -e .aac`

This will produce audio-only .aac files for each chapter. NOTE: codecs are copied
from the source file, so you must use an compatible extension

## Testing

`bundle exec rspec`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
