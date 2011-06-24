require 'rubygems'
require 'faster_csv'

  describe FasterCSV do
    context "parse csv with different delimeters and formats" do
      
      it "should parse simple csv file with 'tab' delimiter per line properly" do
        expected = [["1","2","3"],["4","5","6"]]
        i = 0
        FasterCSV.parse(File.read(File.dirname(__FILE__) + '/data/test.tsv'), :col_sep => "\t") do |row|
          row.should == expected[i]
          i += 1
        end 
        i.should  == expected.length
      end

      it "should parse simple 'inmobi' csv file properly" do
        expected = []
        expected << ["1/27/2011","groupon_inmobi1@fluentnews.com","424412.00","679.00","33.95","12.00"]
        expected << ["1/28/2011","groupon_inmobi1@fluentnews.com","386349.00","1043.00","52.15","12.00"]
        expected << ["1/29/2011","groupon_inmobi1@fluentnews.com","605799.00","1978.00","98.90","11.00"]
        i = 0
        in_file_path = File.dirname(__FILE__) + "/data/inmobi_groupon_28th_Jan_2011.csv"
        FasterCSV.parse(File.read(in_file_path)) do |row|
          row.should == expected[i] 
          i+=1
        end
        i.should  == expected.length
      end

      it "should parse simple csv file with spaces properly" do
        expected = [["11","22","33","44","55"], ["66", nil, nil, "77", nil, nil, "88"]]
        in_file_path = File.dirname(__FILE__) + "/data/custom_test.csv"
        i = 0
        FasterCSV.parse(File.read(in_file_path), :col_sep => "\t") do |row|
          row.should == expected[i]
          i += 1
        end
        i.should  == expected.length
      end

      it "should parse csv file from ticket with \\n and \\n\\r as end of line symbols." do
        in_file_path = File.dirname(__FILE__) + "/data/faster_csv_test.txt"
        i = 0 
        height = 3 
        FasterCSV.parse(File.read(in_file_path)) do |row|
          i += 1
        end
        i.should == height
      end

      it "should parse csv with 'unix-like' end of line symbol" do
        in_file_path = File.dirname(__FILE__) + "/data/test_unix_format.csv"
        height = 6
        width = 5
        i = 1;
        FasterCSV.parse(File.read(in_file_path)) do |row|
          expected = (1..width).map{ |w| "#{i}-#{w}" }
          row.should == expected
          i += 1
          end
        i.should == height+1
      end

      
      it "should parse csv with 'windows' end of line symbol" do
        in_file_path = File.dirname(__FILE__) + "/data/test_win_format.csv"
        height = 6
        width = 5
        i = 1
        FasterCSV.parse(File.read(in_file_path)) do |row|
          expected = (1..width).map{ |w| "#{i}-#{w}" }
          row.should == expected
          i += 1
          end
        i.should == height+1
      end

      it "should parse groupon udid csv file" do
        in_file_path = File.dirname(__FILE__) + "/data/20110212_UDID_groupon.csv"
        i = 0
        height = 296
        width = 2
        FasterCSV.parse(File.read(in_file_path)) do |row|
          row.length.should == width
          i += 1
        end
        i.should == height
      end


      it "should parse jumptap groupon csv file" do
        in_file_path = File.dirname(__FILE__) + "/data/20110214_Jumptap_Groupon.csv"
        i = 0
        height = 533
        width = 6
        FasterCSV.parse(File.read(in_file_path)) do |row|
          row.length.should == width
          i += 1
        end
        i.should == height
      end
        
      it "should parse apperang groupon csv file" do
        in_file_path = File.dirname(__FILE__) + "/data/20110216_apperang_groupon.csv"
        i = 0
        height = 55 
        width = 6
        FasterCSV.parse(File.read(in_file_path)) do |row|
          row.length.to_i.should == width
          i += 1
        end
        i.should == height
      end

    end
  end
