# dhbwvs-quiz-mtfrnn
Public collaboration for DHBW VS Quiz Group: mtfrnn

## Installation
Zur Installation bitte die Inhalte des Ordners Application unter htdocs kopieren.

Der Aufruf erfolgt anschließend under http://localhost/cordova/dhbwvsquiz-mtfrnn/www/

Die Datenbankdatei liegt unter Dokumentation (db_quiz_vs.sql).
Dort ist auch das Datenstruktur-Bild abgelegt.

## Hinweise zu Fehlern
### REST-Schnittstelle
Bitte beachten, dass auch die .htaccess Dateien eingefügt werden, damit die Restschnitstelle korrekt funktioniert.

### RB
Die RedBean-Versionsdatei ist noch auf das alte PHP ausgelegt. Bei Verbindungsproblemen bitte aktualisieren!

### Fehler im Ablauf der Website
Die Seite setzt keine Cookies. Durch ein neu-laden wird die Usersession also beendet.
Im seltenen Falle eines REST Schnittstellen-Fehlers (keine Quizze werden angezeigt) mit Strg+F5 neu laden.

## Highlights und Screenshots
Die Screenshots sind unter Dokumentation/Bilder abgelegt.
Die Highlights der Implementierung sind folgende:
- Eigenständiges Anlegen von Kategorien sofern noch nicht vorhanden
- Einfaches löschen
- Die Obere Leiste der Quizze hat zufällige Farben die abwechslungsreich durchwechseln
- Das Backend ist rein mit PHP, das Frontent rein mit JS + HTML kodiert
- Vollfunktionsfähige Suche für Titel
- Anzeige nach Kategorie
- Anzeige der eigenen Quizze
- Vorbereitung auf spätere Cordova Builds
- True single Page, alle Inhalte auf einer Seite
- Sonderzeichen unterstützt
- Abbruch Handling, keine halben Transaktionen
 - Vermeidung von Grafikfehlern und ineinander gestapelten UI Elementen
