## How to do it better?

* A meta-build system (e.g.: CMake)  <!-- .element: class="fragment" -->
* A really fast build system for C/C++ (ninja) <!-- .element: class="fragment" -->
* All dependencies via bootstrapping <!-- .element: class="fragment" -->
* Other Git repos via CMake's Fetch_Content() <!-- .element: class="fragment" -->
* Pipeline as code in the repo <!-- .element: class="fragment" -->

Note:

Okay, so how do we do it better?

*click*

Well, you definitely need a build system generator that resolves dependencies and generates build files.

CMake is a good candidate from our perspective.

You do need some kind of pipeline, but only to control the build system.

No CI-only code

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

* does NOTHING different than the user locally <!-- .element: class="fragment" -->
* Build is a one-liner <!-- .element: class="fragment" -->
* Automatic job creation for branches and pull requests <!-- .element: class="fragment" -->
* Few plugins to display results <!-- .element: class="fragment" -->
* Supporting developers in analyzing errors <!-- .element: class="fragment" -->

Note:

- https://www.jenkins.io/doc/book/pipeline/pipeline-best-practices/
- Minimal Jenkinsfile plus Organization Folder Plugin (Bitbucket, GitHub)
- A single config file (config.xml of the org)

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

![Peak of Joy](images/gipfel_der_freude.jpg) <!-- .element height="65%" width="65%" -->


---

![](images/feedback.png) <!-- .element height="48%" width="48%" -->

---

![](images/qr-presentation-link.png) <!-- .element height="40%" width="40%" -->
https://xxthunder.github.io/GermanTestingDay2024/
