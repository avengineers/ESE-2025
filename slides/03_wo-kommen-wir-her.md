## Where do we come from?

Back to 2005 <!-- .element: class="fragment" data-fragment-index="1" -->

![18 years back](images/back_to_the_past.png) <!-- .element width="50%" class="fragment" data-fragment-index="1" -->

Note:

Where do we actually come from?

*click*

For that, we need to go back a bit into the past, specifically to the year 2005.

That's when I started as a newcomer in the automotive industry.

--

## The Automotive Industry

- Exciting products <!-- .element: class="fragment" -->
- Constantly new requirements <!-- .element: class="fragment" -->
- Well-paid jobs <!-- .element: class="fragment" -->
- Paradise for SW developers <!-- .element: class="fragment" -->

Note:

What was it like back then in the automotive industry?

Actually, pretty much the same as today.

*click*

Exciting products: brake control units, ESP, ABS, ACC, ...

*click*

Constantly new requirements, as many customers want to stand out from the competition.

*click*

The jobs were well paid.

*click*

Actually paradise for SW developers.

--

## The Job

- SW development for brake control units <!-- .element: class="fragment" -->
- Embedded C? We had that at university! <!-- .element: class="fragment" -->
- It's your code, but don't you dare change anything! <!-- .element: class="fragment" -->
- Always remember: don't break the build! <!-- .element: class="fragment" -->
- Nothing is too difficult for an engineer! <!-- .element: class="fragment" -->

Note:

And the job?

*click*

Sure, we're coding Embedded C for brake control units.

*click*

No problem, we had that at university.

*click*

Here came the first damper.

You got responsibility for a part of the code, but ideally you shouldn't change it.

*click*

Why? Don't break the build!

*click*

Sounded difficult, but we had learned at university: Nothing is too difficult for an engineer!
--

## The Starting Point

- No unit tests <!-- .element: class="fragment" -->
- A bit of SIL and HIL <!-- .element: class="fragment" -->
- Lots of driving tests <!-- .element: class="fragment" -->
- Code reuse across all projects <!-- .element: class="fragment" -->
- Several hundred developers worldwide on one codebase <!-- .element: class="fragment" -->

Note:

The starting point?

*click*

Oops, no unit tests.

Not a single line of test code in the repository.

Sure, where do you test brakes? In the car.

*click*

Well, some SIL and HIL was done.

*click*

But most of it was tested in driving tests.

So many features were tested at some point, somewhere in some project.

Hence the motto: better not change anything.

*click*

But how is that supposed to work when the code is shared across all projects,

all customers come around the corner with new requirements..

*click*

and several hundred developers worldwide are working on one codebase?


--

<!-- .slide: data-visibility="hidden" -->

## Die Tools

- MKS / PTC Integrity oder "RCS on Steroids" <!-- .element: class="fragment" -->
- GNU Make / MSYS in Java GUI auf Windows 2000 <!-- .element: class="fragment" -->
- Build Server auf ESX / VMWare <!-- .element: class="fragment" -->
  - Remote Builds <!-- .element: class="fragment" -->
  - Nightly Builds <!-- .element: class="fragment" -->

Note:
- User konnte remote Builds per GUI triggern
- Nightly Builds automatisch

--

## Continuous What?

![](images/kind_im_brunnen.jpg) <!-- .element: width="40%" class="fragment" data-fragment-index="1" -->

Continuous "Child in the Well" <!-- .element: class="fragment" data-fragment-index="1" -->

Note:

When someone asks me today what Continuous Integration is, I like to remember that time.

About what Continuous Integration is absolutely NOT.

At some point, I came up with a fitting name for the situation back then:

*click*

Continuous "Child in the Well".

What does that mean exactly?

1. Highest quality criterion: SW linkable.
2. Some project is always red (compile or link errors)
3. No test automation
4. No unit tests
5. Developers are evil, they build bugs into the code.

And how did you feel as a developer?

*click*

--

<!-- .slide: data-visibility="hidden" -->

## Der Prozess: ASPICE

![](images/aspice-1.png) <!-- .element width="80%" -->

Note:
- wird nur als Last angesehen
- Entwicklung läuft richtig, da muss nichts geändert werden.
- Wer soll die ganzen Dokumente erzeugen?
- So viel Zeit haben wir gar nicht.

--

![Valley of Tears](images/tal_der_traenen.jpg) <!-- .element width="65%" -->

Note:

Like in the valley of tears.
