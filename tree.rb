#!/usr/bin/env ruby

def tree
  gitFiles = `git ls-files`.split("\n")
  gitFiles.map!{|file| file.split("/")}
  make_tree gitFiles
end

def make_tree(gitFiles)
  gitFiles.each{|file|
    file.each_with_index{|f,i| p ("  "*i)+f}
  }
end

tree()
