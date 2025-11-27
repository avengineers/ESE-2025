## We need to change something!

### But what?

Automotive Software Factory (2011-2021) <!-- .element: class="fragment" -->

Note:

Well, we need to change something! But what?

*click*

This is where our CI journey really begins.

Namely with the development of our Automotive Software Factory.

The name came later, but there were plenty of ideas.

--

SW changes only until noon, then bugfixing and testing in driving tests.

![](images/sad-developer.png) <!-- .element: width="40%"  class="fragment" data-fragment-index="1" -->

Note:

One idea was ...

You can imagine how thrilled the developers were.

*click*

Especially considering the question of what noon means at an international corporation working worldwide.

This idea didn't really work.

What else can you do?

--

## Unit Testing is a good start.

- With our own framework based on CUnit <!-- .element: class="fragment" -->
- Automatic generation of mockups <!-- .element: class="fragment" -->
- Test Driven Development (TDD) <!-- .element: class="fragment" -->
- Nightly tests on Jenkins (and Hudson!) <!-- .element: class="fragment" -->

Note:

Sure, if you don't have unit tests, that's always a good start.

However, it wasn't that easy to make our code testable.

*click*

We built our own framework based on CUnit.

*click*

The automatic generation of mockups was a big success back then.

Writing mockups manually (especially in the era of Autosar) was simply too time-consuming and a major hurdle for developers.

*click*

We tried from the beginning to establish Test Driven Development based on requirements.

*click*

And of course, if you have unit tests, you want to run them automatically.

--

## Continuous Integration sounds nice too.

- Gerrit and Jenkins for tools <!-- .element: class="fragment" -->
- Feature-based testing via commit comments <!-- .element: class="fragment" -->
- SW development still on RCS. <!-- .element: class="fragment" -->
- CI with RCS? Yes, we can! <!-- .element: class="fragment" -->

Note:

Well, we have a Jenkins and some unit tests.

Let's do CI!

*click*

...

--

## No git? <!-- .element: class="r-fit-text" -->

## No mercy! <!-- .element: class="r-fit-text fragment" style="color:red" -->

Note:

What? No Git? You're doing CI with RCS?

*click*

Sorry, but there's no mercy then!

You're on your own!

And that's how it was. We never got away from nightly builds.

Our CI solution ran in parallel to nightly builds.

--

What we wanted to create:

![](images/sw-factory.png) <!-- .element height="60%" width="60%" -->

--

The monster that came out of it:
![](images/jenkinstein.jpg) <!-- .element height="50%" width="50%" -->

Note:

The monster that came out of it was a Jenkins that could do everything.

The Jenkinstein.

Instead of having a unified build system including pipeline, we had a multitude of jobs that were all somehow connected.

We abused Jenkins as a build system, as a test system, as a deployment system, as a monitoring system.

Everything our build system couldn't do, we packed into Jenkins pipelines.

--

Jenkins School of Witchcraft and Wizardry

![](images/jenkins-magic.png) <!-- .element height="60%" width="60%" -->

Note:

- The crux with Jenkins pipelines
  - Java developers who just want to program Java
  - And then aren't allowed to!
  - Many misunderstandings about what runs where
  - Nobody understands how the pipeline works anymore.
  - Nobody can debug.
  - Nobody can follow it.
  - Anti-pattern of CI.
- 2 Scrum teams were at least 50% occupied with maintenance.
- The "Service Card" was being passed around.

--

<!-- .slide: data-visibility="hidden" -->

### Thema: Skalierbarkeit

- Klassische IT hat ESX / VMWare im Bauchladen <!-- .element: class="fragment" -->
- 500 Statische Windows Server VMs <!-- .element: class="fragment" -->
- 2 Millionen Euro in Bare-Metal versenkt <!-- .element: class="fragment" -->
- Kombination von CI/CD, Nightly Builds und on-demand Builds <!-- .element: class="fragment" -->

--

<!-- .slide: data-visibility="hidden" -->

### Die Sicht eines Anwenders:

"Meine Komponente ist so komplex und kann nur komplett im Verbund getestet werden. Ist mir egal, ob es 10 oder 100 Kundenprojekte gibt, das muss die Software Factory können."

--

<!-- .slide: data-visibility="hidden" -->

### Die Erlösung: GitHub Enterprise

- ... ist keine Erlösung. <!-- .element: class="fragment" -->
- Mono-Repo skalierte nicht. <!-- .element: class="fragment" -->
- Testaufwand für jede Änderung zu hoch. <!-- .element: class="fragment" -->
- 24/7 Auslastung der Buildagents <!-- .element: class="fragment" -->
- Teilweise mussten nightly builds auf den Vorgänger warten <!-- .element: class="fragment" -->
- Kann man bei 24h noch von nightly builds reden? <!-- .element: class="fragment" -->
- Webportal zur Anzeige der Ergebnisse der Builds (immer rot) <!-- .element: class="fragment" -->

--

<!-- .slide: data-visibility="hidden" -->

### Und was macht eigentlich die Toolabteilung?

- Tool Dependency Handling mit eigenem Paketmanager (Hack in Java) <!-- .element: class="fragment" -->
- Hybridcloud: on-premise und AWS/EC2 <!-- .element: class="fragment" -->
- 2 Scrum Teams waren zu wenigstens 50% mit Maintenance ausgelastet. <!-- .element: class="fragment" -->
- Es ging die "Service Card" um. <!-- .element: class="fragment" -->
- GitHub Enterprise Instanz andauernd am Limit. <!-- .element: class="fragment" -->
