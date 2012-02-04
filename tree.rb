#!/usr/bin/env ruby
# coding : UTF-8

def tree
  gitFiles = `git ls-files`.split("\n")
  gitFiles.map!{|file| file.split("/")}
  make_tree gitFiles
end

def make_tree(gitFiles)
  tree = []
  tree << "."
  gitFiles.each{|file|
    file.each_with_index.map{|f,i|
      tr = i==0 ? "├" : "│"
      ee = i==0 ? "── " : " ├── "
      tree << (tr + "  "*i + ee)+f
    }
  }
  tree.uniq.map{|key|puts key}
end

tree()
