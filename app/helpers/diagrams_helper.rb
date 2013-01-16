module DiagramsHelper

	def get_total(diagrams)
		n = 0
		diagrams.each do |d|
			n += d.val
		end
		return n
	end

	def get_diagram_url(diagrams,name)
		arr = Array.new
		diagrams.each do |d|
    		arr << d.val
    	end

		Gchart.pie(
			title: name,
        	bg: 'efefef',
			legend: ['yes', 'no', 'i do not know'],
			data: arr)
	end

	def get_diagram_url_pie(diagrams,name)
		total = 0
		res = ''	

		GoogleChart::PieChart.new('320x200', name,false) do |pc| 
			diagrams.each do |d|
	    		pc.data d.legend, d.val
	    	end
		  res = pc.to_url
		  # Pie Chart with no labels 
		  # pc.show_labels = false 
		  # puts "\nPie Chart (with no labels)" 
		  # puts pc.to_url 
		end

		return res
	end

	def get_diagram_url_horbar(diagrams,name)
		res = ''
		arr = Array.new
		arrl = Array.new
		diagrams.each do |d|
    		arr << d.val
    		arrl << d.legend
    	end
		color_1 = 'c53711'
		GoogleChart::BarChart.new("600x200", "Opinion", :horizontal, false) do |bc|
			bc.data name, arr, color_1
			bc.axis :y, :labels => arrl, :font_size => 10
			bc.axis :x, :range => [0,1000]
			bc.show_legend = false
			bc.stacked = true
			bc.data_encoding = :extended
			# bc.shape_marker :circle, :color => '00ff00', :data_set_index => 0, :data_point_index => -1, :pixel_size => 10
			res = bc.to_url
		end
		return res
	end
end
