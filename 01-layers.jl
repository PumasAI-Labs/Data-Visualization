# Plotting packages
using AlgebraOfGraphics # AoG
using CairoMakie # Required (backend)

# Get our sample datasets
using PharmaDatasets
demographics_df = dataset("demographics_1") 

# AlgebraOfGraphics plots are created using layers

## The data layer: specify the data source
data_layer = data(demographics_df) # data(<DataFrame>)
typeof(data_layer) # Layer type

## The mapping layer: how are we going to map our data in the plot
mapping_layer = mapping(:AGE, :WEIGHT) # mapping(<x>, <y>, <z>)

## The visual layer: what type of plot are we going to create
visual_layer = visual(Scatter) # We are creating a scatter plot for this example

# A plot is created by joining layers
plt = data_layer * mapping_layer * visual_layer

# Now we draw our plot
draw(plt)

# It is much more common to define the plot in a single expression
plt = data(demographics_df) *
        mapping(
            :AGE,
            :WEIGHT
        ) *
        visual(Scatter)

draw(plt)

# Save and download the plot