---
comments: true
date: 2010-12-21 16:46:02
layout: post
slug: howto-windows-minidump-auslesen
title: 'Howto: Windows Minidump auslesen'
wordpress_id: 789
---
*Anmerkung: Screenshots wurden entfernt und der Artikel ist nicht mehr aktuell.*

Vor kurzem hat mich unter Windows 7 zum ersten mal ein BSOD erwischt. Das ist, zumindest bei mir, eine sehr seltene Angelegenheit. Leider war ich beim auftauchen des Bluescreens so perplex und habe die Fehlermeldung nicht wahrgenommen. Was also machen? 
Es gibt verschiedene Möglichkeiten die Infos aus dem Bluescreen nachträglich einzusehen.
	
  1. Eventviewer
  2. WinDbg

## EventLog


Die erste Möglichkeit besteht darin, das EventLog von Windows zu durchsuchen.

Das EventLog speichert verschiedene Arten von Ereignissen während des Windows Betriebes auf. Die Ereignisse sind in drei Kategorien aufgeteilt: **Information**, **Warnung**, **Fehler**. Diese Informationen werden ständig im Hintergrund gesammelt und im EventLog aufbereitet dargestellt. Aufgerufen wird das EventLog wie folgt:
	
  1. Start -> Ausführen
  2. "eventvwr" eingeben
  3. Mit OK bestätigen

Ein Bluescreen sollte unter die Kategorie "Fehler" bzw. "Kritisch" fallen. Mit einem Doppelklick auf das entsprechende Event und einem nachfolgendem Klick auf "Details" erhält man folgende Ansicht:

<!--[![Detailansicht im Eventfenster](http://wpimages.phansch.de/2010/11/Bluescreen_01-300x205.png)](http://wpimages.phansch.de/2010/11/Bluescreen_01.png)-->

Sowohl mit der Event-ID als auch dem BugCheckCode lassen sich über Google meistens weitere Informationen finden.


## WinDbg


Wenn die gefundenen Informationen nicht reichen und der Bluescreen nicht beseitigt werden konnte, gibt es noch eine weitere Möglichkeit um der Ursache auf die Spur zu kommen.
Mit WinDbg lassen sich sogenannte Minidumps analysieren. Minidumps werden im Falle eines Bluescreens unter C:\Windows\Minidump angelegt.
Natürlich ist WinDbg sehr komplex. Für unser Problem reicht es jedoch, wenn wir die Schritte kennen um einen Bluescreen-Minidump zu analysieren.


### WinDbg installieren


Für WinDbg werden die Windows Debugging Tools benötigt. Bei der Installation muss allerdings nur WinDbg installiert werden.

Bei der Installation ist es wichtig, die Debugging Tools auszuwählen:
<!--[![Debugging Tools auswählen](http://wpimages.phansch.de/2010/12/windowsSDKinstall_11-300x288.png)](http://wpimages.phansch.de/2010/12/windowsSDKinstall_11.png)-->
WinDbg kann anschließend über das Programmmenü gestartet werden:

<!--[![WinDbg starten](http://wpimages.phansch.de/2010/12/startWinDbg.png)](http://wpimages.phansch.de/2010/12/startWinDbg.png)-->


### WinDbg benutzen um Minidump auszulesen


Zunächst ist es nötig die Windows Symbols herunterzuladen welche das debuggen überhaupt erst ermöglichen.
Dazu gehen wir in WinDbg auf "File -> Symbol File Path.." und geben folgendes ein:

`SRV*c:\symbols*http://msdl.microsoft.com/download/symbols`

Nun sollten wir den Workspace speichern um den Symbolpfad beim erneuten Start des Programms nicht nochmal eingeben zu müssen.
Um den Workspace zu speichern gehen wir auf "File -> Save Workspace".

Als nächstes lokalisieren wir den zu analysierenden Minidump. Normalerweise wird dieser unter `%systemroot%\Minidump` gespeichert. Der Minidump ist nach dem Datum, einer zufälligen Nummer und einer fortlaufenden Nummer benannt.

In meinem Beispiel heißt der Minidump "111010-27456-01.dmp".

Um den Minidump auszulesen öffnen wir ihn in WinDbg über "File -> Open Crash Dump". Bei der Frage, ob wir den Worksapce speichern möchten, wählen wir "No".

Nun befinden wir uns in der Debugging Ansicht. Es wird zunächst eine weile dauern bis die Symboldateien heruntergeladen wurden.
Wenn der Download abgeschlossen ist, sieht das Debuggingfenster so aus:
<!--[![Download der Symbole komplett](http://wpimages.phansch.de/2010/12/winDbg_debug1-150x150.png)](http://wpimages.phansch.de/2010/12/winDbg_debug1.png)-->

Wir können bereits sehen wodurch der Fehler ausgelöst wurde: "Probably caused by : ntkrnlmp.exe"
Um weitere Informationen zu bekommen, geben wir unten in der Kommandozeile den Befehl `!analyze -v` ein.

Dies analysiert den Fehler bis ins Detail:


        BAD_POOL_CALLER (c2)
    The current thread is making a bad pool request.  Typically this is at a bad IRQL level or double freeing the same allocation, etc.
    Arguments:
    Arg1: 000000000000000b, type of pool violation the caller is guilty of.
    Arg2: fffffa8005338728
    Arg3: 0000000005338720
    Arg4: fffffa8005338f38

    Debugging Details:

    FAULTING_IP: 
    nt!ExDeleteResourceLite+199
    fffff800`02c690f9 eba0            jmp     nt!ExDeleteResourceLite+0x13b (fffff800`02c6909b)  

        BUGCHECK_STR:  0xc2_b

    CUSTOMER_CRASH_COUNT:  1  

        DEFAULT_BUCKET_ID:  VISTA_DRIVER_FAULT

    PROCESS_NAME:  System

    CURRENT_IRQL:  0  

    LAST_CONTROL_TRANSFER:  from fffff80002daf6b8 to fffff80002c7c740

    STACK_TEXT:  
    [...]

    STACK_COMMAND:  kb

    FOLLOWUP_IP: 
    nt!ExDeleteResourceLite+199
    fffff800`02c690f9 eba0            jmp     nt!ExDeleteResourceLite+0x13b (fffff800`02c6909b)

    SYMBOL_STACK_INDEX:  2

    SYMBOL_NAME:  nt!ExDeleteResourceLite+199

    FOLLOWUP_NAME:  MachineOwner

    MODULE_NAME: nt

        IMAGE_NAME:  ntkrnlmp.exe

    DEBUG_FLR_IMAGE_TIMESTAMP:  4c1c44a9

    FAILURE_BUCKET_ID:  X64_0xc2_b_nt!ExDeleteResourceLite+199

    BUCKET_ID:  X64_0xc2_b_nt!ExDeleteResourceLite+199

    Followup: MachineOwner


Mithilfe der eingerückten Informationen können wir zum Beispiel über Google weitere Infos bekommen. In diesem Fall hat ein neuer Audiotreiber das Problem behoben.

Ich hoffe dieser Post war einer Hilfe und konnte eventuelle Probleme beheben.
  *[BSOD]: Bluescreen of death
