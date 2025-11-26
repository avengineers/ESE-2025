# A CI Journey: Less Pipelines, More Happy Developers

## Sprache

English

## Zielgruppe

- Software developers
- DevOps and Platform Engineers

## Voraussetzungen

You don't need any prior knowledge.
This topic is relevant for both beginners and experts in Continuous Integration (CI).
You'll probably find it useful to have a basic knowledge of CI Pipelines and Python, but it's not essential.

## Überblick und Zusammenfassung

Continuous Integration (CI) is a crucial part of modern software development, and the automotive suppliers are right behind this.
They want to offer **off-the-shelf products** with a high degree of reusability and a short time-to-market, but OEMs want **unique selling points**.
How can you make sure that your **CI pipelines** are working **efficiently** in this kind of **multi-project landscape**?
How to deliver fast, reliable and easily reproducible feedback to developers, while keeping your CI pipelines understandable and maintainable?
It's tempting to jump into pipeline technology, implement tests for quality gates on all integration levels in a pipeline's Domain-Specific Language (**DSL**) and set up complex, multi-stage pipelines with a lot of dependencies.
But this can lead to a lot of frustration, especially when you have to deal with flaky tests of nightly builds.
How many of us want to spend the next morning analyzing and debugging errors that can't be traced or reproduced?
Not us!
We want to show you how we have simplified the CI pipelines of our Software Product Line Engineering (SPLE) Platform and made them more **maintainable**, while still delivering fast feedback to developers.
We will share our experiences and lessons learned from our CI journey in the automotive industry, focusing on how we reduced the complexity of our pipelines and improved developer happiness.
**Our path to success involves clean dependency handling and comprehensible, reproducible tests for quality gates written in Python, leading to fast, incremental builds with locally reproducible results.**

## Art der Vermittlung

Talk/Presentation

## Nutzen

Discover the ups and downs of a CI journey in the automotive industry.
Learn how to build a simple, maintainable CI solution while keeping pipelines clean and understandable.
The approach highlights the separation of pipeline logic from test logic for quality gates, ensuring reproducibility and clarity.

A solution for quality gates in the SPLE Platform, built on Python, demonstrates how a structured, test-driven approach simplifies CI processes.
The advantages of using Python for writing tests will be explored, showcasing how it helps reduce complexity in CI pipelines.

## Termine

[Link to ESE Page](https://ese-kongress.de/frontend/index.php?page_id=45391)

# German Testing Days 2024

## Eine CI Reise

oder

Weniger Pipelines, Mehr Spaß!

Note:

Hallo zusammen und willkommen zu meinem Vortrag über CI/CD. Ich möchte euch heute mitnehmen auf eine Reise, die ich vor mehr als 10 Jahren begonnen habe. Eine Reise, die mich durch viele verschiedene Projekte und Firmen geführt hat. Eine Reise, die mich gelehrt hat, dass es nicht nur um Automatisierung geht, sondern auch um die Freude an der Entwicklung von Software. (Anekdote: Zurück in die Zukunft)

## Wer sind wir?

<div>
<img src="images/karsten.jpg">

[Karsten](https://www.linkedin.com/in/karnangue/)

</div> <!-- .element: style="float: left; width: 30%" -->

<div>
<img src="images/matthias.png">

[Matthias](https://www.linkedin.com/in/matthias-eggert-b7939a18a/)

</div> <!-- .element: style="float: right; width: 40%;" -->

Note:

Okay, wer sind wir eigentlich?

Matthias hat einige Jahre in der Automobilindustrie als Softwareintegrator, Softwareentwickler und DevOps Engineer gearbeitet.

Dabei ging es immer um sicherheitsrelevante Funktionen wie Bremssysteme oder Batteriemanagementsysteme.

Wir haben schon vor gut 8 Jahren bei Continental zusammengearbeitet und sind dann gleichzeitig zu Marquardt gewechselt.

Dort haben wir gemeinsam an unserer Lösung für Software-Produktlinien gearbeitet, um die es heute nur am Rande gehen wird.

Mittlerweile arbeitet er als DevOps Engineer und Testautomatisierer bei der Qytera GmbH.

Ich selbst bin seit über 18 Jahren als Softwareentwickler im Automobilbereich unterwegs.

Von Ada, Embedded C, C++, Perl, Tcl, Python über die Entwicklung von Dev Tools bis hin zu Jenkins Pipelines hab ich schon eine Menge gesehen und gemacht.

Aktuell arbeite ich als Platform Engineer im Rhein-Main-Team der Marquardt GmbH.

Dort geht es um Software-Produktlinien, interne Developer Plattformen, Automatisierung und CI/CD.

## Wo kommen wir her?

Back to 2005 <!-- .element: class="fragment" data-fragment-index="1" -->

![18 Jahre zurück](images/back_to_the_past.png) <!-- .element width="50%" class="fragment" data-fragment-index="1" -->

Note:

Wo kommen wir eigentlich her?

_click_

Dazu geht es etwas zurück in die Vergangenheit, genauer gesagt ins Jahr 2005.

Da hab ich als Neuling in der Automobilindustrie angefangen.

--

## Die Automobilindustrie

- Spannende Produkte <!-- .element: class="fragment" -->
- Ständig neue Anforderungen <!-- .element: class="fragment" -->
- Gut bezahlte Jobs <!-- .element: class="fragment" -->
- Das Paradies für SW Entwickler <!-- .element: class="fragment" -->

Note:

Wie war das damals in der Automobilindustrie?

Eigentlich genauso wie heute.

_click_

Spannende Produkte: Bremsensteuergeräte, ESP, ABS, ACC, ...

_click_

Ständig neue Anforderungen, da viele Kunden, die sich von der Konkurrenz abheben wollen.

_click_

Die Jobs waren gut bezahlt.

_click_

Eigentlich das Paradies für SW Entwickler.

--

## Der Job

- SW-Entwicklung für Bremsensteuergeräte <!-- .element: class="fragment" -->
- Embedded C? Das hatten wir doch an der Uni! <!-- .element: class="fragment" -->
- Es ist dein Code, aber verändere bloß nichts! <!-- .element: class="fragment" -->
- Always remember: don't break the build! <!-- .element: class="fragment" -->
- Dem Ingenieur ist nix zu schwör! <!-- .element: class="fragment" -->

Note:

Und der Job?

_click_

Klar, wir hacken Embedded C für Bremsensteuergeräte.

_click_

Kein Problem, das hatten wir doch an der Uni.

_click_

Hier kam der erste Dämpfer.

Man bekam Verantwortung für einen Teil des Codes, aber verändern sollte man ihn möglichst nicht.

_click_

Warum? Don't break the build!

_click_

## Klang schwierig, aber wir hatten ja an der Uni gelernt: Dem Ingenieur ist nix zu schwör!

## Die Ausgangslage

- Keine Unit Tests <!-- .element: class="fragment" -->
- Ein bisschen SIL und HIL <!-- .element: class="fragment" -->
- Ganz viel Fahrversuch <!-- .element: class="fragment" -->
- Code Reuse über alle Projekte <!-- .element: class="fragment" -->
- Mehrere 100 Entwickler weltweit an einer Codebasis <!-- .element: class="fragment" -->

Note:

Die Ausgangslage?

_click_

Oha, keine Unit Tests.

Keine einige Zeile Testcode im Repository.

Klar, wo testet man Bremsen? Im Auto.

_click_

Gut, es wurde ein bisschen SIL und HIL gemacht.

_click_

Aber das meiste wurde im Fahrversuch getestet.

Viele Features waren also irgendwann, irgendwo in irgendeinem Projekt getestet.

Daher das Motto: besser nichts ändern.

_click_

Aber wie soll das gehen, wenn der Code über alle Projekte geshared ist,

alle Kunden mit neuen Anforderungen um die Ecke kommen ..

_click_

und mehrere 100 Entwickler weltweit an einer Codebasis arbeiten?

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

Continuous "Kind im Brunnen" <!-- .element: class="fragment" data-fragment-index="1" -->

Note:

Wenn mich heute jemand fragt, was Continuous Integration ist, dann erinnere ich mich gerne an diese Zeit zurück.

Daran, was Continuous Integration überhaupt nicht ist.

Irgendwann ist mir ein treffender Name für die Situation damals eingefallen:

_click_

Continuous "Kind im Brunnen".

Was heißt das genau?

1. Höchstes Qualitätskriterium: SW linkbar.
2. Irgendein Projekt ist immer rot (Compile- oder Link-Fehler)
3. Keine Testautomatisierung
4. Keine Unittests
5. Entwickler sind böse, die bauen Bugs in den Code.

Und wie fühlte man sich als Entwickler dabei?

_click_

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

![Tal der Tränen](images/tal_der_traenen.jpg) <!-- .element width="65%" -->

Note:

Wie im Tal der Tränen.

## Wir müssen was ändern!

### Aber was?

Automotive Software Factory (2011-2021) <!-- .element: class="fragment" -->

Note:

Tja, wir müssen was ändern! Aber was?

_click_

Hier startet unsere CI Reise eigentlich erst so richtig.

Nämlich mit dem Aufbau unserer Automotive Software Factory.

Der Name kam erst später, aber Ideen gab es genug.

--

SW Änderungen nur bis 12 Uhr mittags, danach Bugfixing und Testen beim Fahrversuch.

![](images/sad-developer.png) <!-- .element: width="40%"  class="fragment" data-fragment-index="1" -->

Note:

Eine Idee war ...

Ihr könnt euch vorstellen, wie begeistert die Entwickler waren.

_click_

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

_click_

Wir haben uns ein eigenes Framework gebaut, basierend auf CUnit.

_click_

Die automatische Generierung von Mockups war ein großer Erfolg damals.

Das händische Schreiben von Mockups (gerade in Zeiten von Autosar) war einfach zu aufwändig und eine große Hürde für die Entwickler.

_click_

Wir von Anfang an versucht, Test Driven Development basierend auf den Anforderungen zu etablieren.

_click_

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

_click_

...

--

## No git? <!-- .element: class="r-fit-text" -->

## No mercy! <!-- .element: class="r-fit-text fragment" style="color:red" -->

Note:

Was? Kein Git? Ihr macht CI mit RCS?

_click_

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

## Was haben wir eigentlich alles falsch gemacht?

Note:

Zunächst lief alles gut ...

--

## Freestyle Happiness

![](images/freestyle-happiness.png) <!-- .element width="80%" -->

Note:

Klar, wenn man mit Jenkins startet, geht es mit einfachen freestyle jobs los.

Einfach nur bauen.

--

## Freestyle Faith

<div style="position:relative; width:900px; height:600px; margin:0 auto;">
    <img src="images/freestyle-faith.png" style="position:absolute;top:0;left:0;" />
    <img src="images/freestyle-faith-2.png" style="position:absolute;top:0;left:350;" />
</div>

Note:

- dann passiert plötzlich doch ein bisschen mehr
- nach und nach müssen Tools zusammengeklebt werden
- Anbindung ans SCM System
- Reporting

--

## Holy Moly Groovy Pipelines

![](images/holy-moly-pipelines.png) <!-- .element width="80%" -->

--

![](images/pipeline-lotr.png) <!-- .element width="65%" -->

Note:
Höher, schneller, weiter: Eine Pipeline, um sie alle zu knechten.

--

## Law of the Instrument

- Pipeline als Ersatzbuildsystem <!-- .element: class="fragment" -->
- Buildlogik in Pipelines (10000e Zeilen Groovy DSL) <!-- .element: class="fragment" -->
- Ausreichend? Nein! Shared Libraries und Plugins gibt es ja auch noch ... <!-- .element: class="fragment" -->
- Nicht nachvollziehbare CI Ergebnisse <!-- .element: class="fragment" -->
- Worst case: getrennte Repos für Produkt Source Code und CI Pipeline <!-- .element: class="fragment" -->

Note:

- CI-System macht andere/mehr Sachen als die Buildumgebung.
- Mit dem Hammer in der Hand sieht die Welt wie ein Haufen von Nägeln aus.
- Birmingham screwdriver

--

## Continuous Complexity

![](images/weight.png) <!-- .element width="60%" style="filter: invert(100%)" -->

## Wie geht es besser?

- Ein Meta-Buildsystem (z.B.: CMake) <!-- .element: class="fragment" -->
- Ein richtig schnelles Buildsystem für C/C++ (ninja) <!-- .element: class="fragment" -->
- Mittels Bootstrapping alle Dependencies <!-- .element: class="fragment" -->
- Andere Git Repos via Cmake's Fetch_Content() <!-- .element: class="fragment" -->
- Pipeline als Code im Repo <!-- .element: class="fragment" -->

Note:

Okay, wie geht es denn nun besser?

_click_

Naja, auf jeden Fall braucht man ein Buildsystemgenerator, der die Abhängigkeiten auflöst und die Buildfiles generiert.

CMake ist da aus unserer Sicht ein guter Kandidat.

Man braucht schon irgendeine Art von Pipeline, aber nur als Steuerung des Build Systems.

Kein CI Only Code

--

<!-- .slide: data-visibility="hidden" -->

## SPLE Plattform

- VSCode plus CMake Tools
- Konfiguration as Code
- Einfach Erweiterbar
- SPLE ermöglicht modulare SW Entwicklung
- Komponenten als Bausteine der Software
- Separate Repositories dank RTE Schnittstellen
- Eigene Konfiguration
- Variantenunabhängige Unittests
- Trennung von Kunden- und Entwicklersicht
- Integrationstests der Komponenten möglich

--

## Jenkins

- macht NICHTS anders als der User lokal <!-- .element: class="fragment" -->
- Build ist ein One-Liner <!-- .element: class="fragment" -->
- Automatische Joberzeugung für Branches und Pull Requests <!-- .element: class="fragment" -->
- Wenige Plugins zum Anzeigen von Ergebnissen <!-- .element: class="fragment" -->
- Unterstützung der Entwickler bei Analyse von Fehlern <!-- .element: class="fragment" -->

Note:

- https://www.jenkins.io/doc/book/pipeline/pipeline-best-practices/
- Minimaler Jenkinsfile plus Organisation Folder Plugin (Bitbucket, GitHub)
- Ein einziger Konfigfile (config.xml der Orga)

--

<!-- .slide: data-visibility="hidden" -->

## Reporting

- Weniger ist mehr
- Keine Datenbank
- Kein Ergebnisportal selber stricken
- Jenkins + Artifactory und gut

--

## Pipeline Happiness

![](images/pipeline-happiness.png) <!-- .element height="80%" width="80%" -->

--

![Gipfel der Freude](images/gipfel_der_freude.jpg) <!-- .element height="65%" width="65%" -->

---

![](images/feedback.png) <!-- .element height="48%" width="48%" -->

---

![](images/qr-presentation-link.png) <!-- .element height="40%" width="40%" -->
https://xxthunder.github.io/GermanTestingDay2024/

## Brainstorming

### CI vs. Local

Let us focus on the differences between CI and local environments.

#### Trigger

- CI: push to main branch, pull request, nightly build
- Local: command line, GUI

#### Pipeline

**Local**

1. Clone repository
2. Install dependencies (e.g., tools, external libraries)
3. Build (variant(s))
4. Report?

**CI**

1. Check trigger and determine what quality gate to run
   - pull request -> run quick quality gate
   - push to develop branch -> run full quality gate
   - nightly build -> run long-running tests
2. Nodes orchestration (start different builds in parallel on different nodes)
   1. Clone repository
   2. Install dependencies (e.g., tools, external libraries)
   3. Build (variant(s))
   4. Generate reports
3. Wait for all nodes to finish and collect results
4. Report

### Journey

#### What we had

20 years ago we started with the first CI pipelines for our software platform:

- **R1** Source code repository (not git) for the product line with all variants
- **R2** Proprietary build automation server (Smoke Tester - remote build)
- no unit tests
- static code analysis
- software in the loop
- hardware in the loop
- vehicle tests
- code reuse
- hundreds of developers

15 years ago

- proprietary unit test framework
- Jenkins(Hudson) for CI
  - nightly builds for all variants to run the unit tests

Then all departments wanted to have the automation too.
Solution: freestyle jobs for every test level or test tool.

- Unit test jobs
- SIL jobs
- Build jobs

But no quality gate and no continuous integration.

12 years ago

- **R1** Source code repository (not git) for the product line with all variants
- **R2** Git Repository for the CI configuration
  - json files to configure the Jenkins pipeline for the product line
- **R3** Jenkins job DSL to implement the pipeline logic
  - clone **R2** repository
  - parse json files
  - schedule build jobs for all variants in parallel based on the json configuration
- **R4** Flight Board
  - web interface to show the build status of all variants in real-time
  - search, filter and download build artifacts for every "flight"
  - asynchronously append build result to flights (e.g., when a long-running hardware integration test is finished)
- **R5** Eclipse based build system generator
  - focus was on GUI for developers
  - generated build system (Makefiles)

**Trigger**

Every night start the builds for all SPL variants configured in the **R2** repository.

Why not for every pull request?
It took too much time and slowed down the development.

If one focuses on the nightly builds, then you need reports and status monitoring.

- public build status
- flight board

####

#### What we have now

TODO

### About the article

- how do we want to present the CI **journey**?
- add maybe a section for next steps to be done. What is still missing?

## Tagungsbandbeitrag

## Leitfaden

[Link to ESE Guideline](https://ese-kongress.de/frontend/index.php?page_id=45396)

Leitfaden zur formalen Gestaltung eines Tagungsband-Beitrags
Gelebte Tradition und gute Praxis ist es, dass Vortragende begleitend zu ihrem Vortrag einen Autorenbeitrag zum Tagungsband des ESE Kongress beitragen. Ziel ist es, dem Leser ein hochwertiges, nachhaltiges digitales Begleitbuch während des Kongresses oder für die Nachlese zu bieten.

Im Folgenden finden Sie Hinweise zur Gestaltung Ihres Autorenbeitrags. Mit der Einhaltung dieser Vorgaben sowie der Termine unterstützen Sie uns in diesem Ziel und erleichtern uns die Verarbeitung Ihres Artikels.

Herzlichen Dank im Voraus für Ihre Unterstützung.

Download:
Beispiel (PDF) - Beispielmanuskript Tagungsband-Beitrag

Wichtige Termine
Bis spätestens 12. Oktober:
Prosatext (Word Doc) für Tagungsband - NUR für Vorträge, nicht für Seminare

Wichtig für die Organisation
Unsere Prozesse sind automatisiert. Bitte laden Sie daher Ihren Beitrag für das Tagungsband (Word-Doc) direkt in unsere Referenten-Datenbank. Verwenden Sie hierzu das Log-in

Senden Sie uns das Material nicht per E-Mail!

Formale Kriterien für Ihren Autorenbeitrag
Umfang
Text gesamt ca. 7.000 bis 12.000 Zeichen (inkl. Leerzeichen). Falls Sie darüber hinaus ausführlichere oder ergänzende Texte z.B. als Download zur Verfügung stellen wollen, geben Sie diese bitte als Bezugsquelle an.

Qualität
Bitte liefern Sie für den Tagungsband einen hochwertigen Fachbeitrag aus der Praxis oder einen fundierten wissenschaftlichen Beitrag, wie Sie ihn selbst in einem professionellen Tagungsband erwarten würden (keine Werbung, kein Marketing, keine Produktvorstellung).

Sprache
Deutsch oder Englisch

Dateiformat
Word

Layout
Um ein einheitliches Layout zu gewährleisten, stellen Sie bitte vor Beginn der Schreibarbeit folgende Parameter ein:

Papierformat: DIN A4 hoch
Ränder:
2 cm oben
3 cm unten
3 cm links
3 cm rechts
Gestaltungsraster Satzspiegel (Seitenlayout): einspaltig, Blocksatz
Zeilenabstand: mehrfach 1,15
Schrifttypen der einzelnen Textelemente:
Überschrift/ Titel: Times New Roman, 16 pt bold
Untertitel: Times New Roman, 12 pt bold
Vorspann: Times New Roman, 12 pt bold
Fließtext: Times New Roman, 12 pt
Zwischenüberschrift: Times New Roman, 12 pt bold
Bild-/Tabellenbeschriftung: Times New Roman, 12 pt
Hervorhebungen im Text: kursiv - bitte sparsam und nur falls wirklich notwendig!
Formatierungen: Vermeiden Sie im Fließtext jegliche Formatierungen wie
automatische Absatznummerierungen
Einrückungen
Fettdruck, Unterstreichungen, Farbmarkierungen etc.
Verzichten Sie bitte unbedingt auf
Kopf-/Fußzeilen
Seitennummerierungen
Logos
Bilder und Tabellen
Direkt im Text platzieren (keine separaten Grafikdateien)
Fortlaufend nummerieren
Immer mit erklärender Bildunterschrift versehen
Bild-/Tabellenbeschriftung: Times New Roman, 12 pt
Wichtig: Versehen Sie alle Bilder/Grafiken mit einer Quellenangabe!
Darstellung: Verzichten Sie auf dunklen Hintergrund und achten Sie auf hohe Kontraste.
Achten Sie insgesamt auf eine hohe grafische Qualität bzw. Auflösung (300 dpi).
Formeln, Codebeispiele etc.
Bevorzugt als Bild einbetten
Empfohlener Schrifttyp: Fixschrift, z.B. Courier bzw. Courier New
Schriftgröße: 12 pt
Inhalt
Typische Elemente des Autorenbeitrags
Überschrift
Optional: Untertitel
Autorenname(n), Name der Firma/des Instituts
Vorspann: Problemstellung, Fragestellung, Zielsetzung des Beitrags (1 Absatz)
Hauptteil (ca. 10.000 Zeichen)
Einführung in die Problemstellung, Rahmenbedingungen, Hintergründe, Fragestellung
Theoretische Grundlagen und Begriffe kurz, soweit nötig
Lösungsansätze, Prinzipien, Zusammenhänge
Ergebnisse, Nutzen, Vor- und Nachteile, Randbedingungen
Beispiele
Zusammenfassung, kritische Würdigung, offene Fragestellungen, Ausblick, Empfehlungen
Optional: Symbol-/ Abkürzungsverzeichnis
Optional: Quellen- und Literaturverzeichnis
Kurzbiografie Autor(en): Name, Firma, Funktion, fachliche Schwerpunkte oder Interessen etc.
Optional: Autorenbild
