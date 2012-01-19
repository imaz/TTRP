#!/usr/bin/env ruby

def tree
  gitFiles = `git ls-files`.split("\n")
  gitFiles.map!{|file| file.split("/")}
  make_tree gitFiles
end

def make_tree(gitFiles)
  tree=[]
  gitFiles.each{|file|
    file.each_with_index.map{|f,i| tree << ("  "*i)+f}
  }
  tree.uniq.map{|key|p key}
end

tree()
