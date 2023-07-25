# AoG plots have nice defaults, but we will often want to customize them
include("04-algebra.jl")

# Axis

## Labels
### Scatter plot of age vs weight
data(demographics_df) *
    mapping(
        :AGE,
        :WEIGHT
    ) *
    visual(Scatter) |> draw # The axis labels are the same as the column names

# We can customize axis labels with =>
data(demographics_df) *
    mapping(
        :AGE => "Age (years)", # :column_name => "display name"
        :WEIGHT => "Weight (kg)"
    ) *
    visual(Scatter) |> draw

## Tip: you can also use this syntax to apply transformations
data(demographics_df) *
    mapping(
        :AGE => round => "Age (years)", # :column_name => function => "display name"
        :WEIGHT => (i -> i*2.2) => "Weight (lb)"
    ) *
    visual(Scatter) |> draw

## Other customizations
### Scales
plt_iv = data(iv_summary) *
            mapping(
                :time => "Time (hours)",
                :conc_mean => "Concentration (μg/L)";
                color=:dose => nonnumeric => "Dose (mg)" # Also applies to keyword arguments
            ) *
            visual(ScatterLines)

draw(plt_iv) # Same plot as before

draw(
    plt_iv;
    axis=(; # NamedTuple
        yscale=log10, # We now added a logarithmic scale
        # Also works for xscale
    )
)

## Ticks
draw(
    plt_iv;
    axis=(;
        yscale=log10,
        yticks=[1, 10, 100],
        xticks=0:2:24
    )
)

## Title
draw(
    plt_iv;
    axis=(;
        yscale=log10,
        yticks=[1, 10, 100],
        xticks=0:2:24,
        title="Mean concentration profile for each dose level"
    )
)

# There are many more options: 
# https://docs.makie.org/stable/examples/blocks/axis/index.html#attributes

# Colors

## Palettes (for plots using the color keyword argument)
draw(
    plt_iv;
    palettes=(;
        color=[:navyblue, :limegreen, :coral]
    )
)

## Check out the extensive list of predefined colors:
## https://juliagraphics.github.io/Colors.jl/stable/namedcolors/
## You can also use hex codes, rgb and other formats if you can't find the right color for you

# Geometries (customize individual types of plots)
base_plt = data(demographics_df) *
    mapping(
        :AGE => "Age (years)",
        :eGFR => "eGFR"
    )

visuals = (
    visual(Scatter; color=:grey, markersize=10, strokewidth=0.5) + 
    AlgebraOfGraphics.linear()*visual(; color=:navyblue, linestyle=:dash)
)

plt_reg = base_plt*visuals

draw(plt_reg)

## Another example: box plots
data(demographics_df) *
    mapping(
        :ISMALE => nonnumeric,
        :AGE
    ) *
    visual(
        BoxPlot; 
        color=:firebrick,
        show_notch=true,
        whiskerwidth=0.2
    ) |> draw

## Check specific customization options for each type of plot:
## https://docs.makie.org/stable/examples/plotting_functions/index.html#plotting_functions

# Legends and facets
data(demographics_df) *
    mapping(
        :AGE,
        :WEIGHT;
        color=:ISMALE => nonnumeric
    ) *
    visual(Scatter) |> draw

## Let's change the sex encoding (renamer)
sex_renamer = renamer(
    0 => "Female",
    1 => "Male"
)

plt_rename = data(demographics_df) *
    mapping(
        :AGE,
        :WEIGHT;
        color=:ISMALE => sex_renamer => "Sex" # nonnumeric is no longer needed
    ) *
    visual(Scatter)
draw(plt_rename)

## Tip: you can customize the legend
draw(
    plt_rename;
    legend=(;
        position=:top,
        markersize=15,
        titleposition=:left
    )
)

## It also works for faceting
data(demographics_df) *
    mapping(
        :AGE,
        :WEIGHT;
        col=:ISMALE => sex_renamer => "Sex" # Works for col, row, layout
    ) *
    visual(Scatter) |> draw

# Figure
draw(plt_subjects) # Somewhat small

## Increase the resolution
draw(
    plt_subjects;
    figure=(;
        resolution=(2000, 1500),
        fontsize=28 # We often need to increase the font size when we increase the resolution
    )
)
