# CompactTable
module ActionView::Helpers::TagHelper
  def compact_table(opts)
    opts = {:collection => nil,
            :identifier => 'default',
            :lambda_toggle_link => lambda {},
            :lambda_displayed => lambda {},
            :lambda_hidden => lambda {}}.merge(opts)
    
    #grab the erb template from one of the lambdas
    template_binding = opts[:lambda_displayed].binding
    
    for item in opts[:collection] do
      content = []
      identifier = opts[:identifier].to_s+item.id.to_s

      # start the element
      content.push "<div class=\"compact_table_element\">"
      
      # put in the details link
      content.push "<span class=\"compact_table_details_link\">"
      content.push "<a href=\"javascript:void(0)\" onclick=\"toggle_compact_table_hidden_div('"+identifier+"');\">"
      
      concat(content.join(""), template_binding)
      content = []

      opts[:lambda_toggle_link].call item
      
      content.push "</a>"
      content.push "</span>"

      concat(content.join(""), template_binding)
      content = []


      # add the displayed part
      opts[:lambda_displayed].call item
            
      # add the hidden part
      content.push  "<div id=\"compact_table_hidden_"+identifier+"\" class=\"compact_table_hidden\">"
      concat(content.join(""), template_binding)
      content = []
      
      opts[:lambda_hidden].call item
      
      # clear
      content.push  "</div>"
      # close the elements
      content.push "</div>"
      concat(content.join(""), template_binding)
      content = []
    end
    return content
  end
end
