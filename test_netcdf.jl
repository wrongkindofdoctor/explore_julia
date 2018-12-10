#test_netcdf.jl
# This script uses the 'Quickstart' instructions from the 
# JuliaGeo netCDF packagehttps://github.com/JuliaGeo/NetCDF.jl
# 
# Install the netCDF package using the Julia package manager
import Pkg
#Pkg.add("NetCDF")
# load the NetCDF library
using NetCDF
println("PROCESSING")
# create a file with a variable called 'precip'
filename="testfile.nc"
varname="precip"
#The attributes defined in the Dict attribs are written to the file and are
# associated with the newly created variable.
attribs = Dict("units" => "mm/d", "data_min" => 0.0, "data_max" => 87.0)
# create the file, and define the global dimensions
# 'x1', as a range of from 11-20, and  't' with units of 's'
units = Dict("units"=>"s")
nccreate(filename,varname,"x1",collect(11:20), "t", 20, units , atts=attribs)
# write data to file
d=rand(10,20)
ncwrite(d, filename, varname)
# read the 'precip' data from the file
precip = ncread(filename, varname)

println(precip)
