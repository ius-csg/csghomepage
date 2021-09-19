
This is the web site is for the CSG web page.

## RubyMine
If you use RubyMine for your IDE.
1. Install JetBrains Toolbox
2. Install JetBrains RubyMine 
3. Once RubyMine is installed get from Version Control and clone the git repository. 

## Build instructions 
To build the website into HTML, follow these steps.

1. Install Ruby version 2.x on your system with the provided [installer](https://rubyinstaller.org/downloads/) 
2. Install dependencies via Bundler. Ex. `bundle install`
3. Build using rake. Ex. `bundle exec rake`
4. Generated HTML will be placed in ./_site

## Development 
To actively develop on the Site you will first need to install Jeykell with `gem install jekyll bundler`.

Then use one of the following two methods to see your changes.

#### Jetbrains 
1. Open the file ```.run\Serve CSGHomepage.run.xml``` in the project root directory.
2. In the top right of window of the file you will see a header that reads ```Open Run/Debug Configurations``` and click on it.
3. You will be in the Run/Debug configuration window, click the "apply" Button
4. Click the "OK" button.
5. You will now be able to hit the play button in the top right of the editor to serve the website.

#### CLI
1. Change direcotory to the root of the project.
2.  Run `bundle exec jekyll serve` to start serving the website.