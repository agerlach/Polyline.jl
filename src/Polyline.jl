#= Polyline encoder and decoder

This module performes an encoding and decoding for
GPS coordinates into a polyline using the algorithm
detailed in:
https://developers.google.com/maps/documentation/utilities/polylinealgorithm

Example:
    julia> enc = encodePolyline([[38.5 -120.2]; [40.7 -120.95]; [43.252 -126.453]])
    "_p~iF~ps|U_ulLnnqC_mqNvxq`@"

    julia> dec = decodePolyline("_p~iF~ps|U_ulLnnqC_mqNvxq`@")
    [[38.5 -120.2]; [40.7 -120.95]; [43.252 -126.453]]

=#

__precompile__()

module Polyline

using HTTP

# coordinate is a type to represent a GPS data point
struct coordinate{T}
    Lat::T
    Lng::T
end

include("encode.jl")
include("decode.jl")
include("loadGPX.jl")
include("googleMaps.jl")

export decodePolyline, encodePolyline, getMapImage, mapsURL

end # module
