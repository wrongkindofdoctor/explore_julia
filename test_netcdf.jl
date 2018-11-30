import Pkg
#println("hello world")
#Pkg.add("NetCDF")
using NetCDF
println("PROCESSING")
filename="testfile.nc"
varname="precip"
#This will create the variable called var1 in the file myfile.nc.
#The attributes defined in the Dict attribs are written to the file and are
#associated with the newly created variable.
#The dimensions "x1" and "t" of the variable are called "x1" and "t" in
#this example. If the dimensions do not exist yet in the file, they will be
#created. The dimension "x1" will be of length 10 and have the values 11..20,
#and the dimension "t" will have length 20 and the attribute "units" with
#the value "s".
attribs =Dict("units" => "mm/d", "data_min" => 0.0, "data_max" => 87.0)
atts2 = Dict("units"=>"s")
nccreate(filename,varname,"x1",11:20, "t", 20, atts2 , atts=attribs)
# write data to file
d=rand(1,30)
ncwrite(d, filename, varname)
