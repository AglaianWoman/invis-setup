#!/usr/bin/perl

# Das Passwort f�r den Zugang zum Administrationsfrontend im Klartext.
# Kann nur in dieser Datei ge�ndert werden, nicht im Administrationsfrontend
# selber.
$self->{admin_password} = 'admin';

# Welches Modul soll zur Authentifizierung der Logins benutzt werden?
# Entweder 'DB' oder 'LDAP'.
#
# Wenn LDAP-Authentifizierung benutzt wird, dann kann der Benutzer sein
# Passwort nicht �ber Lx-Office �ndern.
$self->{module} = 'DB';

# Verbindungsinformationen zur Datenbank mit den Benutzer- und
# Gruppeninformationen. Wird auch dann ben�tigt, wenn gegen einen
# LDAP-Server authentifiziert wird, weil dieser nur zur Passwort�berpr�fung
# benutzt wird. Der Rest der Benutzerdaten ist in der Datenbank hinterlegt.
#
# Ist 'module' = 'DB' dann wird diese Datenbank auch f�r die
# Passwort�berpr�fung benutzt.
$self->{DB_config} = {
  'host'     => 'localhost',
  'port'     => 5432,
  'db'       => 'lxerp_auth',
  'user'     => 'postgres',
  'password' => '',
};

# Wird nur ben�tigt, wenn 'module' = 'LDAP' ist. An diesem LDAP-Server
# werden die Benutzerpassw�rter durch einen LDAP-Bind �berpr�ft.
#
# Es m�ssen mindestens die Parameter host, attribute und base_dn
# angegeben werden.
#
# tls:       Verschl�sselung per TLS erzwingen
# attribute: Das LDAP-Attribut, das den Loginnamen enth�lt
# base_dn:   Basis-DN, ab der der LDAP-Baum durchsucht wird
# filter:    Ein optionaler LDAP-Filter. Die Zeichenkette '<%login%>' wird
#            innerhalb des Filters durch den Loginnamen ersetzt.
# bind_dn und bind_password:
#            Wenn zum Durchsuchen des LDAP-Baumes eine Anmeldung erforderlich
#            ist (z.B. beim ActiveDirectory), dann m�ssen diese beiden
#            Parameter gesetzt sein.
$self->{LDAP_config} = {
  'host'          => 'localhost',
  'port'          => 389,
  'tls'           => 0,
  'attribute'     => 'uid',
  'base_dn'       => '',
  'filter'        => '',

  'bind_dn'       => undef,
  'bind_password' => undef,
};

# Der Name des Cookies kann ge�ndert werden, sofern gew�nscht.
# $self->{cookie_name} = 'lx_office_erp_session_id';

# Die Zeitspanne, bis eine inaktive Session ung�ltig wird, kann
# hier ge�ndert werden. Der Standardwert ist acht Stunden.
# Die Angabe ist in Minuten.
# $self->{session_timeout} = 8 * 60;

1;
