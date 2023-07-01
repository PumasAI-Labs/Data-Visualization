# So far we have seen only scatter and line plots, but AoG supports many more
include("02-mappings.jl")

# Bar plots
using DataFramesMeta # We will do some minimal data wrangling

# Mean age for each sex group
mean_ages = @by demographics_df :ISMALE begin
    :AGE = mean(:AGE)
end

data(mean_ages) *
    mapping(
        :ISMALE => nonnumeric,
        :AGE
    ) *
    visual(BarPlot) |> draw # We use the piping operator

## Tip: you can achieve the same results without data wrangling using expectation
data(demographics_df) *
    mapping(
        :ISMALE => nonnumeric,
        :AGE
    ) *
    AlgebraOfGraphics.expectation() |> draw # Both Pumas and AlgebraOfGraphics export expectation

## Tip: there is also a pre-built function for histograms
data(demographics_df) *
    mapping(:AGE) *
    histogram() |> draw

# ScatterLines: Scatter + Lines
iv_summary = @by df_iv [:time, :dose] begin # Mean concentration profile for each dose level
    :conc_mean = mean(:conc)
    :conc_std = std(:conc)
end 

data(iv_summary) *
    mapping(
        :time,
        :conc_mean;
        color=:dose => nonnumeric
    ) *
    visual(ScatterLines) |> draw

## Compare with Lines and Scatter

# Error bars
data(iv_summary) *
    mapping(
        :time,
        :conc_mean,
        :conc_std; # Error bar length
        color=:dose => nonnumeric
    ) *
    visual(Errorbars) |> draw # We only get the error bars

## Common use case: error bars + ScatterLines
data(iv_summary) *
    mapping(
        :time,
        :conc_mean,
        :conc_std;
        color=:dose => nonnumeric
    ) *
    (visual(Errorbars) + visual(ScatterLines)) |> draw # We go over this in the next script

# Box plots
data(demographics_df) *
    mapping(
        :ISMALE => nonnumeric,
        :AGE
    ) *
    visual(BoxPlot) |> draw

# Violin plots
data(demographics_df) *
    mapping(
        :ISMALE => nonnumeric,
        :AGE
    ) * 
    visual(Violin) |> draw

# Make sure to check the documentation to see some more options:
# https://docs.makie.org/stable/examples/plotting_functions/index.html#plotting_functions