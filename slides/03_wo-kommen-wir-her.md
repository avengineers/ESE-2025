## Wo kommen wir her?

Back to 2005 <!-- .element: class="fragment" data-fragment-index="1" -->

![18 Jahre zurück](images/back_to_the_past.png) <!-- .element width="50%" class="fragment" data-fragment-index="1" -->

Note:

Wo kommen wir eigentlich her?

*click*

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

*click*

Spannende Produkte: Bremsensteuergeräte, ESP, ABS, ACC, ...

*click*

Ständig neue Anforderungen, da viele Kunden, die sich von der Konkurrenz abheben wollen.

*click*

Die Jobs waren gut bezahlt.

*click*

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

*click*

Klar, wir hacken Embedded C für Bremsensteuergeräte.

*click*

Kein Problem, das hatten wir doch an der Uni.

*click*

Hier kam der erste Dämpfer.

Man bekam Verantwortung für einen Teil des Codes, aber verändern sollte man ihn möglichst nicht.

*click*

Warum? Don't break the build!

*click*

Klang schwierig, aber wir hatten ja an der Uni gelernt: Dem Ingenieur ist nix zu schwör!
--

## Die Ausgangslage

- Keine Unit Tests <!-- .element: class="fragment" -->
- Ein bisschen SIL und HIL <!-- .element: class="fragment" -->
- Ganz viel Fahrversuch <!-- .element: class="fragment" -->
- Code Reuse über alle Projekte <!-- .element: class="fragment" -->
- Mehrere 100 Entwickler weltweit an einer Codebasis <!-- .element: class="fragment" -->

Note:

Die Ausgangslage?

*click*

Oha, keine Unit Tests.

Keine einige Zeile Testcode im Repository.

Klar, wo testet man Bremsen? Im Auto.

*click*

Gut, es wurde ein bisschen SIL und HIL gemacht.

*click*

Aber das meiste wurde im Fahrversuch getestet.

Viele Features waren also irgendwann, irgendwo in irgendeinem Projekt getestet.

Daher das Motto: besser nichts ändern.

*click*

Aber wie soll das gehen, wenn der Code über alle Projekte geshared ist,

alle Kunden mit neuen Anforderungen um die Ecke kommen ..

*click*

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

*click*

Continuous "Kind im Brunnen".

Was heißt das genau?

1. Höchstes Qualitätskriterium: SW linkbar.
2. Irgendein Projekt ist immer rot (Compile- oder Link-Fehler)
3. Keine Testautomatisierung
4. Keine Unittests
5. Entwickler sind böse, die bauen Bugs in den Code.

Und wie fühlte man sich als Entwickler dabei?

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

![Tal der Tränen](images/tal_der_traenen.jpg) <!-- .element width="65%" -->

Note:

Wie im Tal der Tränen.
