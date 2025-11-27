## What did we actually do wrong?

Note:

At first, everything went well ...

--

## Freestyle Happiness

![](images/freestyle-happiness.png) <!-- .element width="80%" -->

Note:

Sure, when you start with Jenkins, you begin with simple freestyle jobs.

Just building.

--

## Freestyle Faith

<div style="position:relative; width:900px; height:600px; margin:0 auto;">
    <img src="images/freestyle-faith.png" style="position:absolute;top:0;left:0;" />
    <img src="images/freestyle-faith-2.png" style="position:absolute;top:0;left:350;" />
</div>

Note:

- then suddenly a bit more happens
- gradually tools need to be glued together
- Connection to the SCM system
- Reporting

--

## Holy Moly Groovy Pipelines

![](images/holy-moly-pipelines.png) <!-- .element width="80%" -->

--

![](images/pipeline-lotr.png) <!-- .element width="65%" -->

Note:
Higher, faster, further: One pipeline to rule them all.

--

## Law of the Instrument

- Pipeline as replacement build system <!-- .element: class="fragment" -->
- Build logic in pipelines (10,000s of lines of Groovy DSL) <!-- .element: class="fragment" -->
- Sufficient? No! Shared libraries and plugins still exist ... <!-- .element: class="fragment" -->
- Non-reproducible CI results <!-- .element: class="fragment" -->
- Worst case: separate repos for product source code and CI pipeline <!-- .element: class="fragment" -->

Note:

- CI system does different/more things than the build environment.
- With a hammer in hand, the world looks like a pile of nails.
- Birmingham screwdriver

--

## Continuous Complexity

![](images/weight.png) <!-- .element width="60%" style="filter: invert(100%)" -->
