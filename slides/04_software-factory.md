## Wir müssen was ändern!

### Aber was?

Automotive Software Factory (2011-2021) <!-- .element: class="fragment" -->

Note:

Tja, wir müssen was ändern! Aber was?

*click*

Hier startet unsere CI Reise eigentlich erst so richtig.

Nämlich mit dem Aufbau unserer Automotive Software Factory.

Der Name kam erst später, aber Ideen gab es genug.

--

SW Änderungen nur bis 12 Uhr mittags, danach Bugfixing und Testen beim Fahrversuch.

![](images/sad-developer.png) <!-- .element: width="40%"  class="fragment" data-fragment-index="1" -->

Note:

Eine Idee war ...

Ihr könnt euch vorstellen, wie begeistert die Entwickler waren.

*click*

Zumal sich die Frage stellt, was 12 Uhr mittags bei einem internationalen Konzern ist, der weltweit verteilt arbeitet.

Diese Idee hat nicht wirklich funktioniert.

Was kann man sonst noch machen?

--

## Unit Testing ist ein guter Anfang.

- Mit eigenem Framework basierend auf CUnit <!-- .element: class="fragment" -->
- Automatische Generierung von Mockups <!-- .element: class="fragment" -->
- Test Driven Development (TDD) <!-- .element: class="fragment" -->
- Nightly Tests auf Jenkins (und Hudson!) <!-- .element: class="fragment" -->

Note:

Klar, wenn man keine Unit Tests hat, dann ist das immer ein guter Anfang.

Allerdings war das gar nicht so einfach, unseren Code testbar zu machen.

*click*

Wir haben uns ein eigenes Framework gebaut, basierend auf CUnit.

*click*

Die automatische Generierung von Mockups war ein großer Erfolg damals.

Das händische Schreiben von Mockups (gerade in Zeiten von Autosar) war einfach zu aufwändig und eine große Hürde für die Entwickler.

*click*

Wir von Anfang an versucht, Test Driven Development basierend auf den Anforderungen zu etablieren.

*click*

Und klar, wenn man Unit Tests hat, will man die auch automatisiert ausführen.

--

## Continuous Integration klingt auch nett.

- Gerrit und Jenkins für Tools <!-- .element: class="fragment" -->
- Feature-based Testing mittels Commit-Kommentar <!-- .element: class="fragment" -->
- SW Entwicklung weiterhin auf RCS. <!-- .element: class="fragment" -->
- CI mit RCS? Yes, we can! <!-- .element: class="fragment" -->

Note:

Ja gut, wir haben einen Jenkins und ein paar Unit Tests.

Lasst uns doch mal CI machen!

*click*

...

--

## No git? <!-- .element: class="r-fit-text" -->

## No mercy! <!-- .element: class="r-fit-text fragment" style="color:red" -->

Note:

Was? Kein Git? Ihr macht CI mit RCS?

*click*

Sorry, aber dann gibt es keine Gnade!

Ihr seid auf euch alleine gestellt!

Und so war es auch. Wir sind nie von Nightly Builds weggekommen.

Unsere CI Lösung lief parallel zu nightly builds.

--

Was wir erschaffen wollten:

![](images/sw-factory.png) <!-- .element height="60%" width="60%" -->

--

Das Monster, dass dabei rauskam:
![](images/jenkinstein.jpg) <!-- .element height="50%" width="50%" -->

Note:

Das Monster, dass dabei rauskam, war ein Jenkins, der alles konnte.

Der Jenkinstein.

Anstatt ein einheitliches Buildsystem incl. Pipeline zu haben, hatten wir eine Vielzahl von Jobs, die alle irgendwie zusammenhingen.

Wir missbrauchten Jenkins als Buildsystem, als Testsystem, als Deployment-System, als Monitoring-System.

All das, was unser Buildsystem nicht konnte, haben wir in Jenkins Pipelines gepackt.

--

Jenkins School of Witchcraft and Wizardry

![](images/jenkins-magic.png) <!-- .element height="60%" width="60%" -->

Note:

- Die Krux mit den Jenkins Pipelines
  - Java-Entwickler, die einfach Java programmieren wollen
  - Und es dann nicht dürfen!
  - Viele Missverständnisse, was wo ausgeführt wird
  - Keiner versteht mehr, wie die Pipeline funktioniert.
  - Keiner kann debuggen.
  - Keiner kann es nachvollziehen.
  - Anti-Pattern von CI.
- 2 Scrum Teams waren zu wenigstens 50% mit Maintenance ausgelastet.
- Es ging die "Service Card" um.

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
