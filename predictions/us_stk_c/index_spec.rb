#
# index_spec.rb
#

# Usage:
# bundle exec rspec index_spec.rb

# I use this script to create a partial full of new DanBot-scores from US Stock prices.

require "../../spec_helper.rb"

describe "cj4b4 helps me build both erb files which act as Rails templates" do

  it "Should run the sql script us_stk_c.sql" do
    `which sqt`.should == "/pt/w/b4/cj4b4/bin/sqt\n"
    # The script should have an exit so it will not hang:
    `grep exit us_stk_c.sql`.should match /^exit\n/
    time0 = Time.now
    sql_output = `sqt @us_stk_c.sql`
    # The sql script should need at least 3 seconds to finish:
    # (Time.now - time0).should > 2
    sql_output.should match /^Connected to:\n/
    sql_output.should match /^Oracle Database 11g Enterprise Edition /
    sql_output.should match /us_stk_c.sql/
    sql_output.should match /^Disconnected from Oracle Database 11g /
    # I should see a recent spool file:
    (Time.now - File.ctime("/tmp/_us_stk_c_spool.html.erb")).should < 9
    # Do a small edit:
    `grep -v 'rows selected' /tmp/_us_stk_c_spool.html.erb > /tmp/us_stk_c.html`
    (Time.now - File.ctime("/tmp/us_stk_c.html")).should < 2
  end
##

  # I Use Nokogiri to massage the HTML in us_stk_c.html and redirect it into a partial holding a table-element.
  # The partial is here:
  # ./us_stk_c/_us_stk_c_spool.html.erb
  # The partial is rendered in this file: 
  # ./us_stk_c/index.html.slim

  it "Uses Nokogiri to massage us_stk_c.html into a partial holding a table-element." do
    myf = File.open("/tmp/us_stk_c.html")
    html_doc = Nokogiri::HTML(myf)
    myf.close
    table_elem = html_doc.search("table.table_us_stk_c").first
    # Fill html4partial with a default message:
    html4partial = "No predictions have been calculated for this time period."
    unless table_elem.nil?
      # Generate some a-elements from th-elements.
      th_elems = table_elem.search("th")
      th_elems.each {|elm| 
        ei_h =   elm.inner_html
        ei_hclass=ei_h.gsub(/\n/,'').gsub(/\<br\>/,'').gsub(/\<br \/>/,'').gsub(/ /,'').sub(/\(/,'').sub(/\)/,'').downcase
        elm.inner_html = "<a href='#' class='#{ei_hclass}'>#{ei_h}</a>"
      }
      # Generate some a-elements from td-elements containing tickers.
      td_elems = table_elem.search("td")
      # Look at every td-element and see if it matches a simple reg-exp for a string of upper-case chars:
      td_elems.each {|elm|
        ei_h = elm.inner_html
        if ei_h =~ /(tkr: )([A-Z]+)/
          mytkr = $2
          elm.inner_html = "<a target='y' href='http://finance.yahoo.com/q?s=#{mytkr}'>#{mytkr}</a>"
        end
      }
      # Overwrite the default:
      html4partial = table_elem.to_html
      html4partial << "<br />"
    end

    # Im done, write it to the Rails partial:
    partial_fn = "./us_stk_c/_us_stk_c_spool.html.erb"
    fhw = File.open(partial_fn,"w")
    fhw.write(html4partial)
    fhw.close
    File.size(partial_fn).should > 1
  end
##

end

