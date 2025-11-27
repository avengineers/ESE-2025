## Wie geht es besser?

* Ein Meta-Buildsystem (z.B.: CMake)  <!-- .element: class="fragment" -->
* Ein richtig schnelles Buildsystem für C/C++ (ninja) <!-- .element: class="fragment" -->
* Mittels Bootstrapping alle Dependencies <!-- .element: class="fragment" -->
* Andere Git Repos via Cmake's Fetch_Content() <!-- .element: class="fragment" -->
* Pipeline als Code im Repo <!-- .element: class="fragment" -->

Note:

Okay, wie geht es denn nun besser?

*click*

Naja, auf jeden Fall braucht man ein Buildsystemgenerator, der die Abhängigkeiten auflöst und die Buildfiles generiert.

CMake ist da aus unserer Sicht ein guter Kandidat.

Man braucht schon irgendeine Art von Pipeline, aber nur als Steuerung des Build Systems.

Kein CI Only Code

--

<!-- .slide: data-visibility="hidden" -->

## SPLE Plattform

* VSCode plus CMake Tools
* Konfiguration as Code
* Einfach Erweiterbar
* SPLE ermöglicht modulare SW Entwicklung
* Komponenten als Bausteine der Software
* Separate Repositories dank RTE Schnittstellen
* Eigene Konfiguration
* Variantenunabhängige Unittests
* Trennung von Kunden- und Entwicklersicht
* Integrationstests der Komponenten möglich

--

## Jenkins

* macht NICHTS anders als der User lokal <!-- .element: class="fragment" -->
* Build ist ein One-Liner <!-- .element: class="fragment" -->
* Automatische Joberzeugung für Branches und Pull Requests <!-- .element: class="fragment" -->
* Wenige Plugins zum Anzeigen von Ergebnissen <!-- .element: class="fragment" -->
* Unterstützung der Entwickler bei Analyse von Fehlern <!-- .element: class="fragment" -->

Note:

- https://www.jenkins.io/doc/book/pipeline/pipeline-best-practices/
- Minimaler Jenkinsfile plus Organisation Folder Plugin (Bitbucket, GitHub)
- Ein einziger Konfigfile (config.xml der Orga)

--

<!-- .slide: data-visibility="hidden" -->

## Reporting

* Weniger ist mehr
* Keine Datenbank
* Kein Ergebnisportal selber stricken
* Jenkins + Artifactory und gut

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
