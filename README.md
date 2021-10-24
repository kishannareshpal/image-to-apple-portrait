## image_to_apple_portrait

This small script converts multiple images into the Apple Portraits format. Fast.

> #### !Caveat
>
> This does not magically add depth and all of the cool portrait mode effects you might be thinking.
>
> Instead this makes the image **"trick"** the Photos app to recognize the image as Portrait instead of normal.
>
> #### Ok, how does it do it's **"trick"**?
>
> The Apple Photos app recognizes an image as Portrait if the CustomRendered EXIF Tag is set to 8 (or Portrait). This program changes the tag of the image to be just that. [What the heck are EXIF Tags?](https://exiftool.org/TagNames/EXIF.html)

### Requirements

-   [Ruby 1.9 or higher](https://www.ruby-lang.org/en/)
-   Perl. But you might already have it installed in your system anyway.

### Setup and installation

1. Clone the repo
2. Install the required ruby gems:

```bash
bundle install
```

> or if you don't have [Bundle](https://bundler.io/) in your environment, you could `gem install` the gems inside the `GEMFILE` manually.\
> <small>Wouldn't recommend that though. Just install [Bundle](https://bundler.io/)! It's easier.</small>

### Usage

1. Copy the images you want to convert into the `./input/` dir.
2. Run the `main.rb` script:
    ```bash
    $ ruby main.rb
    ```
3. Voila! Grab your converted images from the `./output/` dir.

### Author

Kishan Jadav • kishan_jadav@hotmail.com

### Credits

Thanks to:

-   [Phil Harvey @boardhead](https://github.com/boardhead) (philharvey66@gmail.com) for the amazing [exiftool](https://github.com/exiftool/exiftool) ([https://exiftool.org](https://exiftool.org)) perl module to write/read EXIF from any various images (released under the [GNU General Public License](https://dev.perl.org/licenses/gpl1.html), same as Perl).
-   [Jan Friedrich @janfri](https://github.com/janfri) (janfri26@gmail.com) for [MultiExiftool](https://github.com/janfri/multi_exiftool) which is a Ruby wrapper for the [exiftool](https://github.com/exiftool/exiftool) written by Phil Harvey (released under the MIT License).
