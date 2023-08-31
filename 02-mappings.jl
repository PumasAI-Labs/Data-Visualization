# mapping supports many more arguments that can help us create more complex plots
include("01-layers.jl")

# Coloring
plt_colors =
  data(demographics_df) * mapping(
    :AGE,
    :WEIGHT;
    color = :ISMALE, # We want to have different colors according to sex
  ) * visual(Scatter)
draw(plt_colors) # Works, but it is interpreting :ISMALE as a continuous variable

## We can tell AoG that :ISMALE is categorical with nonnumeric
plt_colors =
  data(demographics_df) *
  mapping(:AGE, :WEIGHT; color = :ISMALE => nonnumeric) *
  visual(Scatter)
draw(plt_colors) # Now it works as expected

# Markers
plt_markers =
  data(demographics_df) *
  mapping(:AGE, :WEIGHT; marker = :ISMALE => nonnumeric) *
  visual(Scatter)
draw(plt_markers)

## Tip: you can combine different arguments in a single plot
plt_combined =
  data(demographics_df) *
  mapping(:AGE, :WEIGHT; color = :ISMALE => nonnumeric, marker = :ISMALE => nonnumeric) *
  visual(Scatter)
draw(plt_combined)

## There are many more options depending on the type of plot that you are creating

# Faceting
## Columns
plt_cols =
  data(demographics_df) *
  mapping(:AGE, :WEIGHT; col = :ISMALE => nonnumeric) *
  visual(Scatter)
draw(plt_cols)

## Rows
plt_rows =
  data(demographics_df) *
  mapping(:AGE, :WEIGHT; row = :ISMALE => nonnumeric) *
  visual(Scatter)
draw(plt_rows)

## Layout
df_iv = dataset("iv_sd_1") # New dataset

plt_subjects =
  data(df_iv) * # Concentration profiles for each subject
  mapping(:time, :conc; layout = :id => nonnumeric) *
  visual(Lines) # New type of plot (we will see more later)
draw(plt_subjects)
