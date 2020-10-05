# frozen_string_literal: true

task default: :build

task :serve do
  sh 'bundle exec jekyll serve'
end

task :build do
  sh 'jekyll build'
end

task :clean do
  sh 'rm -r _site/'
end
