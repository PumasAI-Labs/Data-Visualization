# We have seen how to combine layers with * but AoG also offers the + operator
# to superimpose different layers
include("03-geometries.jl")

# Mean concentration on top of all concentration profiles for each dose level
plt_mean =
    data(iv_summary) *
    mapping(:time, :conc_mean; layout = :dose => nonnumeric) *
    visual(ScatterLines)
draw(plt_mean) # So far we only have the mean concentration profiles

plt_all =
    data(df_iv) *
    mapping(
        :time,
        :conc;
        layout = :dose => nonnumeric,
        group = :id => nonnumeric, # Required
    ) *
    visual(ScatterLines; color = (:grey, 0.5)) # We will talk more about customization later
draw(plt_all) # Here we only have all the concentration profiles

# We can add both plots
plt = plt_all + plt_mean
draw(plt)

# Scatter plot with a linear regression on top
data(demographics_df) *
mapping(:AGE, :eGFR) *
(visual(Scatter) + AlgebraOfGraphics.linear()) |> draw # Distributive law

## We can also add a smoothing line
data(demographics_df) *
mapping(:AGE, :eGFR) *
(visual(Scatter) + AlgebraOfGraphics.linear() + smooth()) |> draw # Both Pumas an AoG export linear
