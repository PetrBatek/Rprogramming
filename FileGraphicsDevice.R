pdf(file = "myplot.pdf") ##Open PDF device; create 'myplot.pdf' in my working directory

## create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data") ##Anotate plot; still nothing on screen
dev.off() ##Close the PDF file device

