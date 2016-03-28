require 'json'
csv = File.open("matriz.csv").read
raw_matrix = csv.split("\r\n").map {|line| line.split(",") }
packageNames = raw_matrix[0]
raw_matrix.delete_at(0)
raw_matrix.map!{|line| line.map {|el| el.empty? ? 0 : 1}}
matrix = raw_matrix.map do |l| 
	if l.size < packageNames.size
		l = l + Array.new(packageNames.size - l.size){0}
	else
		l
	end
end

data = JSON.dump({packageNames: packageNames, matrix: matrix})

File.open("data.json","w+") {|f| f.write(data)}