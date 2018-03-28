
Before do |scenario|
@@startT = Time.now


end

# This block is used to terminate a Test if a Scenario fails

After do |scenario|
	if $config['testrail'] == true
		  @@endT = Time.now
		  elapsedseconds = @@endT - @@startT
		  puts "Elapsed Time in (s): #{elapsedseconds}"
		    #puts scenario.methods
		    #puts scenario.source_tags.to_s
		    finaltag = ""
			#scenario.source_tags.to_s.split(',').each do |data|
			scenario.tags.to_s.split(',').each do |data|
		      puts data
		      tag = data.to_s.split('::Tag "')[1].split('" (features')[0].strip
		        #puts tag
		        #puts tag[0,2]

					if tag.gsub(tag[0,2],"").isInteger?
		        if (tag[0,2] == "@c")
		          newtag = tag.gsub("@c", "")
		          #puts newtag
		            begin
		              finaltag = newtag.to_i
		            rescue
		            end
		        elsif (tag[0,2] == "@C")
		            newtag = tag.gsub("@C", "")
		            #puts newtag
		            begin
		              finaltag = newtag.to_i
		            rescue
		            end
		            #if newtag.is_a? Integer
		             # finaltag = newtag
		            #end
		        else
		            finaltag = ""
		        end

		          if finaltag == ""

		              puts "Cannot Find Case ID, so not going to upload result to Testrail!!!"

		          else
		              #caseId = finaltag.gsub("@C", "")
		              caseId = finaltag
		              puts "Case id: #{caseId}"
		               files = "//zgbwcfs3005.jupiter.bbc.co.uk/QA/Jenkins/Jupiter/ACTIVEXrunid.txt"
		               file = File.new(files,'r')
		               runId = file.gets
		               file.close
		               puts "Run id: "+runId
		               $runId = runId


		          # Test fail do
		              if scenario.failed?
		                statusId = "5"
		              else
		          # Test Pass do
		                statusId = "1"
		              end
		              posttestrail($runId, caseId, statusId, $versionId, elapsedseconds)
		          end
					end
		    end
	else
		puts "Not updating testrail, config set to false!"
	end
end
