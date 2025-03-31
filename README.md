# WayMatcher - Database

- [WayMatcher - Database](#waymatcher---database)
  - [**1. Azure Setup**](#1-azure-setup)
  - [**2. ER-Diagramm**](#2-er-diagramm)
  - [**3. Entitäten der Datenbank**](#3-entitäten-der-datenbank)
    - [**3.1. Address Tabelle**](#31-address-tabelle)
      - [**3.1.1 Beschreibung**](#311-beschreibung)
      - [**3.1.2 Tabellenschema**](#312-tabellenschema)
      - [**3.1.3 Audit-Trigger**](#313-audit-trigger)
      - [**3.1.4 Fremdschlüsselbeziehungen**](#314-fremdschlüsselbeziehungen)
      - [**3.1.5 Verwendung**](#315-verwendung)
    - [**3.2. WayMatcher Datenbank - Audit Tabelle**](#32-waymatcher-datenbank---audit-tabelle)
      - [**3.2.1 Beschreibung**](#321-beschreibung)
      - [**3.2.2 Tabellenschema**](#322-tabellenschema)
      - [**3.2.3 Fremdschlüsselbeziehungen**](#323-fremdschlüsselbeziehungen)
      - [**3.2.4 Verwendung**](#324-verwendung)
    - [**3.3. Chat\_Message Tabelle**](#33-chat_message-tabelle)
      - [**3.3.1 Beschreibung**](#331-beschreibung)
      - [**3.3.2 Tabellenschema**](#332-tabellenschema)
      - [**3.3.3 Audit-Trigger**](#333-audit-trigger)
      - [**3.3.4 Fremdschlüsselbeziehungen**](#334-fremdschlüsselbeziehungen)
      - [**3.3.5 Verwendung**](#335-verwendung)
    - [**3.4. Event\_Member Tabelle**](#34-event_member-tabelle)
      - [**3.4.1 Beschreibung**](#341-beschreibung)
      - [**3.4.2 Tabellenschema**](#342-tabellenschema)
      - [**3.4.3 Audit-Trigger**](#343-audit-trigger)
      - [**3.4.4 Fremdschlüsselbeziehungen**](#344-fremdschlüsselbeziehungen)
      - [**3.4.5 Verwendung**](#345-verwendung)
    - [**3.5 Event Tabelle**](#35-event-tabelle)
      - [**3.5.1 Beschreibung**](#351-beschreibung)
      - [**3.5.2 Tabellenschema**](#352-tabellenschema)
      - [**3.5.3 Audit-Trigger**](#353-audit-trigger)
      - [**3.5.4 Fremdschlüsselbeziehungen**](#354-fremdschlüsselbeziehungen)
      - [**3.5.5 Verwendung**](#355-verwendung)
    - [**3.6 Invite Tabelle**](#36-invite-tabelle)
      - [**3.6.1 Beschreibung**](#361-beschreibung)
      - [**3.6.2 Tabellenschema**](#362-tabellenschema)
      - [**3.6.3 Audit-Trigger**](#363-audit-trigger)
      - [**3.6.4 Fremdschlüsselbeziehungen**](#364-fremdschlüsselbeziehungen)
      - [**3.6.5 Verwendung**](#365-verwendung)
    - [**3.7 Notification Tabelle**](#37-notification-tabelle)
      - [**3.7.1 Beschreibung**](#371-beschreibung)
      - [**3.7.2 Tabellenschema**](#372-tabellenschema)
      - [**3.7.3 Audit-Trigger**](#373-audit-trigger)
      - [**3.7.4 Fremdschlüsselbeziehungen**](#374-fremdschlüsselbeziehungen)
      - [**3.7.5 Verwendung**](#375-verwendung)
    - [**3.8 Rating Tabelle**](#38-rating-tabelle)
      - [**3.8.1 Beschreibung**](#381-beschreibung)
      - [**3.8.2 Tabellenschema**](#382-tabellenschema)
      - [**3.8.3 Audit-Trigger**](#383-audit-trigger)
      - [**3.8.4 Fremdschlüsselbeziehungen**](#384-fremdschlüsselbeziehungen)
      - [**3.8.5 Verwendung**](#385-verwendung)
    - [**3.9 Role Tabelle**](#39-role-tabelle)
      - [**3.9.1 Beschreibung**](#391-beschreibung)
      - [**3.9.2 Tabellenschema**](#392-tabellenschema)
      - [**3.9.3 Audit-Trigger**](#393-audit-trigger)
      - [**3.9.4 Verwendung**](#394-verwendung)
    - [**3.10 Schedule Tabelle**](#310-schedule-tabelle)
      - [**3.10.1 Beschreibung**](#3101-beschreibung)
      - [**3.10.2 Tabellenschema**](#3102-tabellenschema)
      - [**3.10.3 Audit-Trigger**](#3103-audit-trigger)
      - [**3.10.4 Fremdschlüsselbeziehungen**](#3104-fremdschlüsselbeziehungen)
      - [**3.10.5 Verwendung**](#3105-verwendung)
    - [**3.11 Status Tabelle**](#311-status-tabelle)
      - [**3.11.1 Beschreibung**](#3111-beschreibung)
      - [**3.11.2 Tabellenschema**](#3112-tabellenschema)
      - [**3.11.3 Audit-Trigger**](#3113-audit-trigger)
      - [**3.11.4 Verwendung**](#3114-verwendung)
    - [**3.12 Stop Tabelle**](#312-stop-tabelle)
      - [**3.12.1 Beschreibung**](#3121-beschreibung)
      - [**3.12.2 Tabellenschema**](#3122-tabellenschema)
      - [**3.12.3 Audit-Trigger**](#3123-audit-trigger)
      - [**3.12.4 Fremdschlüsselbeziehungen**](#3124-fremdschlüsselbeziehungen)
      - [**3.12.5 Verwendung**](#3125-verwendung)
    - [**3.13 User Tabelle**](#313-user-tabelle)
      - [**3.13.1 Beschreibung**](#3131-beschreibung)
      - [**3.13.2 Tabellenschema**](#3132-tabellenschema)
      - [**3.13.3 Audit-Trigger**](#3133-audit-trigger)
      - [**3.13.4 Fremdschlüsselbeziehungen**](#3134-fremdschlüsselbeziehungen)
      - [**3.13.5 Verwendung**](#3135-verwendung)
    - [**3.14 Vehicle\_Mapping Tabelle**](#314-vehicle_mapping-tabelle)
      - [**3.14.1 Beschreibung**](#3141-beschreibung)
      - [**3.14.2 Tabellenschema**](#3142-tabellenschema)
      - [**3.14.3 Audit-Trigger**](#3143-audit-trigger)
      - [**3.14.4 Fremdschlüsselbeziehungen**](#3144-fremdschlüsselbeziehungen)
      - [**3.14.5 Verwendung**](#3145-verwendung)
    - [**3.15 Vehicle Tabelle**](#315-vehicle-tabelle)
      - [**3.15.1 Beschreibung**](#3151-beschreibung)
      - [**3.15.2 Tabellenschema**](#3152-tabellenschema)
      - [**3.15.3 Audit-Trigger**](#3153-audit-trigger)
      - [**3.15.4 Fremdschlüsselbeziehungen**](#3154-fremdschlüsselbeziehungen)
      - [**3.15.5 Verwendung**](#3155-verwendung)
  - [**4. Views der Datenbank**](#4-views-der-datenbank)
    - [**vw\_EventDetails View**](#vw_eventdetails-view)
    - [**vw\_PassengerEvents View**](#vw_passengerevents-view)
    - [**vw\_PilotEvents View**](#vw_pilotevents-view)
  - [**5. Stored Procedures der Datenbank**](#5-stored-procedures-der-datenbank)
    - [**LogAuditEntry Stored Procedure**](#logauditentry-stored-procedure)

## **1. Azure Setup**

Für Setup siehe [Azure-Setup.md](docs/Azure-Setup.md)

## **2. ER-Diagramm**

bild von ERD

## **3. Entitäten der Datenbank**

### **3.1. Address Tabelle**

#### **3.1.1 Beschreibung**

Die **Address**-Tabelle speichert Adressdaten und enthält Informationen wie Stadt, Postleitzahl, Straße, Land, Ländercode, Region, Bundesstaat sowie Geokoordinaten. Jede Adresse hat eine eindeutige **Address_ID** als Primärschlüssel. Der **Status_ID** verweist auf die Status-Tabelle.

#### **3.1.2 Tabellenschema**

Die Tabelle "Address" enthält die folgenden Spalten:

- **Address_ID**: Primärschlüssel, automatisch inkrementierend
- **City**: Name der Stadt
- **Postal_Code**: Postleitzahl
- **Street**: Straßenname
- **Country**: Name des Landes
- **Country_Code**: Ländercode
- **Region**: Region der Adresse
- **State**: Bundesstaat oder Kanton
- **Longitude**: Geografische Länge
- **Latitude**: Geografische Breite
- **Address_Line1**: Erste Adresszeile
- **Address_Line2**: Zweite Adresszeile
- **Status_ID**: Fremdschlüssel zur Status-Tabelle

#### **3.1.3 Audit-Trigger**

Ein Trigger **trg_Address_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Address_ID**.

#### **3.1.4 Fremdschlüsselbeziehungen**

- **Status_ID** verweist auf die **Status**-Tabelle

#### **3.1.5 Verwendung**

Die **Address**-Tabelle wird für die Speicherung von Adressen und deren Status verwendet. Änderungen werden über den Trigger **trg_Address_Audit** protokolliert.

### **3.2. WayMatcher Datenbank - Audit Tabelle**

#### **3.2.1 Beschreibung**

Die **Audit**-Tabelle speichert Protokolleinträge zu Änderungen an Entitäten innerhalb des Systems. Jede Änderung wird mit einem Zeitstempel versehen und kann einem Benutzer zugeordnet werden.

#### **3.2.2 Tabellenschema**

Die Tabelle "Audit" enthält die folgenden Spalten:

- **Audit_ID**: Primärschlüssel, automatisch inkrementierend
- **Message**: Beschreibung der Änderung
- **Entity_Type**: Typ der geänderten Entität
- **Timestamp**: Zeitpunkt der Änderung (Standardwert: aktuelle Systemzeit)
- **Entity_ID**: ID der betroffenen Entität
- **User_ID**: Fremdschlüssel zur Benutzer-Tabelle

#### **3.2.3 Fremdschlüsselbeziehungen**

- **User_ID** verweist auf die **User**-Tabelle

#### **3.2.4 Verwendung**

Die **Audit**-Tabelle dient der Nachverfolgbarkeit von Änderungen an Datensätzen. Sie wird genutzt, um administrative Einsicht in Systemänderungen zu ermöglichen und sicherzustellen, dass alle relevanten Änderungen protokolliert werden.

### **3.3. Chat_Message Tabelle**

#### **3.3.1 Beschreibung**

Die **Chat_Message**-Tabelle speichert Chat-Nachrichten innerhalb des Systems. Jede Nachricht enthält einen Zeitstempel, eine Referenz auf den Benutzer, der die Nachricht gesendet hat, und optional eine Referenz auf ein Event.

#### **3.3.2 Tabellenschema**

Die Tabelle "Chat_Message" enthält die folgenden Spalten:

- **Chat_Message_ID**: Primärschlüssel, automatisch inkrementierend
- **Message**: Inhalt der Nachricht
- **Timestamp**: Zeitpunkt der Nachrichtenerstellung (Standardwert: aktuelle Systemzeit)
- **User_ID**: Fremdschlüssel zur Benutzer-Tabelle
- **Event_ID**: Fremdschlüssel zur Event-Tabelle

#### **3.3.3 Audit-Trigger**

Ein Trigger **trg_Chat_Message_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Chat_Message_ID**.

#### **3.3.4 Fremdschlüsselbeziehungen**

- **User_ID** verweist auf die **User**-Tabelle
- **Event_ID** verweist auf die **Event**-Tabelle

#### **3.3.5 Verwendung**

Die **Chat_Message**-Tabelle wird für die Speicherung von Chat-Nachrichten in Events verwendet. Änderungen werden über den Trigger **trg_Chat_Message_Audit** protokolliert.

---

### **3.4. Event_Member Tabelle**

#### **3.4.1 Beschreibung**

Die **Event_Member**-Tabelle speichert Informationen über Benutzer, die an einem Event teilnehmen. Sie enthält eine Referenz auf den Benutzertyp innerhalb des Events und den aktuellen Status.

#### **3.4.2 Tabellenschema**

Die Tabelle "Event_Member" enthält die folgenden Spalten:

- **Member_ID**: Primärschlüssel, automatisch inkrementierend
- **EventMemberType_ID**: Typ des Event-Mitglieds
- **User_ID**: Fremdschlüssel zur Benutzer-Tabelle
- **Event_ID**: Fremdschlüssel zur Event-Tabelle
- **Status_ID**: Fremdschlüssel zur Status-Tabelle

#### **3.4.3 Audit-Trigger**

Ein Trigger **trg_Event_Member_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Member_ID**.

#### **3.4.4 Fremdschlüsselbeziehungen**

- **User_ID** verweist auf die **User**-Tabelle
- **Event_ID** verweist auf die **Event**-Tabelle
- **Status_ID** verweist auf die **Status**-Tabelle

#### **3.4.5 Verwendung**

Die **Event_Member**-Tabelle wird genutzt, um die Mitgliedschaften von Benutzern innerhalb von Events zu verwalten. Änderungen werden über den Trigger **trg_Event_Member_Audit** protokolliert.

---

### **3.5 Event Tabelle**

#### **3.5.1 Beschreibung**

Die **Event**-Tabelle speichert Informationen über Events, die innerhalb des Systems erstellt wurden. Sie enthält Details zur Anzahl freier Plätze, eine Beschreibung, Zeitstempel für den Start und eine Verknüpfung zu einem Zeitplan.

#### **3.5.2 Tabellenschema**

Die Tabelle "Event" enthält die folgenden Spalten:

- **Event_ID**: Primärschlüssel, automatisch inkrementierend
- **EventType_ID**: Typ des Events
- **Free_Seats**: Anzahl der freien Plätze
- **Description**: Beschreibung des Events
- **Start_Timestamp**: Zeitpunkt des Event-Beginns
- **Schedule_ID**: Fremdschlüssel zur Schedule-Tabelle
- **Status_ID**: Fremdschlüssel zur Status-Tabelle
- **EventOwner_ID**: ID des Event-Erstellers

#### **3.5.3 Audit-Trigger**

Ein Trigger **trg_Event_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Event_ID**.

#### **3.5.4 Fremdschlüsselbeziehungen**

- **Schedule_ID** verweist auf die **Schedule**-Tabelle
- **Status_ID** verweist auf die **Status**-Tabelle

#### **3.5.5 Verwendung**

Die **Event**-Tabelle wird zur Verwaltung von Veranstaltungen genutzt. Änderungen werden über den Trigger **trg_Event_Audit** protokolliert.

### **3.6 Invite Tabelle**

#### **3.6.1 Beschreibung**

Die **Invite**-Tabelle speichert Einladungen zu Events. Eine Einladung kann entweder eine direkte Einladung oder eine Anfrage zur Teilnahme sein. Jede Einladung hat einen Status, eine Referenz zum entsprechenden Event und den zugehörigen Benutzer.

#### **3.6.2 Tabellenschema**

Die Tabelle "Invite" enthält die folgenden Spalten:

- **Invite_ID**: Primärschlüssel, automatisch inkrementierend
- **Status_ID**: Fremdschlüssel zur Status-Tabelle (nicht null)
- **Is_Request**: Boolean-Wert, gibt an, ob es sich um eine Teilnahme-Anfrage handelt
- **Event_ID**: Fremdschlüssel zur Event-Tabelle
- **User_ID**: Fremdschlüssel zur Benutzer-Tabelle

#### **3.6.3 Audit-Trigger**

Ein Trigger **trg_Invite_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Invite_ID**.

#### **3.6.4 Fremdschlüsselbeziehungen**

- **Status_ID** verweist auf die **Status**-Tabelle
- **Event_ID** verweist auf die **Event**-Tabelle
- **User_ID** verweist auf die **User**-Tabelle

#### **3.6.5 Verwendung**

Die **Invite**-Tabelle wird zur Verwaltung von Einladungen und Anfragen zu Events verwendet. Änderungen werden über den Trigger **trg_Invite_Audit** protokolliert.

### **3.7 Notification Tabelle**

#### **3.7.1 Beschreibung**

Die **Notification**-Tabelle speichert Benachrichtigungen für Benutzer. Jede Benachrichtigung kann einer bestimmten Entität zugeordnet sein und enthält Informationen darüber, ob sie bereits gelesen wurde.

#### **3.7.2 Tabellenschema**

Die Tabelle "Notification" enthält die folgenden Spalten:

- **Notification_ID**: Primärschlüssel, automatisch inkrementierend
- **Read**: Boolean-Wert, gibt an, ob die Benachrichtigung gelesen wurde (Standardwert: 0)
- **Message**: Inhalt der Benachrichtigung
- **Entity_Type**: Typ der zugehörigen Entität
- **Entity_ID**: ID der betroffenen Entität
- **User_ID**: Fremdschlüssel zur Benutzer-Tabelle

#### **3.7.3 Audit-Trigger**

Ein Trigger **trg_Notification_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Notification_ID**.

#### **3.7.4 Fremdschlüsselbeziehungen**

- **User_ID** verweist auf die **User**-Tabelle

#### **3.7.5 Verwendung**

Die **Notification**-Tabelle wird verwendet, um Benutzer über relevante Ereignisse im System zu informieren. Änderungen werden über den Trigger **trg_Notification_Audit** protokolliert.

### **3.8 Rating Tabelle**

#### **3.8.1 Beschreibung**

Die **Rating**-Tabelle speichert Bewertungen von Benutzern für andere Benutzer. Jede Bewertung enthält eine Bewertungstext, einen Wert (zwischen 1 und 5) und verweist auf den bewerteten Benutzer sowie den Benutzer, der die Bewertung abgegeben hat.

#### **3.8.2 Tabellenschema**

Die Tabelle "Rating" enthält die folgenden Spalten:

- **Rating_ID**: Primärschlüssel, automatisch inkrementierend
- **Rating_Text**: Text der Bewertung
- **Rating_Value**: Bewertungswert (ganzzahliger Wert zwischen 1 und 5)
- **Rated_user_ID**: Fremdschlüssel zur Benutzer-Tabelle (ID des bewerteten Benutzers)
- **User_who_rated_ID**: Fremdschlüssel zur Benutzer-Tabelle (ID des Benutzers, der die Bewertung abgegeben hat)
- **Status_ID**: Fremdschlüssel zur Status-Tabelle

#### **3.8.3 Audit-Trigger**

Ein Trigger **trg_Rating_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Rating_ID**.

#### **3.8.4 Fremdschlüsselbeziehungen**

- **Rated_user_ID** verweist auf die **User**-Tabelle
- **User_who_rated_ID** verweist auf die **User**-Tabelle
- **Status_ID** verweist auf die **Status**-Tabelle

#### **3.8.5 Verwendung**

Die **Rating**-Tabelle wird zur Speicherung von Bewertungen zwischen Benutzern verwendet. Änderungen werden über den Trigger **trg_Rating_Audit** protokolliert.

### **3.9 Role Tabelle**

#### **3.9.1 Beschreibung**

Die **Role**-Tabelle speichert Informationen über verschiedene Rollen im System. Jede Rolle hat einen Namen und eine Beschreibung, die ihre Funktion im System näher beschreibt.

#### **3.9.2 Tabellenschema**

Die Tabelle "Role" enthält die folgenden Spalten:

- **Role_ID**: Primärschlüssel, automatisch inkrementierend
- **Name**: Name der Rolle (z. B. "Admin", "User")
- **Description**: Beschreibung der Rolle und ihrer Funktion im System

#### **3.9.3 Audit-Trigger**

Ein Trigger **trg_Role_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Role_ID**.

#### **3.9.4 Verwendung**

Die **Role**-Tabelle wird verwendet, um Benutzerrollen und deren Berechtigungen zu verwalten. Änderungen werden über den Trigger **trg_Role_Audit** protokolliert.

### **3.10 Schedule Tabelle**

#### **3.10.1 Beschreibung**

Die **Schedule**-Tabelle speichert Informationen zu geplanten Ereignissen im System. Sie enthält eine Cron-ähnliche Zeitplanbeschreibung und verweist auf den Benutzer, der den Zeitplan erstellt hat.

#### **3.10.2 Tabellenschema**

Die Tabelle "Schedule" enthält die folgenden Spalten:

- **Schedule_ID**: Primärschlüssel, automatisch inkrementierend
- **Cron_Schedule**: Cron-ähnliche Beschreibung für den Zeitplan (z. B. "0 0 * * *" für tägliche Ausführung)
- **User_ID**: Fremdschlüssel zur Benutzer-Tabelle (ID des Benutzers, der den Zeitplan erstellt hat)

#### **3.10.3 Audit-Trigger**

Ein Trigger **trg_Schedule_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Schedule_ID**.

#### **3.10.4 Fremdschlüsselbeziehungen**

- **User_ID** verweist auf die **User**-Tabelle

#### **3.10.5 Verwendung**

Die **Schedule**-Tabelle wird zur Verwaltung von Zeitplänen verwendet, die mit bestimmten Aufgaben oder Ereignissen im System verknüpft sind. Änderungen werden über den Trigger **trg_Schedule_Audit** protokolliert.

### **3.11 Status Tabelle**

#### **3.11.1 Beschreibung**

Die **Status**-Tabelle speichert verschiedene Statuswerte, die anderen Entitäten im System zugewiesen werden können. Jeder Status hat eine Beschreibung, die seinen Zweck im System definiert.

#### **3.11.2 Tabellenschema**

Die Tabelle "Status" enthält die folgenden Spalten:

- **Status_ID**: Primärschlüssel, automatisch inkrementierend
- **Status_Description**: Beschreibung des Status (z. B. "Aktiv", "Inaktiv")

#### **3.11.3 Audit-Trigger**

Ein Trigger **trg_Status_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Status_ID**.

#### **3.11.4 Verwendung**

Die **Status**-Tabelle wird verwendet, um den Zustand von verschiedenen Entitäten im System zu verwalten. Änderungen werden über den Trigger **trg_Status_Audit** protokolliert.

### **3.12 Stop Tabelle**

#### **3.12.1 Beschreibung**

Die **Stop**-Tabelle speichert Informationen über Haltestellen, die mit einem Event verknüpft sind. Jede Haltestelle ist mit einer Adresse und einer Reihenfolge verknüpft, die angibt, in welcher Reihenfolge die Haltestellen besucht werden.

#### **3.12.2 Tabellenschema**

Die Tabelle "Stop" enthält die folgenden Spalten:

- **Stop_ID**: Primärschlüssel, automatisch inkrementierend
- **Stop_sequence_number**: Die Reihenfolgenummer der Haltestelle im Event
- **Address_ID**: Fremdschlüssel zur **Address**-Tabelle
- **Event_ID**: Fremdschlüssel zur **Event**-Tabelle

#### **3.12.3 Audit-Trigger**

Ein Trigger **trg_Stop_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Stop_ID**.

#### **3.12.4 Fremdschlüsselbeziehungen**

- **Address_ID** verweist auf die **Address**-Tabelle
- **Event_ID** verweist auf die **Event**-Tabelle

#### **3.12.5 Verwendung**

Die **Stop**-Tabelle wird zur Verwaltung von Haltestellen innerhalb eines Events verwendet. Änderungen werden über den Trigger **trg_Stop_Audit** protokolliert.

### **3.13 User Tabelle**

#### **3.13.1 Beschreibung**

Die **User**-Tabelle speichert Informationen zu den Benutzern des Systems. Sie enthält persönliche Angaben wie Name, E-Mail, Telefonnummer, sowie Zugangsdaten und Rolleninformationen.

#### **3.13.2 Tabellenschema**

Die Tabelle "User" enthält die folgenden Spalten:

- **User_ID**: Primärschlüssel, automatisch inkrementierend
- **Firstname**: Vorname des Benutzers
- **Name**: Nachname des Benutzers
- **Username**: Benutzername (eindeutig)
- **Password**: Passwort des Benutzers
- **E-Mail**: E-Mail-Adresse des Benutzers (eindeutig)
- **Telephone**: Telefonnummer des Benutzers
- **Additional_Description**: Zusätzliche Beschreibung des Benutzers
- **License_Verified**: Gibt an, ob die Lizenz des Benutzers verifiziert wurde (Wahr/Falsch)
- **Profile_Picture**: Profilbild des Benutzers im Binärformat
- **Creation_Date**: Datum der Benutzererstellung (Standardwert: aktuelle Systemzeit)
- **Address_ID**: Fremdschlüssel zur **Address**-Tabelle
- **Role_ID**: Fremdschlüssel zur **Role**-Tabelle
- **Status_ID**: Fremdschlüssel zur **Status**-Tabelle
- **MfAToken**: Token für Multi-Faktor-Authentifizierung

#### **3.13.3 Audit-Trigger**

Ein Trigger **trg_User_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **User_ID**.

#### **3.13.4 Fremdschlüsselbeziehungen**

- **Address_ID** verweist auf die **Address**-Tabelle
- **Role_ID** verweist auf die **Role**-Tabelle
- **Status_ID** verweist auf die **Status**-Tabelle

#### **3.13.5 Verwendung**

Die **User**-Tabelle wird verwendet, um Benutzerinformationen zu speichern. Änderungen an Benutzerdaten werden über den Trigger **trg_User_Audit** in der **Audit**-Tabelle protokolliert.

### **3.14 Vehicle_Mapping Tabelle**

#### **3.14.1 Beschreibung**

Die **Vehicle_Mapping**-Tabelle speichert Informationen zur Zuordnung von Fahrzeugen zu Benutzern und deren Status. Sie enthält Details zu Fahrzeugen, einschließlich des Kraftstoffverbrauchs, Zusatzinformationen und des Kennzeichens.

#### **3.14.2 Tabellenschema**

Die Tabelle "Vehicle_Mapping" enthält die folgenden Spalten:

- **Vehicle_Mapping_ID**: Primärschlüssel, automatisch inkrementierend
- **Fuel_Milage**: Kraftstoffverbrauch des Fahrzeugs (Angabe in Litern pro 100 Kilometer)
- **Additional_Info**: Zusätzliche Informationen zum Fahrzeug
- **License_Plate**: Kennzeichen des Fahrzeugs
- **Vehicle_ID**: Fremdschlüssel zur **Vehicle**-Tabelle
- **User_ID**: Fremdschlüssel zur **User**-Tabelle
- **Status_ID**: Fremdschlüssel zur **Status**-Tabelle

#### **3.14.3 Audit-Trigger**

Ein Trigger **trg_Vehicle_Mapping_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Vehicle_Mapping_ID**.

#### **3.14.4 Fremdschlüsselbeziehungen**

- **Vehicle_ID** verweist auf die **Vehicle**-Tabelle
- **User_ID** verweist auf die **User**-Tabelle
- **Status_ID** verweist auf die **Status**-Tabelle

#### **3.14.5 Verwendung**

Die **Vehicle_Mapping**-Tabelle wird verwendet, um Fahrzeuge Benutzern zuzuordnen und deren Status sowie zusätzliche Informationen zu verwalten. Änderungen werden über den Trigger **trg_Vehicle_Mapping_Audit** protokolliert.

### **3.15 Vehicle Tabelle**

#### **3.15.1 Beschreibung**

Die **Vehicle**-Tabelle speichert Informationen zu Fahrzeugen im System. Sie enthält Details wie Modell, Sitzplätze, Herstellungsjahr, Herstellername und den Status des Fahrzeugs.

#### **3.15.2 Tabellenschema**

Die Tabelle "Vehicle" enthält die folgenden Spalten:

- **Vehicle_ID**: Primärschlüssel, automatisch inkrementierend
- **Model**: Modell des Fahrzeugs
- **Seats**: Anzahl der Sitzplätze im Fahrzeug
- **Year_of_manufacture**: Herstellungsjahr des Fahrzeugs
- **Manufacturer_Name**: Name des Fahrzeugherstellers
- **Status_ID**: Fremdschlüssel zur **Status**-Tabelle

#### **3.15.3 Audit-Trigger**

Ein Trigger **trg_Vehicle_Audit** wird nach Updates oder Löschungen in der Tabelle ausgelöst. Er protokolliert die Änderungen in der Audit-Log-Tabelle **LogAuditEntry**. Dabei wird gespeichert, ob ein Datensatz aktualisiert oder gelöscht wurde, sowie die betroffene **Vehicle_ID**.

#### **3.15.4 Fremdschlüsselbeziehungen**

- **Status_ID** verweist auf die **Status**-Tabelle

#### **3.15.5 Verwendung**

Die **Vehicle**-Tabelle wird zur Verwaltung von Fahrzeugen genutzt. Änderungen werden über den Trigger **trg_Vehicle_Audit** protokolliert.

## **4. Views der Datenbank**

Die folgenden Views vereinfachen die Abfragen von kombinierten Daten aus mehreren Tabellen und bieten eine bessere Lesbarkeit für spezifische Anforderungen:

### **vw_EventDetails View**

Die **vw_EventDetails**-View kombiniert Informationen zu Events, deren Zeitplan, Haltestellen, Adressen, Event-Mitgliedern und Einladungen. Sie enthält detaillierte Informationen zu einem Event, die Daten aus mehreren Tabellen wie **Event**, **Schedule**, **Stop**, **Address**, **Event_Member** und **Invite** zusammenführt.

### **vw_PassengerEvents View**

Die **vw_PassengerEvents**-View filtert Events, die für Passagiere relevant sind (EventType_ID = 2).

### **vw_PilotEvents View**

Die **vw_PilotEvents**-View filtert Events, die für Piloten relevant sind (EventType_ID = 1).

## **5. Stored Procedures der Datenbank**

Die **Stored Procedures** dienen dazu, häufig ausgeführte SQL-Abfragen oder Aktionen zu kapseln und deren Wiederverwendbarkeit zu fördern. Eine wichtige Stored Procedure in dieser Datenbank ist die **LogAuditEntry**-Prozedur, die zur Protokollierung von Änderungen und Löschungen in der Datenbank dient.

### **LogAuditEntry Stored Procedure**

Die **LogAuditEntry**-Prozedur protokolliert Ereignisse, die eine Änderung oder Löschung eines Datensatzes betreffen, und speichert diese in der **Audit**-Tabelle. Sie wird verwendet, um eine Historie über Änderungen und Löschungen in der Datenbank zu führen.
