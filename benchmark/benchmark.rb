require 'rubygems'
require 'benchmark'
require 'fastercsv'

Benchmark.bm do |b|
  
  b.report("FasterCsv") do
    FasterCSV.parse(File.open("data/test.csv")) do |row|
    end
  end
end
