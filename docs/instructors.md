---
title: Instructor's Notes for Pumas-AI Data Visualization Workshop
---

[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

Start with `01-layers.jl`, which covers the basic structure used to create a plot with `AlgebraOfGraphics.jl`: `data`, `mapping`, and `visual` layers.
Begin by briefly explaining `PharmaDatasets.jl`, the source of data for the workshop. Next, go over the `data` function, which is the simplest layer, used to 
inform `AoG.jl` (short for `AlgebraOfGraphics.jl`) about the data source for the plot. After that, explain `mapping`, which is in charge of defining how that data 
will be used in the plot. Lastly, cover the `visual` layer, which defines the type of plot to be created. Once you have explained all the layers, show how to 
create a plot by combining them with the `*` operator (the use of `*` will be explained in more detail later in the lesson). Finally, showcase the `draw` 
function, which is used to display plots. If you are running the code examples in JuliaHub, you can spend some time demonstrating how to use the plot 
navigator. Users might find it particularly useful to learn how to access previously generated plots and how to save plots as images.

Next, move on to the `02-mappings.jl` script, which focuses on using the `mapping` function. Start by explaining how to use the `color` and `marker` keyword 
arguments to incorporate more variables into the plot. Use the provided `color` example to explain why sometimes `nonnumeric` is necessary for categorical 
variables encoded with numbers. Conclude this part of the lesson by showing that `mapping` supports using multiple keyword arguments together, as shown in the 
example that used both `color` and `marker`. The next topic is faceting, which allows creating multiple subplots based on a categorical variable. Discuss the 
`col` and `row` keyword arguments, used to separate subplots into columns or rows, respectively. Lastly, demonstrate how to create a grid of plots using the 
`layout` keyword argument. 

Afterward, cover the contents of `03-geometries.jl`. The code examples in this script focus on the use of `visual` and the various types of plots that can be 
created with `AoG.jl`. Begin by demonstrating how to create a bar plot and how the built-in function `expectation` can be useful for automatically generating a 
bar plot that shows the mean values of a variable. It may also be helpful to explain the `histogram` function, which, as the name suggests, facilitates the creation of histograms. Emphasize how using built-in functions like `expectation` and `histogram` reduces the need for data wrangling before plotting. After 
that, cover the other geometries discussed in the script: `ScatterLines`, `Errorbars`, `BoxPlot`, and `Violin`. To conclude this segment of the workshop, 
highlight that there are numerous other geometries available and demonstrate how participants can find them in 
[`Makie.jl`'s documentation](https://docs.makie.org/stable/examples/plotting_functions/index.html#plotting_functions).

The next part of the workshop will focus on using the `+` and `*` operators in `AoG.jl`, and the related script is `04-algebra.jl`. Start by providing a brief 
explanation of the `*` operator, which combines layers and has been used extensively in the previous code examples. Next, show how individual plots can be 
superimposed with the `+` operator, allowing the creation of much more complex plots using different data sources. Next, use the examples to showcase that both 
`*` and `+` obey the distributive law, enabling the superimposition of layers with a very intuitive and concise syntax. This part of the script should also 
introduce the `linear` and `smooth` built-in functions, which allow plotting a linear regression and a smoothing line, respectively.


The final script for the workshop is `05-customization.jl`, which focuses on plot customization in `AoG.jl`. Begin by demonstrating how to customize axis labels 
using the pair syntax (`:column_name => "display name"`) and how a similar syntax can be used to apply transformations and rename in one go (`:column_name => 
function => "display name"`). Proceed to the next part of the script, which deals with axis customization using the `axis` keyword argument. Cover the 
`NamedTuple` syntax used to pass arguments to `axis` and showcase the commonly used customization options through examples. Lastly, emphasize that both `AoG.jl` 
and `Makie` offer *extensive* support for customization. Show participants how to explore more customization options in [`Makie.jl`'s 
documentation](https://docs.makie.org/stable/examples/blocks/axis/index.html#attributes).

In the next part of `05-customization.jl`, cover various customization options, such as creating custom color palettes using the `palettes` keyword argument and 
applying specific customization options to different geometries (e.g., `markersize` for `Scatter` and `linestyle` for `Lines`). Then, discuss the `renamer` 
helper function, highlighting its role in customizing plot legends, column or row titles. Lastly, explain the `figure` keyword argument for customizing the 
`Figure` or "canvas" on which the plot is drawn.

## Get in touch

If you have any suggestions or want to get in touch with our education team,
please send an email to <training@pumas.ai>.

## License

This content is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
