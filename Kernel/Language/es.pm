# --
# Copyright (C) 2003-2006 Jorge Becerra <jorge at hab.desoft.cu>
# Copyright (C) 2007 Carlos Oyarzabal <carlos.oyarzabal at grupocash.com.mx>
# Copyright (C) 2008 Pelayo Romero Martí­n <pelayo.romero at gmail.com>
# Copyright (C) 2009 Gustavo Azambuja <gazambuja at gmail.com>
# Copyright (C) 2009 Emiliano Gonzalez <egonzalez@ergio.com.ar>
# Copyright (C) 2013 Enrique Matías Sánchez <quique@unizar.es>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # $$START$$
    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D/%M/%Y - %T';
    $Self->{DateFormatLong}      = '%A, %D %B %Y - %T';
    $Self->{DateFormatShort}     = '%D/%M/%Y';
    $Self->{DateInputFormat}     = '%D/%M/%Y';
    $Self->{DateInputFormatLong} = '%D/%M/%Y - %T';
    $Self->{Completeness}        = 0.796909941044928;

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Sí',
        'No' => 'No',
        'yes' => 'sí',
        'no' => 'no',
        'Off' => 'Desactivado',
        'off' => 'desactivado',
        'On' => 'Activado',
        'on' => 'activado',
        'top' => 'inicio',
        'end' => 'fin',
        'Done' => 'Hecho',
        'Cancel' => 'Cancelar',
        'Reset' => 'Restablecer',
        'more than ... ago' => 'hace más de ...',
        'in more than ...' => 'en más de ...',
        'within the last ...' => 'en los últimos ...',
        'within the next ...' => 'en los próximos ...',
        'Created within the last' => 'Creado en los últimos',
        'Created more than ... ago' => 'Creado hace más de ...',
        'Today' => 'Hoy',
        'Tomorrow' => 'Mañana',
        'Next week' => 'Próxima semana',
        'day' => 'día',
        'days' => 'días',
        'day(s)' => 'día(s)',
        'd' => 'd',
        'hour' => 'hora',
        'hours' => 'horas',
        'hour(s)' => 'hora(s)',
        'Hours' => 'Horas',
        'h' => 'h',
        'minute' => 'minuto',
        'minutes' => 'minutos',
        'minute(s)' => 'minuto(s)',
        'Minutes' => 'Minutos',
        'm' => 'm',
        'month' => 'mes',
        'months' => 'meses',
        'month(s)' => 'mes(es)',
        'week' => 'semana',
        'week(s)' => 'semana(s)',
        'quarter' => 'cuatrimestre',
        'quarter(s)' => 'cuatrimestre(s)',
        'half-year' => 'semestre',
        'half-year(s)' => 'semestre(s)',
        'year' => 'año',
        'years' => 'años',
        'year(s)' => 'año(s)',
        'second(s)' => 'segundo(s)',
        'seconds' => 'segundos',
        'second' => 'segundo',
        's' => 's',
        'Time unit' => 'Unidad de tiempo',
        'wrote' => 'escribió',
        'Message' => 'Mensaje',
        'Error' => 'Error',
        'Bug Report' => 'Informe de errores',
        'Attention' => 'Atención',
        'Warning' => 'Advertencia',
        'Module' => 'Módulo',
        'Modulefile' => 'Archivo de módulo',
        'Subfunction' => 'Subfunción',
        'Line' => 'Línea',
        'Setting' => 'Ajuste',
        'Settings' => 'Ajustes',
        'Example' => 'Ejemplo',
        'Examples' => 'Ejemplos',
        'valid' => 'válido',
        'Valid' => 'Válido',
        'invalid' => 'no válido',
        'Invalid' => 'No válido',
        '* invalid' => '* no válido',
        'invalid-temporarily' => 'temporalmente-no-válido',
        ' 2 minutes' => ' 2 minutos',
        ' 5 minutes' => ' 5 minutos',
        ' 7 minutes' => ' 7 minutos',
        '10 minutes' => '10 minutos',
        '15 minutes' => '15 minutos',
        'Mr.' => 'Sr.',
        'Mrs.' => 'Sra.',
        'Next' => 'Siguiente',
        'Back' => 'Atrás',
        'Next...' => 'Siguiente...',
        '...Back' => '...Atrás',
        '-none-' => '-ninguno-',
        'none' => 'ninguno',
        'none!' => '¡ninguno!',
        'none - answered' => 'ninguno  - respondido',
        'please do not edit!' => '¡Por favor, no editar!',
        'Need Action' => 'Acción requerida',
        'AddLink' => 'Añadir enlace',
        'Link' => 'Enlazar',
        'Unlink' => 'Desenlazar',
        'Linked' => 'Enlazado',
        'Link (Normal)' => 'Enlazar (Normal)',
        'Link (Parent)' => 'Enlazar (Padre)',
        'Link (Child)' => 'Enlazar (Hijo)',
        'Normal' => 'Normal',
        'Parent' => 'Padre',
        'Child' => 'Hijo',
        'Hit' => 'Acierto',
        'Hits' => 'Aciertos',
        'Text' => 'Texto',
        'Standard' => 'Estándar',
        'Lite' => 'Ligera',
        'User' => 'Usuario',
        'Username' => 'Nombre de usuario',
        'Language' => 'Idioma',
        'Languages' => 'Idiomas',
        'Password' => 'Contraseña',
        'Preferences' => 'Preferencias',
        'Salutation' => 'Saludo',
        'Salutations' => 'Saludos',
        'Signature' => 'Firma',
        'Signatures' => 'Firmas',
        'Customer' => 'Cliente',
        'CustomerID' => 'ID del cliente',
        'CustomerIDs' => 'ID de los clientes',
        'customer' => 'cliente',
        'agent' => 'agente',
        'system' => 'sistema',
        'Customer Info' => 'Información del cliente',
        'Customer Information' => 'Información del cliente',
        'Customer Companies' => 'Empresas de los clientes',
        'Company' => 'Empresa',
        'go!' => '¡ir!',
        'go' => 'ir',
        'All' => 'Todo',
        'all' => 'todo',
        'Sorry' => 'Disculpe',
        'update!' => '¡actualizar!',
        'update' => 'actualizar',
        'Update' => 'Actualizar',
        'Updated!' => '¡Actualizado!',
        'submit!' => '¡enviar!',
        'submit' => 'enviar',
        'Submit' => 'Enviar',
        'change!' => '¡modificar!',
        'Change' => 'Modificar',
        'change' => 'modificar',
        'click here' => 'pulse aquí',
        'Comment' => 'Comentario',
        'Invalid Option!' => '¡Opción no válida!',
        'Invalid time!' => '¡Hora no válida!',
        'Invalid date!' => '¡Fecha no válida!',
        'Name' => 'Nombre',
        'Group' => 'Grupo',
        'Description' => 'Descripción',
        'description' => 'descripción',
        'Theme' => 'Tema',
        'Created' => 'Creado',
        'Created by' => 'Creado por',
        'Changed' => 'Modificado',
        'Changed by' => 'Modificado por',
        'Search' => 'Buscar',
        'and' => 'y',
        'between' => 'entre',
        'before/after' => 'antes/después',
        'Fulltext Search' => 'Búsqueda de texto completo',
        'Data' => 'Datos',
        'Options' => 'Opciones',
        'Title' => 'Título',
        'Item' => 'Elemento',
        'Delete' => 'Borrar',
        'Edit' => 'Editar',
        'View' => 'Ver',
        'Number' => 'Número',
        'System' => 'Sistema',
        'Contact' => 'Contacto',
        'Contacts' => 'Contactos',
        'Export' => 'Exportar',
        'Up' => 'Arriba',
        'Down' => 'Abajo',
        'Add' => 'Añadir',
        'Added!' => '¡Añadido!',
        'Category' => 'Categoría',
        'Viewer' => 'Visor',
        'Expand' => 'Expandir',
        'Small' => 'Pequeño',
        'Medium' => 'Mediano',
        'Large' => 'Grande',
        'Date picker' => 'Selector de fecha',
        'Show Tree Selection' => 'Mostrar selección en árbol',
        'The field content is too long!' => '¡El contenido del campo es demasiado largo!',
        'Maximum size is %s characters.' => 'La cantidad máxima de caracteres es %s.',
        'This field is required or' => 'Este campo es obligatorio o',
        'New message' => 'Mensaje nuevo',
        'New message!' => '¡Mensaje nuevo!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Por favor, responda a este ticket para regresar a la vista normal de la cola.',
        'You have %s new message(s)!' => '¡Tiene %s nuevo(s) mensaje(s)!',
        'You have %s reminder ticket(s)!' => '¡Tiene %s recordatorio(s) de ticket(s)!',
        'The recommended charset for your language is %s!' => '¡El juego de caracteres recomendado para su idioma es %s!',
        'Change your password.' => 'Cambie su contraseña.',
        'Please activate %s first!' => '¡Por favor, active %s antes!',
        'No suggestions' => 'Sin sugerencias',
        'Word' => 'Palabra',
        'Ignore' => 'Ignorar',
        'replace with' => 'reemplazar con',
        'There is no account with that login name.' => 'No existe ninguna cuenta con ese nombre de usuario.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            '¡Inicio de sesión fallido! El nombre de usuario o contraseña son incorrectos.',
        'There is no acount with that user name.' => 'No hay ninguna cuenta con ese nombre de usuario',
        'Please contact your administrator' => 'Por favor, contacte con su administrador',
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact your administrator.' =>
            'Autenticación exitosa, pero no se encontró ningún registro del cliente en el backend cliente. Por favor, contactar con su administrador',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'La cuenta de correo ya existe. Por favor inicie sesión o restablezca su contraseña.',
        'Logout' => 'Cerrar la sesión',
        'Logout successful. Thank you for using %s!' => 'Sesión cerrada con éxito. ¡Gracias por utilizar %s!',
        'Feature not active!' => '¡Característica no activa!',
        'Agent updated!' => '¡Agente actualizado!',
        'Database Selection' => 'Selección de la base de datos',
        'Create Database' => 'Crear la base de datos',
        'System Settings' => 'Ajustes del sistema',
        'Mail Configuration' => 'Configuración del correo',
        'Finished' => 'Finalizado',
        'Install OTRS' => 'Instalar OTRS',
        'Intro' => 'Introducción',
        'License' => 'Licencia',
        'Database' => 'Base de datos',
        'Configure Mail' => 'Configurar el correo.',
        'Database deleted.' => 'Base de datos borrada.',
        'Enter the password for the administrative database user.' => 'Introduzca la contraseña del usuario administrador de la base de datos.',
        'Enter the password for the database user.' => 'Introduzca la contraseña del usuario de la base de datos.',
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Si ha establecido una contraseña para root en su base de datos, debe introducirla aquí. Si no, deje este campo en blanco.',
        'Database already contains data - it should be empty!' => 'La base de datos ya contiene datos. ¡Debería estar vacía!',
        'Login is needed!' => '¡Se requiere inicio de sesión!',
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'No es posible iniciar sesión debido a un mantenimiento del sistema programado',
        'Password is needed!' => '¡Se requiere una contraseña!',
        'Take this Customer' => 'Utilizar este cliente',
        'Take this User' => 'Utilizar este usuario',
        'possible' => 'posible',
        'reject' => 'rechazar',
        'reverse' => 'revertir',
        'Facility' => 'Instalación',
        'Time Zone' => 'Zona horaria',
        'Pending till' => 'Pendiente hasta',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            'No use la cuenta de Superusuario para trabajar con OTRS. Cree nuevos agentes y trabaje con esas cuentas.',
        'Dispatching by email To: field.' => 'Despachar por el campo Para: del correo electrónico',
        'Dispatching by selected Queue.' => 'Despachar por la cola seleccionada',
        'No entry found!' => '¡No se encontró ninguna entrada!',
        'Session invalid. Please log in again.' => 'Sesión no válida. Por favor, inicie sesión de nuevo.',
        'Session has timed out. Please log in again.' => 'La sesión ha caducado. Por favor, inicie sesión de nuevo.',
        'Session limit reached! Please try again later.' => 'Se ha alcanzado el límite de sesiones. Por favor, inténtelo de nuevo más tarde.',
        'No Permission!' => '¡No tiene permiso!',
        '(Click here to add)' => '(Pulse aquí para añadir)',
        'Preview' => 'Vista previa',
        'Package not correctly deployed! Please reinstall the package.' =>
            'El paquete no fue desplegado correctamente. Por favor, reinstale el paquete.',
        '%s is not writable!' => '¡%s se puede escribir!',
        'Cannot create %s!' => '¡No se puede crear %s!',
        'Check to activate this date' => 'Marque para activar esta fecha',
        'You have Out of Office enabled, would you like to disable it?' =>
            'Tiene habilitado «Fuera de la oficina», ¿desea inhabilitarlo?',
        'News about OTRS releases!' => '¡Noticias acerca de lanzamientos de OTRS!',
        'Go to dashboard!' => '¡Ir al panel principal!',
        'Customer %s added' => 'Añadido el cliente %s',
        'Role added!' => '¡Rol añadido!',
        'Role updated!' => '¡Rol actualizado!',
        'Attachment added!' => '¡Archivo adjunto añadido!',
        'Attachment updated!' => '¡Archivo adjunto actualizado!',
        'Response added!' => '¡Respuesta añadida!',
        'Response updated!' => '¡Respuesta actualizada!',
        'Group updated!' => '¡Grupo actualizado!',
        'Queue added!' => '¡Cola añadida!',
        'Queue updated!' => '¡Cola actualizada!',
        'State added!' => '¡Estado añadido!',
        'State updated!' => '¡Estado actualizado!',
        'Type added!' => '¡Tipo añadido!',
        'Type updated!' => '¡Tipo actualizado!',
        'Customer updated!' => '¡Cliente actualizado!',
        'Customer company added!' => '¡Empresa del cliente añadida!',
        'Customer company updated!' => '¡Empresa del cliente actualizada!',
        'Note: Company is invalid!' => 'Nota: ¡La empresa no es válida!',
        'Mail account added!' => '¡Cuenta de correo añadida!',
        'Mail account updated!' => '¡Cuenta de correo actualizada!',
        'System e-mail address added!' => '¡Cuenta de correo del sistema añadido!',
        'System e-mail address updated!' => '¡Cuenta de correo del sistema actualizada!',
        'Contract' => 'Contrato',
        'Online Customer: %s' => 'Cliente conectado: %s',
        'Online Agent: %s' => 'Agente conectado: %s',
        'Calendar' => 'Calendario',
        'File' => 'Archivo',
        'Filename' => 'Nombre del archivo',
        'Type' => 'Tipo',
        'Size' => 'Tamaño',
        'Upload' => 'Cargar',
        'Directory' => 'Directorio',
        'Signed' => 'Firmado',
        'Sign' => 'Firma',
        'Crypted' => 'Cifrado',
        'Crypt' => 'Cifrar',
        'PGP' => 'PGP',
        'PGP Key' => 'Clave PGP',
        'PGP Keys' => 'Claves PGP',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'Certificado S/MIME',
        'S/MIME Certificates' => 'Certificados S/MIME',
        'Office' => 'Oficina',
        'Phone' => 'Teléfono',
        'Fax' => 'Fax',
        'Mobile' => 'Móvil',
        'Zip' => 'Código Postal',
        'City' => 'Ciudad',
        'Street' => 'Calle',
        'Country' => 'País',
        'Location' => 'Localidad',
        'installed' => 'instalado',
        'uninstalled' => 'desinstalado',
        'Security Note: You should activate %s because application is already running!' =>
            'Nota de seguridad: ¡Ud. debe activar %s porque la aplicación ya está ejecutándose!',
        'Unable to parse repository index document.' => 'No es posible analizar el documento índice del repositorio.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'En este repositorio no se encontraros paquetes para su versión del marco de trabajo, sólo contiene paquetes para otras versiones del marco de trabajo.',
        'No packages, or no new packages, found in selected repository.' =>
            'No se encontraron paquetes (o paquetes nuevos) en el repositorio seleccionado.',
        'Edit the system configuration settings.' => 'Editar los ajustes de configuración del sistema.',
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'La información sobre ACL de la base de datos no está sincronizada con la configuración del sistema. Por favor, despliegue todas las ACL.',
        'printed at' => 'impreso en',
        'Loading...' => 'Cargando...',
        'Dear Mr. %s,' => 'Estimado Sr. %s.',
        'Dear Mrs. %s,' => 'Estimada Sra. %s.',
        'Dear %s,' => 'Estimado %s.',
        'Hello %s,' => 'Hola %s.',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Esta cuenta no está permitida para registrarse. Por favor, póngase en contacto con el personal de apoyo.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Creada la nueva cuenta. Enviada la información de inicio de sesión a %s. Por favor, revise su correo electrónico.',
        'Please press Back and try again.' => 'Por favor, presione Atrás e inténtelo de nuevo.',
        'Sent password reset instructions. Please check your email.' => 'Enviadas instrucción de restablecimiento de contraseña. Por favor, revise su correo electrónico',
        'Sent new password to %s. Please check your email.' => 'Enviada nueva contraseña a %s. Por favor, revise su correo electrónico.',
        'Upcoming Events' => 'Próximos eventos',
        'Event' => 'Evento',
        'Events' => 'Eventos',
        'Invalid Token!' => '¡Ficha no válida!',
        'more' => 'más',
        'Collapse' => 'Contraer',
        'Shown' => 'Mostrados',
        'Shown customer users' => 'Mostrar usuarios clientes',
        'News' => 'Noticias',
        'Product News' => 'Noticias de productos',
        'OTRS News' => 'Noticias de OTRS',
        '7 Day Stats' => 'Estadísticas semanales',
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'La información de la gestión de procesos de la base de datos no está sincronizada con la configuración del sistema. Por favor, sincronice todos los procesos.',
        'Package not verified by the OTRS Group! It is recommended not to use this package.' =>
            '¡Paquete no verificado por el grupo OTRS! Se recomienda que no use este paquete.',
        '<br>If you continue to install this package, the following issues may occur!<br><br>&nbsp;-Security problems<br>&nbsp;-Stability problems<br>&nbsp;-Performance problems<br><br>Please note that issues that are caused by working with this package are not covered by OTRS service contracts!<br><br>' =>
            '<br>Si continúa e instala este paquete, se podrían producir los siguientes problemas<br><br>&nbsp;-Problemas de seguridad<br>&nbsp;-Problemas de estabilidad<br>&nbsp;-Problemas de rendimiento<br><br>Tenga en cuenta que los problemas causados por usar este paquete no están cubiertos por los contratos de servicio de OTRS.<br><br>',
        'Mark' => 'Marcar',
        'Unmark' => 'Desmarcar',
        'Bold' => 'Negrita',
        'Italic' => 'Itálica',
        'Underline' => 'Subrayado',
        'Font Color' => 'Color de letra',
        'Background Color' => 'Color de fondo',
        'Remove Formatting' => 'Eliminar el formato',
        'Show/Hide Hidden Elements' => 'Mostrar/Ocultar elementos ocultos',
        'Align Left' => 'Alinear a la izquierda',
        'Align Center' => 'Alinear al centro',
        'Align Right' => 'Alinear a la derecha',
        'Justify' => 'Justificado',
        'Header' => 'Encabezado',
        'Indent' => 'Sangrar',
        'Outdent' => 'Reducir sangría',
        'Create an Unordered List' => 'Crear una lista sin orden',
        'Create an Ordered List' => 'Crear una lista ordenada',
        'HTML Link' => 'Enlace HTML',
        'Insert Image' => 'Insertar una imagen',
        'CTRL' => 'CTRL',
        'SHIFT' => 'Mayúsculas',
        'Undo' => 'Deshacer',
        'Redo' => 'Rehacer',
        'OTRS Daemon is not running.' => 'Daemon OTRS no se está ejecutando.',
        'Can\'t contact registration server. Please try again later.' => 'No es posible contactar con el servidor de registro. Por favor, inténtelo de nuevo más tarde.',
        'No content received from registration server. Please try again later.' =>
            'No se ha recibido ningún contenido del servidor de registro. Por favor, inténtelo de nuevo más tarde.',
        'Problems processing server result. Please try again later.' => 'Problemas al procesar el resultado del servidor. Por favor, inténtelo de nuevo más tarde.',
        'Username and password do not match. Please try again.' => 'El usuario y la contraseña no coinciden. Por favor, inténtelo de nuevo.',
        'The selected process is invalid!' => '¡El proceso seleccionado no es válido!',
        'Upgrade to %s now!' => '¡Actualizar a %s ahora!',
        '%s Go to the upgrade center %s' => '%s Vaya al centro de actualizaciones %s',
        'The license for your %s is about to expire. Please make contact with %s to renew your contract!' =>
            'La licencia de su %s esta por expirar. ¡Por favor contactese con %s para renovar su contrato!',
        'An update for your %s is available, but there is a conflict with your framework version! Please update your framework first!' =>
            'Una actualización de su %s esta disponible, pero existe un conflicto con la versión del framework! Por favor actualice su framework primero!',
        'Your system was successfully upgraded to %s.' => 'Su sistema se actualizó correctamente a %s.',
        'There was a problem during the upgrade to %s.' => 'Hubo un problema durante la actualización a %s.',
        '%s was correctly reinstalled.' => '%s fue correctamente instalado.',
        'There was a problem reinstalling %s.' => 'Hubo un problema reinstalando %s.',
        'Your %s was successfully updated.' => 'Su %s fue actualizado correctamente.',
        'There was a problem during the upgrade of %s.' => 'Hubo un problema durante la actualización de %s.',
        '%s was correctly uninstalled.' => '%s fue correctamente desinstalado.',
        'There was a problem uninstalling %s.' => 'Hubo un problema desinstalando %s.',
        'Enable cloud services to unleash all OTRS features!' => '¡Habilitar los servicios en la nube para liberar todas las características de OTRS!',

        # Template: AAACalendar
        'New Year\'s Day' => 'Día de Año Nuevo',
        'International Workers\' Day' => 'Día Internacional de los Trabajadores',
        'Christmas Eve' => 'Nochebuena',
        'First Christmas Day' => 'Navidad',
        'Second Christmas Day' => 'Segundo día de navidad',
        'New Year\'s Eve' => 'Nochevieja',

        # Template: AAAGenericInterface
        'OTRS as requester' => 'OTRS como solicitante',
        'OTRS as provider' => 'OTRS como proveedor',
        'Webservice "%s" created!' => '¡Servicio web «%s» creado!',
        'Webservice "%s" updated!' => '¡Servicio web "%s" actualizado!',

        # Template: AAAMonth
        'Jan' => 'Ene',
        'Feb' => 'Feb',
        'Mar' => 'Mar',
        'Apr' => 'Abr',
        'May' => 'May',
        'Jun' => 'Jun',
        'Jul' => 'Jul',
        'Aug' => 'Ago',
        'Sep' => 'Sep',
        'Oct' => 'Oct',
        'Nov' => 'Nov',
        'Dec' => 'Dic',
        'January' => 'Enero',
        'February' => 'Febrero',
        'March' => 'Marzo',
        'April' => 'Abril',
        'May_long' => 'Mayo',
        'June' => 'Junio',
        'July' => 'Julio',
        'August' => 'Agosto',
        'September' => 'Septiembre',
        'October' => 'Octubre',
        'November' => 'Noviembre',
        'December' => 'Diciembre',

        # Template: AAAPreferences
        'Preferences updated successfully!' => '¡Las preferencias se actualizaron correctamente!',
        'User Profile' => 'Perfil del usuario',
        'Email Settings' => 'Ajustes del correo electrónico',
        'Other Settings' => 'Otros ajustes',
        'Notification Settings' => 'Preferencias de Notificaciones',
        'Change Password' => 'Cambiar la contraseña',
        'Current password' => 'Contraseña actual',
        'New password' => 'Nueva contraseña',
        'Verify password' => 'Verificar contraseña',
        'Spelling Dictionary' => 'Diccionario ortográfico',
        'Default spelling dictionary' => 'Diccionario ortográfico predeterminado',
        'Max. shown Tickets a page in Overview.' => 'Cantidad máxima de tickets a mostrar en la vista general',
        'The current password is not correct. Please try again!' => 'La contraseña actual no es correcta. ¡Inténtelo de nuevo!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'No es posible actualizar la contraseña, su nueva contraseña no coincide. ¡Inténtelo de nuevo!',
        'Can\'t update password, it contains invalid characters!' => 'No es posible actualizar la contraseña, contiene caracteres no válidos.',
        'Can\'t update password, it must be at least %s characters long!' =>
            'No es posible actualizar la contraseña, debe tener al menor %s caracteres.',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase characters!' =>
            'No es posible actualizar la contraseña, debe contener al menos 2 minúsculas y 2 mayúsculas.',
        'Can\'t update password, it must contain at least 1 digit!' => 'No es posible actualizar la contraseña, debe contener al menos 1 dígito.',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'No es posible actualizar la contraseña, debe contener al menos 2 caracteres.',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'No es posible actualizar la contraseña, esta contraseña ya ha sido usada. Elija una nueva.',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Seleccione el carácter separador a usar en los archivos CSV (estadísticas y búsquedas). Si no selecciona ningún separador aquí, se usará el separador predeterminado para su idioma.',
        'CSV Separator' => 'Separador CSV',

        # Template: AAATicket
        'Status View' => 'Vista de Estados',
        'Service View' => 'Vista de Servicios',
        'Bulk' => 'Bloque',
        'Lock' => 'Bloquear',
        'Unlock' => 'Desbloquear',
        'History' => 'Historial',
        'Zoom' => 'Vista detallada',
        'Age' => 'Antigüedad',
        'Bounce' => 'Rebotar',
        'Forward' => 'Reenviar',
        'From' => 'De',
        'To' => 'Para',
        'Cc' => 'Copia',
        'Bcc' => 'Copia oculta',
        'Subject' => 'Asunto',
        'Move' => 'Mover',
        'Queue' => 'Cola',
        'Queues' => 'Colas',
        'Priority' => 'Prioridad',
        'Priorities' => 'Prioridades',
        'Priority Update' => 'Actualización de la prioridad',
        'Priority added!' => '¡Prioridad añadida!',
        'Priority updated!' => '¡Prioridad actualizada!',
        'Signature added!' => '¡Firma añadida!',
        'Signature updated!' => '¡Firma actualizada!',
        'SLA' => 'Acuerdo de nivel de servicio',
        'Service Level Agreement' => 'Acuerdo de Nivel de Servicio',
        'Service Level Agreements' => 'Acuerdos de Niveles de Servicios',
        'Service' => 'Servicio',
        'Services' => 'Servicios',
        'State' => 'Estado',
        'States' => 'Estados',
        'Status' => 'Estado',
        'Statuses' => 'Estados',
        'Ticket Type' => 'Tipo de Ticket',
        'Ticket Types' => 'Tipos de Tickets',
        'Compose' => 'Redactar',
        'Pending' => 'Pendiente',
        'Owner' => 'Propietario',
        'Owner Update' => 'Actualización del Propietario',
        'Responsible' => 'Responsable',
        'Responsible Update' => 'Actualización del responsable',
        'Sender' => 'Remitente',
        'Article' => 'Artículo',
        'Ticket' => 'Ticket',
        'Createtime' => 'Fecha de Creación',
        'plain' => 'plano',
        'Email' => 'Correo',
        'email' => 'correo',
        'Close' => 'Cerrar',
        'Action' => 'Acción',
        'Attachment' => 'Archivo adjunto',
        'Attachments' => 'Archivos adjuntos',
        'This message was written in a character set other than your own.' =>
            'Este mensaje fue escrito usando un juego de caracteres distinto al suyo',
        'If it is not displayed correctly,' => 'Si no se muestra correctamente,',
        'This is a' => 'Este es un',
        'to open it in a new window.' => 'para abrirlo en una nueva ventana.',
        'This is a HTML email. Click here to show it.' => 'Éste es un correo HTML. Pulse aquí para mostrarlo.',
        'Free Fields' => 'Campos libres',
        'Merge' => 'Fusionar',
        'merged' => 'fusionado',
        'closed successful' => 'cerrado con éxito',
        'closed unsuccessful' => 'cerrado sin éxito',
        'Locked Tickets Total' => 'Total de tickets bloqueados',
        'Locked Tickets Reminder Reached' => 'Alcanzado el recordatorio de tickets bloqueados',
        'Locked Tickets New' => 'Nuevo Ticket bloqueado',
        'Responsible Tickets Total' => 'Total de Tickets del Responsable',
        'Responsible Tickets New' => 'Nuevo Ticket del Responsable',
        'Responsible Tickets Reminder Reached' => 'Recordatorio de Tickets del Responsable Alcanzado',
        'Watched Tickets Total' => 'Total de Tickets vistos',
        'Watched Tickets New' => 'Nuevo Tickets Visto',
        'Watched Tickets Reminder Reached' => 'Recordatorio de Tickets Vistos Alcanzados',
        'All tickets' => 'Todos los tickets',
        'Available tickets' => 'Tickets disponibles',
        'Escalation' => 'Escalada',
        'last-search' => 'última-búsqueda',
        'QueueView' => 'Vista de Colas',
        'Ticket Escalation View' => 'Vista de Escaladas de Ticket',
        'Message from' => 'Mensaje de',
        'End message' => 'Fin del mensaje',
        'Forwarded message from' => 'Mensaje reenviado de',
        'End forwarded message' => 'Fin del mensaje reenviado',
        'Bounce Article to a different mail address' => 'Rebote el Artículo a una dirección de correo diferente',
        'Reply to note' => 'Responder la nota',
        'new' => 'nuevo',
        'open' => 'abierto',
        'Open' => 'Abierto',
        'Open tickets' => 'Tickets Abiertos',
        'closed' => 'cerrado',
        'Closed' => 'Cerrado',
        'Closed tickets' => 'Tickets cerrados',
        'removed' => 'eliminado',
        'pending reminder' => 'pendiente de recordatorio',
        'pending auto' => 'pendiente automático',
        'pending auto close+' => 'pendiente de cierre automático+',
        'pending auto close-' => 'pendiente de cierre automático-',
        'email-external' => 'correo-externo',
        'email-internal' => 'correo-interno',
        'note-external' => 'nota-externa',
        'note-internal' => 'nota-interna',
        'note-report' => 'nota-informe',
        'phone' => 'teléfono',
        'sms' => 'sms',
        'webrequest' => 'solicitud vía web',
        'lock' => 'bloqueado',
        'unlock' => 'desbloqueado',
        'very low' => 'muy baja',
        'low' => 'baja',
        'normal' => 'normal',
        'high' => 'alta',
        'very high' => 'muy alta',
        '1 very low' => '1 muy baja',
        '2 low' => '2 baja',
        '3 normal' => '3 normal',
        '4 high' => '4 alta',
        '5 very high' => '5 muy alta',
        'auto follow up' => 'seguimiento automático',
        'auto reject' => 'rechazo automático',
        'auto remove' => 'eliminación automática',
        'auto reply' => 'respuesta automática',
        'auto reply/new ticket' => 'respuesta automática/nuevo ticket',
        'Create' => 'Crear',
        'Answer' => 'Responder',
        'Phone call' => 'Llamada telefónica',
        'Ticket "%s" created!' => '¡Ticket "%s" creado!',
        'Ticket Number' => 'Número de Ticket',
        'Ticket Object' => 'Ticket Objeto',
        'No such Ticket Number "%s"! Can\'t link it!' => '¡No existe el número de ticket "%s"! ¡No se puede enlazar a él!',
        'You don\'t have write access to this ticket.' => 'No tiene permisos de escritura sobre este ticket',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Disculpe, necesita ser el propietario del ticket para realizar esta acción.',
        'Please change the owner first.' => 'Por favor, cambie antes el propietario.',
        'Ticket selected.' => 'Ticket seleccionado',
        'Ticket is locked by another agent.' => 'El ticket está bloqueado por otro agente',
        'Ticket locked.' => 'Ticket bloqueado',
        'Don\'t show closed Tickets' => 'No mostrar los tickets cerrados',
        'Show closed Tickets' => 'Mostrar los tickets cerrados',
        'New Article' => 'Nuevo artículo',
        'Unread article(s) available' => 'Artículo(s) sin leer disponible(s)',
        'Remove from list of watched tickets' => 'Eliminar de la lista de tickets vistos',
        'Add to list of watched tickets' => 'Añadir a la lista de tickets vistos',
        'Email-Ticket' => 'Ticket por correo',
        'Create new Email Ticket' => 'Crea nuevo ticket por correo',
        'Phone-Ticket' => 'Ticket telefónico',
        'Search Tickets' => 'Buscar tickets',
        'Customer Realname' => 'Nombre real del Cliente',
        'Customer History' => 'Historial del Cliente',
        'Edit Customer Users' => 'Editar Usuario Cliente',
        'Edit Customer' => 'Editar Cliente',
        'Bulk Action' => 'Acción en Bloque',
        'Bulk Actions on Tickets' => 'Acción en Bloque sobre tickets',
        'Send Email and create a new Ticket' => 'Enviar un correo y crear un nuevo ticket',
        'Create new Email Ticket and send this out (Outbound)' => 'Crea un nuevo ticket por correo y envíelo (saliente).',
        'Create new Phone Ticket (Inbound)' => 'Crea nuevo ticket telefónico (entrante)',
        'Address %s replaced with registered customer address.' => 'Dirección %s reemplaza con la del cliente registrado.',
        'Customer user automatically added in Cc.' => 'Usuario Cliente añadido automáticamente en Cc.',
        'Overview of all open Tickets' => 'Vista general de todos los Tickets abiertos',
        'Locked Tickets' => 'Tickets Bloqueados',
        'My Locked Tickets' => 'Mis Tickets Bloqueados',
        'My Watched Tickets' => 'Mis Tickets vistos',
        'My Responsible Tickets' => 'Tickets de mi Responsabilidad',
        'Watched Tickets' => 'Tickets Vistos',
        'Watched' => 'Vistos',
        'Watch' => 'Ver',
        'Unwatch' => 'No Vistos',
        'Lock it to work on it' => 'Bloquear para trabajar en él',
        'Unlock to give it back to the queue' => 'Desbloquear para devolverlo a la cola',
        'Show the ticket history' => 'Mostrar el historial del ticket',
        'Print this ticket' => 'Imprimir este ticket',
        'Print this article' => 'Imprimir este artículo',
        'Split' => 'Dividir',
        'Split this article' => 'Dividir este artículo',
        'Forward article via mail' => 'Reenviar el artículo por correo',
        'Change the ticket priority' => 'Cambiar la prioridad del ticket',
        'Change the ticket free fields!' => '¡Cambiar los campos libres del ticket!',
        'Link this ticket to other objects' => 'Enlazar este ticket a otros objetos',
        'Change the owner for this ticket' => 'Cambiar el propietario de este ticket',
        'Change the  customer for this ticket' => 'Cambiar el cliente de este ticket',
        'Add a note to this ticket' => 'Añadir una nota a este ticket',
        'Merge into a different ticket' => 'Fusionar con otro ticket',
        'Set this ticket to pending' => 'Poner este ticket en pendiente',
        'Close this ticket' => 'Cerrar este ticket',
        'Look into a ticket!' => '¡Revisar un ticket!',
        'Delete this ticket' => 'Borrar este ticket',
        'Mark as Spam!' => '¡Marcar como spam!',
        'My Queues' => 'Mis colas',
        'Shown Tickets' => 'Tickets mostrados',
        'Shown Columns' => 'Columnas mostradas',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Su correo con el número de ticket "<OTRS_TICKET>" se fusionó con "<OTRS_MERGE_TO_TICKET>".',
        'Ticket %s: first response time is over (%s)!' => 'Ticket %s: ¡Se ha excedido el tiempo para la primera respuesta (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Ticket %s: ¡El tiempo para primera respuesta expirará en %s!',
        'Ticket %s: update time is over (%s)!' => 'Ticket %s: ¡Se ha excedido el tiempo para la actualización (%s)!',
        'Ticket %s: update time will be over in %s!' => 'Ticket %s: ¡El tiempo para la actualización vencerá en %s!',
        'Ticket %s: solution time is over (%s)!' => 'Ticket %s: ¡Se ha sobrepasado el tiempo para solucionarlo (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Ticket %s: ¡El tiempo para solucionarlo vencerá en %s!',
        'There are more escalated tickets!' => '¡Hay más tickets escalados!',
        'Plain Format' => 'Formato plano',
        'Reply All' => 'Responder a todos',
        'Direction' => 'Dirección',
        'New ticket notification' => 'Notificación de tickets nuevos ',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Notificarme si hay un nuevo ticket en "Mis colas".',
        'Send new ticket notifications' => 'Enviar notificaciones de nuevo ticket',
        'Ticket follow up notification' => 'Enviar notificaciones de seguimiento',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Enviarme una notificación si un cliente envía un seguimiento y soy el propietario del ticket o el ticket está desbloqueado y en una las colas a las que estoy suscrito.',
        'Send ticket follow up notifications' => 'Enviar notificaciones de seguimiento de tickets',
        'Ticket lock timeout notification' => 'Notificación de bloqueo de tickets por tiempo',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Notificarme si un ticket es desbloqueado por el sistema',
        'Send ticket lock timeout notifications' => 'Enviar notificaciones de bloqueo de ticket por tiempo excedido',
        'Ticket move notification' => 'Notificación de movimiento de ticket',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Notificarme si un ticket es colocado en una de "Mis colas".',
        'Send ticket move notifications' => 'Enviar notificaciones de movimiento de ticket',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            'La selección de sus colas favoritas. También se le notifican estas colas por correo si se habilita.',
        'Custom Queue' => 'Cola personalizada',
        'QueueView refresh time' => 'Tiempo de actualización de la vista de colas',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'Si se habilita, la Vista de colas se actualizará automáticamente tras el tiempo indicado.',
        'Refresh QueueView after' => 'Refrescar la Vista de colas tras',
        'Screen after new ticket' => 'Pantalla posterior a nuevo ticket',
        'Show this screen after I created a new ticket' => 'Mostrar esta pantalla después de crear un nuevo ticket',
        'Closed Tickets' => 'Tickets cerrados',
        'Show closed tickets.' => 'Mostrar los tickets cerrados',
        'Max. shown Tickets a page in QueueView.' => 'Cantidad máxima de tickets a mostrar en la Vista de colas',
        'Ticket Overview "Small" Limit' => 'Límite en la Vista general «pequeña» de tickets',
        'Ticket limit per page for Ticket Overview "Small"' => 'Límite de tickets por página en la Vista general de tickets «pequeña»',
        'Ticket Overview "Medium" Limit' => 'Límite en la Vista general «mediana» de tickets',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Límite de tickets por página en la Vista general de tickets «mediana»',
        'Ticket Overview "Preview" Limit' => 'Límite en la Vista general «previsualización» de tickets',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Límite de tickets por página en la Vista general de tickets «previsualización»',
        'Ticket watch notification' => 'Notificación de tickets vistos',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Enviarme las mismas notificaciones para mis tickets vistos que recibirán los propietarios del ticket',
        'Send ticket watch notifications' => 'Enviar notificaciones de tickets vistos',
        'Out Of Office Time' => 'Tiempo de ausencia de la oficina',
        'New Ticket' => 'Nuevo Ticket',
        'Create new Ticket' => 'Crear un nuevo Ticket',
        'Customer called' => 'Cliente llamado',
        'phone call' => 'llamada telefónica',
        'Phone Call Outbound' => 'Llamada Telefónica Saliente',
        'Phone Call Inbound' => 'Llamada Telefónica Entrante',
        'Reminder Reached' => 'Recordatorio Alcanzado',
        'Reminder Tickets' => 'Tickets Recordatorio',
        'Escalated Tickets' => 'Tickets Escalados',
        'New Tickets' => 'Tickets Nuevos ',
        'Open Tickets / Need to be answered' => 'Tickets Abiertos / Que necesitan de una respuesta',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'Todos los Tickets abiertos, ya se ha trabajado en estos tickets, pero necesitan una respuesta',
        'All new tickets, these tickets have not been worked on yet' => 'Todos los Tickets nuevos, todavía no se ha trabajado en estos tickets',
        'All escalated tickets' => 'Todos los Tickets escalados',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Todos los Tickets para los que se ha alcanzado su fecha de recordatorio',
        'Archived tickets' => 'Tickets archivados',
        'Unarchived tickets' => 'Tickets no archivados',
        'Ticket Information' => 'Información del ticket',
        'including subqueues' => 'incluyendo subcolas',
        'excluding subqueues' => 'excluyendo subcolas',

        # Template: AAAWeekDay
        'Sun' => 'Dom',
        'Mon' => 'Lun',
        'Tue' => 'Mar',
        'Wed' => 'Mié',
        'Thu' => 'Jue',
        'Fri' => 'Vie',
        'Sat' => 'Sáb',

        # Template: AdminACL
        'ACL Management' => 'Gestión de las ACL',
        'Filter for ACLs' => 'Filtro para las ACLs.',
        'Filter' => 'Filtro',
        'ACL Name' => 'Nombre de la ACL',
        'Actions' => 'Acciones',
        'Create New ACL' => 'Crear una nueva ACL',
        'Deploy ACLs' => 'Desplegar las ACL',
        'Export ACLs' => 'Exportar las ACL',
        'Configuration import' => 'Importar configuración',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Aquí puede cargar un archivo de configuración para importar ACLs a su sistema. El archivo debe estar en formato .yml tal y como lo exporta el módulo de edición de ACL.',
        'This field is required.' => 'Este campo es obligatorio.',
        'Overwrite existing ACLs?' => '¿Sobrescribir las ACL existentes?',
        'Upload ACL configuration' => 'Cargar configuración de ACL',
        'Import ACL configuration(s)' => 'Importar configuración de la ACL',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Para crear una nueva ACL puede importar ACLs que hayan sido exportadas en otro sistema, o bien crear una completamente nueva.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'Los cambios a estas ACL sólo afectan al comportamiento del sistema, si despliega los datos de las ACL después. Al desplegar los datos de las ACL, los nuevos cambios realizados se escribirán en la configuración.',
        'ACLs' => 'ACLs',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Por favor, observe: Esta tabla representa la orden de ejecución de las ACL. Si necesita cambiar el orden en que se ejecutan las ACL, cambie los nombres de las ACL afectadas.',
        'ACL name' => 'Nombre de la ACL',
        'Validity' => 'Validez',
        'Copy' => 'Copiar',
        'No data found.' => 'No se encontró ningún dato.',

        # Template: AdminACLEdit
        'Edit ACL %s' => 'Editar la ACL %s',
        'Go to overview' => 'Ir a la vista general',
        'Delete ACL' => 'Borrar la ACL',
        'Delete Invalid ACL' => 'Borrar ACL no válida',
        'Match settings' => 'Ajustes de la coincidencia',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Establecer los criterios de coincidencia para esta ACL. Use «Propiedades» para coincidir con la pantalla actual o «BasededatosPropiedades» para coincidir con los atributos del ticket actual que están en la base de datos.',
        'Change settings' => 'Cambiar los ajustes',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Establecer qué quiere cambiar si los criterios coinciden. Tenga en cuenta que «Posible» es una lista blanca, «PosibleNo» una lista negra.',
        'Check the official' => 'Compruebe la oficial',
        'documentation' => 'documentación',
        'Show or hide the content' => 'Mostrar u ocultar el contenido',
        'Edit ACL information' => 'Editar la información de la ACL',
        'Stop after match' => 'Parar al coincidir',
        'Edit ACL structure' => 'Editar la estructura de la ACL',
        'Save settings' => 'Guardar configuraciones',
        'Save ACL' => 'Guardar ACL',
        'Save' => 'Guardar',
        'or' => 'o',
        'Save and finish' => 'Guardar y finalizar',
        'Do you really want to delete this ACL?' => '¿Realmente desea eliminar esta ACL?',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Este elemento todavía contiene subelementos. ¿Seguro que desea eliminar este elemento y sus subelementos?',
        'An item with this name is already present.' => 'Ya hay un elemento con este nombre.',
        'Add all' => 'Añadir todos',
        'There was an error reading the ACL data.' => 'Se produjo un error al leer los datos de la ACL.',

        # Template: AdminACLNew
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'Crear una nueva ACL enviando los datos del formulario. Tras crear la ACL, podrá añadir elementos de configuración en el modo de edición.',

        # Template: AdminAttachment
        'Attachment Management' => 'Gestión de adjuntos',
        'Add attachment' => 'Añadir anexo',
        'List' => 'Lista',
        'Download file' => 'Descargar el archivo',
        'Delete this attachment' => 'Borrar este adjunto',
        'Do you really want to delete this attachment?' => '¿Realmente desea eliminar este archivo adjunto?',
        'Add Attachment' => 'Añadir un adjunto',
        'Edit Attachment' => 'Editar adjunto',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Gestión de respuestas automáticas',
        'Add auto response' => 'Añadir respuesta automática',
        'Add Auto Response' => 'Añadir respuesta automática',
        'Edit Auto Response' => 'Editar respuesta automática',
        'Response' => 'Respuesta',
        'Auto response from' => 'Respuesta automática de',
        'Reference' => 'Referencia',
        'You can use the following tags' => 'Puede usar las siguientes etiquetas',
        'To get the first 20 character of the subject.' => 'Para obtener los primeros 20 caracteres del asunto.',
        'To get the first 5 lines of the email.' => 'Para obtener las primeras 5 líneas del correo.',
        'To get the name of the ticket\'s customer user (if given).' => 'Para obtener el nombre del usuario de cliente de ticket (si lo habían entregado)',
        'To get the article attribute' => 'Para obtener el atributo del artículo',
        ' e. g.' => 'v. g.',
        'Options of the current customer user data' => 'Opciones de los datos del ciente usuario actual',
        'Ticket owner options' => 'Opciones del propietario del ticket',
        'Ticket responsible options' => 'Opciones del responsable del ticket',
        'Options of the current user who requested this action' => 'Opciones del usuario actual que solicitó esta acción',
        'Options of the ticket data' => 'Opciones de los datos del ticket',
        'Options of ticket dynamic fields internal key values' => 'Opciones de los valores de las claves internas de los campos dinámicos de los tickets',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Opciones de los valores mostrados de los campos dinámicos de los tickets, útil para los campos desplegables y de selección múltiple',
        'Config options' => 'Opciones de configuración',
        'Example response' => 'Ejemplo de respuesta',

        # Template: AdminCloudServiceSupportDataCollector
        'Cloud Service Management' => 'Gestión Servicio en la Nube',
        'Support Data Collector' => 'Recolector Datos Soporte',
        'Support data collector' => 'Recolector datos soporte',
        'Hint' => 'Consejo',
        'Currently support data is only shown in this system.' => 'Actualmente los datos de soporte sólo son mostrados en este sistema.',
        'It is highly recommended to send this data to OTRS Group in order to get better support.' =>
            'Es altamente recomendable enviar estos datos a Grupo OTRS con el fin de obtener un mejor servicio de soporte.',
        'Configuration' => 'Configuración',
        'Send support data' => 'Enviar datos de soporte',
        'This will allow the system to send additional support data information to OTRS Group.' =>
            'Esto permitirá al sistema enviar información de datos de apoyo adicional al Grupo OTRS.',
        'System Registration' => 'Registro del sistema',
        'To enable data sending, please register your system with OTRS Group or update your system registration information (make sure to activate the \'send support data\' option.)' =>
            'Para habilitar el envío de datos, registre su sistema con Grupo OTRS o actualice su información de registro del sistema ( asegúrese de activar la opción \'Enviar datos de soporte enviar\'.)',
        'Register this System' => 'Registre este Sistema',
        'System Registration is disabled for your system. Please check your configuration.' =>
            'El Registro no está disponible para su sistema. Por favor revise su configuración.',

        # Template: AdminCloudServices
        'System registration is a service of OTRS Group, which provides a lot of advantages!' =>
            '!El registro del sistema es un servicio del grupo OTRS, el cual provee innumerables ventajas!',
        'Please note that the use of OTRS cloud services requires the system to be registered.' =>
            'Por favor tenga en cuenta que el uso de servicios en la nube de OTRS requiere que el sistema esté registrado.',
        'Register this system' => 'Registrar este sistema',
        'Here you can configure available cloud services that communicate securely with %s.' =>
            'Aquí puede configurar los servicios en la nube disponibles para comunicarse de forma segura con %s.',
        'Available Cloud Services' => 'Servicios En La Nube Disponibles',
        'Upgrade to %s' => 'Actualizar a %s',

        # Template: AdminCustomerCompany
        'Customer Management' => 'Gestión de clientes',
        'Wildcards like \'*\' are allowed.' => 'Se permiten caracteres comodín como \'*\'.',
        'Add customer' => 'Añadir un cliente',
        'Select' => 'Seleccionar',
        'List (only %s shown - more available)' => 'Listar (solo %s se muestra - más disponibles)',
        'List (%s total)' => 'Listar (%s total)',
        'Please enter a search term to look for customers.' => 'Introduzca un término de búsqueda para buscar clientes.',
        'Add Customer' => 'Añadir un cliente',

        # Template: AdminCustomerUser
        'Customer User Management' => 'Gestión de Usuarios Cliente',
        'Back to search results' => 'Volver a los resultados de la búsqueda',
        'Add customer user' => 'Añadir un usuario cliente',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Los usuarios cliente necesitan tener un historial de cliente e iniciar sesión por medio del panel de cliente.',
        'Last Login' => 'Última sesión',
        'Login as' => 'Conectarse como',
        'Switch to customer' => 'Cambiar a cliente',
        'Add Customer User' => 'Añadir Usuario Cliente',
        'Edit Customer User' => 'Editar Usuario Cliente',
        'This field is required and needs to be a valid email address.' =>
            'Este campo es obligatorio y tiene que ser una dirección de correo electrónico válida.',
        'This email address is not allowed due to the system configuration.' =>
            'No se permite esta dirección de correo debido a la configuración del sistema.',
        'This email address failed MX check.' => 'Esta dirección de correo no superó la verificación MX.',
        'DNS problem, please check your configuration and the error log.' =>
            'Problema con el DNS. Por favor, verifique su configuración y el registro de errores.',
        'The syntax of this email address is incorrect.' => 'La sintaxis de esta dirección de correo es incorrecta',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Gestionar las relaciones Cliente-Grupo',
        'Notice' => 'Nota',
        'This feature is disabled!' => '¡Esta característica está inhabilitada!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Utilice esta característica sólo si desea definir permisos de grupo para los clientes.',
        'Enable it here!' => '¡Habilítelo aquí!',
        'Edit Customer Default Groups' => 'Editar los Grupos Predeterminados de los Clientes',
        'These groups are automatically assigned to all customers.' => 'Estos grupos se asignan automáticamente a todos los clientes.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Puede gestionar estos grupos mediante el ajuste de configuración «CustomerGroupAlwaysGroups».',
        'Filter for Groups' => 'Filtrar por Grupos',
        'Just start typing to filter...' => 'Empiece a escribir para filtrar...',
        'Select the customer:group permissions.' => 'Seleccionar los permisos cliente:grupo',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Si no se selecciona nada, este grupo no tendrá permisos (los tickets no estarán disponibles para el cliente).',
        'Search Results' => 'Resultado de la búsqueda',
        'Customers' => 'Clientes',
        'No matches found.' => 'No se encontraron coincidencias.',
        'Groups' => 'Grupos',
        'Change Group Relations for Customer' => 'Cambiar las Relaciones de Grupo del Cliente',
        'Change Customer Relations for Group' => 'Cambiar las Relaciones de Cliente del Grupo',
        'Toggle %s Permission for all' => 'Conmutar el permiso %s para todos',
        'Toggle %s permission for %s' => 'Conmutar el permiso %s para %s',
        'Customer Default Groups:' => 'Grupos Predeterminados del Cliente:',
        'No changes can be made to these groups.' => 'No se pueden hacer cambios a estos grupos.',
        'ro' => 'sólo lectura',
        'Read only access to the ticket in this group/queue.' => 'Acceso de sólo lectura a los tickets de este grupo/cola.',
        'rw' => 'lectura escritura',
        'Full read and write access to the tickets in this group/queue.' =>
            'Acceso completo de lectura y escritura a los tickets de este grupo/cola.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Gestionar las Relaciones Cliente-Servicios',
        'Edit default services' => 'Editar los servicios predeterminados',
        'Filter for Services' => 'Filtro para los servicios',
        'Allocate Services to Customer' => 'Asignar Servicios al Cliente',
        'Allocate Customers to Service' => 'Asignar Clientes al Servicio',
        'Toggle active state for all' => 'Conmutar el estado activo a todos',
        'Active' => 'Activo',
        'Toggle active state for %s' => 'Conmutar el estado activo a %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => 'Gestión de Campos Dinámicos',
        'Add new field for object' => 'Añadir un nuevo campo al objeto',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Para añadir un nuevo campo, seleccione el tipo de campo de la lista de objetos, el objeto define los limites del campo y no puede ser cambiado despues de la creación del campo.',
        'Dynamic Fields List' => 'Lista de Campos Dinámicos',
        'Dynamic fields per page' => 'Campos dinámicos por página',
        'Label' => 'Etiqueta',
        'Order' => 'Orden',
        'Object' => 'Objeto',
        'Delete this field' => 'Borrar este campo',
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            '¿Realmente desea eliminar este campo dinámico? ¡Se PERDERÁN TODOS los datos asociados!',
        'Delete field' => 'Borrar el campo',
        'Deleting the field and its data. This may take a while...' => 'Borrar el campo y sus datos. Esto tomará unos momentos...',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => 'Campos Dinámicos',
        'Field' => 'Campo',
        'Go back to overview' => 'Volver a la vista general',
        'General' => 'General',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Este campo es necesario, y el valor debería contener sólo caracteres alfabéticos y numéricos.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Debe ser único y sólo aceptar caracteres alfabéticos y numéricos.',
        'Changing this value will require manual changes in the system.' =>
            'Cambiar este valor requerirá cambios manuales en el sistema.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Éste es el nombre a mostrar en las pantallas en las que el campo esté activo.',
        'Field order' => 'Orden de campo',
        'This field is required and must be numeric.' => 'Este campo es necesario y debe ser numérico.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Éste es el orden en que se mostrará este campo en las pantallas en las que esté activo.',
        'Field type' => 'Tipo de campo',
        'Object type' => 'Tipo de objeto',
        'Internal field' => 'Campo interno',
        'This field is protected and can\'t be deleted.' => 'Este campo está protegido y no se puede borrar.',
        'Field Settings' => 'Ajustes del campo',
        'Default value' => 'Valor predeterminado',
        'This is the default value for this field.' => 'Éste es valor predeterminado para este campo.',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => 'Diferencia de fechas predeterminada',
        'This field must be numeric.' => 'Este campo debe ser numérico.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'La diferencia de AHORA (en segundos) para calcular el valor predeterminado del campo (vg 3600 o -60).',
        'Define years period' => 'Definir el periodo en años',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Active esta característica para definir un intervalo fijo de años (en el futuro y en el pasado) a mostrar en la parte año de este campo.',
        'Years in the past' => 'Años en el pasado',
        'Years in the past to display (default: 5 years).' => 'Años en el pasado a mostrar (por defecto: 5 años).',
        'Years in the future' => 'Años en el futuro',
        'Years in the future to display (default: 5 years).' => 'Años en el futuro a mostrar (por defecto: 5 años).',
        'Show link' => 'Mostrar el enlace',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Aquí puede indicar un enlace HTTP opcional para el valor del campo en las pantallas de Vista general y Ampliación',
        'Link for preview' => 'Enlace de vista previa',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'Si se rellena, esta URL será usada para una vista preliminar si se pone el ratón encima de detalles del ticket. Por favor note que para que esto funcione, la URL usada arriba debe ser rellenada también.',
        'Restrict entering of dates' => 'Restringir entrada de fechas',
        'Here you can restrict the entering of dates of tickets.' => 'Aquí puede restringir la entrada de fechas para los tickets.',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => 'Posibles valores',
        'Key' => 'Clave',
        'Value' => 'Valor',
        'Remove value' => 'Eliminar el valor',
        'Add value' => 'Añadir un valor',
        'Add Value' => 'Añadir un valor',
        'Add empty value' => 'Añadir un valor vacío',
        'Activate this option to create an empty selectable value.' => 'Active esta opción para crear un valor seleccionable vacío.',
        'Tree View' => 'Vista en árbol',
        'Activate this option to display values as a tree.' => 'Active esta opción para mostrar los valores como un árbol.',
        'Translatable values' => 'Valores traducibles',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Si activa esta opción los valores se traducirán al idioma definido por el usuario.',
        'Note' => 'Nota',
        'You need to add the translations manually into the language translation files.' =>
            'Necesita añadir las traducciones manualmente en los ficheros de traducción al idioma.',

        # Template: AdminDynamicFieldText
        'Number of rows' => 'Número de filas',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Indica la altura (en líneas) de este campo en el modo de edición.',
        'Number of cols' => 'Número de columnas',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Indica la anchura (en caracteres) de este campo en el modo de edición.',
        'Check RegEx' => 'Comprobar RegEx',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Aquí puede especificar una expresión regular para comprobar el valor. El regex se ejecutara con los modificadores xms.',
        'RegEx' => 'RegEx',
        'Invalid RegEx' => 'Inválido RegEx',
        'Error Message' => 'Mensaje de error',
        'Add RegEx' => 'Añadir RegEx',

        # Template: AdminEmail
        'Admin Notification' => 'Notificación del administrador',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Con este módulo, los administradores pueden enviar mensajes a los agentes y miembros de grupos o roles.',
        'Create Administrative Message' => 'Crear mensaje administrativo',
        'Your message was sent to' => 'Se ha enviado su mensaje a',
        'Send message to users' => 'Enviar mensaje a los usuarios',
        'Send message to group members' => 'Enviar mensaje a los miembros del grupo',
        'Group members need to have permission' => 'Los miembros del grupo tienen que tener permiso',
        'Send message to role members' => 'Enviar mensajes a los miembros del rol',
        'Also send to customers in groups' => 'Enviar también a los clientes de los grupos',
        'Body' => 'Cuerpo',
        'Send' => 'Enviar',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Agente genérico',
        'Add job' => 'Añadir trabajo',
        'Last run' => 'Última ejecución',
        'Run Now!' => '¡Ejecutar ahora!',
        'Delete this task' => 'Borrar esta tarea',
        'Run this task' => 'Ejecutar esta tarea',
        'Do you really want to delete this task?' => '¿Realmente desea eliminar esta tarea?',
        'Job Settings' => 'Ajustes del trabajo',
        'Job name' => 'Nombre del trabajo',
        'The name you entered already exists.' => 'El nombre introducido ya existe.',
        'Toggle this widget' => 'Conmutar este widget',
        'Automatic execution (multiple tickets)' => 'Ejecución automática (múltiples tickets)',
        'Execution Schedule' => 'Planificación de la ejecución',
        'Schedule minutes' => 'Minutos para la planificación',
        'Schedule hours' => 'Horas para planificación',
        'Schedule days' => 'Días para la planificación',
        'Currently this generic agent job will not run automatically.' =>
            'Actualmente este trabajo de agente genérico no se ejecutará automáticamente.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            '¡Para habilitar la ejecución automática, seleccione al menos un valor de minutos, horas y días!',
        'Event based execution (single ticket)' => 'Ejecución basada en eventos (un único ticket)',
        'Event Triggers' => 'Disparadores del evento',
        'List of all configured events' => 'Lista de todos los eventos configurados',
        'Delete this event' => 'Borrar este evento',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Además o en lugar de una ejecución periódica, puede definir eventos de ticket que disparen este trabajo.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Si se dispara un evento de ticket, se aplicará el filtro de tickets para combrobar si el ticket coincide. Sólo entonces se ejecuta el trabajo sobre ese ticket.',
        'Do you really want to delete this event trigger?' => '¿Realmente desea eliminar este disparador de evento?',
        'Add Event Trigger' => 'Añadir disparador de evento',
        'Add Event' => 'Añadir Evento',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Para añadir un nuevo evento seleccione el objeto evento y el nombre del evento y pulse el botón "+"',
        'Duplicate event.' => 'Duplicar el evento',
        'This event is already attached to the job, Please use a different one.' =>
            'Este evento ya está ligado al trabajo, seleccione uno diferente.',
        'Delete this Event Trigger' => 'Borrar este disparador de eventos',
        'Remove selection' => 'Eliminar selección',
        'Select Tickets' => 'Seleccionar Ticket',
        '(e. g. 10*5155 or 105658*)' => '(ej: 10*5155 o 105658*)',
        '(e. g. 234321)' => '(ej: 234321)',
        'Customer user' => 'Usuario del cliente',
        '(e. g. U5150)' => '(ej: U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Búsqueda de texto completo en un artículo (ej. «Mar*in» o «Baue*»).',
        'Agent' => 'Agente',
        'Ticket lock' => 'Bloqueo de tickets',
        'Create times' => 'Fechas de creación',
        'No create time settings.' => 'No hay fecha de creación',
        'Ticket created' => 'Ticket creado',
        'Ticket created between' => 'Ticket creado entre',
        'Last changed times' => 'Últimas fechas modificadas',
        'No last changed time settings.' => 'No hay últimas ajustes de fechas modificadas.',
        'Ticket last changed' => 'Último Ticket modificado',
        'Ticket last changed between' => 'Último Ticket modificado entre',
        'Change times' => 'Fecha de modificación',
        'No change time settings.' => 'No hay fecha de modificación',
        'Ticket changed' => 'Ticket modificado',
        'Ticket changed between' => 'Ticket modificado entre',
        'Close times' => 'Fechas de cierre',
        'No close time settings.' => 'No hay fechas de cierre',
        'Ticket closed' => 'Ticket cerrado',
        'Ticket closed between' => 'Ticket cerrado entre',
        'Pending times' => 'Fechas de recordatorio',
        'No pending time settings.' => 'No hay fechas de recordatorio',
        'Ticket pending time reached' => 'Alcanzado el tiempo de espera del ticket',
        'Ticket pending time reached between' => 'Alcanzado el tiempo de espera del ticket entre',
        'Escalation times' => 'Fechas de escalada',
        'No escalation time settings.' => 'No hay ajustes para las fechas de escalada',
        'Ticket escalation time reached' => 'Alcanzada la fecha de escalada del ticket',
        'Ticket escalation time reached between' => 'Alcanzada la fecha de escalada del ticket entre',
        'Escalation - first response time' => 'Escalada - fecha de la primera respuesta',
        'Ticket first response time reached' => 'Alcanzada la fecha de primera respuesta al ticket',
        'Ticket first response time reached between' => 'Alcanzada la fecha de primera respuesta entre',
        'Escalation - update time' => 'Escalada - fecha de actualización',
        'Ticket update time reached' => 'Alcanzada la fecha de actualización del ticket',
        'Ticket update time reached between' => 'Alcanzada la fecha de actualización del ticket entre',
        'Escalation - solution time' => 'Escalada - fecha de solución',
        'Ticket solution time reached' => 'Alcanzada la fecha de solución del ticket',
        'Ticket solution time reached between' => 'Alcanzada la fecha de solución del ticket entre',
        'Archive search option' => 'Opciones de búsqueda en el archivo',
        'Update/Add Ticket Attributes' => 'Actualizar/Añadir Atributos de Ticket',
        'Set new service' => 'Establecer nuevo servicio',
        'Set new Service Level Agreement' => 'Establecer nuevo Acuerdo de Nivel de Servicio',
        'Set new priority' => 'Establecer nueva prioridad',
        'Set new queue' => 'Establecer nueva cola',
        'Set new state' => 'Establecer nuevo estado',
        'Pending date' => 'Fecha pendiente',
        'Set new agent' => 'Establecer nuevo agente',
        'new owner' => 'nuevo propietario',
        'new responsible' => 'nuevo responsable',
        'Set new ticket lock' => 'Establecer nuevo bloqueo de ticket',
        'New customer user' => 'Nuevo usuario del cliente',
        'New customer ID' => 'Nuevo ID de cliente',
        'New title' => 'Nuevo título',
        'New type' => 'Nuevo tipo',
        'New Dynamic Field Values' => 'Nuevos valores de campo dinámico',
        'Archive selected tickets' => 'Archivar los tickets seleccionados',
        'Add Note' => 'Añadir una nota',
        'Time units' => 'Unidades de tiempo',
        'Execute Ticket Commands' => 'Ejecutar Comandos del Ticket',
        'Send agent/customer notifications on changes' => 'Enviar notificaciones al agente/cliente cuando haya cambios',
        'CMD' => 'CMD',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Se ejecutará esta orden. ARG[0] será el número del ticket, ARG[1] el id del ticket.',
        'Delete tickets' => 'Borrar los tickets',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Advertencia: ¡Se eliminarán de la base de datos todos los tickets afectados, y no podrán restaurarse!',
        'Execute Custom Module' => 'Ejecutar módulo personalizado',
        'Param %s key' => 'Clave del parámetro %s',
        'Param %s value' => 'Valor del parámetro %s',
        'Save Changes' => 'Guardar los cambios',
        'Results' => 'Resultados',
        '%s Tickets affected! What do you want to do?' => '¡%s tickets afectados! ¿Qué desea hacer?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Advertencia: Ha usado la opción BORRAR. ¡Se perderán todos los tickets borrados!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'Advertencia. Hay %s tickets afectados pero solo %s podrían ser modificados durante una ejecución de tarea.',
        'Edit job' => 'Editar el trabajo',
        'Run job' => 'Ejecutar el trabajo',
        'Affected Tickets' => 'Tickets afectados',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => 'Depurador de la interfaz genérica para el servicio web %s',
        'You are here' => 'Usted está aquí.',
        'Web Services' => 'Servicios web',
        'Debugger' => 'Depurador',
        'Go back to web service' => 'Volver al servicio web',
        'Clear' => 'Limpiar',
        'Do you really want to clear the debug log of this web service?' =>
            '¿Realmente desea limpiar el registro de depuración de este servicio web?',
        'Request List' => 'Lista de solicitudes',
        'Time' => 'Fecha y hora',
        'Remote IP' => 'IP remota',
        'Loading' => 'Cargando',
        'Select a single request to see its details.' => 'Seleccione una única solicitud para ver sus detalles.',
        'Filter by type' => 'Filtrar por tipo',
        'Filter from' => 'Filtrar desde',
        'Filter to' => 'Filtrar hasta',
        'Filter by remote IP' => 'Filtrar por IP remota',
        'Limit' => 'Límite',
        'Refresh' => 'Actualizar',
        'Request Details' => 'Detalles de la solicitud',
        'An error occurred during communication.' => 'Se produjo un error durante la comunicación.',
        'Show or hide the content.' => 'Mostrar u ocultar el contenido.',
        'Clear debug log' => 'Limpiar el registro de depuración',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => 'Añadir un nuevo invocador al servicio web %s',
        'Change Invoker %s of Web Service %s' => 'Cambiar el invocador %s del servicio web %s',
        'Add new invoker' => 'Añadir nuevo invocador',
        'Change invoker %s' => 'Cambiar el invocador %s',
        'Do you really want to delete this invoker?' => '¿Realmente desea borrar este invocador?',
        'All configuration data will be lost.' => 'Se perderán todos los datos de configuración.',
        'Invoker Details' => 'Detalles del invocador',
        'The name is typically used to call up an operation of a remote web service.' =>
            'El nombre se usa normalmente para llamar una operación de un servicio web remoto.',
        'Please provide a unique name for this web service invoker.' => 'Proporcione un nombre único para este invocador de servicio web.',
        'Invoker backend' => 'Backend del invocador',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Se llamará a este módulo del backend del invocador OTRS para preparar los datos a enviar al sistema remoto, y para procesar los datos de la respuesta.',
        'Mapping for outgoing request data' => 'Mapeo para los datos de la solicitud saliente',
        'Configure' => 'Configurar',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Los datos del invocador de OTRS serán procesador por este mapeo, para transformarlos al tipo de datos que el sistema remoto espera.',
        'Mapping for incoming response data' => 'Mapeo para los datos de la respuesta entrante',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            'Los datos de la respuesta serán procesados por este mapeo, para transformarlos al tipo de datos que el invocador de OTRS espera.',
        'Asynchronous' => 'Asíncrono',
        'This invoker will be triggered by the configured events.' => 'Este invocador será disparado por los eventos configurados.',
        'Asynchronous event triggers are handled by the OTRS Scheduler Daemon in background (recommended).' =>
            'Disparadores de evento asíncronos son manejados por el Planificador Daemon de OTRS en segundo plano (recomendado).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'Los disparadores de eventos asíncronos serían procesados directamente durante la solicitud web.',
        'Save and continue' => 'Guardar y continuar',
        'Delete this Invoker' => 'Borrar este invocador',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => 'Simple Mapeo de la Interface Genérica para Servicio Web %s',
        'Go back to' => 'Volver a',
        'Mapping Simple' => 'Simple Mapeo',
        'Default rule for unmapped keys' => 'Regla por defecto para llaves sin asignar',
        'This rule will apply for all keys with no mapping rule.' => 'Esta regla aplica para todas las claves sin regla asignada.',
        'Default rule for unmapped values' => 'Regla por defecto para valores sin asignar',
        'This rule will apply for all values with no mapping rule.' => 'Esta regla aplica para todos los valores sin regla asignada.',
        'New key map' => 'Nueva asignación de clave',
        'Add key mapping' => 'Añadir asignación de clave',
        'Mapping for Key ' => 'Asignación para clave',
        'Remove key mapping' => 'Eliminar asignación de clave',
        'Key mapping' => 'Asignación de clave',
        'Map key' => 'Clave Asignada',
        'matching the' => 'coincida con el',
        'to new key' => 'a nueva clave',
        'Value mapping' => 'Asignacion de Valores',
        'Map value' => 'Valor Asignado',
        'to new value' => 'a nuevo valor',
        'Remove value mapping' => 'Eliminar asignación de valor',
        'New value map' => 'Nuevo asignación de valor',
        'Add value mapping' => 'Añadir asignación de valor',
        'Do you really want to delete this key mapping?' => '¿Realmente desea eliminar esta asignación de clave?',
        'Delete this Key Mapping' => 'Borrar esta Asignación de Clave',

        # Template: AdminGenericInterfaceMappingXSLT
        'GenericInterface Mapping XSLT for Web Service %s' => 'Mapeo XSLT de la InterfazGenerica para Servicio Web %s',
        'Mapping XML' => 'Mapeo XML',
        'Template' => 'Plantilla',
        'The entered data is not a valid XSLT stylesheet.' => 'Los datos introducidos no son una hoja de estilo XSLT válida.',
        'Insert XSLT stylesheet.' => 'Inserte hoja de estilo XSLT',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => 'Añadir nueva operación al Servicio Web %s',
        'Change Operation %s of Web Service %s' => 'Cambiar Operación %s del Servicio Web %s',
        'Add new operation' => 'Añadir nueva operación',
        'Change operation %s' => 'Cambiar operación %s',
        'Do you really want to delete this operation?' => '¿Realmente desea eliminar esta operación?',
        'Operation Details' => 'Detalles de la Operación',
        'The name is typically used to call up this web service operation from a remote system.' =>
            'El nombre se utiliza normalmente para acceder a esta operación de servicio web desde un sistema remoto.',
        'Please provide a unique name for this web service.' => 'Por favor, proporcione un nombre único para este servicio web.',
        'Mapping for incoming request data' => 'Asignación para la solicitud de datos entrantes',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            'La solicitud de datos serán procesados por esta asignación, para transformar a la clase de datos que OTRS espera.',
        'Operation backend' => 'Backend Operación',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            'Este módulo OTRS backend operación será llamado internamente para procesar la solicitud, la generación de datos para la respuesta.',
        'Mapping for outgoing response data' => 'Asignación de datos de respuesta de salida',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Los datos de respuesta serán procesados por esta asignación, para transformar a la clase de datos que el sistema remoto espera.',
        'Delete this Operation' => 'Borrar esta Operación',

        # Template: AdminGenericInterfaceTransportHTTPREST
        'GenericInterface Transport HTTP::REST for Web Service %s' => 'Transporte HTTP::REST de la Interface Genérica para Servicio Web %s',
        'Network transport' => 'Transporte de Red',
        'Properties' => 'Propiedades',
        'Route mapping for Operation' => 'Asignación de rutas para la Operación',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'Definir la ruta que debe ser asignada a esta operación. Variables marcadas por una \':\' serán asignadas al nombre ingresado y pasadas por otras asignaciones. (ej. /Ticket/:TicketID).',
        'Valid request methods for Operation' => 'Métodos solicitud válida para la Operación',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'Limitar esta operación a los métodos de petición específicos. Si no se selecciona ningún método se aceptarán todas las solicitudes.',
        'Maximum message length' => 'Longitud máxima del mensaje',
        'This field should be an integer number.' => 'Este campo debe ser un número entero.',
        'Here you can specify the maximum size (in bytes) of REST messages that OTRS will process.' =>
            'Aquí puede especificar el tamaño máximo (en bytes) de mensajes REST que procesará OTRS.',
        'Send Keep-Alive' => 'Enviar Mantener-Activo',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Esta configuración define si las conexiones entrantes deben quedar cerrados o mantenerse activas.',
        'Host' => 'Host',
        'Remote host URL for the REST requests.' => 'URL del host remoto para las solicitudes REST.',
        'e.g https://www.otrs.com:10745/api/v1.0 (without trailing backslash)' =>
            'ej. https://www.otrs.com:10745/api/v1.0 (sin la barra invertida)',
        'Controller mapping for Invoker' => 'Asignación del Controlador para el Invocador',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'El controlador al que el invocador debe enviar peticiones a. Variables marcadas por un \'.\' quedarán reemplazadas por los valores de los datos y pasados con la petición (e.j. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).',
        'Valid request command for Invoker' => 'Comando petición válido para Invocador',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'Comando HTTP específico para usar por peticiones con este invocador (opcional).',
        'Default command' => 'Comando por defecto',
        'The default HTTP command to use for the requests.' => 'El comando HTTP por defecto para usar con las peticiones.',
        'Authentication' => 'Autenticación',
        'The authentication mechanism to access the remote system.' => 'Mecanismo de autenticación para acceder al sistema remoto.',
        'A "-" value means no authentication.' => 'Un valor "-" significa que no estás autenticado.',
        'The user name to be used to access the remote system.' => 'Nombre de usuario a ser usado para acceder al sistema remoto.',
        'The password for the privileged user.' => 'La contraseña para el usuario con permisos especiales.',
        'Use SSL Options' => 'Usar opciones SSL',
        'Show or hide SSL options to connect to the remote system.' => 'Muestra u oculta las opciones SSL para conectar al sistema remoto.',
        'Certificate File' => 'Archivo de Cetificado',
        'The full path and name of the SSL certificate file.' => 'La ruta completa y nombre del archivo de certificado SSL',
        'e.g. /opt/otrs/var/certificates/REST/ssl.crt' => 'ej. /opt/otrs/var/certificates/REST/ssl.crt',
        'Certificate Password File' => 'Archivo de Contraseña del Certificado',
        'The full path and name of the SSL key file.' => 'Ruta completa y nombre del archivo llave SSL.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.key' => 'ej.  /opt/otrs/var/certificates/REST/ssl.key',
        'Certification Authority (CA) File' => 'Archivo de Autoridad de Certificacion (CA)',
        'The full path and name of the certification authority certificate file that validates the SSL certificate.' =>
            'Ruta completa y nombre del archivo del certificado de autoridad de certificación que valida el certificado SSL.',
        'e.g. /opt/otrs/var/certificates/REST/CA/ca.file' => 'ej.  /opt/otrs/var/certificates/REST/CA/ca.file',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => 'InterfazGenerica Transporta HTTP::SOAP para Servicio Web %s',
        'Endpoint' => 'Puntofinal',
        'URI to indicate a specific location for accessing a service.' =>
            'URI para indicar una localización específica para acceder al servicio.',
        'e.g. http://local.otrs.com:8000/Webservice/Example' => 'ej. http://local.otrs.com:8000/Webservice/Example',
        'Namespace' => 'Espacio de nombre',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI para dar un contexto a métodos SOAP, reduciendo ambiguedades.',
        'e.g urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions' =>
            'ej. urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions',
        'Request name scheme' => 'Petición nombre de esquema',
        'Select how SOAP request function wrapper should be constructed.' =>
            'Seleccione como el contenedor de la función de petición SOAP debe ser construido.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '\'NombreFuncion\' es utilizado como ejemplo para el actual nombre de invocador/operación.',
        '\'FreeText\' is used as example for actual configured value.' =>
            '\'TextoLibre\' es utilizado como ejemplo para el valor configurado actualmente.',
        'Request name free text' => '',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'Texto para ser usado como un sufijo del nombre del contenedor de la función o remplazo.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'Por favor considere las restricciones de nombrado de elemento XML (ej. no usar \'<\' y \'&\').',
        'Response name scheme' => 'Nombre esquema respuesta',
        'Select how SOAP response function wrapper should be constructed.' =>
            'Seleccione como el contenedor de la función de respuesta SOAP debe ser construido.',
        'Response name free text' => 'Texto libre nombre de respuesta',
        'Here you can specify the maximum size (in bytes) of SOAP messages that OTRS will process.' =>
            'Aquí puede especificar el tamaño máximo (en bytes) de mensajes SOAP que procesará OTRS.',
        'Encoding' => 'Codificación',
        'The character encoding for the SOAP message contents.' => 'El caracter codificación para contenidos de mensaje SOAP. ',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'ej. utf-8, latin1, iso-8859-1, cp1250, Etc.',
        'SOAPAction' => 'SOAPAcción',
        'Set to "Yes" to send a filled SOAPAction header.' => 'Establece a "Si" para enviar una cabecera SOAPAccion cubierta.',
        'Set to "No" to send an empty SOAPAction header.' => 'Establece a "No" para enviar una cabecera SOAPAcción vacía.',
        'SOAPAction separator' => 'Separador SOAPAcción',
        'Character to use as separator between name space and SOAP method.' =>
            'Caracter para usar como separador entre el espacio del nombre y el método SOAP.',
        'Usually .Net web services uses a "/" as separator.' => 'Usualmente servicios web de .Net usan "/" como separador.',
        'Proxy Server' => 'Servidor Proxy',
        'URI of a proxy server to be used (if needed).' => 'URI del servidor proxy a usar (si se requiere).',
        'e.g. http://proxy_hostname:8080' => 'ej. http://proxy_hostname:8080',
        'Proxy User' => 'Usuario de Proxy',
        'The user name to be used to access the proxy server.' => 'El nombre de usuario a ser usado para acceder al servidor proxy.',
        'Proxy Password' => 'Contraseña de Proxy',
        'The password for the proxy user.' => 'La contraseña para el usuario de proxy.',
        'The full path and name of the SSL certificate file (must be in .p12 format).' =>
            'La ruta completa y nombre del archivo de certificado SSL (debe estar en formato .p12).',
        'e.g. /opt/otrs/var/certificates/SOAP/certificate.p12' => 'ej. /opt/otrs/var/certificates/SOAP/certificate.p12',
        'The password to open the SSL certificate.' => 'La contraseña para abrir el certificado SSL',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'La ruta completa y el nombre de la autoridad de certificación del archivo del certificado que valida el certificado SSL.',
        'e.g. /opt/otrs/var/certificates/SOAP/CA/ca.pem' => 'ej.  /opt/otrs/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Directorio Autoridad Certificación (CA)',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'La ruta completa del directorio de la autoridad de certificación donde los certificados de CA se almacenan en el sistema de archivos .',
        'e.g. /opt/otrs/var/certificates/SOAP/CA' => 'ej. /opt/otrs/var/certificates/SOAP/CA',
        'Sort options' => 'Opciones clasificación',
        'Add new first level element' => 'Añadir nuevo elemento de primer nivel',
        'Element' => 'Elemento',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            'Orden de clasificación de salida para campos xml (estructura comenzando a continuación del nombre de contenedor de la función) - ver la documentación para el transporte SOAP.',

        # Template: AdminGenericInterfaceWebservice
        'GenericInterface Web Service Management' => 'Gestión Servicio Web InterfazGenerica',
        'Add web service' => 'Agregar servicio web',
        'Clone web service' => 'Clonar servicio web.',
        'The name must be unique.' => 'El nombre debe ser unico.',
        'Clone' => 'Clonar',
        'Export web service' => 'Exportar servicio web',
        'Import web service' => 'Importar servicio web',
        'Configuration File' => 'Archivo de Configuración',
        'The file must be a valid web service configuration YAML file.' =>
            'El archivo debe ser un archivo válido YAML de configuración de servicio web.',
        'Import' => 'Importar',
        'Configuration history' => 'Historial de Configuración',
        'Delete web service' => 'Eliminar servicio web',
        'Do you really want to delete this web service?' => '¿Realmente desea eliminar este servicio web?',
        'Ready-to-run Web Services' => 'Listo para ejecutar los servicios Web',
        'Here you can activate ready-to-run web services showcasing our best practices that are a part of %s.' =>
            'Aquí puede activar ejemplos de buenas prácticas de servicios web que son parte de %s.',
        'Please note that these web services may depend on other modules only available with certain %s contract levels (there will be a notification with further details when importing).' =>
            'Por favor considere que estos servicios de web pueden depender de otros módulos que son solo disponibles con el cierto porcentaje de niveles de contrato (habrá una notificación allí con siguientes detalles de importación)',
        'Import ready-to-run web service' => 'Importar servicios web listos para ejecutar',
        'Would you like to benefit from web services created by experts? Upgrade to %s to import some sophisticated ready-to-run web services.' =>
            'Quisieras  beneficiarte de servicios web creados por los expertos? Actualiza al cierto porcentaje para importar algunos servicios web sofisticados listos para ejecutarse',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'Después de salvar su configuración ud. será redireccionado de nuevo a la pantalla de edición',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'Si desea volver al resumen por favor presione el botón "Volver a resumen"',
        'Web Service List' => 'Lista de Servicios Web',
        'Remote system' => 'Sistema remoto',
        'Provider transport' => 'Proveedor transporte',
        'Requester transport' => 'Solicitante transporte',
        'Debug threshold' => 'Umbral de depuración',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            'En modo proveedor, OTRS ofrece servicios web los cuales son usados por sistemas remotos.',
        'In requester mode, OTRS uses web services of remote systems.' =>
            'En modo solicitante, OTRS usa servicios web de sistemas remotos.',
        'Operations are individual system functions which remote systems can request.' =>
            'Operaciones son funciones de sistema individuales las cuales los sistemas remotos pueden solicitar.',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'Los invocadores preparan datos para una petición a un servicio web remoto, y procesa los datos de respuesta.',
        'Controller' => 'Controlador',
        'Inbound mapping' => 'Mapeo de entrada',
        'Outbound mapping' => 'Mapeo de salida',
        'Delete this action' => 'Borrar esta acción',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'Al menos un %s tiene un controlador que no está activo o presente, por favor revise el registro del controlador o elimine el %s',
        'Delete webservice' => 'Borrar servicio web',
        'Delete operation' => 'Eliminar operación',
        'Delete invoker' => 'Borrar Invocador',
        'Clone webservice' => 'Clonar servicio web',
        'Import webservice' => 'Importar servicio web',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => 'Historico Configuración InterfazGenerica para Servicio Web %s',
        'Go back to Web Service' => 'Volver al Servicio Web',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Aquí puedes ver versiones anteriores de la configuración del servicio web actual, exportarlo o incluso restaurarlos.',
        'Configuration History List' => 'Lista Histórico Configuración',
        'Version' => 'Versión',
        'Create time' => 'Crear tiempo',
        'Select a single configuration version to see its details.' => 'Seleccione una única versión de configuración para ver sus detalles.',
        'Export web service configuration' => 'Exportar configuración de servicio web',
        'Restore web service configuration' => 'Restaurar configuración de servicio web',
        'Do you really want to restore this version of the web service configuration?' =>
            '¿Realmente desea restablecer esta versión de la configuración del servicio web?',
        'Your current web service configuration will be overwritten.' => 'Tu configuración del servicio web va a ser sobreescrito.',
        'Restore' => 'Restaurar',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'ATENCIÓN: Cuando cambia el nombre del grupo \'admin\', antes de realizar los cambios apropiados en SysConfig, ¡bloqueará el panel de administración! Si esto sucediera, por favor vuelva a renombrar el grupo para administrar por declaración SQL.',
        'Group Management' => 'Administración de grupos',
        'Add group' => 'Agregar grupo',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'El grupo admin es para usar el área de administración y el grupo stats para usar el área estadisticas.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Crear nuevos grupos para manejar permisos de acceso para diferentes grupos de agente (ej. departamento compras, departamento soporte, departamento ventas, ...).',
        'It\'s useful for ASP solutions. ' => 'Es útil para soluciones ASP.',
        'total' => 'Total',
        'Add Group' => 'Añadir Grupo',
        'Edit Group' => 'Editar grupo',

        # Template: AdminLog
        'System Log' => 'Registro del sistema',
        'Here you will find log information about your system.' => 'Aquí encontrará información de registro sobre su sistema.',
        'Hide this message' => 'Ocultar este mensaje',
        'Recent Log Entries' => 'Entradas recientes del registro',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Gestión de Cuentas de Correo',
        'Add mail account' => 'Agregar cuenta de correo',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            '¡Todos los correos entrantes con una cuenta serán enviados a la cola seleccionada!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Si su cuenta está validada, ¡las cabeceras X-OTRS ya existentes en la llegada se utilizarán para la prioridad! El filtro Postmaster se usa de todas formas.',
        'Delete account' => 'Eliminar cuenta',
        'Fetch mail' => 'Traer correos',
        'Add Mail Account' => 'Agregar Cuenta de Correo',
        'Example: mail.example.com' => 'Ejemplo: mail.ejemplo.com',
        'IMAP Folder' => 'Carpeta IMAP',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Modifique esto solo si necesita obtener correos de un directorio distinto a INBOX',
        'Trusted' => 'Validado',
        'Dispatching' => 'Remitiendo',
        'Edit Mail Account' => 'Editar Cuenta de Correo',

        # Template: AdminNavigationBar
        'Admin' => 'Admin',
        'Agent Management' => 'Gestión de agentes',
        'Queue Settings' => 'Ajustes de las colas',
        'Ticket Settings' => 'Ajustes de los tickets',
        'System Administration' => 'Administración del sistema',
        'Online Admin Manual' => 'Manual de Administración Online',

        # Template: AdminNotificationEvent
        'Ticket Notification Management' => 'Gestión Notificación de Ticket',
        'Add notification' => 'Agregar notificación',
        'Export Notifications' => 'Exportar Notificaciones',
        'Configuration Import' => 'Configuración Importaciones',
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            'Aquí puede cargar un archivo de configuración para importar Notificaciones de Ticket a su sistema. El archivo debe estar en formato .yml como exportados por el módulo de Notificación de Ticket.',
        'Overwrite existing notifications?' => 'Sobrescribir notificaciones existentes?',
        'Upload Notification configuration' => 'Cargar configuración Notificación',
        'Import Notification configuration' => 'Importar configuración Notificación',
        'Delete this notification' => 'Eliminar esta notificación',
        'Do you really want to delete this notification?' => '¿Realmente desea eliminar esta notificación?',
        'Add Notification' => 'Agregar Notificación',
        'Edit Notification' => 'Editar Notificación',
        'Show in agent preferences' => 'Mostrar en preferencias de agente',
        'Agent preferences tooltip' => 'Preferencias de ayuda de agente',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'Este mensaje se mostrará en la pantalla de preferencias de los agentes como un texto de ayuda para esta notificación.',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'Aquí se puede elegir qué eventos dispararán esta notificación. Un filtro de ticket adicional se puede aplicar a continuación para enviar sólo para ticket con ciertos criterios.',
        'Ticket Filter' => 'Filtro de tickets',
        'Article Filter' => 'Filtro de artículos',
        'Only for ArticleCreate and ArticleSend event' => 'Solo para eventos de ArticleCreate y ArticleSend',
        'Article type' => 'Tipo de artículo',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'Si CrearArticulo o EnviarArticulo es usado como disparador de evento, necesitas especificar un filtro de articulo también. Por favor seleccione al menos uno de los campos de filtro de articulo.',
        'Article sender type' => 'Tipo de remitente de articulo',
        'Subject match' => 'Coincidencia de asunto',
        'Body match' => 'Coincidencia del cuerpo',
        'Include attachments to notification' => 'Incluir archivos adjuntos a la notificación',
        'Recipients' => 'Destinatarios',
        'Send to' => 'Enviar a',
        'Send to these agents' => 'Enviar a estos agentes',
        'Send to all group members' => 'Enviar a todos los miembros del grupo',
        'Send to all role members' => 'Enviar a todos los miembros del rol',
        'Send on out of office' => 'Enviar fuera de la oficina',
        'Also send if the user is currently out of office.' => 'También enviar si el usuario está actualmente fuera de la oficina.',
        'Once per day' => 'Una vez por día',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'Notificar al usuario sólo una vez al día acerca de un único ticket utilizando el transporte seleccionado.',
        'Notification Methods' => 'Métodos de Notificación',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'Estos son los posibles métodos que se pueden utilizar para enviar esta notificación a cada uno de los destinatarios. Por favor seleccione al menos un método en la sección inferior.',
        'Enable this notification method' => 'Habilitar este método de notificación',
        'Transport' => 'Transporte',
        'At least one method is needed per notification.' => 'Se necesita al menos un método por notificación',
        'Active by default in agent preferences' => 'Activo por defecto en preferencias de agente',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'Este es el valor por defecto para los agentes receptores asignados que no realizaron una elección para esta notificación aún en sus preferencias. Si la casilla está activada, la notificación será enviada a dichos agentes.',
        'This feature is currently not available.' => 'Esta característica no está disponible en este momento.',
        'No data found' => 'No se encontró ningún dato.',
        'No notification method found.' => 'No se encontró un método de notificación.',
        'Notification Text' => 'Texto de la Notificación',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'Este idioma no está presente o activado en el sistema. Esta notificación puede eliminarse si ya no es necesaria.',
        'Remove Notification Language' => 'Quitar el Idioma de la Notificación',
        'Message body' => 'Cuerpo del Mensaje',
        'Add new notification language' => 'Agregar un nuevo idioma de notificación',
        'Do you really want to delete this notification language?' => '¿Realmente desear eliminar este idioma de notificación?',
        'Tag Reference' => 'Etiqueta de Referencia',
        'Notifications are sent to an agent or a customer.' => 'Las notificaciones se envían a un agente o cliente',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Para obtener los primeros 20 caracters del Sujeto (del último artículo del agente).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Para obtener las primeras 5 líneas del cuerpo (del último artículo del agente).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Para obtener los primeros 20 caracters del Sujeto (del último artículo del cliente).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Para obtener las primeras 5 líneas del cuerpo (del último artículo del cliente).',
        'Attributes of the current customer user data' => 'Atributos de los datos actuales del usuario cliente',
        'Attributes of the current ticket owner user data' => 'Atributos de los datos del propietario actual del ticket',
        'Attributes of the current ticket responsible user data' => 'Atributos de los datos actuales del responsable del ticket',
        'Attributes of the current agent user who requested this action' =>
            'Atributos del actual usuario agente que solicitó esta acción.',
        'Attributes of the recipient user for the notification' => 'Atributos del usuario destinatario para la notificación.',
        'Attributes of the ticket data' => 'Atributos de los datos del ticket',
        'Ticket dynamic fields internal key values' => 'Valores de las claves internas de los campos dinámicos de los tickets',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Valores mostrados de los campos  dinámicos de los tickets, útil para los campos desplegables y de selección múltiple',
        'Example notification' => 'Notificación de ejemplo',

        # Template: AdminNotificationEventTransportEmailSettings
        'Additional recipient email addresses' => 'Direcciones adicionales del destinatario de correo electrónico.',
        'You can use OTRS-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            'Puede usar los OTRS-tags como <OTRS_TICKET_DynamicField_...> para insertar los valores desde su Ticket actual.',
        'Notification article type' => 'Notificación de tipo',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'Un artículo será creado si la notificación es enviada al cliente o a una dirección de correo adicional.',
        'Email template' => 'Plantilla de correo',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'Use esta plantilla para generar el email completo (sólo para emails HTML).',
        'Enable email security' => 'Habilitar seguridad de email',
        'Email security level' => 'Nivel de seguridad del email',
        'If signing key/certificate is missing' => 'Si la clave/certificado no está',
        'If encryption key/certificate is missing' => 'Si la llave/certificado de cifrado no está',

        # Template: AdminOTRSBusinessInstalled
        'Manage %s' => 'Administrar %s',
        'Downgrade to OTRS Free' => 'Degradar a OTRS Gratis',
        'Read documentation' => 'Leer documentación',
        '%s makes contact regularly with cloud.otrs.com to check on available updates and the validity of the underlying contract.' =>
            '%s hace contacto regular con cloud.otrs.com para comprobar actualizaciones disponibles y la validez del contrato subyacente.',
        'Unauthorized Usage Detected' => 'Detectado Uso No Autorizado',
        'This system uses the %s without a proper license! Please make contact with %s to renew or activate your contract!' =>
            'Este sistema usa el %s sin la licencia apropiada! por favor contacte con %s para renovar o activar tu contrato!',
        '%s not Correctly Installed' => '%s no esta Correctamente Instalado',
        'Your %s is not correctly installed. Please reinstall it with the button below.' =>
            'Su %s no esta correctamente instalado. Por favor reinstale con el botón de abajo',
        'Reinstall %s' => 'Reinstalar %s',
        'Your %s is not correctly installed, and there is also an update available.' =>
            'Tu %s no está correctamente instalado, y hay también disponible una actualización.',
        'You can either reinstall your current version or perform an update with the buttons below (update recommended).' =>
            'Puedes o bien reinstalar tu versión actual o realizar una actualización con los botones siguientes (recomendada actualización).',
        'Update %s' => 'Actualización %s',
        '%s Not Yet Available' => '%s No Está Aún Dsiponible',
        '%s will be available soon.' => '%s estará disponible pronto.',
        '%s Update Available' => '%s Actualización Disponible',
        'An update for your %s is available! Please update at your earliest!' =>
            'Una actualización para tu %s está disponible! Por favor actualice cuanto antes!',
        '%s Correctly Deployed' => '%s Desplegado correctamente',
        'Congratulations, your %s is correctly installed and up to date!' =>
            'Felicitaciones, su %s está instalado y actualizado correctamente.',

        # Template: AdminOTRSBusinessNotInstalled
        '%s will be available soon. Please check again in a few days.' =>
            '%s estará disponible pronto. Por favor, puedes volver a intentarlo dentro de unos días .',
        'Please have a look at %s for more information.' => 'Por favor, eche un vistazo a %s para más información.',
        'Your OTRS Free is the base for all future actions. Please register first before you continue with the upgrade process of %s!' =>
            'Su OTRS libre es la base para todas las acciones futuras. Por favor regístrese primero antes de continuar con el proceso de mejora de %s!',
        'Before you can benefit from %s, please contact %s to get your %s contract.' =>
            'Antes de que pueda beneficiarse de %s , por favor póngase en contacto con %s para obtener su contrato de %s.',
        'Connection to cloud.otrs.com via HTTPS couldn\'t be established. Please make sure that your OTRS can connect to cloud.otrs.com via port 443.' =>
            'Conexión a cloud.otrs.com a través de HTTPS no se pudo establecer . Por favor, asegúrese de que su OTRS puede conectarse a través del puerto 443 cloud.otrs.com.',
        'With your existing contract you can only use a small part of the %s.' =>
            'Con su contrato existente sólo se puede utilizar una pequeña parte de la %s.',
        'If you would like to take full advantage of the %s get your contract upgraded now! Contact %s.' =>
            'Si quieres sacar el máximo provecho de la  %s consiga su mejora de contrato ahora! Contacte %s.',

        # Template: AdminOTRSBusinessUninstall
        'Cancel downgrade and go back' => 'Cancelar el degrado y regresar',
        'Go to OTRS Package Manager' => 'Ir al Manejador de Paquetes de OTRS',
        'Sorry, but currently you can\'t downgrade due to the following packages which depend on %s:' =>
            'Lo sentimos , pero actualmente no se puede degradar debido a los siguientes paquetes que dependen de %s:',
        'Vendor' => 'Vendedor',
        'Please uninstall the packages first using the package manager and try again.' =>
            'Por favor, desinstale los paquetes primero utilizando el gestor de paquetes y vuelva a intentarlo .',
        'You are about to downgrade to OTRS Free and will lose the following features and all data related to these:' =>
            'Vas a degradar a OTRS gratuito y perderá las siguientes características y todos los datos relacionados con los siguientes:',
        'Chat' => 'Chat',
        'Report Generator' => 'Generador de Reportes',
        'Timeline view in ticket zoom' => 'Vista LineaTiempo en ticket zoom',
        'DynamicField ContactWithData' => 'CampoDinamico ContactoConDatos',
        'DynamicField Database' => 'CampoDinamico BaseDatos',
        'SLA Selection Dialog' => 'ANS Dialogo Selección',
        'Ticket Attachment View' => 'Vista Adjuntos Ticket',
        'The %s skin' => 'La apariencia %s',

        # Template: AdminPGP
        'PGP Management' => 'Administración PGP',
        'PGP support is disabled' => 'El soporte de PGP se encuentra deshabilitado',
        'To be able to use PGP in OTRS, you have to enable it first.' => 'Para poder usar PGP en OTRS, deberá habilitarlo primero.',
        'Enable PGP support' => 'Habilitar el soporte de PGP',
        'Faulty PGP configuration' => 'Configuración PGP errónea',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'El soporte PGP está habilitado, pero la configuración relevante contiene errores. Porfavor compruebe la configuración usando el botón de abajo.',
        'Configure it here!' => 'Configuralo aquí!',
        'Check PGP configuration' => 'Comprobar la configuración PGP',
        'Add PGP key' => 'Agregar Clave PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'De esta forma puede editar directamente el anillo de Claves configurado en Sysconfig',
        'Introduction to PGP' => 'Introducción a PGP',
        'Result' => 'Resultado',
        'Identifier' => 'Identificador',
        'Bit' => 'Bit',
        'Fingerprint' => 'Huella',
        'Expires' => 'Expira',
        'Delete this key' => 'Borrar esta clave',
        'Add PGP Key' => 'Agregar Clave PGP',
        'PGP key' => 'Clave PGP',

        # Template: AdminPackageManager
        'Package Manager' => 'Gestor de paquetes',
        'Uninstall package' => 'Desinstalar paquete',
        'Do you really want to uninstall this package?' => '¿Realmente desea desinstalar este paquete?',
        'Reinstall package' => 'Reinstalar paquete',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            '¿Realmente desea reinstalar este paquete? Se perderá cualquier cambio manual.',
        'Continue' => 'Continuar',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Por favor asegúrese de que su base de datos acepta paquetes mayores a % MB en tamaño (actualmente sólo acepta paquetes hasta % MB). Por favor adapte la configuración max_allowed_packet de su base de datos para prevenir errores.',
        'Install' => 'Instalar',
        'Install Package' => 'Instalar Paquete',
        'Update repository information' => 'Actualizar información de repositorio',
        'Cloud services are currently disabled.' => 'Los servicios en la nube se encuentran dehabilitados.',
        'OTRS Verify™ can not continue!' => '¡OTRS Verify™ no puede continuar!',
        'Enable cloud services' => 'Habilitar servicios en la Nube',
        'Online Repository' => 'Repositorio en línea',
        'Module documentation' => 'Módulo de documentación',
        'Upgrade' => 'Actualizar',
        'Local Repository' => 'Repositorio Local',
        'This package is verified by OTRSverify (tm)' => 'Este paquete está verificado por OTRSverify (tm)',
        'Uninstall' => 'Desinstalar',
        'Reinstall' => 'Reinstalar',
        'Features for %s customers only' => 'Características sólo para clientes %s',
        'With %s, you can benefit from the following optional features. Please make contact with %s if you need more information.' =>
            'Con %s , usted puede beneficiarse de las siguientes características opcionales. Por favor contacte con %s si necesita más información.',
        'Download package' => 'Descargar paquete',
        'Rebuild package' => 'Reconstruir paquete',
        'Metadata' => 'Metadatos',
        'Change Log' => 'Cambio de Log',
        'Date' => 'Fecha',
        'List of Files' => 'Lista de Archivos',
        'Permission' => 'Permisos',
        'Download' => 'Descargar',
        'Download file from package!' => '¡Descargar fichero del paquete!',
        'Required' => 'Obligatorio',
        'Primary Key' => 'Clave principal',
        'Auto Increment' => 'Auto Incremento',
        'SQL' => 'Límite',
        'File differences for file %s' => 'Diferencias de archivo para el archivo %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Trazas de rendimiento',
        'This feature is enabled!' => '¡Esta característica está habilitada!',
        'Just use this feature if you want to log each request.' => 'Use esta característica sólo si desea registrar cada petición.',
        'Activating this feature might affect your system performance!' =>
            '¡Activar esta opción podría afectar el rendimiento de su sistema!',
        'Disable it here!' => '¡Deshabilítelo aquí!',
        'Logfile too large!' => '¡Archivo de trazas muy grande!',
        'The logfile is too large, you need to reset it' => 'El archivolog es demasiado grande , es necesario reiniciarlo',
        'Overview' => 'Resumen',
        'Range' => 'Rango',
        'last' => 'último',
        'Interface' => 'Interfaz',
        'Requests' => 'Solicitudes',
        'Min Response' => 'Respuesta Mínima',
        'Max Response' => 'Respuesta Máxima',
        'Average Response' => 'Respuesta Promedio',
        'Period' => 'Periodo',
        'Min' => 'Min',
        'Max' => 'Max',
        'Average' => 'Promedio',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Gestión del filtro maestro',
        'Add filter' => 'Agregar filtro',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Para enviar o filtrar los correos electrónicos entrantes basados ​​en encabezados de correo electrónico . La coincidencia usando Expresiones Regulares también es posible.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Si desea chequear sólo la dirección del email, use EMAILADDRESS:info@example.com en De, Para o Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Si utiliza Expresiones Regulares , también puede utilizar el valor emparejado en () como [***] en la acción \'Set\' .',
        'Delete this filter' => 'Borrar este filtro',
        'Do you really want to delete this filter?' => '¿Realmente desea eliminar este filtro?',
        'Add PostMaster Filter' => 'Añada Filtro PostMaster',
        'Edit PostMaster Filter' => 'Esite Filtro PostMaster',
        'The name is required.' => 'El nombre es imprescindible.',
        'Filter Condition' => 'Condición Filtro',
        'AND Condition' => 'Condición AND',
        'Check email header' => 'Comprobar encabezado email',
        'Negate' => 'Negar',
        'Look for value' => 'Busque valor',
        'The field needs to be a valid regular expression or a literal word.' =>
            'El campo tiene que ser una expresión regular válida o una palabra literal.',
        'Set Email Headers' => 'Establecer Encabezados de Email',
        'Set email header' => 'Establecer encabezado de Email',
        'Set value' => 'Establecer valor',
        'The field needs to be a literal word.' => 'El campo tiene que ser una palabra literal.',

        # Template: AdminPriority
        'Priority Management' => 'Gestión de prioridades',
        'Add priority' => 'Añadir prioridad',
        'Add Priority' => 'Añadir prioridad',
        'Edit Priority' => 'Editar la prioridad',

        # Template: AdminProcessManagement
        'Process Management' => 'Gestión de Procesos',
        'Filter for Processes' => 'Filtro para Procesos',
        'Create New Process' => 'Crear nuevo proceso',
        'Deploy All Processes' => 'Desplegar todos los Procesos',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Aquí puede cargar un archivo de configuración para importar un proceso a su sistema. El archivo debe estar en formato .yml como exportado por el módulo de gestión de procesos.',
        'Overwrite existing entities' => 'Sobrescribir entidades existentes',
        'Upload process configuration' => 'Configuración del proceso Cargar',
        'Import process configuration' => 'Configuración del proceso de importación',
        'Ready-to-run Processes' => 'Procesos Listos para Ejecutar',
        'Here you can activate ready-to-run processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            'Aquí puede activar procesos listos para ejecutar que muestren nuestras mejores prácticas. Tenga en cuenta que puede ser necesaria alguna configuración adicional.',
        'Would you like to benefit from processes created by experts? Upgrade to %s to import some sophisticated ready-to-run processes.' =>
            '¿Te gustaría beneficiarse de los procesos creados por los expertos? Actualice a  %s para importar algunos procesos sofisticados listos para ejecutarse.',
        'Import ready-to-run process' => 'Importar procesos listos para ejecutar',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'Para crear un nuevo proceso puede importar un proceso que se exportó desde otro sistema o crear uno completamente nuevo.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'Los cambios en los procesos aquí sólo afectan al comportamiento del sistema , si sincroniza los datos del Proceso . Mediante la sincronización de los Procesos , los cambios recién hechos se escribirán en la Configuración.',
        'Processes' => 'Procesos',
        'Process name' => 'Nombre de proceso',
        'Print' => 'Imprimir',
        'Export Process Configuration' => 'Exportar Configuración de Procesos',
        'Copy Process' => 'Copiar Proceso',

        # Template: AdminProcessManagementActivity
        'Cancel & close' => 'Cancelar y cerrar',
        'Go Back' => 'Volver',
        'Please note, that changing this activity will affect the following processes' =>
            'Tenga en cuenta , que el cambio de esta actividad afectará a los siguientes procesos',
        'Activity' => 'Actividad',
        'Activity Name' => 'Nombre de Actividad',
        'Activity Dialogs' => 'Dialogos de Actividad',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Puede asignar Diálogos de Actividad a esta Actividad arrastrando los elementos con el ratón en la lista de la izquierda a la lista de la derecha .',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'Ordenar los elementos dentro de la lista también es posible mediante arrastrar y soltar .',
        'Filter available Activity Dialogs' => 'Filtros disponibles en Diálogos de Actividad ',
        'Available Activity Dialogs' => 'Dialogos Actividad Disponibles',
        'Name: %s, EntityID: %s' => 'Nombre: %s, IDdeEntidad: %s',
        'Create New Activity Dialog' => 'Cree Nueva Actividad de Diálogo',
        'Assigned Activity Dialogs' => 'Asignación de Diálogos Actividad',
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'Tan pronto como use este botón o enlace , saldrá de esta pantalla y su estado actual se guardará automáticamente. ¿Quieres continuar?',

        # Template: AdminProcessManagementActivityDialog
        'Please note that changing this activity dialog will affect the following activities' =>
            'Tenga en cuenta que el cambio de este diálogo de actividad afectará a las siguientes actividades',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'Tenga en cuenta que los usuarios clientes no serán capaces de ver o utilizar los siguientes campos : Propietario, Responsable, Bloqueo, TiempoEspera y IDCliente.',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'El campo Cola sólo puede ser usado por clientes cuando crean un nuevo ticket.',
        'Activity Dialog' => 'Diálogo Actividad',
        'Activity dialog Name' => 'Nombre diálogo actividad',
        'Available in' => 'Disponible en',
        'Description (short)' => 'Descripción (corta)',
        'Description (long)' => 'Descripción (larga)',
        'The selected permission does not exist.' => 'El permiso seleccionado no existe.',
        'Required Lock' => 'Bloqueo Requerido',
        'The selected required lock does not exist.' => 'El bloqueo requerido seleccionado no existe.',
        'Submit Advice Text' => 'Envíe Texto Aviso',
        'Submit Button Text' => 'Texto Botón Enviar',
        'Fields' => 'Campos',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'Puede asignar Campos a esta Diálogo de Actividad arrastrando los elementos con el ratón de la lista de la izquierda a la lista de la derecha .',
        'Filter available fields' => 'Campos de filtro disponibles',
        'Available Fields' => 'Campos disponibles',
        'Name: %s' => 'Nombre: %s',
        'Assigned Fields' => 'Campos Asignados',
        'ArticleType' => 'TipoArticulo',
        'Display' => 'Mostrar',
        'Edit Field Details' => 'Edite Detalles Campo',
        'Customer interface does not support internal article types.' => 'Interfaz de cliente no soporta tipos de artículo internos.',

        # Template: AdminProcessManagementPath
        'Path' => 'Ruta',
        'Edit this transition' => 'Edite esta transición',
        'Transition Actions' => 'Acciones Transición',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Puede asignar Acciones de Transición a esta Transición arrastrando los elementos con el ratón de la lista de la izquierda a la lista de la derecha .',
        'Filter available Transition Actions' => 'Filtros disponibles Acciones Transición',
        'Available Transition Actions' => 'Acciones Transición Disponibles',
        'Create New Transition Action' => 'Crear Nueva Acción Transición',
        'Assigned Transition Actions' => 'Acción Transición Asignada',

        # Template: AdminProcessManagementProcessAccordion
        'Activities' => 'Actividades',
        'Filter Activities...' => 'Filtrar Actividades...',
        'Create New Activity' => 'Crear Nueva Actividad',
        'Filter Activity Dialogs...' => 'Filtrar Diálogos Actividad...',
        'Transitions' => 'Transiciones',
        'Filter Transitions...' => 'Filtrar Transiciones...',
        'Create New Transition' => 'Crear Nueva Transición',
        'Filter Transition Actions...' => 'Filtrar Acciones Transición...',

        # Template: AdminProcessManagementProcessEdit
        'Edit Process' => 'Editar Porceso',
        'Print process information' => 'Imprimir información proceso',
        'Delete Process' => 'Borrar Proceso',
        'Delete Inactive Process' => 'Elimine Proceso Inactivo',
        'Available Process Elements' => 'Elementos Proceso Disponibles',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'Los elementos listado anteriormente en esta barra lateral se pueden mover a la zona canvas de la derecha usando arrastrar y soltar .',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'Puede emplazar las Actividades en el área canvas para asignar esta Actividad al Proceso.',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'Para asignar un Diálogo de Actividad a una Actividad suelte el elemento del Diálogo de Actividad de esta barra lateral sobre la Actividad situada en el área canvas.',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            'Puedes ejecutar la conexión entre dos "Actividades" por lanzando la "Transición" por encima de "Ejecutar la Actividad" de la conexión. Al hacerlo puedes mover el cabo suelto de la flecha al "Fin de Actividad".',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'Las Acciones pueden ser asignadas a una Transición soltando el Elemento de Acción sobre la etiqueta de la Transición.',
        'Edit Process Information' => 'Editar información de Proceso',
        'Process Name' => 'Nombre del Proceso',
        'The selected state does not exist.' => 'El estado seleccionado no existe.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Añada y Edite Actividades, Diálogos de Actividad y Transiciones.',
        'Show EntityIDs' => 'Mostrar IDsEntidad',
        'Extend the width of the Canvas' => 'Amplíe la anchura del Canvas',
        'Extend the height of the Canvas' => 'Amplíe la altura del Canvas',
        'Remove the Activity from this Process' => 'Elimine la Actividad de este Proceso',
        'Edit this Activity' => 'Edite esta Actividad',
        'Save Activities, Activity Dialogs and Transitions' => 'Guarde Actividades, Diálogos de Actividad y Transiciones',
        'Do you really want to delete this Process?' => '¿Realmente desea eliminar este Proceso?',
        'Do you really want to delete this Activity?' => '¿Realmente desea eliminar esta Actividad?',
        'Do you really want to delete this Activity Dialog?' => '¿Realmente desea eliminar  este Diálogo de Actividad?',
        'Do you really want to delete this Transition?' => '¿Realmente desea eliminar  esta Transición?',
        'Do you really want to delete this Transition Action?' => '¿Realmente desea eliminar esta Acción de Transición?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            '¿Realmente desea eliminar la actividad del canvas? Esto sólo puede ser deshecho abandonando esta pantalla sin guardar.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            '¿Realmente desea eliminar esta transición del canvas? Esto sólo puede ser deshecho abandonando esta pantalla sin guardar.',
        'Hide EntityIDs' => 'Ocultar IDsEntidad',
        'Delete Entity' => 'Borrar Entidad',
        'Remove Entity from canvas' => 'Eliminar Entidad de canvas',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Esta Actividad ya está siendo utilizada en el Proceso. No puede añadirla por duplicado!',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'Esta Actividad no se puede borrar porque es la Actividad de Inicio.',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Esta Transición ya esta siendo utilizada para esta Actividad. No puede usarla por duplicado!',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'Esta AcciónTransición ya esta siendo utilizada en esta Ruta. No puede usarla por duplicado!',
        'Remove the Transition from this Process' => 'Elimine la Transición de este Proceso',
        'No TransitionActions assigned.' => 'No AccionesTransición asignadas.',
        'The Start Event cannot loose the Start Transition!' => 'El Evento de Inicio no puede perder la Transición de Inicio!',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'No se han asignado aún diálogos. Simplemente escoja un diálogo de actividad de la lista de la izquierda y arrástrela aquí.',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            'Una transición no conectada ya está colocada en el canvas. Por favor, conecte esta transición primero antes de hacer otra transición .',

        # Template: AdminProcessManagementProcessNew
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'En esta pantalla, puede crear un nuevo proceso . Con el fin de hacer que el nuevo proceso esté a disposición de los usuarios , por favor asegúrese de ajustar su estado a \'Activa\' y sincronizar después de completar su trabajo.',

        # Template: AdminProcessManagementProcessPrint
        'cancel & close' => 'cancelar y cerrar',
        'Start Activity' => 'Comenzar Actividad',
        'Contains %s dialog(s)' => 'Contiene %s diálogo(s)',
        'Assigned dialogs' => 'Diálogos asignados',
        'Activities are not being used in this process.' => 'Actividades no están siendo usadas en este proceso.',
        'Assigned fields' => 'Campos asignados',
        'Activity dialogs are not being used in this process.' => 'Diálogos de actividad no están siendo usados en este proceso.',
        'Condition linking' => 'Condición de vinculación',
        'Conditions' => 'Condiciones',
        'Condition' => 'Condición',
        'Transitions are not being used in this process.' => 'Transiciones no están siendo usadas en este proceso.',
        'Module name' => 'Nombre del Módulo',
        'Transition actions are not being used in this process.' => 'Acciones de transición no están siendo usadas en este proceso.',

        # Template: AdminProcessManagementTransition
        'Please note that changing this transition will affect the following processes' =>
            'Tenga en cuenta que el cambio de esta transición afectará a los siguientes procesos',
        'Transition' => 'Transición',
        'Transition Name' => 'Nombre de la Transición',
        'Conditions can only operate on non-empty fields.' => 'Condiciones sólo pueden operar en campos no vacíos.',
        'Type of Linking between Conditions' => 'Tipo de Vinculación entre Condiciones',
        'Remove this Condition' => 'Eliminar esta Condición',
        'Type of Linking' => 'Tipo de Vinculación',
        'Add a new Field' => 'Añadir nuevo Campo',
        'Remove this Field' => 'Eliminar este Campo',
        'And can\'t be repeated on the same condition.' => 'Y no puede ser repetida en la misma condición.',
        'Add New Condition' => 'Añadir Nueva Condición',

        # Template: AdminProcessManagementTransitionAction
        'Please note that changing this transition action will affect the following processes' =>
            'Tenga en cuenta que el cambio de esta acción de transición afectará a los siguientes procesos',
        'Transition Action' => 'Acción de Transición',
        'Transition Action Name' => 'Nombre Acción de Transición',
        'Transition Action Module' => 'Módulo Acción de Transición',
        'Config Parameters' => 'Parámetros de Configuración',
        'Add a new Parameter' => 'Añada un nuevo Parámetro',
        'Remove this Parameter' => 'Elimine este Parámetro',

        # Template: AdminQueue
        'Manage Queues' => 'Gestionar las colas',
        'Add queue' => 'Añadir cola',
        'Add Queue' => 'Añadir cola',
        'Edit Queue' => 'Editar la cola',
        'A queue with this name already exists!' => '¡Una cola con este nombre ya existe!',
        'Sub-queue of' => 'Subcola de',
        'Unlock timeout' => 'Tiempo para desbloqueo automático',
        '0 = no unlock' => '0 = sin desbloqueo',
        'Only business hours are counted.' => 'Sólo se contarán las horas de trabajo',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Si un agente bloquea un ticket y no se cierra antes de que haya pasado el tiempo de espera de desbloqueo, el ticket se desbloqueará y estará disponible para otros agentes .',
        'Notify by' => 'Notificado por',
        '0 = no escalation' => '0 = sin escalada',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Si no se añade un contacto de cliente, ya sea correo electrónico externo o teléfono, a un nuevo ticket antes de que la hora definida aquí expire, el ticket es escalado.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Si se añade un artículo, como un seguimiento a través de correo electrónico o portal del cliente , el tiempo para escalada por actualización se restablece. Si no hay contacto del cliente, ya sea correo electrónico o teléfono externo, añadido a un ticket antes de que la hora definida aquí expire, el ticket escala.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Si el ticket no se establece a cerrado antes de que la hora definida aquí expire, el ticket es escalado.',
        'Follow up Option' => 'Opción de seguimiento',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Especifica si el seguimiento a los tickets cerrados volvería a abrir el ticket , ser rechazado o dar lugar a un nuevo ticket.',
        'Ticket lock after a follow up' => 'Bloquear un ticket después del seguimiento',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Si un ticket es cerrado y el cliente envía un seguimiento del ticket se bloqueará al antiguo propietario.',
        'System address' => 'Dirección del sistema',
        'Will be the sender address of this queue for email answers.' => 'Será la dirección del emisor en esta cola para respuestas por correo.',
        'Default sign key' => 'Clave de firma por defecto',
        'The salutation for email answers.' => 'Saludo para respuestas por correo.',
        'The signature for email answers.' => 'Firma para respuestas por correo.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Administrar Colas - Relaciones Auto Respuesta  ',
        'This filter allow you to show queues without auto responses' => 'Este filtro te permite ver colas sin respuestas automáticas',
        'Queues without auto responses' => 'Colas sin respuestas automáticas',
        'This filter allow you to show all queues' => 'Este filtro te permite ver todas las colas',
        'Show all queues' => 'Mostrar todas las colas',
        'Filter for Queues' => 'Filtrar por Colas',
        'Filter for Auto Responses' => 'Filtrar por Auto Respuestas',
        'Auto Responses' => 'Respuestas Automáticas',
        'Change Auto Response Relations for Queue' => 'Cambiar Relaciones Auto Respuesta para Cola',

        # Template: AdminQueueTemplates
        'Manage Template-Queue Relations' => 'Administrar Relaciones Plantilla-Cola',
        'Filter for Templates' => 'Filtrar por Plantillas',
        'Templates' => 'Plantillas',
        'Change Queue Relations for Template' => 'Cambiar Relaciones Cola para Plantilla',
        'Change Template Relations for Queue' => 'Cambiar Relaciones Plantilla para Cola',

        # Template: AdminRegistration
        'System Registration Management' => 'Gestión de Registro del sistema',
        'Edit details' => 'Edite detalles',
        'Show transmitted data' => 'Mostrar datos transmitidos',
        'Deregister system' => 'Dar de baja sistema',
        'Overview of registered systems' => 'Vista general de sistemas registrados',
        'This system is registered with OTRS Group.' => 'Este sistema se encuentra registrado por OTRS Group.',
        'System type' => 'Tipo de sistema',
        'Unique ID' => 'Identificador unica',
        'Last communication with registration server' => 'Última comunicación con el servidor de registro',
        'System registration not possible' => 'Registrar el sistema no es posible',
        'Please note that you can\'t register your system if OTRS Daemon is not running correctly!' =>
            'Tenga en cuenta que no se puede registrar su sistema si OTRS Daemon no está funcionando correctamente!',
        'Instructions' => 'Instrucciones',
        'System deregistration not possible' => 'Dar de baja el sistema no es posible',
        'Please note that you can\'t deregister your system if you\'re using the %s or having a valid service contract.' =>
            'Tenga en cuenta que no se puede dar de baja su sistema si usted está utilizando el %s o teniendo un contrato de servicio válido.',
        'OTRS-ID Login' => 'Inicio de sesión con OTRS-ID',
        'Read more' => 'Leer más',
        'You need to log in with your OTRS-ID to register your system.' =>
            'Debe iniciar sesión con su OTRS-ID para registrar el sistema.',
        'Your OTRS-ID is the email address you used to sign up on the OTRS.com webpage.' =>
            'Su OTRS-ID es la dirección de correo electrónico que utilizó para registrarse en la página web OTRS.com',
        'Data Protection' => 'Protección de Datos',
        'What are the advantages of system registration?' => '¿Cuáles son las ventajas de registrar su sistema?',
        'You will receive updates about relevant security releases.' => 'Usted recibirá actualizaciones sobre versiones de seguridad importantes.',
        'With your system registration we can improve our services for you, because we have all relevant information available.' =>
            'Con el registro de su sistema podremos mejorar nuestros servicios hacia usted, porque tenemos disponible toda la información importante.',
        'This is only the beginning!' => '¡Este es sólo el comienzo!',
        'We will inform you about our new services and offerings soon.' =>
            'Muy pronto le estaremos informando sobre nuevos servicios y ofertas',
        'Can I use OTRS without being registered?' => '¿Es posible utilizar OTRS sin registrarlo?',
        'System registration is optional.' => 'El registro del sistema es opcional.',
        'You can download and use OTRS without being registered.' => 'Usted puede descargar y utilizar OTRS sin estar registrado.',
        'Is it possible to deregister?' => '¿Es posible dar de baja el registro?',
        'You can deregister at any time.' => 'Usted puede dar de baja el registro en cualquier momento.',
        'Which data is transfered when registering?' => '¿Qué datos se transfieren al registrarse?',
        'A registered system sends the following data to OTRS Group:' => 'Un sistema registrado envía los siguientes datos al grupo OTRS:',
        'Fully Qualified Domain Name (FQDN), OTRS version, Database, Operating System and Perl version.' =>
            'Nombre de dominio totalmente calificado (FQDN), versión de OTRS, base de datos, sistema operativo y versión de Perl.',
        'Why do I have to provide a description for my system?' => '¿Por qué debo proporcionar una descripción para mi sistema?',
        'The description of the system is optional.' => 'La descripción del sistema es opcional.',
        'The description and system type you specify help you to identify and manage the details of your registered systems.' =>
            'La descripción y el tipo de sistema que especifique ayudara para identificar y gestionar los datos de sus sistemas registrados',
        'How often does my OTRS system send updates?' => '¿Con qué frecuencia mi sistema OTRS envía actualizaciones?',
        'Your system will send updates to the registration server at regular intervals.' =>
            'Su sistema enviará actualizaciones al servidor de registro a intervalos regulares.',
        'Typically this would be around once every three days.' => 'Normalmente, esto sería alrededor de una vez cada tres días.',
        'In case you would have further questions we would be glad to answer them.' =>
            'En caso de que tenga alguna duda estaremos encantados de responderla.',
        'Please visit our' => 'Por favor, visite nuestro',
        'portal' => 'portal',
        'and file a request.' => 'e ingrese una solicitud.',
        'If you deregister your system, you will lose these benefits:' =>
            'Si da de baja su sistema, perderá estos beneficios :',
        'You need to log in with your OTRS-ID to deregister your system.' =>
            'Debe iniciar sesión con su OTRS-ID para dar de baja su sistema.',
        'OTRS-ID' => 'OTRS-ID',
        'You don\'t have an OTRS-ID yet?' => '¿Aún no tiene su OTRS-ID?',
        'Sign up now' => 'Regístrese ahora',
        'Forgot your password?' => '¿Olvidó su contraseña?',
        'Retrieve a new one' => 'Solicitar una nueva',
        'This data will be frequently transferred to OTRS Group when you register this system.' =>
            'Estos datos se transferiran con frecuencia al grupo OTRS cuando registre este sistema.',
        'Attribute' => 'Atributo',
        'FQDN' => 'Nombre de dominio totalmente calificado',
        'OTRS Version' => 'Versión De OTRS',
        'Operating System' => 'Sistema Operativo',
        'Perl Version' => 'Versión de Perl',
        'Optional description of this system.' => 'Descripción opcional de este sistema.',
        'Register' => 'Registrar',
        'Deregister System' => 'Sistema dado de baja',
        'Continuing with this step will deregister the system from OTRS Group.' =>
            'Continuando con este paso se dará de baja el sistema para el grupo OTRS.',
        'Deregister' => 'Dar de baja',
        'You can modify registration settings here.' => 'Usted puede modificar los ajustes de registro aquí.',
        'Overview of transmitted data' => 'Resumen de los datos transmitidos',
        'There is no data regularly sent from your system to %s.' => 'No hay datos enviados con regularidad de su sistema a %s.',
        'The following data is sent at minimum every 3 days from your system to %s.' =>
            'Los siguientes datos se envían como mínimo cada 3 días desde su sistema a %s.',
        'The data will be transferred in JSON format via a secure https connection.' =>
            'Los datos se transfieren en formato JSON a través de una conexión segura https.',
        'System Registration Data' => 'Datos Registro Sistema',
        'Support Data' => 'Datos de Soporte',

        # Template: AdminRole
        'Role Management' => 'Gestión de Roles',
        'Add role' => 'Agregar rol',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Cree un rol y coloque grupos en el mismo. Luego añada el rol a los usuarios.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'No hay roles definidos. Por favor use el botón \'\'Agregar" para crear un nuevo rol.',
        'Add Role' => 'Añadir Rol',
        'Edit Role' => 'Editar Rol',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Gestionar las relaciones Rol - Grupo',
        'Filter for Roles' => 'Filtro por Roles',
        'Roles' => 'Roles',
        'Select the role:group permissions.' => 'Seleccione los permisos rol:grupo',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Si nada es seleccionado, entonces no hay permisos en este grupo (los tickets no estarán disponibles para el Rol)',
        'Change Role Relations for Group' => 'Cambiar las relaciones de Rol del Grupo',
        'Change Group Relations for Role' => 'Cambiar las relaciones de Grupo del Rol',
        'Toggle %s permission for all' => 'Activar el permiso %s para todos',
        'move_into' => 'mover_a',
        'Permissions to move tickets into this group/queue.' => 'Permiso para mover tickets a este grupo/cola',
        'create' => 'crear',
        'Permissions to create tickets in this group/queue.' => 'Permiso para crear tickets en este grupo/cola',
        'note' => 'nota',
        'Permissions to add notes to tickets in this group/queue.' => 'Permisos para añadir notas a los tickets de este grupo/cola.',
        'owner' => 'propietario',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Permisos para cambiar el propietario de los tickets de este grupo/cola.',
        'priority' => 'prioridad',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Permiso para cambiar la prioridad del ticket en este grupo/cola',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Gestionar las relaciones Agente - Rol',
        'Add agent' => 'Añadir agente',
        'Filter for Agents' => 'Filtrar por Agentes',
        'Agents' => 'Agentes',
        'Manage Role-Agent Relations' => 'Gestionar las relaciones Rol - Agente',
        'Change Role Relations for Agent' => 'Cambiar las relaciones de Rol del Agente',
        'Change Agent Relations for Role' => 'Cambiar las relaciones de Agente del Rol',

        # Template: AdminSLA
        'SLA Management' => 'Gestión de SLA',
        'Add SLA' => 'Añadir SLA',
        'Edit SLA' => 'Editar el SLA',
        'Please write only numbers!' => 'Introduzca sólo números.',

        # Template: AdminSMIME
        'S/MIME Management' => 'Gestion S/MIME',
        'SMIME support is disabled' => 'el soporte para SMIME esta deshabilitado',
        'To be able to use SMIME in OTRS, you have to enable it first.' =>
            'Para poder usar SMIME en OTRS, necesitas habilitarlo antes.',
        'Enable SMIME support' => 'Habilitar soporte SMIME',
        'Faulty SMIME configuration' => 'Configuración SMIME errónea',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'El soporte SMIME está habilitado, pero la configuración relevante contiene errores. Porfavor compruebe la configuración usando el botón de abajo.',
        'Check SMIME configuration' => 'Comprueba la configuración de SMIME',
        'Add certificate' => 'Añadir certificado',
        'Add private key' => 'Añadir clave privada',
        'Filter for certificates' => 'Filtro para certificados',
        'Filter for S/MIME certs' => 'Filtro para certificados S/MIME',
        'To show certificate details click on a certificate icon.' => 'Para mostrar los detalles de certificado hacer click en un icono de certificado.',
        'To manage private certificate relations click on a private key icon.' =>
            'Para gestionar las relaciones de certificados privados hacer clic en un icono de la llave privada.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'Aquí usted puede agregar relaciones con su certificado privado, estos serán incorporados a la firma S/MIME cada vez que se utiliza este certificado para firmar un correo electrónico.',
        'See also' => 'Vea también',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'De esta forma Ud. puede editar directamente la certificación y claves privadas en el sistema de ficheros.',
        'Hash' => 'De esta forma Ud. puede editar directamente la certificación y claves privadas en el sistema de ficheros.',
        'Handle related certificates' => 'Maneje certificados relacionados',
        'Read certificate' => 'Leer certificado',
        'Delete this certificate' => 'Eliminar este certificado',
        'Add Certificate' => 'Añadir un certificado',
        'Add Private Key' => 'Añadir una Clave privada',
        'Secret' => 'Secreto',
        'Related Certificates for' => 'Certificados relacionados para',
        'Delete this relation' => 'Eliminar esta relación',
        'Available Certificates' => 'Certificados Disponibles',
        'Relate this certificate' => 'Relacionar este certificado',

        # Template: AdminSMIMECertRead
        'Close dialog' => 'Cerrar dialogo',
        'Certificate details' => 'Detalles del Certificado',

        # Template: AdminSalutation
        'Salutation Management' => 'Gestión de saludos',
        'Add salutation' => 'Añadir saludo',
        'Add Salutation' => 'Añadir saludo',
        'Edit Salutation' => 'Editar el saludo',
        'e. g.' => 'ej.',
        'Example salutation' => 'Saludo de ejemplo',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => '¡Es necesario habilitar modo seguro!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'El Modo Seguro (normalmente) queda habilitado cuando la instalación inicial se completa.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Si el modo seguro no está activado , activarlo a través de sysconfig porque su aplicación ya se está ejecutando .',

        # Template: AdminSelectBox
        'SQL Box' => 'Consola SQL',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'Aquí puede introducir una SQL para enviarla directamente a la base de datos de la aplicación. No es posible cambiar el contenido de las tablas , sólo consultas select están permitidas.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Aquí puede introducir una SQL para enviarla directamente a la base de datos de la aplicación.',
        'Only select queries are allowed.' => 'Solo consultas select están permitidas.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'La sintaxis de tu consulta SQL tiene un error. Por favor compruébela.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Hay por lo menos un parámetro que falta para la unión. Compruébelo por favor.',
        'Result format' => 'Formato resultado',
        'Run Query' => 'Ejecutar Consulta',
        'Query is executed.' => 'Consulta se ejecuta.',

        # Template: AdminService
        'Service Management' => 'Gestión de servicios',
        'Add service' => 'Añadir servicio',
        'Add Service' => 'Añadir servicio',
        'Edit Service' => 'Editar el servicio',
        'Sub-service of' => 'Subservicio de',

        # Template: AdminSession
        'Session Management' => 'Gestión de Sesiones',
        'All sessions' => 'Todas las sesiones',
        'Agent sessions' => 'Sesiones de agente',
        'Customer sessions' => 'Sesiones de cliente',
        'Unique agents' => 'Agentes únicos',
        'Unique customers' => 'Clientes únicos',
        'Kill all sessions' => 'Finalizar todas las sesiones',
        'Kill this session' => 'Matar esta sesión',
        'Session' => 'Sesión',
        'Kill' => 'Matar',
        'Detail View for SessionID' => 'Vista Detalle para SesiónID',

        # Template: AdminSignature
        'Signature Management' => 'Gestión de firmas',
        'Add signature' => 'Añadir firma',
        'Add Signature' => 'Añadir firma',
        'Edit Signature' => 'Editar la firma',
        'Example signature' => 'Firma de ejemplo',

        # Template: AdminState
        'State Management' => 'Gestión de estados',
        'Add state' => 'Añadir estado',
        'Please also update the states in SysConfig where needed.' => 'Actualice también los estados en SysConfig donde sea necesario.',
        'Add State' => 'Añadir estado',
        'Edit State' => 'Editar el estado',
        'State type' => 'Tipo de estado',

        # Template: AdminSupportDataCollector
        'Sending support data to OTRS Group is not possible!' => 'El envío de información de soporte al Grupo de OTRS no fue posible!',
        'Enable Cloud Services' => 'Habilitar los servicios en la nube',
        'This data is sent to OTRS Group on a regular basis. To stop sending this data please update your system registration.' =>
            'Estos datos se envían a Grupo OTRS en una base regular. Para detener el envío de estos datos por favor actualice su registro del sistema.',
        'You can manually trigger the Support Data sending by pressing this button:' =>
            'Puedes disparar manualmente los envíos de Datos de Soporte presionando este botón:',
        'Send Update' => 'Enviar Actualización',
        'Sending Update...' => 'Enviando Actualización...',
        'Support Data information was successfully sent.' => 'Información de Datos de Soporte fue enviada satisfactoriamente.',
        'Was not possible to send Support Data information.' => 'No fue posible enviar información de Datos de Soporte.',
        'Update Result' => 'Actualizar Resultado',
        'Currently this data is only shown in this system.' => 'Actualmente estos datos sólo se muestran en este sistema.',
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'Un paquete de apoyo (incluyendo : información de registro del sistema, los datos de apoyo, una lista de los paquetes instalados y todos los archivos de código fuente modificados localmente) puede generarse presionando este botón:',
        'Generate Support Bundle' => 'Generar Paquete de Apoyo',
        'Generating...' => 'Generando...',
        'It was not possible to generate the Support Bundle.' => 'No fue posible generar el Paquete de Apoyo.',
        'Generate Result' => 'Generar Resultado',
        'Support Bundle' => 'Paquete de Soporte',
        'The mail could not be sent' => 'El correo no pudo ser enviado',
        'The support bundle has been generated.' => 'El paquete de soporte ha sido generado.',
        'Please choose one of the following options.' => 'Por favor escoja una de las siguientes opciones.',
        'Send by Email' => 'Enviar por Email',
        'The support bundle is too large to send it by email, this option has been disabled.' =>
            'El paquete de soporte es demasiado grande para enviarlo por correo electrónico, esta opción ha sido deshabilitada.',
        'The email address for this user is invalid, this option has been disabled.' =>
            'La dirección de correo electrónico para este usuario no es válida, esta opción se ha desactivado.',
        'Sending' => 'Remitente',
        'The support bundle will be sent to OTRS Group via email automatically.' =>
            'El paquete de soporte será enviado a Grupo OTRS a través de correo electrónico de forma automática.',
        'Download File' => 'Descargar Archivo',
        'A file containing the support bundle will be downloaded to the local system. Please save the file and send it to the OTRS Group, using an alternate method.' =>
            'Un archivo que contiene el paquete de soporte se descargará en el sistema local. Por favor, guarde el archivo y envíelo al Grupo de OTRS, utilizando un método alternativo .',
        'Error: Support data could not be collected (%s).' => 'Error: Los datos de soporte no han podido ser recolectados (%s).',
        'Details' => 'Detalles',

        # Template: AdminSysConfig
        'SysConfig' => 'Configuración del sistema',
        'Navigate by searching in %s settings' => 'Navegue por búsqueda en ajustes %s',
        'Navigate by selecting config groups' => 'Navegue seleccionando grupos de configuración',
        'Download all system config changes' => 'Descargue todos los cambios de configuración de sistema',
        'Export settings' => 'Exportar ajustes',
        'Load SysConfig settings from file' => 'Cargue ajustes de SysConfig desde archivo',
        'Import settings' => 'Importar ajustes',
        'Import Settings' => 'Importar Ajustes',
        'Please enter a search term to look for settings.' => 'Por favor, introduzca un término de búsqueda para buscar los ajustes.',
        'Subgroup' => 'Subgrupo',
        'Elements' => 'Elementos',

        # Template: AdminSysConfigEdit
        'Edit Config Settings in %s → %s' => 'Editar parámetros de configuración en %s → %s',
        'This setting is read only.' => 'Esta opción es de sólo lectura.',
        'This config item is only available in a higher config level!' =>
            'Este elemento de configuración sólo está disponible en un nivel de configuración mayor!',
        'Reset this setting' => 'Reestablecer este ajuste',
        'Error: this file could not be found.' => 'Error: este archivo no pudo ser encontrado.',
        'Error: this directory could not be found.' => 'Error: este directorio no pudo ser encontrado.',
        'Error: an invalid value was entered.' => 'Error: se ingresó un valor no válido.',
        'Content' => 'Contenido',
        'Remove this entry' => 'Elimine esta entrada',
        'Add entry' => 'Añada entrada',
        'Remove entry' => 'Elimine entrada',
        'Add new entry' => 'Añadir nueva entrada',
        'Delete this entry' => 'Eliminar esta entrada',
        'Create new entry' => 'Crear nueva entrada',
        'New group' => 'Nuevo grupo',
        'Group ro' => 'Grupo ro',
        'Readonly group' => 'Grupo de sólo lectura',
        'New group ro' => 'Nuevo grupo ro',
        'Loader' => 'Cargador',
        'File to load for this frontend module' => 'Archivo a cargar para este módulo frontend',
        'New Loader File' => 'Nuevo Cargador de Archivo',
        'NavBarName' => 'NombreBarraNavegación',
        'NavBar' => 'BarraNavegación',
        'LinkOption' => 'Enlazar',
        'Block' => 'Bloqueo',
        'AccessKey' => 'Tecla de acceso',
        'Add NavBar entry' => 'Añada entrada en NavBar',
        'NavBar module' => 'Módulo NavBar',
        'Year' => 'Año',
        'Month' => 'Mes',
        'Day' => 'Día',
        'Invalid year' => 'Año no válido',
        'Invalid month' => 'Mes no válido',
        'Invalid day' => 'Día no válido',
        'Show more' => 'Mostrar más',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Gestión de Direcciones de Correo del sistema',
        'Add system address' => 'Añadir dirección de sistema',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Todo el correo electrónico entrante con esta dirección en Para o Cc será enviado a la cola seleccionada.',
        'Email address' => 'Dirección de correo electrónico',
        'Display name' => 'Mostrar nombre',
        'Add System Email Address' => 'Añadir Dirección de Correo Electrónico de Sistema',
        'Edit System Email Address' => 'Editar Dirección de Correo Electrónico de Sistema',
        'The display name and email address will be shown on mail you send.' =>
            'El nombre a mostrar y la dirección de correo electrónico serán mostrados en el correo que tu envías.',

        # Template: AdminSystemMaintenance
        'System Maintenance Management' => 'Sistema de Gestión de Mantenimiento',
        'Schedule New System Maintenance' => 'Planificar Nuevo Mantenimiento de Sistema',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'Programar un periodo de mantenimiento del sistema para anunciar a los Agentes y Clientes que el sistema está desactivado por un período de tiempo.',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'Algún tiempo antes de que comience este mantenimiento de sistema los usuarios recibirán una notificación en cada pantalla anunciando sobre este hecho.',
        'Start date' => 'Fecha inicio',
        'Stop date' => 'Fecha fin',
        'Delete System Maintenance' => 'Eliminar Mantenimiento de Sistema',
        'Do you really want to delete this scheduled system maintenance?' =>
            '¿Realmente desea eliminar este mantenimiento de sistema programado?',

        # Template: AdminSystemMaintenanceEdit
        'Edit System Maintenance %s' => 'Editar mantenimiento del sistema  %s',
        'Edit System Maintenance Information' => 'Edite la Información de Mantenimiento de Sistema',
        'Date invalid!' => '¡Fecha no válida!',
        'Login message' => 'Mensaje de login',
        'Show login message' => 'Mostrar mensaje de login',
        'Notify message' => 'Notificar mensaje',
        'Manage Sessions' => 'Administrar Sesiones',
        'All Sessions' => 'Todas las Sesiones',
        'Agent Sessions' => 'Sesiones del Agente',
        'Customer Sessions' => 'Sesiones del Cliente',
        'Kill all Sessions, except for your own' => 'Matar todas las Sesiones, excepto de la suya propia',

        # Template: AdminTemplate
        'Manage Templates' => 'Gestionar Plantillas',
        'Add template' => 'Agregar plantilla',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'Una plantilla es el texto por defecto que ayuda a sus agentes a escribir mas rápido los tickets, respuestas o reenvios',
        'Don\'t forget to add new templates to queues.' => 'No olvide agregar las nuevas plantillas a las colas',
        'Do you really want to delete this template?' => '¿Realmente desea eliminar esta plantilla?',
        'Add Template' => 'Agregar Plantilla',
        'Edit Template' => 'Editar Plantilla',
        'A standard template with this name already exists!' => '¡Una plantilla estándar con este nombre ya existe!',
        'Create type templates only supports this smart tags' => 'Crear plantillas tipo sólo soporta estas etiquetas inteligentes',
        'Example template' => 'Plantilla Ejemplo',
        'The current ticket state is' => 'El estado actual del ticket es',
        'Your email address is' => 'Su dirección de correo electrónico es',

        # Template: AdminTemplateAttachment
        'Manage Templates <-> Attachments Relations' => 'Gestionar Relación Plantillas <-> Archivos adjuntos',
        'Filter for Attachments' => 'Filtro para Archivos adjuntos',
        'Change Template Relations for Attachment' => 'Cambiar las relaciones de Plantillas del Adunto',
        'Change Attachment Relations for Template' => 'Cambiar las relaciones de Adjuntos de la Plantilla',
        'Toggle active for all' => 'Alternar a activo para todos',
        'Link %s to selected %s' => 'Enlaza %s al %s seleccionado',

        # Template: AdminType
        'Type Management' => 'Gestión de tipos',
        'Add ticket type' => 'Añadir tipo de ticket',
        'Add Type' => 'Añadir tipo',
        'Edit Type' => 'Editar el tipo',
        'A type with this name already exists!' => '¡Un tipo con este nombre ya existe!',

        # Template: AdminUser
        'Agents will be needed to handle tickets.' => 'Se necesitan agentes para gestionar los tickets.',
        'Don\'t forget to add a new agent to groups and/or roles!' => '¡No olvide añadir un nuevo agente a grupos y/o roles!',
        'Please enter a search term to look for agents.' => 'Introduzca un término de búsqueda para buscar agentes.',
        'Last login' => 'Última sesión',
        'Switch to agent' => 'Cambiar al agente',
        'Add Agent' => 'Añadir agente',
        'Edit Agent' => 'Editar el agente',
        'Title or salutation' => 'Título o saludo',
        'Firstname' => 'Nombre',
        'Lastname' => 'Apellido',
        'A user with this username already exists!' => '¡Un usuario con este nombre ya existe!',
        'Will be auto-generated if left empty.' => 'Se autogenerará si se deja en blanco.',
        'Start' => 'Iniciar',
        'End' => 'Fin',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Gestionar las relaciones agente-grupo',
        'Change Group Relations for Agent' => 'Cambiar las relaciones de grupo del agente',
        'Change Agent Relations for Group' => 'Cambiar las relaciones de agente del grupo',

        # Template: AgentBook
        'Address Book' => 'Libreta de direcciones',
        'Search for a customer' => 'Buscar un cliente',
        'Add email address %s to the To field' => 'Añadir la dirección de correo %s al campo Para',
        'Add email address %s to the Cc field' => 'Añadir la dirección de correo %s al campo Cc',
        'Add email address %s to the Bcc field' => 'Añadir la dirección de correo %s al campo "Copia oculta"',
        'Apply' => 'Aplicar',

        # Template: AgentCustomerInformationCenter
        'Customer Information Center' => 'Centro de información al cliente',

        # Template: AgentCustomerInformationCenterSearch
        'Customer User' => 'Cliente',

        # Template: AgentCustomerSearch
        'Duplicated entry' => 'Entrada duplicada',
        'This address already exists on the address list.' => 'Esta dirección ya estaba en la lista de direcciones.',
        'It is going to be deleted from the field, please try again.' => 'Se va a borrar del campo, inténtelo de nuevo.',

        # Template: AgentCustomerTableView
        'Note: Customer is invalid!' => 'Nota: ¡El cliente no es válido!',
        'Start chat' => 'Iniciar chat',
        'Video call' => 'Videollamada',
        'Audio call' => 'Llamada de audio',

        # Template: AgentDaemonInfo
        'The OTRS Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'El Servicio OTRS es un proceso en segundo plano que efectúa tareas asíncronas, por ejemplo el disparo de escalada de tickets, envío de correos, etc.',
        'A running OTRS Daemon is mandatory for correct system operation.' =>
            'Un Daemon funcionando de OTRS es obligatorio para su correcta operación.',
        'Starting the OTRS Daemon' => 'Iniciando el Daemon de OTRS',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the OTRS Daemon is running and start it if needed.' =>
            'Asegúrese de que el archivo \'%s\' existe (sin la extensión .dist). Este trabajo programado verificará cada 5 minutos si el Daemon de OTRS está corriendo y lo iniciará de ser necesario.',
        'Execute \'%s start\' to make sure the cron jobs of the \'otrs\' user are active.' =>
            'Ejecute \'%s start\' para asegurarse de que el trabajo programado del usuario \'otrs\' está activo.',
        'After 5 minutes, check that the OTRS Daemon is running in the system (\'bin/otrs.Daemon.pl status\').' =>
            'Después de 5 minutos verifique que el Daemon OTRS está ejecutándose en el sistema (\'bin/otrs.Daemon.pl status\').',

        # Template: AgentDashboard
        'Dashboard' => 'Panel principal',

        # Template: AgentDashboardCalendarOverview
        'in' => 'en',

        # Template: AgentDashboardCommon
        'Close this widget' => 'Cerrar este widget',
        'Available Columns' => 'Columnas disponibles',
        'Visible Columns (order by drag & drop)' => 'Columnas visibles (ordenar arrastrando y soltando)',

        # Template: AgentDashboardCustomerIDStatus
        'Escalated tickets' => 'Tickets escalados',

        # Template: AgentDashboardCustomerUserList
        'Customer login' => 'Inicio de sesión de clientes',
        'Customer information' => 'Información del cliente',
        'Phone ticket' => 'Ticket telefónico',
        'Email ticket' => 'Ticket por correo',
        '%s open ticket(s) of %s' => '%s tickets abiertos de %s',
        '%s closed ticket(s) of %s' => '%s tickets cerrados de %s',
        'New phone ticket from %s' => 'Nuevo ticket telefónico de %s',
        'New email ticket to %s' => 'Nuevo ticket por correo para %s',

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '¡%s %s está disponible!',
        'Please update now.' => 'Por favor, actualice ahora.',
        'Release Note' => 'Notas de versión',
        'Level' => 'Nivel',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Enviado hace %s.',

        # Template: AgentDashboardStats
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'La configuración de este widget estadístico contiene errores, por favor revise su configuración.',
        'Download as SVG file' => 'Descargar como archivo SVG',
        'Download as PNG file' => 'Descargar como archivo PNG',
        'Download as CSV file' => 'Descargar como archivo CSV',
        'Download as Excel file' => 'Descargar como archivo Excel',
        'Download as PDF file' => 'Descargar como archivo PDF',
        'Grouped' => 'Agrupado',
        'Stacked' => 'Apilado',
        'Expanded' => 'Expandido',
        'Stream' => 'Stream',
        'No Data Available.' => '',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'Por favor, seleccione un formato de salida gráfica válida en la configuración de este widget.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'Se está preparado el contenido de esta estadística para usted, por favor sea paciente.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'Esta estadística puede actualmente no estar siendo utilizada debido a que su configuración debe ser corregida por el administrador de las estadísticas.',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => 'Mis tickets bloqueados',
        'My watched tickets' => 'Mis Tickets vistos',
        'My responsibilities' => 'Mis responsabilidades',
        'Tickets in My Queues' => 'Tickets en mis colas',
        'Tickets in My Services' => 'Tickets en Mis Servicios',
        'Service Time' => 'Tiempo de servicio',
        'Remove active filters for this widget.' => 'Eliminar los filtros activos para este componente.',

        # Template: AgentDashboardTicketQueueOverview
        'Totals' => 'Totales',

        # Template: AgentDashboardUserOnline
        'out of office' => 'fuera de la oficina',

        # Template: AgentDashboardUserOutOfOffice
        'until' => 'hasta',

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => 'El ticket ha sido bloqueado',
        'Undo & close' => 'Deshacer y cerrar',

        # Template: AgentInfo
        'Info' => 'Información',
        'To accept some news, a license or some changes.' => 'Para aceptar algunas noticias, una licencia o algunos cambios.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Enlazar el objeto: %s',
        'go to link delete screen' => 'ir a la pantalla de borrado de enlaces',
        'Select Target Object' => 'Seleccione el objeto destino',
        'Link object %s with' => 'Vincular objeto %s con',
        'Unlink Object: %s' => 'Desenlazar el objeto: %s',
        'go to link add screen' => 'ir a la pantalla de añadir enlaces',

        # Template: AgentOTRSBusinessBlockScreen
        'Unauthorized usage of %s detected' => 'Uso no autorizado de %s detectado',
        'If you decide to downgrade to OTRS Free, you will lose all database tables and data related to %s.' =>
            'Si va a volver a OTRS Free, perderá todas las tablas y datos relacionadas con %s.',

        # Template: AgentPreferences
        'Edit your preferences' => 'Editar sus preferencias',
        'Did you know? You can help translating OTRS at %s.' => '¿Sabías que? Puedes ayudar a traducir OTRS en %s.',

        # Template: AgentSpelling
        'Spell Checker' => 'Verificación ortográfica',
        'spelling error(s)' => 'errores ortográficos',
        'Apply these changes' => 'Aplicar los cambios',

        # Template: AgentStatisticsAdd
        'Statistics » Add' => 'Estadísticas » Agregar',
        'Add New Statistic' => 'Agregar Nueva Estadística',
        'Dynamic Matrix' => 'Matriz Dinámica',
        'Tabular reporting data where each cell contains a singular data point (e. g. the number of tickets).' =>
            'Datos de reporte tabulares donde cada celda contiene un punto de dato singular (ej. número de tickets).',
        'Dynamic List' => 'Lista Dinámica',
        'Tabular reporting data where each row contains data of one entity (e. g. a ticket).' =>
            'Datos de reporte tabulares donde cada fila contiene una entidad de dato(ej. un ticket).',
        'Static' => 'Estático',
        'Complex statistics that cannot be configured and may return non-tabular data.' =>
            'Estadísticas complejas que no pueden ser configuradas y pueden retornar datos no tabulares.',
        'General Specification' => 'Especificación General',
        'Create Statistic' => 'Crear Estadística',

        # Template: AgentStatisticsEdit
        'Statistics » Edit %s%s — %s' => 'Estadísticas » Editar %s%s — %s',
        'Run now' => 'Ejecutar ahora',
        'Statistics Preview' => 'Vista previa de Estadísticas',
        'Save statistic' => 'Guardar Estadísticas',

        # Template: AgentStatisticsImport
        'Statistics » Import' => 'Estadísticas » Importar',
        'Import Statistic Configuration' => 'Importar Configuración Estadística',

        # Template: AgentStatisticsOverview
        'Statistics » Overview' => 'Estadísticas » Vista general',
        'Statistics' => 'Estadísticas',
        'Run' => 'Ejecutar',
        'Edit statistic "%s".' => 'Editar estadística "%s".',
        'Export statistic "%s"' => 'Exportar estadística "%s".',
        'Export statistic %s' => 'Exportar estadística %s',
        'Delete statistic "%s"' => 'Eliminar estadística "%s"',
        'Delete statistic %s' => 'Eliminar estadística %s',
        'Do you really want to delete this statistic?' => '¿Realmente desea eliminar esta estadística?',

        # Template: AgentStatisticsView
        'Statistics » View %s%s — %s' => 'Estadísticas » Ver %s%s — %s',
        'Statistic Information' => 'Información Estadística',
        'Sum rows' => 'Sumar las filas',
        'Sum columns' => 'Sumar las columnas',
        'Show as dashboard widget' => 'Mostrar como un elemento gráfico en el panel principal',
        'Cache' => 'Caché',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Esta estadísticas contiene errores de configuracion y no puede ser utilizada actualmente.',

        # Template: AgentTicketActionCommon
        'Change Free Text of %s%s%s' => 'Cambiar Texto Libre de %s%s',
        'Change Owner of %s%s%s' => 'Cambiar Propietario de %s%s',
        'Close %s%s%s' => 'Cerrar %s%s%s',
        'Add Note to %s%s%s' => 'Añadir una nota a %s%s%s',
        'Set Pending Time for %s%s%s' => 'Establecer Tiempo en Espera para %s%s',
        'Change Priority of %s%s%s' => 'Cambiar Prioridad de %s%s',
        'Change Responsible of %s%s%s' => 'Cambiar Responsable de %s%s',
        'All fields marked with an asterisk (*) are mandatory.' => 'Todos los campos marcados con un asterisco (*) son obligatorios.',
        'Service invalid.' => 'Servicio no válido',
        'New Owner' => 'Nuevo propietario',
        'Please set a new owner!' => '¡Por favor, introduzca un nuevo propietario!',
        'New Responsible' => 'Nuevo Responsable',
        'Next state' => 'Siguiente estado',
        'For all pending* states.' => 'Para todos los estados pendientes*.',
        'Add Article' => 'Añadir Artículo',
        'Create an Article' => 'Crear un Artículo',
        'Inform agents' => 'Informar agentes',
        'Inform involved agents' => 'Informar agentes involucrados',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Aquí puede seleccionar agentes adicionales que deben recibir una notificación sobre el nuevo artículo.',
        'Text will also be received by' => 'El texto también será recibido también por',
        'Spell check' => 'Verificar la ortografía',
        'Text Template' => 'Plantilla de texto',
        'Setting a template will overwrite any text or attachment.' => 'Establecer una plantilla sobreescribirá cualquier texto o adjunto.',
        'Note type' => 'Tipo de nota',

        # Template: AgentTicketBounce
        'Bounce %s%s%s' => 'Rebotar %s%s',
        'Bounce to' => 'Rebotar a',
        'You need a email address.' => 'Necesita una dirección de correo electrónico.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Necesita una dirección de correo válida, o no use una dirección de correo local.',
        'Next ticket state' => 'Nuevo estado del ticket',
        'Inform sender' => 'Informar al remitente',
        'Send mail' => 'Enviar correo',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Acción en Bloque con Tickets',
        'Send Email' => 'Enviar correo',
        'Merge to' => 'Fusionar con',
        'Invalid ticket identifier!' => 'Identificador de ticket no válido',
        'Merge to oldest' => 'Fusionar con el mas antiguo',
        'Link together' => 'Enlazar juntos',
        'Link to parent' => 'Enlazar al padre',
        'Unlock tickets' => 'Desbloquear los tickets',
        'Execute Bulk Action' => 'Ejecutar Acción en Bloque',

        # Template: AgentTicketCompose
        'Compose Answer for %s%s%s' => 'Redactar una Respuesta para %s%s%s',
        'This address is registered as system address and cannot be used: %s' =>
            'Esta dirección está registrada como una dirección de sistema y no se puede utilizar: %s',
        'Please include at least one recipient' => 'Incluya al menos un destinatario',
        'Remove Ticket Customer' => 'Eliminar el cliente del ticket',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Elimine esta entrada e introduzca una nueva con el valor correcto.',
        'Remove Cc' => 'Eliminar Cc',
        'Remove Bcc' => 'Eliminar "Copia oculta"',
        'Address book' => 'Libreta de direcciones',
        'Date Invalid!' => '¡Fecha no válida!',

        # Template: AgentTicketCustomer
        'Change Customer of %s%s%s' => 'Cambiar Cliente de  %s%s%s',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Crear un nuevo ticket por correo electrónico',
        'Example Template' => 'Ejemplo Plantilla',
        'From queue' => 'De la cola',
        'To customer user' => 'Al usuario cliente',
        'Please include at least one customer user for the ticket.' => 'Por favor, incluya al menos un usuario cliente para el ticket.',
        'Select this customer as the main customer.' => 'Seleccionar a este cliente como el cliente principal.',
        'Remove Ticket Customer User' => 'Eliminar el usuario cliente del ticket',
        'Get all' => 'Obtener todo',

        # Template: AgentTicketEmailOutbound
        'Outbound Email for %s%s%s' => 'Email de Salida para %s%s',

        # Template: AgentTicketEscalation
        'Ticket %s: first response time is over (%s/%s)!' => 'Ticket %s: tiempo de primera respuesta ha sido excedido (%s%s)!',
        'Ticket %s: first response time will be over in %s/%s!' => 'Ticket %s: tiempo de primera respuesta será excedido en %s%s!',
        'Ticket %s: update time is over (%s/%s)!' => 'Ticket %s: el tiempo de actualización ha terminado (%s/%s)!',
        'Ticket %s: update time will be over in %s/%s!' => 'Ticket %s: tiempo de actualización será excedido en %s%s!',
        'Ticket %s: solution time is over (%s/%s)!' => 'Ticket %s: tiempo de resolución ha sido excedido (%s%s)!',
        'Ticket %s: solution time will be over in %s/%s!' => 'Ticket %s: tiempo de resolución será excedido en %s%s!',

        # Template: AgentTicketForward
        'Forward %s%s%s' => 'Reenviar %s%s%s',

        # Template: AgentTicketHistory
        'History of %s%s%s' => 'Histórico de %s%s%s',
        'History Content' => 'Contenido del historial',
        'Zoom view' => 'Vista detallada ',

        # Template: AgentTicketMerge
        'Merge %s%s%s' => 'Fusionar %s%s%s',
        'Merge Settings' => 'Ajustes de Fusión',
        'You need to use a ticket number!' => '¡Es necesario usar un número de ticket!',
        'A valid ticket number is required.' => 'Se requiere un número de ticket válido.',
        'Need a valid email address.' => 'Se requiere una dirección de correo electrónico válida.',

        # Template: AgentTicketMove
        'Move %s%s%s' => 'Mover %s%s%s',
        'New Queue' => 'Nueva cola',

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Seleccionar todo',
        'No ticket data found.' => 'No se encontraron datos del ticket.',
        'Open / Close ticket action menu' => 'Abrir / Cerrar menu acción ticket',
        'Select this ticket' => 'Seleccionar este ticket',
        'First Response Time' => 'Tiempo para primera respuesta',
        'Update Time' => 'Tiempo para actualización',
        'Solution Time' => 'Tiempo para solución',
        'Move ticket to a different queue' => 'Mover el ticket a otra cola',
        'Change queue' => 'Cambiar de cola',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Cambiar las opciones de búsqueda',
        'Remove active filters for this screen.' => 'Eliminar los filtros activos para esta pantalla.',
        'Tickets per page' => 'Tickets por página',

        # Template: AgentTicketOverviewSmall
        'Reset overview' => 'Restablecer la vista general',
        'Column Filters Form' => 'Formulario de filtros de columna',

        # Template: AgentTicketPhone
        'Split Into New Phone Ticket' => 'Dividir En Nuevo Ticket Telefónico',
        'Save Chat Into New Phone Ticket' => 'Guardar Chat En Nuevo Ticket Telefónico',
        'Create New Phone Ticket' => 'Crear un nuevo ticket telefónico',
        'Please include at least one customer for the ticket.' => 'Incluya al menos un cliente para el ticket',
        'To queue' => 'A la cola',
        'Chat protocol' => 'Protocolo chat',
        'The chat will be appended as a separate article.' => 'El chat se agregará como un artículo separado.',

        # Template: AgentTicketPhoneCommon
        'Phone Call for %s%s%s' => 'Llamada Telefónica para %s%s%s',

        # Template: AgentTicketPlain
        'View Email Plain Text for %s%s%s' => 'Ver Email en Texto Plano para %s%s%s',
        'Plain' => 'Texto plano',
        'Download this email' => 'Descargar este correo',

        # Template: AgentTicketProcess
        'Create New Process Ticket' => 'Crear un nuevo ticket de proceso',
        'Process' => 'Proceso',

        # Template: AgentTicketProcessSmall
        'Enroll Ticket into a Process' => 'Registrar Ticket en un Proceso',

        # Template: AgentTicketSearch
        'Search template' => 'Plantilla de búsqueda',
        'Create Template' => 'Crear plantilla',
        'Create New' => 'Crear nueva',
        'Profile link' => 'Enlace al perfil',
        'Save changes in template' => 'Guardar los cambios de la plantilla',
        'Filters in use' => 'Filtros en uso',
        'Additional filters' => 'Filtros adicionales',
        'Add another attribute' => 'Añadir otro atributo',
        'Output' => 'Formato del resultado',
        'Fulltext' => 'Texto completo',
        'Remove' => 'Eliminar',
        'Searches in the attributes From, To, Cc, Subject and the article body, overriding other attributes with the same name.' =>
            'Busca en los atributos De, Para, Cc, Asunto y el cuerpo del artículo, ignorando otros atributos con el mismo nombre.',
        'CustomerID (complex search)' => 'Identificación del cliente (búsqueda compleja)',
        '(e. g. 234*)' => '(por ejemplo 234*)',
        'CustomerID (exact match)' => 'Identificación del cliente (coincidencia exacta)',
        'Customer User Login (complex search)' => 'Login de usuario Cliente (busqueda compleja)',
        '(e. g. U51*)' => '(por ejemplo U51*)',
        'Customer User Login (exact match)' => 'Login de usuario Cliente (coincidencia exacta)',
        'Attachment Name' => 'Nombre del archivo adjunto',
        '(e. g. m*file or myfi*)' => '(ej. m*archivo or miar*)',
        'Created in Queue' => 'Creado en la cola',
        'Lock state' => 'Estado bloqueado',
        'Watcher' => 'Vigilante',
        'Article Create Time (before/after)' => 'Hora de creación del artículo (antes/después)',
        'Article Create Time (between)' => 'Hora de creación del artículo (entre)',
        'Ticket Create Time (before/after)' => 'Hora de creación del ticket (antes/después)',
        'Ticket Create Time (between)' => 'Hora de creación del ticket (entre)',
        'Ticket Change Time (before/after)' => 'Hora de modificación del ticket (antes/después)',
        'Ticket Change Time (between)' => 'Hora de modificación del ticket (entre)',
        'Ticket Last Change Time (before/after)' => 'Hora del último cambio del Ticket (antes/después)',
        'Ticket Last Change Time (between)' => 'Tiempo Último Cambio Ticket (entre)',
        'Ticket Close Time (before/after)' => 'Hora de cierre del ticket (antes/después)',
        'Ticket Close Time (between)' => 'Hora de cierre del ticket (entre)',
        'Ticket Escalation Time (before/after)' => 'Hora de escalada del ticket (antes/después)',
        'Ticket Escalation Time (between)' => 'Hora de escalada del ticket (entre)',
        'Archive Search' => 'Búsqueda en archivados',
        'Run search' => 'Ejecutar la búsqueda',

        # Template: AgentTicketZoom
        'Article filter' => 'Filtro de artículos',
        'Article Type' => 'Tipo de artículo',
        'Sender Type' => 'Tipo de remitente',
        'Save filter settings as default' => 'Guardar los ajustes del filtro como predeterminados',
        'Event Type Filter' => 'Filtro Tipo Evento',
        'Event Type' => 'Tipo Evento',
        'Save as default' => 'Guardar como Por Defecto',
        'Archive' => 'Archivar',
        'This ticket is archived.' => 'Este ticket está archivado.',
        'Note: Type is invalid!' => 'Nota: ¡El tipo no es válido!',
        'Locked' => 'Bloqueo',
        'Accounted time' => 'Tiempo contabilizado',
        'Linked Objects' => 'Objetos enlazados',
        'Change Queue' => 'Cambiar de cola',
        'There are no dialogs available at this point in the process.' =>
            'No hay diálogos disponibles en este punto del proceso.',
        'This item has no articles yet.' => 'Este elemento todavía no tiene ningún artículo.',
        'Ticket Timeline View' => 'Vista Linea Temporal de Ticket',
        'Article Overview' => 'Vista General de Artículos',
        'Article(s)' => 'Artículo(s)',
        'Page' => 'Página',
        'Add Filter' => 'Añadir un filtro',
        'Set' => 'Establecer',
        'Reset Filter' => 'Restablecer el filtro',
        'Show one article' => 'Mostrar un artículo',
        'Show all articles' => 'Mostrar todos los artículos',
        'Show Ticket Timeline View' => 'Mostrar Vista Linea Temporal de Ticket',
        'Unread articles' => 'Artículos no leídos',
        'No.' => 'Nº',
        'Important' => 'Importante',
        'Unread Article!' => 'Artículo no leído',
        'Incoming message' => 'Mensaje entrante',
        'Outgoing message' => 'Mensaje saliente',
        'Internal message' => 'Mensaje interno',
        'Resize' => 'Redimensionar',
        'Mark this article as read' => 'Marcar este artículo como leído',
        'Show Full Text' => 'Mostrar Texto Completo',
        'Full Article Text' => 'Texto Artículo Completo',
        'No more events found. Please try changing the filter settings.' =>
            'No se encontraron más eventos. Por favor pruebe cambiando los ajustes de filtro.',
        'by' => 'por',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            'Para abrir enlaces en el siguiente artículo, es posible que tenga que pulsar Ctrl o Cmd o Shift mientras hace clic en el enlace (dependiendo de su navegador y sistema operativo ). ',
        'Close this message' => 'Cerrar este mensaje',
        'Article could not be opened! Perhaps it is on another article page?' =>
            'El artículo no se pudo abrir! Tal vez sea en otro artículo de la página?',
        'Scale preview content' => 'Escalar contenido en vista preliminar',
        'Open URL in new tab' => 'Abrir URL en una nueva pestaña',
        'Close preview' => 'Cerrar vista previa',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'La vista previa de esta página no puede ser mostrada porque no se permitió su integración',

        # Template: AttachmentBlocker
        'To protect your privacy, remote content was blocked.' => 'Para proteger su privacidad, se bloqueó el contenido remoto.',
        'Load blocked content.' => 'Cargar el contenido remoto.',

        # Template: ChatStartForm
        'First message' => 'Primer mensaje',

        # Template: CloudServicesDisabled
        'This feature requires cloud services.' => 'Esta funcionalidad requiere de servicios en la nube',
        'You can' => 'Puede',
        'go back to the previous page' => 'retroceder a la página anterior',

        # Template: CustomerError
        'An Error Occurred' => 'Ha ocurrido un error',
        'Error Details' => 'Detalles del error',
        'Traceback' => 'Traza inversa',

        # Template: CustomerFooter
        'Powered by' => 'Funciona con',

        # Template: CustomerFooterJS
        'One or more errors occurred!' => '¡Se han producido uno o más errores!',
        'Close this dialog' => 'Cerrar este diálogo',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'No fue posible abrir una ventana emergente.  Inhabilite los bloqueadores de ventanas emergentes para esta aplicacíon.',
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Si deja esta página ahora, también se cerrarán todas las ventanas emergentes abiertas.',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Ya está abierta una ventana emergente de esta pantalla. ¿Desea cerrarla y cargar ésta en su lugar?',
        'There are currently no elements available to select from.' => 'Actualmente no hay elementos disponibles que seleccionar.',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'Por favor apague el Modo Compatibilidad en Internet Explorer!',
        'The browser you are using is too old.' => 'El navegador que está usando es demasiado antiguo.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS funciona con un gran número de navegadores, por favor, actualice a uno de ellos.',
        'Please see the documentation or ask your admin for further information.' =>
            'Para más información, consulte la documentación o pregunte a su administrador.',
        'Switch to mobile mode' => 'Cambiar a modo móvil',
        'Switch to desktop mode' => 'Cambiar a modo de escritorio',
        'Not available' => 'No disponible',
        'Clear all' => 'Limpiar todo',
        'Clear search' => 'Limpiar búsqueda',
        '%s selection(s)...' => '%s selección(es)...',
        'and %s more...' => 'y %s más...',
        'Filters' => 'Filtros',
        'Confirm' => 'Confirmar',
        'You have unanswered chat requests' => 'Tienes peticiones de chat sin responder',
        'Accept' => 'Aceptar',
        'Decline' => 'Rechazar',
        'An internal error occurred.' => 'Ha Ocurrido un Error Interno',
        'Connection error' => 'Error de conexión ',
        'Reload page' => 'Recargar página',
        'Your browser was not able to communicate with OTRS properly, there seems to be something wrong with your network connection. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            'Tu navegador no pudo comunicarse con OTRS apropiadamente, parece que tienes problemas con tu conexión de red. Puedes tratar de reiniciar la página manualmente ó esperar mientras tu navegador re-establece la conexión por sí mismo. ',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            'Esta conexión ha sido re-establecida después de la pérdida de conexión. Dado a eso los elementos de esta página pudieron haber dejado de trabajar correctamente. Para usar todos los elementos correctamente de nuevo es muy recomendable que reinicies esta página.',

        # Template: CustomerLogin
        'JavaScript Not Available' => 'JavaScript no disponible',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Para utilizar OTRS, necesitará habilitar JavaScript en su navegador.',
        'Browser Warning' => 'Advertencia del navegador',
        'One moment please, you are being redirected...' => 'Un momento por favor, está siendo redirigido...',
        'Login' => 'Inicio de sesión',
        'User name' => 'Nombre de usuario',
        'Your user name' => 'Su nombre de usuario',
        'Your password' => 'Su contraseña',
        'Forgot password?' => '¿Olvidó su contraseña?',
        '2 Factor Token' => '2 Factor de Señal',
        'Your 2 Factor Token' => 'Tu 2 Factor de Señal',
        'Log In' => 'Iniciar sesión',
        'Not yet registered?' => '¿Todavía no está registrado?',
        'Request new password' => 'Solicitar una nueva contraseña',
        'Your User Name' => 'Su nombre de usuario',
        'A new password will be sent to your email address.' => 'Se le enviará una nueva contraseña a su dirección de correo electrónico.',
        'Create Account' => 'Crear una cuenta',
        'Please fill out this form to receive login credentials.' => 'Rellene este formulario para recibir las credenciales de inicio de sesión.',
        'How we should address you' => 'Cómo debemos dirigirnos a usted',
        'Your First Name' => 'Su nombre',
        'Your Last Name' => 'Su apellido',
        'Your email address (this will become your username)' => 'Su dirección de correo electrónico (esto será su nombre de usuario)',

        # Template: CustomerNavigationBar
        'Incoming Chat Requests' => 'Petición de Chat Entrante',
        'Edit personal preferences' => 'Editar las preferencias personales',
        'Logout %s %s' => 'Cerrar sesión %s %s',

        # Template: CustomerRichTextEditor
        'Split Quote' => 'Dividir Cita',
        'Open link' => 'Abrir enlace',

        # Template: CustomerTicketMessage
        'Service level agreement' => 'Acuerdo de nivel de servicio',

        # Template: CustomerTicketOverview
        'Welcome!' => 'Bienvenido',
        'Please click the button below to create your first ticket.' => 'Pulse el botón inferior para crear su primer ticket.',
        'Create your first ticket' => 'Cree su primer ticket',

        # Template: CustomerTicketSearch
        'Profile' => 'Perfil',
        'e. g. 10*5155 or 105658*' => 'ej: 10*5155 or 105658*',
        'Customer ID' => 'ID del cliente',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Búsqueda de texto completo en los tickets (vg «Juan*n» o «Guillermo*»)',
        'Recipient' => 'Destinatario',
        'Carbon Copy' => 'Copia carbón',
        'e. g. m*file or myfi*' => 'ej. m*archivo o miar*',
        'Types' => 'Tipos',
        'Time restrictions' => 'Restricciones de tiempo',
        'No time settings' => 'Sin ajustes de tiempo',
        'Specific date' => 'Fecha específica',
        'Only tickets created' => 'Sólo los tickets creados',
        'Date range' => 'Rango de fecha',
        'Only tickets created between' => 'Sólo los tickets creados entre',
        'Ticket archive system' => 'Sistema de archivo de tickets',
        'Save search as template?' => '¿Guardar la búsqueda como una plantilla?',
        'Save as Template?' => '¿Guardar como plantilla?',
        'Save as Template' => 'Guardar como plantilla',
        'Template Name' => 'Nombre de la plantilla',
        'Pick a profile name' => 'Elija un nombre de perfil',
        'Output to' => 'Formato de salida',

        # Template: CustomerTicketSearchResultShort
        'of' => 'de',
        'Search Results for' => 'Resultados de la búsqueda de',
        'Remove this Search Term.' => 'Elimine este Termino de Búsqueda.',

        # Template: CustomerTicketZoom
        'Start a chat from this ticket' => 'Inicie un chat desde este ticket',
        'Expand article' => 'Expandir el artículo',
        'Information' => 'Información',
        'Next Steps' => 'Siguientes pasos',
        'Reply' => 'Contestar',
        'Chat Protocol' => 'Protocolo de Chat',

        # Template: DashboardEventsTicketCalendar
        'All-day' => 'Todo el día',
        'Sunday' => 'Domingo',
        'Monday' => 'Lunes',
        'Tuesday' => 'Martes',
        'Wednesday' => 'Miércoles',
        'Thursday' => 'Jueves',
        'Friday' => 'Viernes',
        'Saturday' => 'Sábado',
        'Su' => 'Do',
        'Mo' => 'Lu',
        'Tu' => 'Ma',
        'We' => 'Mi',
        'Th' => 'Ju',
        'Fr' => 'Vi',
        'Sa' => 'Sá',
        'Event Information' => 'Información del evento',
        'Ticket fields' => 'Campos del ticket',
        'Dynamic fields' => 'Campos dinámicos',

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'Fecha no válida (se necesita una fecha futura)',
        'Invalid date (need a past date)!' => 'Fecha inválida (necesaria fecha pasada)!',
        'Previous' => 'Anterior',
        'Open date selection' => 'Abrir selección de fecha',

        # Template: Error
        'An error occurred.' => 'Ha ocurrido un error.',
        'Really a bug? 5 out of 10 bug reports result from a wrong or incomplete installation of OTRS.' =>
            '¿Realmente es un error? 5 de cada 10 informes de errores son el resultado de una instalación incorrecta o incompleta de OTRS.',
        'With %s, our experts take care of correct installation and cover your back with support and periodic security updates.' =>
            'Con %s, nuestros expertos se encargarán de una  instalación correcta y cubrirán sus espaldas con soporte y parches de seguridad periódicos.',
        'Contact our service team now.' => 'Contacta con nuestro equipo de soporte ahora.',
        'Send a bugreport' => 'Enviar un informe de error',

        # Template: FooterJS
        'Please enter at least one search value or * to find anything.' =>
            'Introduzca al menos un valor de búsqueda, o * para buscar todo.',
        'Please remove the following words from your search as they cannot be searched for:' =>
            'Por favor elimine las siguientes palabras de su búsqueda pues ellas no pueden ser buscadas por:',
        'Please check the fields marked as red for valid inputs.' => 'Compruebe que los campos marcados en rojo tienen datos válidos.',
        'Please perform a spell check on the the text first.' => 'Por favor ejecute una comprobación ortográfica en el texto primero.',
        'Slide the navigation bar' => 'Deslice la barra de navegación',
        'Unavailable for chat' => 'No disponible para chat',
        'Available for internal chats only' => 'Disponible para chat interno solamente',
        'Available for chats' => 'Disponible para chats',
        'Please visit the chat manager' => 'Por favor visite el manager de chat',
        'New personal chat request' => 'Nueva petición de chat personal',
        'New customer chat request' => 'Nueva petición de chat de cliente',
        'New public chat request' => 'Nueva petición de chat público',
        'Selected user is not available for chat.' => 'El usuario seleccionado no está disponible en el chat',
        'New activity' => 'Nueva actividad',
        'New activity on one of your monitored chats.' => 'Nueva actividad en uno de sus chats monitorizados.',
        'Your browser does not support video and audio calling.' => 'Su navegador no soporta llamadas de audio y video',
        'Selected user is not available for video and audio call.' => 'El usuario seleccionado no está disponible para una videollamada.',
        'Target user\'s browser does not support video and audio calling.' =>
            'El navegador del usuario no admite llamadas de video y audio',
        'Do you really want to continue?' => '¿Realmente desea continuar?',
        'Information about the OTRS Daemon' => 'Información acerca del Daemon de OTRS',
        'This feature is part of the %s.  Please contact us at %s for an upgrade.' =>
            'Esta función es parte de %s. Por favor contacte con nosotros en %s para una mejora.',
        'Find out more about the %s' => 'Encuentre más sobre el %s',

        # Template: Header
        'You are logged in as' => 'Ha iniciado sesión como',

        # Template: Installer
        'JavaScript not available' => 'JavaScript no disponible',
        'Step %s' => 'Paso %s',
        'Database Settings' => 'Ajustes de la base de datos',
        'General Specifications and Mail Settings' => 'Indicaciones generales y ajustes del correo',
        'Finish' => 'Finalizar',
        'Welcome to %s' => 'Bienvenido a %s',
        'Web site' => 'Sitio web',
        'Mail check successful.' => 'Se ha verificado el correo con éxito.',
        'Error in the mail settings. Please correct and try again.' => 'Error en los ajustes del correo. Corríjalos e inténtelo de nuevo.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Configurar el correo saliente',
        'Outbound mail type' => 'Tipo de correo saliente',
        'Select outbound mail type.' => 'Seleccionar el tipo de correo saliente',
        'Outbound mail port' => 'Puero del correo saliente',
        'Select outbound mail port.' => 'Seleccionar el puerto del coreo saliente',
        'SMTP host' => 'Servidor SMTP',
        'SMTP host.' => 'Servidor SMTP.',
        'SMTP authentication' => 'Autenticación SMTP',
        'Does your SMTP host need authentication?' => '¿Su servidor SMTP necesita autenticación?',
        'SMTP auth user' => 'Usuario para la autenticación SMTP',
        'Username for SMTP auth.' => 'Nombre de usuario para la autenticación SMTP.',
        'SMTP auth password' => 'Contraseña para la autenticación SMTP',
        'Password for SMTP auth.' => 'Contraseña para la autenticación SMTP.',
        'Configure Inbound Mail' => 'Configurar el correo entrante',
        'Inbound mail type' => 'Tipo de correo entrante',
        'Select inbound mail type.' => 'Seleccionar el tipo de correo entrante.',
        'Inbound mail host' => 'Servidor de correo entrante',
        'Inbound mail host.' => 'Servidor de correo entrante.',
        'Inbound mail user' => 'Usuario de correo entrante',
        'User for inbound mail.' => 'Usuario para el correo entrante',
        'Inbound mail password' => 'Contraseña para el correo entrante',
        'Password for inbound mail.' => 'Contraseña para el correo entrante.',
        'Result of mail configuration check' => 'Resultado de la verificación de la configuración del correo',
        'Check mail configuration' => 'Comprobar la configuración del correo',
        'Skip this step' => 'Omitir este paso',

        # Template: InstallerDBResult
        'Database setup successful!' => '¡Base de datos configurada con éxito!',

        # Template: InstallerDBStart
        'Install Type' => 'Tipo de instalación',
        'Create a new database for OTRS' => 'Crear una nueva base de datos para OTRS',
        'Use an existing database for OTRS' => 'Usar una base de datos existente para OTRS',

        # Template: InstallerDBmssql
        'Database name' => 'Nombre de la base de datos',
        'Check database settings' => 'Verificar los ajustes de la base de datos',
        'Result of database check' => 'Resultado de la verificación de la base de datos',
        'Database check successful.' => 'Se ha verificado la base de datos con éxito.',
        'Database User' => 'Usuario de la base de datos',
        'New' => 'Nuevo',
        'A new database user with limited permissions will be created for this OTRS system.' =>
            'Se creará un nuevo usuario de la base de datos con permisos limitados para este sistema OTRS.',
        'Repeat Password' => 'Repita la contraseña',
        'Generated password' => 'Contraseña generada',

        # Template: InstallerDBmysql
        'Passwords do not match' => 'Las contraseñas no coinciden',

        # Template: InstallerDBoracle
        'SID' => 'SID',
        'Port' => 'Puerto',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Para poder utilizar OTRS debe escribir la siguiente línea en la consola de sistema (Terminal/Shell) como usuario root',
        'Restart your webserver' => 'Reinicie su servidor web',
        'After doing so your OTRS is up and running.' => 'Después de hacer esto, su OTRS estará activo y ejecutándose',
        'Start page' => 'Página de inicio',
        'Your OTRS Team' => 'Su equipo OTRS',

        # Template: InstallerLicense
        'Don\'t accept license' => 'No aceptar la licencia',
        'Accept license and continue' => 'Aceptar la licencia y continuar',

        # Template: InstallerSystem
        'SystemID' => 'ID del sistema',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'El identificador del sistema. Cada número de ticket y cada identificador de sesión HTTP contienen este número.',
        'System FQDN' => 'FQDN del sistema',
        'Fully qualified domain name of your system.' => 'Nombre de dominio totalmente cualificado de su sistema.',
        'AdminEmail' => 'Correo del administrador.',
        'Email address of the system administrator.' => 'Dirección de correo electrónico del administrador del sistema.',
        'Organization' => 'Organización',
        'Log' => 'Registro',
        'LogModule' => 'Módulo de registro',
        'Log backend to use.' => 'Motor de registro a usar.',
        'LogFile' => 'Fichero de registro',
        'Webfrontend' => 'Interfaz web',
        'Default language' => 'Idioma predeterminado',
        'Default language.' => 'Idioma predeterminado.',
        'CheckMXRecord' => 'Verificar los registros MX',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'Las direcciones de correo introducidas manualmente se verifican contra los registros MX encontrados en el DNS. No utilice esta opción si su DNS es lento o no resuelve direcciones públicas.',

        # Template: LinkObject
        'Object#' => 'Objeto nº',
        'Add links' => 'Añadir enlaces',
        'Delete links' => 'Borrar enlaces',

        # Template: Login
        'Lost your password?' => '¿Perdió su contraseña?',
        'Request New Password' => 'Solicitar nueva contraseña',
        'Back to login' => 'Volver al inicio de sesión',

        # Template: MobileNotAvailableWidget
        'Feature not available' => 'Característica no disponible',
        'Sorry, but this feature of OTRS is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'Lo sentimos, pero esta característica de OTRS no está disponible para dispositivos móviles. Si desea utilizarla, puede cambiar al modo de escritorio o utilizar el dispositivo de escritorio normal.',

        # Template: Motd
        'Message of the Day' => 'Mensaje del día',
        'This is the message of the day. You can edit this in %s.' => 'Este es el mensaje del día. Puede editarlo en %s.',

        # Template: NoPermission
        'Insufficient Rights' => 'Derechos insuficientes',
        'Back to the previous page' => 'Volver a la página anterior',

        # Template: Pagination
        'Show first page' => 'Mostrar la primera página',
        'Show previous pages' => 'Mostrar las páginas anteriores',
        'Show page %s' => 'Mostrar la página %s',
        'Show next pages' => 'Mostrar las siguientes páginas',
        'Show last page' => 'Mostrar la última página',

        # Template: PictureUpload
        'Need FormID!' => 'Se necesita el identificador del formulario',
        'No file found!' => 'No se encontró ningún fichero.',
        'The file is not an image that can be shown inline!' => 'Este fichero no es una imagen que se pueda mostrar.',

        # Template: PreferencesNotificationEvent
        'Notification' => 'Notificaciones',
        'No user configurable notifications found.' => 'No encontrada ninguna notificación de usuario configurable.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Recibir mensajes para notificación \'%s\' por el método de transporte \'%s\'.',
        'Please note that you can\'t completely disable notifications marked as mandatory.' =>
            'Por favor tome en cuenta que no puede deshabilitar completamente notificaciones marcadas como obligatorias.',
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            'Disculpe, pero no puede deshabilitar todos los métodos para las notificación marcadas como obligatorias.',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'Disculpe, pero no puede deshabilitar todos los métodos para esta notificación.',

        # Template: ActivityDialogHeader
        'Process Information' => 'Información de Proceso',
        'Dialog' => 'Diálogo',

        # Template: Article
        'Inform Agent' => 'Informar al agente',

        # Template: PublicDefault
        'Welcome' => 'Bienvenido',
        'This is the default public interface of OTRS! There was no action parameter given.' =>
            'Esta es la interfaz pública por defecto de OTRS! No se ha dado ninguna acción como parámetro.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            'Puedes instalar el módulo público del cliente (por medio del gestor de paquetes), por ejemplo el módulo de FAQ lo cuál tiene el interfaz público.',

        # Template: RichTextEditor
        'Remove Quote' => 'Eliminar Cita',

        # Template: GeneralSpecificationsWidget
        'Permissions' => 'Permisos',
        'You can select one or more groups to define access for different agents.' =>
            'Puede seleccionar uno o más grupos para definir accesos para diferentes agentes.',
        'Result formats' => 'Formatos de Resultado',
        'The selected time periods in the statistic are time zone neutral.' =>
            'Los periodos de tiempo seleccionados en la estadística son de zona horaria neutral.',
        'Create summation row' => 'Crear una fila de agregación',
        'Generate an additional row containing sums for all data rows.' =>
            'Generar una línea de datos adicional que contiene sumas para todas las líneas.',
        'Create summation column' => 'Crear una columna de agregación',
        'Generate an additional column containing sums for all data columns.' =>
            'Generar una columna adicional que contiene sumas para todas las columnas de datos.',
        'Cache results' => 'Almacenar resultados temporalmente',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            'Guarde las estadísticas de los datos sobre los resultados en la caché para poder usar en las vistas posteriores con la misma configuración (requiere al menos un campo de tiempo seleccionado).',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'Proporcionar la estadística como un elemento gráfico que los agentes pueden activar en su panel principal.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'Por favor, ten en cuenta que habilitar el elemento gráfico en el panel principal activará el cacheo para esta estadística en el panel principal.',
        'If set to invalid end users can not generate the stat.' => 'Si se establece como "no válido" los usuarios finales no pueden generar la estadística.',

        # Template: PreviewWidget
        'There are problems in the configuration of this statistic:' => 'Hay problemas en la configuración de esta estadística:',
        'You may now configure the X-axis of your statistic.' => 'Ahora tienes que configurar el eje-X de tu estadística.',
        'This statistic does not provide preview data.' => 'Esta estadística no provee datos de vista previa.',
        'Preview format:' => 'Formato de Vista Previa:',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Por favor tenga en cuenta que la Vista Previa usa datos al azar y no considera los filtros de datos.',
        'Configure X-Axis' => 'Configurar Eje-X',
        'X-axis' => 'Eje-X',
        'Configure Y-Axis' => 'Configurar Eje-Y',
        'Y-axis' => 'Eje-Y',
        'Configure Filter' => 'Configurar Filtros',

        # Template: RestrictionsWidget
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Por favor seleccione sólo un elemento o desactive el botón «Fijado».',
        'Absolute period' => 'Periodo absoluto',
        'Between' => 'Entre',
        'Relative period' => 'Periodo relativo',
        'The past complete %s and the current+upcoming complete %s %s' =>
            'El pasado completó %s y el actual + próximo completo %s %s',
        'Do not allow changes to this element when the statistic is generated.' =>
            'No permitir cambios en este elemento mientras la estadística es generada.',

        # Template: StatsParamsWidget
        'Format' => 'Formato',
        'Exchange Axis' => 'Intercambiar los ejes',
        'Configurable params of static stat' => 'Parámetros configurables de estadística estática',
        'No element selected.' => 'No hay seleccionado ningún elemento',
        'Scale' => 'Escala',
        'show more' => 'ver más',
        'show less' => 'ver menos',

        # Template: D3
        'Download SVG' => 'Descargar SVG',
        'Download PNG' => 'Descargar PNG',

        # Template: XAxisWidget
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'El periodo del tiempo seleccionado define el marco predeterminado del tiempo para la estadística de recopilar los datos.',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'Define el plazo que se utilizará para separar el periodo seleccionado del tiempo en reportaje de puntos de datos.',

        # Template: YAxisWidget
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'Por favor, recuerde que la escala para el Eje-Y debe ser más larga que la escala para el Eje-X. (ej. Eje-X => Mes, Eje-Y => Año). ',

        # Template: Test
        'OTRS Test Page' => 'Página de prueba de OTRS',
        'Welcome %s %s' => 'Bienvenido %s %s',
        'Counter' => 'Contador',

        # Template: Warning
        'Go back to the previous page' => 'Volver a la página anterior',

        # Perl Module: Kernel/Config/Defaults.pm
        'View system log messages.' => 'Muestra mensajes de log del sistema.',
        'Update and extend your system with software packages.' => 'Actualizar y extender su sistema con software packages.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACLs could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            'Las ACL no se pueden importar debido a un error desconocido, compruebe los registros de OTRS para obtener más información',
        'The following ACLs have been added successfully: %s' => 'Las siguientes ACL se han agregado correctamente: %s',
        'The following ACLs have been updated successfully: %s' => 'Las siguientes ACL se ha sido actualizadas correctamente: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            'Hay errores al añadir/actualizar los siguientes  ACL: %s.  Compruebe el archivo de registro para obtener más información.',
        'This field is required' => 'Este campo es requerido.',
        'There was an error creating the ACL' => 'Ha habido un error al crear la ACL',
        'Need ACLID!' => '¡Se necesita la ID de una ACL!',
        'Could not get data for ACLID %s' => 'No se pudieron obtener datos para ACL con ID %s',
        'There was an error updating the ACL' => 'e ha producido un error al actualizar la ACL',
        'There was an error setting the entity sync status.' => 'Se produjo un error al establecer el estado de sincronización de la entidad.',
        'There was an error synchronizing the ACLs.' => 'Se produjo un error al sincronizar las ACL.',
        'ACL %s could not be deleted' => 'La ACL %s no se pudo eliminar',
        'There was an error getting data for ACL with ID %s' => 'Se produjo un error al obtener datos de la ACL con ID %s',
        'Exact match' => 'Coincidencia exacta',
        'Negated exact match' => 'Semejanza exacta negativa.',
        'Regular expression' => 'Expresión regular.',
        'Regular expression (ignore case)' => 'Expresión regular (ignorar el caso)',
        'Negated regular expression' => 'Expresión regular negada',
        'Negated regular expression (ignore case)' => 'Expresión regular negada (caso ignorada) ',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer Company %s already exists!' => '¡La Empresa del cliente %s ya existe!',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'New phone ticket' => 'Nuevo ticket telefónico',
        'New email ticket' => 'Nuevo ticket por correo',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => 'Campos de configuración no están válidos.',
        'Objects configuration is not valid' => 'La configuración de objetos no es válida',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'No pudo reajustar el orden de Campo Dinámico apropiadamente, favor revise el registro de errores para más información.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'Subrutina no definida.',
        'Need %s' => 'Necesita %s',
        'The field does not contain only ASCII letters and numbers.' => 'El campo no contiene solamente caracteres y números de ASCII.',
        'There is another field with the same name.' => 'Hay otro campo con el mismo nombre.',
        'The field must be numeric.' => 'El campo debe ser numérico.',
        'Need ValidID' => 'Se requiere un ID Válido.',
        'Could not create the new field' => 'No se pudo crear el nuevo campo',
        'Need ID' => 'Necesario el ID',
        'Could not get data for dynamic field %s' => 'No se pudo cargar los datos del campo dimámico %s',
        'The name for this field should not change.' => 'El nombre de este campo no debe ser cambiado.',
        'Could not update the field %s' => 'No se pudo actualizar el campo %s',
        'Currently' => 'Actualmente',
        'Unchecked' => 'Desmarcado',
        'Checked' => 'Marcado',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'Prevenir el ingreso de datos en futuro.',
        'Prevent entry of dates in the past' => 'Prevenir el ingreso de datos en pasado.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'El valor del campo está duplicado.',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => 'Selecciona un recipiente por lo menos.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'archive tickets' => 'archivar tickets',
        'restore tickets from archive' => 'restaurar tickets desde archivo',
        'Need Profile!' => 'Perfil Necesário!',
        'Got no values to check.' => 'No recibió ningún valor para revisar.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Por favor elimine las siguientes palabras porque ellas no pueden ser usadas para la selección de ticket:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => '¡Se requiere ID de ServicioWeb!',
        'Could not get data for WebserviceID %s' => 'No pudo recibir los datos para el ID de Servicio Web %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Need InvokerType' => 'Requiere el Tipo de Invocador',
        'Invoker %s is not registered' => 'El invocador %s no está registrado',
        'InvokerType %s is not registered' => 'El Tipo de Invocador %s no esta registrado',
        'Need Invoker' => 'Se requiere el Invocador',
        'Could not determine config for invoker %s' => 'No se determina la configuración para el invocador %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Could not get registered configuration for action type %s' => 'No pudo registrarse la configuración para el tipo de acción %s',
        'Could not get backend for %s %s' => 'No se pudo obtener el backend para %s %s',
        'Could not update configuration data for WebserviceID %s' => 'No se pudo actualizar los datos de configuración para el ID ServicioWeb %s',
        'Keep (leave unchanged)' => 'Mantener (dejar sin cambio)',
        'Ignore (drop key/value pair)' => 'Ignorar (dejar el llave/par de valor)',
        'Map to (use provided value as default)' => 'Determinar para (usar valor proporcionado como predeterminado)',
        'Exact value(s)' => 'Valor(es) exacto',
        'Ignore (drop Value/value pair)' => 'Ignorar (dejar el Valor/ par de valores)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'Could not find required library %s' => 'No se pudo encontrar la biblioteca %s necesaria.',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Need OperationType' => 'Se requiere el Tipo de Operación',
        'Operation %s is not registered' => 'La operación %s no está registrada.',
        'OperationType %s is not registered' => 'El Tipo de Operación %s no está registrada.',
        'Need Operation' => 'Se requiere Operación',
        'Could not determine config for operation %s' => 'No se pudo determinar configuración para la operación %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need Subaction!' => 'Se requiere Subacción!',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => 'Hay otro servicio web con el mismo nombre.',
        'There was an error updating the web service.' => 'Se produjo un error actualizando el servicio web.',
        'Web service "%s" updated!' => 'Servicio web "%s" actualizado!',
        'There was an error creating the web service.' => 'Se produjo un error creando un servicio web.',
        'Web service "%s" created!' => '¡Servicio web "%s" creado!',
        'Need Name!' => '¡Se requiere el Nombre!',
        'Need ExampleWebService!' => '¡Se requiere un Ejemplo de Servicio Web!',
        'Could not read %s!' => '¡No se pudo leer %s!',
        'Need a file to import!' => '¡Se requiere el archivo para importar!',
        'The imported file has not valid YAML content! Please check OTRS log for details' =>
            '¡El archivo importado no funciona con el contenido YAML!  Por favor, compruebe los registros de OTRS para más información',
        'Web service "%s" deleted!' => 'Servicio web "%s" borrado!',
        'New Web service' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => 'No tiene Historia de ID de Servicio Web!',
        'Could not get history data for WebserviceHistoryID %s' => 'No se pudo obtener los datos de la historia para La Historia de ID de Servicio Web %s',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Notification updated!' => '¡Notificación actualizada!',
        'Notification added!' => '¡Notificación añadida!',
        'There was an error getting data for Notification with ID:%s!' =>
            'Se produjo un error al obtener los datos para Notificación con ID:%s!',
        'Unknown Notification %s!' => 'Notificación %s Desconocida! ',
        'There was an error creating the Notification' => 'Se produjo un error al crear la Notificación',
        'Notifications could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            'Los notificaciones no se pudieron importarse debido a un error desconocido, favor, compruebe los registros de OTRS para más información.',
        'The following Notifications have been added successfully: %s' =>
            'Los siguientes Notificaciones se han agregado exitosamente: %s',
        'The following Notifications have been updated successfully: %s' =>
            'Los siguientes Notificaciones se han actualizado exitosamente:%s',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            'Hubo errores al añadir/actualizar las siguientes Notificaciones: %s. Por favor, compruebe el archivo de registros para más información.',
        'Agent who owns the ticket' => 'Agente que es propietario del ticket',
        'Agent who is responsible for the ticket' => 'Agente que es responsable del ticket',
        'All agents watching the ticket' => 'Todos los agentes viendo el ticket',
        'All agents with write permission for the ticket' => 'Todos los agentes con permisos de escritura para el ticket',
        'All agents subscribed to the ticket\'s queue' => 'Todos los agentes suscritos a la cola de ticket',
        'All agents subscribed to the ticket\'s service' => 'Todos los suscritos al servicio del ticket',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'Todos los agentes suscritos a ambos cola y servicio del ticket',
        'Customer of the ticket' => 'Cliente del ticket',
        'Yes, but require at least one active notification method' => 'Si, pero requiere al menos un método de notificación activo',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            'El entorno de PGP no funciona.  ¡Por favor compruebe los registros para más información!',
        'Need param Key to delete!' => '¡Se requiere la Clave de parámetros para borrar!',
        'Key %s deleted!' => '¡La Clave %s se ha borrado!',
        'Need param Key to download!' => '¡Se requiere el Clave de parámetros para descargar!',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/otrs.Console.pl to install packages!' =>
            'Perdón, Apache:: Se requiere un reinicio como PerlModule y PerllnitHandler en el archivo de configuración de Apache. También vea los scripts/apache2-httpd.include.conf. Como una alternativa, puedes usar la herramienta de línea de comandos bin/otrs.Console.p para instalar los paquetes!',
        'No such package!' => '¡No existe el paquete!',
        'No such file %s in package!' => '¡No hay tal archivo %s en el paquete!',
        'No such file %s in local file system!' => '¡No hay tal archivo %s en la sistema de los archivos locales!',
        'Can\'t read %s!' => '¡No se puede leer %s!',
        'File is OK' => 'El archivo está bien.',
        'Package has locally modified files.' => 'El paquete tiene archivos modificados localmente. ',
        'No packages or no new packages found in selected repository.' =>
            'No hay paquetes ó ningún paquete encontrado en el repositorio seleccionado.',
        'Package not verified due a communication issue with verification server!' =>
            'Paquete no verificado debido a problema en la comunicación con el servidor de verificación!',
        'Can\'t connect to OTRS Feature Add-on list server!' => 'No se pudo conectarse con el servidor de la lista de Funciones de los Complementos  de OTRS!',
        'Can\'t get OTRS Feature Add-on list from server!' => 'No se puede obtener la lista de los Complementos de las Funciones de OTRS desde el servidor!',
        'Can\'t get OTRS Feature Add-on from server!' => '¡No se puede obtener el Complemento de los Funciones de OTRS desde el servidor!',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => 'No existe el filtro: %s',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Need ExampleProcesses!' => 'Se requiere un Ejemplo de Procesos!',
        'Need ProcessID!' => '¡Se requiere el ID de Processo!',
        'Yes (mandatory)' => 'Si (Obligatorio)',
        'Unknown Process %s!' => '¡Proceso Desconocido %s!',
        'There was an error generating a new EntityID for this Process' =>
            'Se produjo un error al generar un nuevo ID de Entidad para este Processo.',
        'The StateEntityID for state Inactive does not exists' => 'El ID del Estado de Entidad para el estado Inactivo no existe.',
        'There was an error creating the Process' => 'Se produjo un error al crear el Processo.',
        'There was an error setting the entity sync status for Process entity: %s' =>
            'Se produjo un error al establecer el estatus de sincronización de entidad para la entidad del Processo: %s ',
        'Could not get data for ProcessID %s' => 'No se pudieron obtener los datos para el ID del Processo %s.',
        'There was an error updating the Process' => 'Se produjo un error al actualizar el Proceso.',
        'Process: %s could not be deleted' => 'El Proceso: %s no se pudo eliminar',
        'There was an error synchronizing the processes.' => 'Se produjo un error al sincronizar los procesos.',
        'The %s:%s is still in use' => 'El %s:%s esta siendo utilizado.',
        'The %s:%s has a different EntityID' => 'El %s:%s tiene diferente ID de Entidad.',
        'Could not delete %s:%s' => 'No se pudo borrar el %s:%s',
        'There was an error setting the entity sync status for %s entity: %s' =>
            'Se produjo un error al establecer el estado de sincronización de la entidad de %s entidad: %s ',
        'Could not get %s' => 'No se pudo obtener %s',
        'Need %s!' => 'Necesita %s',
        'Process: %s is not Inactive' => 'El proceso %s no está Inactivo',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            'Se produjo un error al generar un nuevo ID de Entidad para esta Actividad',
        'There was an error creating the Activity' => 'Se produjo un error al crear la Actividad',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            'Se produjo un error al establecer el estatus de sincronización de la entidad para la entidad de Actividad: %s ',
        'Need ActivityID!' => 'Se requiere ID de Actividad!',
        'Could not get data for ActivityID %s' => 'No se pudieron obtener los datos para ID de Actividad %s',
        'There was an error updating the Activity' => 'Se produjo un error al atualizar Actividad',
        'Missing Parameter: Need Activity and ActivityDialog!' => 'Se falta el Parámetro: Se quiere Actividad y Diálogo de Actividad!',
        'Activity not found!' => '¡Actividad no encontrada!',
        'ActivityDialog not found!' => '¡Diálogo de Actividad no encontrado!',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            'Diálogo de Actividad ya está asignada a Actividad. No puedes agregar Diálogo de Actividad dos veces!',
        'Error while saving the Activity to the database!' => 'Se produjo un error al guardar la Actividad a la base de datos!',
        'This subaction is not valid' => 'Esta subacción no es válida',
        'Edit Activity "%s"' => 'Edite Actividad "%s"',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            'Se produjo un error al generar un nuevo ID de Entidad para este Diálogo de Actividad',
        'There was an error creating the ActivityDialog' => 'Se produjo un error al crear este Diálogo de Actividad',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            'Se produjo un error al establecer el estatus de sincronización del Diálogo de Actividad de la entidad: %s ',
        'Need ActivityDialogID!' => 'Se requiere ID del Diálogo de Actividad!',
        'Could not get data for ActivityDialogID %s' => 'No se pudieron obtener los datos para ID del Diálogo de Actividad %s',
        'There was an error updating the ActivityDialog' => 'Se produjo un error al actualizar el Diálogo de Actividad',
        'Edit Activity Dialog "%s"' => 'Edite Diálogo de Actividad "%s"',
        'Agent Interface' => 'Interfaz del agente',
        'Customer Interface' => 'Interfaz del cliente',
        'Agent and Customer Interface' => 'Interfaz del agente y del cliente',
        'Do not show Field' => 'No mostrar el campo',
        'Show Field' => 'Mostrar campo',
        'Show Field As Mandatory' => 'Mostrar campo como Obligatorio',
        'fax' => 'fax',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => 'Editar Ruta',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            'Se produjo un error al generar un nuevo ID de Entidad para esta Transición',
        'There was an error creating the Transition' => 'Se produjo un error al crear la Transición',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            'Se produjo un error al establecer el estatus de sincronización de la entidad para la entidad de Transición: %s ',
        'Need TransitionID!' => 'Se requiere ID de Transición!',
        'Could not get data for TransitionID %s' => 'No se pudieron obtener los datos para ID de Transición %s',
        'There was an error updating the Transition' => 'Se produjo un error al actualizar la Transición',
        'Edit Transition "%s"' => 'Editar transición "%s"',
        'xor' => 'xor',
        'String' => 'Cadena',
        'Transition validation module' => 'Módulo Validación de Transición',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => 'Se requiere por lo menos un parámetro de configuración valido.',
        'There was an error generating a new EntityID for this TransitionAction' =>
            'Se produjo un error al generar un nuevo ID de Entidad para esta Acción de Transición',
        'There was an error creating the TransitionAction' => 'Se produjo un error al crear la Acción de Transición',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            'Se produjo un error al establecer el estatus de sincronización de la entidad para la entidad de Acción de Transición: %s ',
        'Need TransitionActionID!' => 'Se requiere ID de Acción de Transición!',
        'Could not get data for TransitionActionID %s' => 'No se pudieron obtener los datos para ID de Acción de Transición %s',
        'There was an error updating the TransitionAction' => 'Se produjo un error al actualizar la Acción de Transición',
        'Edit Transition Action "%s"' => 'Edite Acción de Transición "%s"',
        'Error: Not all keys seem to have values or vice versa.' => 'Error: No todos claves paracen tener valores ó al revés.',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Don\'t use :: in queue name!' => '¡No uses :: al nombrar una cola!',
        'Click back and change it!' => 'Pulse atrás y cámbiala!',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => 'Colas (sin respuestas automáticas)',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            'El entorno de S/MINE no funciona. Favor compruebe los registros para más nformación!',
        'Need param Filename to delete!' => 'Se requiere el Nombre de Archivo de parámetros para borrar!',
        'Need param Filename to download!' => 'Se requiere el Nombre de Archivo de parámetros para descargar!',
        'Needed CertFingerprint and CAFingerprint!' => 'Se requiería CertFingerprint and CAFingerprint!',
        'CAFingerprint must be different than CertFingerprint' => 'CAFingerprint debe ser diferente de CertFingerprint',
        'Relation exists!' => 'La Relación existe!',
        'Relation added!' => '¡Relación añadida!',
        'Impossible to add relation!' => '¡Imposible añadir relación!',
        'Relation doesn\'t exists' => 'La Relación no existe',
        'Relation deleted!' => '¡Relación eliminada!',
        'Impossible to delete relation!' => 'Imposible eliminar relación!',
        'Certificate %s could not be read!' => 'El Certificado %s no se puede leer!',
        'Needed Fingerprint' => 'Huella requerida',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation updated!' => '¡Saludo actualizado!',
        'Salutation added!' => '¡Saludo añadido!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => '¡No se pudo leer el archivo %s!',

        # Perl Module: Kernel/Modules/AdminSysConfig.pm
        'Import not allowed!' => 'No se permite Importar!',
        'Need File!' => 'Se necesita el Archivo!',
        'Can\'t write ConfigItem!' => 'No se puede crear Unidad de Configuración.',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => 'Fecha de Inicio no debería ser definida después de Fecha de finalización!',
        'There was an error creating the System Maintenance' => 'Se produjo un error al crear el Mantenimiento de Sistema',
        'Need SystemMaintenanceID!' => 'Se requiere ID de Mantenimiento de Sistema ',
        'Could not get data for SystemMaintenanceID %s' => 'No se pudieron obtener los datos de ID de Mantenimiento del Sistema %s',
        'System Maintenance was saved successfully!' => 'el Mantenimiento del Sistema se guardó exitosamente!',
        'Session has been killed!' => 'La sesión ha sido finalizada!',
        'All sessions have been killed, except for your own.' => 'Todas las sesiones se han cerrado, excepto la suya propia.',
        'There was an error updating the System Maintenance' => 'Se produjo un error al actualizar el Mantenimiento del Sistema',
        'Was not possible to delete the SystemMaintenance entry: %s!' => 'No se pudo borrar la entrada del Mantenimiento del Sistema: %s!',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => '¡Plantilla actualizada!',
        'Template added!' => '¡Plantilla añadida!',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => '¡Se requiere el Tipo!',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => 'No existe tal configuración para %s',
        'Statistic' => 'Estadística',
        'No preferences for %s!' => '¡No hay preferencias para %s!',
        'Can\'t get element data of %s!' => 'No se pudieron obtener los datos de elementos de %s!',
        'Can\'t get filter content data of %s!' => 'No se pudieron obtener los datos de filtro de contenido de %s!',
        'Customer Company Name' => 'Nombre de la Empresa del Cliente',
        'Customer User ID' => 'ID de Usuario Cliente',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => 'Se requiere  Objeto de Fuente y Clave de Fuente!',
        'Please contact the administrator.' => 'Por favor contacte el administrador.',
        'You need ro permission!' => 'Necesita permiso ro !',
        'Can not delete link with %s!' => '¡No se puede borrar el enlace con %s!',
        'Can not create link with %s! Object already linked as %s.' => '¡No se puede crear un enlace con % s! El objeto ya esta enlazado con % s.',
        'Can not create link with %s!' => 'No se puede crear enlace con %s!',
        'The object %s cannot link with other object!' => 'El objeto %s no puede vincularse con otro objeto!',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => 'Se requiere Grupo de parámetros!',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => 'Falta el parámetro %s',
        'Invalid Subaction.' => 'Subaccion Invalida.',
        'Statistic could not be imported.' => 'Las estadísticas no pudieron ser importadas.',
        'Please upload a valid statistic file.' => 'Por favor suba un archivo estadístico válido.',
        'Export: Need StatID!' => 'Exportar: se necesita ID de Estadística!',
        'Delete: Get no StatID!' => 'Borrar: No se pudo obtener ID de Estadística!',
        'Need StatID!' => 'Se necesita ID de Estadística!',
        'Could not load stat.' => 'No se pudo cargar la estadística.',
        'Could not create statistic.' => 'No se pudo crear la estadística.',
        'Run: Get no %s!' => 'Ejecución: No se pudo obtener %s!',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => 'Ningún TicketID está dado!',
        'You need %s permissions!' => 'Necesita permisos %s!',
        'Could not perform validation on field %s!' => 'No se pudo realizar validación en campo %s!',
        'No subject' => 'Sin asunto',
        'Previous Owner' => 'Propietario anterior',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '¡%s es necesario!',
        'Plain article not found for article %s!' => 'Artículo sencillo no está encontrado para el artículo %s!',
        'Article does not belong to ticket %s!' => 'El artículo no pertenece al ticket %s!',
        'Can\'t bounce email!' => '¡No se puede rebotar el correo electrónico!',
        'Can\'t send email!' => '¡No se puede enviar el correo!',
        'Wrong Subaction!' => '¡Subacción incorrecta!',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => 'No se puede bloquear los Ticket, ningún TicketID está dado!',
        'Ticket (%s) is not unlocked!' => '¡El ticket (% s) no está desbloqueado!',
        'Bulk feature is not enabled!' => 'La característica básica no está habilitada!',
        'No selectable TicketID is given!' => 'Ningún TicketID seleccionable está dado!',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            'No seleccionaste ningún ticket ó solamente seleccionaste los tickets que están bloqueados por otros agentes.',
        'You need to select at least one ticket.' => 'Debe seleccionar al menos un ticket.',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            'Los siguientes tickets fueron ignorados porque están bloqueadas por otro agente o no tiene acceso de escritura a estos tickets: %s.',
        'The following tickets were locked: %s.' => 'Los siguientes tickets fueron bloqueados: %s.',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Can not determine the ArticleType!' => 'No se puede determinar el Tipo de Artículo!',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'No Subaction!' => '¡No hay Subacción!',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => '¡No tiene TicketID!',
        'System Error!' => '¡Error del sistema!',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Invalid Filter: %s!' => '¡Filtro no válido:% s!',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => 'No se puede mostrar el historial, no se da el TicketID!',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => 'No se puede bloquear el Ticket, no se da el TicketID!',
        'Sorry, the current owner is %s!' => '¡Lo siento, el nuevo propietario es %s!',
        'Please become the owner first.' => '¡Por favor, conviértete en el propietario primero!',
        'Ticket (ID=%s) is locked by %s!' => '¡Ticket (ID=%s) esta bloqueado por %s!',
        'Change the owner!' => '¡Cambia el propietario!',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => '¡No se puede fusionar el Ticket con sí mismo!',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => '¡Necesitas permisos de movimiento!',

        # Perl Module: Kernel/Modules/AgentTicketPhone.pm
        'Chat is not active.' => 'El chat no está activo.',
        'No permission.' => 'No tiene permisos.',
        '%s has left the chat.' => '%s ha dejado la conversación.',
        'This chat has been closed and will be removed in %s hours.' => 'Esta conversación ha sido cerrada y será removida en %s horas.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => '¡No hay ID de Artículo!',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            'No se pudo leer el artículo sencillo! Tal vez no existe ningún correo sencillo en el procesador adicional. Lee el mensaje del procesador adicional.',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => '¡Se necesita TicketID!',
        'printed by' => 'impreso por',
        'Ticket Dynamic Fields' => 'Campos dinámicos del ticket',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => 'No se pudo obtener el ID de la Entidad del Diálogo de Actividad "%s"!',
        'No Process configured!' => 'Ningún Proceso configurado!',
        'Process %s is invalid!' => '¡El proceso %s no es válido!',
        'Subaction is invalid!' => '¡La subacción no es válida!',
        'Parameter %s is missing in %s.' => 'Falta el parámetro %s en %s.',
        'No ActivityDialog configured for %s in _RenderAjax!' => 'Ningún Diálogo de Actividad configurado para %s en _RenderAjax!',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            'No se pudo Iniciar ningún ID de la Entidad de Actividad ó Iniciar ID de la Entidad de Diálogo de Actividad para Proceso: %s en _Obtener Parámetros!',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => 'No se pudo obtener el Ticket para TicketID: %s en Obtener Parámetros!',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            'No se pudo determinar el ID de Entidad de Actividad. Campo Dinámico ó la Configuración no está instalada apropiadamente!',
        'Process::Default%s Config Value missing!' => 'Proceso: falta el Valor de Configuración Predeterminada%s! ',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            'No se pudo obtener ningún ID de la Entidad de Proceso ó TicketID y ID de Entidad de Diálogo de la Actividad!',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            'No se pudo obtener el Diálogo de Inicio de Actividad y el Diálogo de Inicio de Actividad para  el ID de Entidad de Proceso "%s"!',
        'Can\'t get Ticket "%s"!' => '¡No se puede obtener el Ticket "%s"!',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            'No se pudieron obtener el ID de Entidad de Proceso ó ID de Entidad de Actividad para TicketID "%s"!',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            'No se puede obtener la configuración de Actividad para ID de Entidad de Actividad "%s"!',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            'No se puede obtener la configuración del Diálogo de Actividad para ID de Entidad del Diálogo de Actividad "%s"!',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => 'No se pudieron obtener los datos para el Campo "%s" del Diálogo de Actividad "%s"!',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            'El TiempoPendiente puede usarse sí el Estado ó ID de Estado está configurado para el mismo Diálogo de Actividad. Diálogo de Actividad: %s!',
        'Pending Date' => 'Fecha pendiente',
        'for pending* states' => 'para estados pendiente*',
        'ActivityDialogEntityID missing!' => 'Falta el ID de Entidad de Diálogo de Actividad!',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => 'No se pudo obtener la Configuración para el ID de Entidad de Diálogo de Actividad "%s"!',
        'Couldn\'t use CustomerID as an invisible field.' => 'No se pudo usar el ID del Cliente cómo el campo invisible.',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            'Falta el ID de Entidad del Proceso, revise su ActivityDialogHeader.tt!',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            'Ningún Diálogo de Inicio de Actividad ó Diálogo de Inicio de Actividad para el Proceso "%s" está configurado!',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            'No se pudo crear el ticket para el Proceso con ID de Entidad del Proceso "%s"!',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => 'No se pudo ajustar el ID de Entidad del Proceso "%s" en TicketID "%s"!',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => 'No se pudo establecer el ID de Entidad de Actividad "%s" en TicketID "%s"!',
        'Could not store ActivityDialog, invalid TicketID: %s!' => 'No se pudo almacenar el Diálogo de Actividad, TicketID inválido: %s!',
        'Invalid TicketID: %s!' => '¡TicketID no valido: %s!',
        'Missing ActivityEntityID in Ticket %s!' => 'Falta ID de Entidad de Actividad en Ticket %s!',
        'This step does not belong anymore the current activity in process for Ticket %s!' =>
            '',
        'Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            '',
        'Missing ProcessEntityID in Ticket %s!' => 'Falta ID de Entidad de Proceso en Ticket %s!',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'No se pudo establecer el valor del Campo Dinámico para %s de Ticket con ID "%s" en Diálogo de Actividad "%s"!',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'No se pudo establecer el TiempoPendiente para Ticket con ID "%s" en Diálogo de Actividad "%s"!',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            'La configuración del Campo de Diálogo de Actividad equivocada: %s no puede ser Mostrar=> 1 /Demostrar el campo (Favor cambie su configuración a Mostrar=> 0 / No demostrar el campo ó Mostrar=> 2 / Demostrar el campo como obligatorio)!',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'No se pudo establecer %s para el Ticket con ID "%s" en Diálogo de Actividad "%s"!',
        'Default Config for Process::Default%s missing!' => 'Configuración Predeterminada para el Proceso: falta Predetermiada%s!',
        'Default Config for Process::Default%s invalid!' => 'Configuración Predeterminada para el Proceso: Predeterminada%s inválida!',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'Untitled' => 'Sin titulo',
        'Customer Name' => 'Nombre del cliente',
        'Invalid Users' => 'Usuarios no válidos',
        'CSV' => 'CSV',
        'Excel' => 'Excel',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => '¡La característica no está habilitada!',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => 'La característica no está activada',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'Link Deleted' => 'Enlace borrado',
        'Ticket Locked' => 'Ticket Bloqueado',
        'Pending Time Set' => 'Establecer el Tiempo Pendiente',
        'Dynamic Field Updated' => 'Campo dinámico actualizado',
        'Outgoing Email (internal)' => 'Correo Saliente (Interno)',
        'Ticket Created' => 'Ticket Creado',
        'Type Updated' => 'Tipo Actualizado',
        'Escalation Update Time In Effect' => 'Tiempo de Actualización en Escalada en Efecto',
        'Escalation Update Time Stopped' => 'Tiempo de Actualización en Escalada Parado',
        'Escalation First Response Time Stopped' => 'Tiempo de la Primera Respuesta en Escalada Parado',
        'Customer Updated' => 'Cliente actualizado',
        'Internal Chat' => 'Chat interno',
        'Automatic Follow-Up Sent' => 'Seguimiento Automático Enviado',
        'Note Added' => 'Nota añadida',
        'Note Added (Customer)' => 'Nota añadida (cliente)',
        'State Updated' => 'Estado actualizado',
        'Outgoing Answer' => 'Respuesta Saliente',
        'Service Updated' => 'Servicio actualizado',
        'Link Added' => 'Link añadido',
        'Incoming Customer Email' => 'Mensaje entrante de cliente',
        'Incoming Web Request' => 'Solicitud de Web Entrante',
        'Priority Updated' => 'Prioridad actualizada',
        'Ticket Unlocked' => 'Ticket Desbloqueado',
        'Outgoing Email' => 'Mensaje saliente',
        'Title Updated' => 'Titulo actualizado',
        'Ticket Merged' => 'Ticket Fusionado',
        'Outgoing Phone Call' => 'Llamada Telefónica Saliente',
        'Forwarded Message' => 'Mensaje reenviado',
        'Removed User Subscription' => 'Suscripción de Usuario Eliminada',
        'Time Accounted' => 'Cuenta de tiempo',
        'Incoming Phone Call' => 'Llamada Telefónica Entrante',
        'System Request.' => 'Solicitud del sistema.',
        'Incoming Follow-Up' => 'Seguimiento Entrante',
        'Automatic Reply Sent' => 'Respuesta Automática Enviada',
        'Automatic Reject Sent' => 'Rechazo Automático Enviado',
        'Escalation Solution Time In Effect' => 'Tiempo de Solución en Escalada En Efecto',
        'Escalation Solution Time Stopped' => 'Tiempo de Solución en Escalada Parado',
        'Escalation Response Time In Effect' => 'Tiempo de Respuesta en Escalada En Efecto',
        'Escalation Response Time Stopped' => 'Tiempo de Respuesta en Escalada Parado',
        'SLA Updated' => 'SLA actualizado',
        'Queue Updated' => 'Cola actualizada',
        'External Chat' => 'Chat externo',
        'Queue Changed' => 'Cola cambiada',
        'Notification Was Sent' => 'Notificación enviada',
        'We are sorry, you do not have permissions anymore to access this ticket in its current state.' =>
            'Lo sentimos, usted ya no tiene permisos para acceder a este ticket en su estado actual.',
        'Can\'t get for ArticleID %s!' => 'No se lo pudo obtener para el ID de Artículo %s!',
        'Article filter settings were saved.' => 'Los ajustes de filtro de artículos fueron guardados.',
        'Event type filter settings were saved.' => 'Los ajustes de filtro de tipo de evento fueron guardados.',
        'Need ArticleID!' => 'Se requiere el ID de Artículo!',
        'Invalid ArticleID!' => 'El ID de Artículo inválido!',
        'Offline' => 'Desconectado',
        'User is currently offline.' => 'El usuario está desconectado.',
        'User is currently active.' => 'El usuario está conectado.',
        'Away' => 'Ausente',
        'User was inactive for a while.' => 'El usuario estuvo inactivo por un tiempo.',
        'Unavailable' => 'No disponible',
        'User set their status to unavailable.' => 'El usuario establece su estado como no disponible.',
        'Fields with no group' => 'Campos sin grupo',
        'View the source for this Article' => 'Ver la fuente de este artículo',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => 'Se requieren el ID de Archivo y el ID de Artículo! ',
        'No TicketID for ArticleID (%s)!' => 'Ningún TicketID para el ID de Artículo (%s)!',
        'No such attachment (%s)!' => '¡No existe el archivo adjunto (%s)!',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => 'Revise los ajustes de la Configuración del Sistema para %s::FilaPredeterminada.',
        'Check SysConfig setting for %s::TicketTypeDefault.' => 'Revise los ajustes de la Configuración del Sistema para %s::TipodeTicketPredeterminado.',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => '¡Se necesita la Identificación del cliente!',
        'My Tickets' => 'Mis Tickets',
        'Company Tickets' => 'Tickets de Empresa',
        'Untitled!' => '¡Sin título!',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Please remove the following words because they cannot be used for the search:' =>
            'Por favor quite las siguientes palabras porque no pueden ser utilizadas en la búsqueda:',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => 'No se puede reabrir el ticket, ¡No es posible en esta cola!',
        'Create a new ticket!' => '¡Crear un nuevo Ticket!',

        # Perl Module: Kernel/Modules/Installer.pm
        'Directory "%s" doesn\'t exist!' => '¡El directorio "%s" no existe!',
        'Configure "Home" in Kernel/Config.pm first!' => 'Configurar "Casa" en Kernel/Config.pm primero!',
        'File "%s/Kernel/Config.pm" not found!' => '¡Archivo "%s/Kernel/Config.pm" no encontrado!',
        'Directory "%s" not found!' => '¡Directorio "%s" no encontrado!',
        'Kernel/Config.pm isn\'t writable!' => 'Kernel/Config.pm no es modificable!',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            'Si quieres usar el instalador, establece el Kernel/Config.pm modificable para el usuario de servicio web.',
        'Unknown Check!' => 'Cheque Desconocido!',
        'The check "%s" doesn\'t exist!' => 'El cheque "%s" no existe!',
        'Database %s' => 'Base de datos %s',
        'Configure MySQL' => '',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => 'Tipo de base de datos desconocida "%s".',
        'Please go back.' => 'Por favor, vuelve atrás.',
        'Install OTRS - Error' => 'Instalar OTRS - Error',
        'File "%s/%s.xml" not found!' => '¡Archivo "%s/%s.xml" no encontrado!',
        'Contact your Admin!' => '¡Contacta con tu Administrador!',
        'Syslog' => '',
        'Can\'t write Config file!' => 'No se puede crear el Archivo de Configuración.',
        'Unknown Subaction %s!' => 'Subacción Desconocida %s!',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            'No se puede conectar ala base de datos, Modulo Perl DBD::%s No Instalado!',
        'Can\'t connect to database, read comment!' => '¡No se puede conectar a la base de datos, lee el comentario!',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Error: Por favor, asegúrese de que su base de datos acepta paquetes de más de %s MB de tamaño (actualmente sólo acepta paquetes hasta %s MB). Por favor, adaptar el ajuste max_allowed_packet de su base de datos con el fin de evitar errores.',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            'Error: Por favor, establezca el valor de innodb_log_file_size en su base de datos para al menos %s MB ( actual: %s MB, recomendado: %s MB). Para obtener más información, por favor, eche un vistazo a %s.',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => 'Se necesita configurar Paquete::Registro de Acceso a Repositorio Expirado ',
        'Authentication failed from %s!' => 'Autenticación fallida desde %s!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Sent message crypted to recipient!' => 'Mensaje enviado encriptado al destinatario!',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '"Mensaje Firmado PGP " se encontró el encabezado, pero no es válido!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '"Mensaje Firmado S/MIME" se encontró el encabezado, pero no es válido!',
        'Ticket decrypted before' => 'Ticket descifrado antes',
        'Impossible to decrypt: private key for email was not found!' => 'Imposible descifrar: ¡No se encontró la clave privada para el correo electrónico!',
        'Successful decryption' => 'Descifrado exitoso',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => 'La hora de inicio de un ticket se ha configurado después de la hora de finalización!',

        # Perl Module: Kernel/Output/HTML/Dashboard/News.pm
        'Can\'t connect to OTRS News server!' => 'No se puede conectar al servidor de Noticias de OTRS!',
        'Can\'t get OTRS News from server!' => 'No se pueden obtener Noticias OTRS desde el servidor!',

        # Perl Module: Kernel/Output/HTML/Dashboard/ProductNotify.pm
        'Can\'t connect to Product News server!' => 'No se puede conectar con el Servidor de Noticias de Productos.',
        'Can\'t get Product News from server!' => 'No se pueden obtener Noticias de Productos desde el servidor!',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => '¡No se puede conectar a %s!',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'sorted ascending' => 'orden ascendente',
        'sorted descending' => 'orden descendente',
        'filter not active' => 'filtro no activo',
        'filter active' => 'filtro activo',
        'This ticket has no title or subject' => 'Este ticket no tiene título o asunto',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'We are sorry, you do not have permissions anymore to access this ticket in its current state. You can take one of the following actions:' =>
            'Lo sentimos, ya no tienes permisos para acceder a este ticket en su estado actual. Puede realizar una de las siguientes acciones:',
        'No Permission' => 'Sin permisos',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Enlazado como',
        'Search Result' => 'Resultado de la búsqueda',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => 'Archivar la búsqueda',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOTRSBusiness.pm
        '%s Upgrade to %s now! %s' => '%s ¡Actualizar ahora a %s! %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'A system maintenance period will start at: ' => 'El periodo de mantenimiento de sistema comenzará a las:',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(en proceso)',

        # Perl Module: Kernel/Output/HTML/Preferences/NotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            'Por favor asegúrese de haber seleccionado al menos un medio de transporte para las notificaciones obligatorias.',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'Por favor especifique una fecha de término posterior a la fecha de inicio.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Please supply your new password!' => '¡Por favor ingrese una nueva contraseña!',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'No (not supported)' => 'No (no soportado)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            'No esta seleccionado el valor de tiempo relativo completo de pasado ó de actual+próximo.
 ',
        'The selected time period is larger than the allowed time period.' =>
            'El periodo de tiempo seleccionado es mayor que el periodo de tiempo permitido.',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            'No hay valor disponible de escala de tiempo para la escala de tiempo actualmente seleccionada en el eje X.',
        'The selected date is not valid.' => 'La fecha seleccionada no es válida.',
        'The selected end time is before the start time.' => 'La fecha de finalización seleccionada es anterior a la de inicio.',
        'There is something wrong with your time selection.' => 'Hay un error con su selección de tiempo.',
        'Please select only one element or allow modification at stat generation time.' =>
            'Por favor seleccione sólo un elemento o permita su modificación al momento de generación de la estadística.',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            'Por favor seleccione al menos un valor de este campo o permita su modificación al momento de generación de la estadística.',
        'Please select one element for the X-axis.' => 'Por favor seleccione un elemento para el Eje-X.',
        'You can only use one time element for the Y axis.' => 'Sólo puede utilizar un elemento de tiempo para el eje Y.',
        'You can only use one or two elements for the Y axis.' => 'Sólo puedes usar uno o dos elementos para el eje Y.',
        'Please select at least one value of this field.' => 'Por favor seleccione al menos un valor para este campo.',
        'Please provide a value or allow modification at stat generation time.' =>
            'Por favor ingrese un valor o permita su modificación al momento de generación de la estadística.',
        'Please select a time scale.' => 'Por favor seleccione una escala de tiempo.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            'El intervalo de tiempo para los reportes es demasiado pequeño, por favor utilice una escala de tiempo más grande.',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            'Por favor quite las siguientes palabras debido a que no pueden ser utilizadas para las restricciones del ticket: %s.',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Ordenar por',

        # Perl Module: Kernel/System/AuthSession.pm
        'You have exceeded the number of concurrent agents - contact sales@otrs.com.' =>
            'Ha superado el número máximo de agentes concurrentes  - póngase en contacto con sales@otrs.com.',
        'Please note that the session limit is almost reached.' => 'Tenga en cuenta que el límite de sesión casi se ha alcanzado.',
        'Login rejected! You have exceeded the maximum number of concurrent Agents! Contact sales@otrs.com immediately!' =>
            '¡Inicio de sesión rechazado! Ha superado el número máximo de agentes concurrentes. ¡Póngase en contacto con sales@otrs.com inmediatamente!',
        'Session per user limit reached!' => '¡Se ha alcanzado el límite de sesión por usuario!',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'Referencia de Opciones de Configuración',
        'This setting can not be changed.' => 'Este ajuste no puede ser cambiado.',
        'This setting is not active by default.' => 'Esta opción no esta activa por omisión.',
        'This setting can not be deactivated.' => 'Este ajuste no puede ser deshabilitado.',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => 'no instalado',
        'File is not installed!' => '¡El archivo no esta instalado!',
        'File is different!' => '¡El archivo es diferente!',
        'Can\'t read file!' => '¡El archivo no se puede leer!',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Inactivo',
        'FadeAway' => 'Agotado',

        # Perl Module: Kernel/System/Registration.pm
        'Can\'t get Token from sever' => 'No se puede obtener el Token desde el servidor',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Suma',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Tipo de Estado',
        'Created Priority' => 'Prioridad de creación',
        'Created State' => 'Estado de creación',
        'Create Time' => 'Fecha de creación',
        'Close Time' => 'Fecha de cierre',
        'Escalation - First Response Time' => 'Escalada - Fecha de la primera respuesta',
        'Escalation - Update Time' => 'Escalada - Fecha de actualización',
        'Escalation - Solution Time' => 'Escalada - Fecha de solución',
        'Agent/Owner' => 'Agente/Propietario',
        'Created by Agent/Owner' => 'Creado por Agente/Propietario',
        'CustomerUserLogin' => 'Nombre de usuario del cliente',
        'CustomerUserLogin (complex search)' => 'Login del Usuario Cliente (búsqueda compleja) ',
        'CustomerUserLogin (exact match)' => 'Login de Usuario Cliente (coincidencia exacta)',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Evaluación por',
        'Ticket/Article Accounted Time' => 'Tiempo utilizado por ticket/artículo',
        'Ticket Create Time' => 'Hora de creación del ticket',
        'Ticket Close Time' => 'Hora de finalización del ticket',
        'Accounted time by Agent' => 'Tiempo utilizado por el Agente',
        'Total Time' => 'Tiempo total',
        'Ticket Average' => 'Media de los tickets',
        'Ticket Min Time' => 'Tiempo mínimo de los tickets',
        'Ticket Max Time' => 'Teimpo máximo de los tickets',
        'Number of Tickets' => 'Número de tickets',
        'Article Average' => 'Media de los artículos',
        'Article Min Time' => 'Tiempo mínimo de los artículos',
        'Article Max Time' => 'Tiempo máximo de los artículos',
        'Number of Articles' => 'Número de artículos',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => 'ilimitado',
        'ascending' => 'ascendente',
        'descending' => 'descendente',
        'Attributes to be printed' => 'Atributos a imprimir',
        'Sort sequence' => 'Ordenar la secuencia',
        'State Historic' => 'Histórico de Estado',
        'State Type Historic' => 'Estado Tipo Histórico',
        'Historic Time Range' => 'Rango Tiempo Histórico',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => 'Promedio de la solución',
        'Solution Min Time' => 'Tiempo mínimo de la solución',
        'Solution Max Time' => 'Tiempo máximo de la solución',
        'Solution Average (affected by escalation configuration)' => 'Solución promedia (afectada por la configuración de escalada)',
        'Solution Min Time (affected by escalation configuration)' => 'Tiempo Mínimo de Solución (afectada por la configuración de escalada)',
        'Solution Max Time (affected by escalation configuration)' => 'Tiempo Máximo de Solución (afectada por la configuración de escalada)',
        'Solution Working Time Average (affected by escalation configuration)' =>
            'Tiempo de Trabajo Promedio de Solución (afectada por la configuración de escalada)',
        'Solution Min Working Time (affected by escalation configuration)' =>
            'Tiempo de Trabajo Mínimo de Solución (afectada por la configuración de escalada)',
        'Solution Max Working Time (affected by escalation configuration)' =>
            'Tiempo de Trabajo Máximo de Solución (afectada por la configuración de escalada)',
        'First Response Average (affected by escalation configuration)' =>
            '',
        'First Response Min Time (affected by escalation configuration)' =>
            '',
        'First Response Max Time (affected by escalation configuration)' =>
            '',
        'First Response Working Time Average (affected by escalation configuration)' =>
            '',
        'First Response Min Working Time (affected by escalation configuration)' =>
            '',
        'First Response Max Working Time (affected by escalation configuration)' =>
            '',
        'Number of Tickets (affected by escalation configuration)' => 'Número de Tickets (afectados por la configuración de escalada)',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'Días',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'Presencia de Tablas',
        'Internal Error: Could not open file.' => 'Error Interno: No se pude abrir el archivo',
        'Table Check' => 'Comprobación De Tablas',
        'Internal Error: Could not read file.' => 'Error Interno: No se pudo leer el archivo',
        'Tables found which are not present in the database.' => 'Tablas encontradas que no se encuentran presentes en la base de datos',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Tamaño de la Base De Datos',
        'Could not determine database size.' => 'No se pudo determinar el tamaño de la base de datos',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Versión de la Base de Datos',
        'Could not determine database version.' => 'No se pudo determinar la versión de la base de datos',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Juego de Caracteres de la Conexión del Cliente',
        'Setting character_set_client needs to be utf8.' => 'El ajuste character_set_client necesita ser utf8.',
        'Server Database Charset' => 'Juego de Caracteres del Servidor de Base de Datos',
        'Setting character_set_database needs to be UNICODE or UTF8.' => 'el ajuste de character_set_database necesita ser UNICODE o UTF8.',
        'Table Charset' => 'Juego de Caracter de la Tabla',
        'There were tables found which do not have utf8 as charset.' => 'Se encontrarón tablas las cuales el juego de caracteres no es utf8.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'Tamaño del Archivo Log InnoDB',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'El ajuste innodb_log_file_size debe ser de al menos 256 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Tamaño Máximo de la Consulta',
        'The setting \'max_allowed_packet\' must be higher than 20 MB.' =>
            'El ajuste \'max_allowed_packet\' debe ser mayor de 20 MB,',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Performance.pm
        'Query Cache Size' => 'Tamaño de la Cache de la Consulta',
        'The setting \'query_cache_size\' should be used (higher than 10 MB but not more than 512 MB).' =>
            'El ajuste \'query_cache_size\' debe ser usada (mayor de 10 MB pero no menor de 512 MB).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Motor Predeterminado de Almacenamiento',
        'Table Storage Engine' => 'Motor Almacenamiento Tabla',
        'Tables with a different storage engine than the default engine were found.' =>
            'Tablas con diferente motor de almacenamiento que la de por defecto fueron encontradas.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'MySQL 5.x o mayor es requerida.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'Ajuste NLS_LANG',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG debe estar establecido a al32utf8 (ej. GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'Ajuste NLS_DATE_FORMAT',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'NLS_DATE_FORMAT debe ser configurado a \'YYYY-MM-DD HH24:MI:SS\'.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'El ajuste NLS_DATE_FORMAT Comprobar SQL',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'El ajuste client_encoding necesita ser UNICODE o UTF8.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'El ajuste server_encoding necesita ser UNICODE o UTF8.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Formato de Fecha',
        'Setting DateStyle needs to be ISO.' => 'El ajuste DateStyle necesita ser ISO.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 8.x or higher is required.' => 'PostgreSQL 8.x o mayor es requerido.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionOTRS.pm
        'OTRS Disk Partition' => 'Partición del Disco OTRS',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Uso del Disco',
        'The partition where OTRS is located is almost full.' => 'La partición donde se localiza OTRS está casi lleno.',
        'The partition where OTRS is located has no disk space problems.' =>
            'La partición donde se localiza OTRS no tiene problemas de espacio de disco.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'Uso de la Partición del Disco',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Distribución',
        'Could not determine distribution.' => 'No se pudo determinar la distribución.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Versión del Kernel',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Carga del Sistema',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'La carga del sistema debe ser como máximo el número de CPUs que el sistema tiene (ejm. una carga de 8 o menos en un sistema con 8 CPUs esta OK).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Módulos De Perl',
        'Not all required Perl modules are correctly installed.' => 'No todos los modulos Perl requeridos están instalados correctamente.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Espacio de Intercambio Libre (%)',
        'No swap enabled.' => 'No permuta habilitada.',
        'Used Swap Space (MB)' => 'Espacio de Intercambio Usado (MB)',
        'There should be more than 60% free swap space.' => 'Debe haber mas del 60% de espacio de intercambio libre.',
        'There should be no more than 200 MB swap space used.' => 'Debe haber no mas de 200 MB de espacio de intercambio usado.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ConfigSettings.pm
        'OTRS' => 'OTRS',
        'Config Settings' => 'Configuraciones del sistema',
        'Could not determine value.' => 'No se pudo determinar el valor.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DaemonRunning.pm
        'Daemon' => 'Daemon',
        'Daemon is running.' => 'Daemon se esta ejecutando.',
        'Daemon is not running.' => 'Daemon no se está ejecutando.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DatabaseRecords.pm
        'Database Records' => 'Registros de la Base de Datos',
        'Tickets' => 'Tickets',
        'Ticket History Entries' => 'Entradas Del Historial De Ticket',
        'Articles' => 'Artículos',
        'Attachments (DB, Without HTML)' => 'Archivos adjuntos (BD, Sin HTML)',
        'Customers With At Least One Ticket' => 'Clientes con al menos un ticket',
        'Dynamic Field Values' => 'Valores de Campos Dinámicos',
        'Invalid Dynamic Fields' => 'Campo Dinámico Invalido',
        'Invalid Dynamic Field Values' => 'Valor del Campo Dinámico Invalido',
        'GenericInterface Webservices' => 'Servicios Web de la Interfaz Genérica',
        'Process Tickets' => 'Tickets de Proceso',
        'Months Between First And Last Ticket' => 'Meses entre el Primer y Último Ticket',
        'Tickets Per Month (avg)' => 'Tickets al Mes (promedio)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'SOAP Nombre de Usuario y Contraseña Por Defecto',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'Riesgo de Seguridad: Esta usando la configuración por defecto para SOAP::User y SOAP::Password. Por favor cambiela.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultUser.pm
        'Default Admin Password' => 'Contraseña Por Defecto Para Admin',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Riesgo de seguridad: la cuenta del agente root@localhost todavía tiene la contraseña predeterminada. Por favor cámbiala o invalida la cuenta.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ErrorLog.pm
        'Error Log' => 'Registro de Errores',
        'There are error reports in your system log.' => 'Existen reportes de error en el registro del sistema.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FQDN.pm
        'FQDN (domain name)' => 'FQDN (nombre de dominio)',
        'Please configure your FQDN setting.' => 'Por favor configure ajuste de su FQDN.',
        'Domain Name' => 'Nombre de Dominio',
        'Your FQDN setting is invalid.' => 'Su configuración FQDN no es válida.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FileSystemWritable.pm
        'File System Writable' => 'Sistema de Archivos Grabable',
        'The file system on your OTRS partition is not writable.' => 'El sistema de archivos de la partición OTRS no es grabable.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageDeployment.pm
        'Package Installation Status' => 'Estado de Instalación del Paquete',
        'Some packages have locally modified files.' => 'Algunos paquetes tienen archivos modificados localmente.',
        'Some packages are not correctly installed.' => 'Algunos paquetes no estan correctamente instalados.',
        'Package Verification Status' => 'Estado de verificación del paquete',
        'Some packages are not verified by the OTRS Group! It is recommended not to use this packages.' =>
            '¡Algunos paquetes no ha sido verificados por OTRS group! Se recomienda no utilizar estos paquetes.',
        'Package Framework Version Status' => 'Estado de la versión del paquete Framework ',
        'Some packages are not allowed for the current framework version.' =>
            'Algunos paquetes no están permitidos para la versión actual del framework.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageList.pm
        'Package List' => 'Listado de paquetes',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SessionConfigSettings.pm
        'Session Config Settings' => 'Ajustes de Configuración de Sesión.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SpoolMails.pm
        'Spooled Emails' => 'Emails están en portapapeles',
        'There are emails in var/spool that OTRS could not process.' => 'Se encuentran emails en var/spool cuáles no pueden ser procesados por OTRS.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'El ajuste del ID del Sistema es es valido, debe contener solamente dígitos.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/DefaultType.pm
        'Default Ticket Type' => 'Tipo de Ticket predeterminado',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            'El tipo predeterminado de ticket configurado está inválido ó se falta. Favor, cambie los ajustes Ticket::Type::Default y seleccione el tipo de ticket válido.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Módulo De Índice de Tickets',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Usted tiene más de 60,000 tickets y debería usar el backend StaticDB. Ver el manual admin (Optimización del Rendimiento) para más información.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => 'Usuarios no válidos con Tickets bloqueados',
        'There are invalid users with locked tickets.' => 'Hay usuarios no válidos con Tickets bloqueados.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/OpenTickets.pm
        'Open Tickets' => 'Tickets Abiertos',
        'You should not have more than 8,000 open tickets in your system.' =>
            'No debe tener más de 8.000 tickets abiertos en su sistema.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'Módulo Índice Búsqueda de Ticket',
        'You have more than 50,000 articles and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Usted tiene más de 50.000 artículos y debería usar el backend StaticDB. Ver el manual admin (Optimización del Rendimiento) para más información.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => 'Registros Huérfanos En La Tabla ticket_lock_index',
        'Table ticket_lock_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'La tabla ticket_lock_index contiene registros huérfanos. Por favor ejectute bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" para limpiar el índice StaticDB.',
        'Orphaned Records In ticket_index Table' => 'Registros Huerfanos en la Tabla ticket_index',
        'Table ticket_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'La tabla ticket_index contiene registros perdidos. Favor inicie bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" para limpiar el StaticDB index.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/TimeSettings.pm
        'Time Settings' => 'Ajustes de hora',
        'Server time zone' => 'Zona horaria del servidor',
        'Computed server time offset' => 'Desfase calculado de hora del servidor',
        'OTRS TimeZone setting (global time offset)' => 'Configuración de la Zona Horaria de OTRS (compensación de hora global) ',
        'TimeZone may only be activated for systems running in UTC.' => 'La Zona Horaria sólo puede ser activada en sistemas que operan en UTC.',
        'OTRS TimeZoneUser setting (per-user time zone support)' => 'Los ajustes del Usuario de la Zona Horaria de OTRS (soporte por usuario de la zona horaria)',
        'TimeZoneUser may only be activated for systems running in UTC that don\'t have an OTRS TimeZone set.' =>
            'El Usuario de la Zona Horaria solo puede ser activado para los sistemas que operan en  UTC que no tiene la Zona Horaria de OTRS establecida.',
        'OTRS TimeZone setting for calendar ' => 'Ajustes OTRS TimeZone para calendario',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Servidor Web',
        'Loaded Apache Modules' => 'Módulos Apache Cargados',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'modelo MPM',
        'OTRS requires apache to be run with the \'prefork\' MPM model.' =>
            'OTRS requiere apache para ejecutarse con el módulo \'prefork\' MPM.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'Uso Del Acelerador de CGI',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'Usted debe usar FastCGI o mod_perl para aumentar el rendimiento.',
        'mod_deflate Usage' => 'Uso del mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => 'Por favor instale mod_deflate para mejorar la velocidad del GUI',
        'mod_filter Usage' => 'Uso de mod_filter',
        'Please install mod_filter if mod_deflate is used.' => 'Por favor, instale el módulo mod_filter si se utiliza el módulo mod_deflate.',
        'mod_headers Usage' => 'Uso del mod_headers',
        'Please install mod_headers to improve GUI speed.' => 'Por favor instale mod_headers para mejorar la velocidad del GUI',
        'Apache::Reload Usage' => 'Uso del Apache::Reload',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'Apache::Reload o Apache2::Reload debe ser usado como PerlModulo y PerlInitHandler para prevenir que el servidor web se reinicie cuando se instala o se actualiza un módulo.',
        'Apache2::DBI Usage' => 'Uso Apache2::DBI',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'Apache2::DBI debe ser usado para obtener un rendimiento mejor con conexiones de base de datos prestablecidas.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => 'Variables de entorno',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => 'Colección de Datos de Soporte',
        'Support data could not be collected from the web server.' => 'No se pudo recopilar datos de soporte desde el servidor web.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Versión del Servidor Web',
        'Could not determine webserver version.' => 'No se pudo determinar la versión del servidor web.',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/OTRS/ConcurrentUsers.pm
        'Concurrent Users Details' => 'Detalles de Usuarios Concurrentes',
        'Concurrent Users' => 'Usuarios Concurrentes',

        # Perl Module: Kernel/System/SupportDataCollector/PluginBase.pm
        'Unknown' => 'Desconocido',
        'OK' => 'Aceptar',
        'Problem' => 'Problema',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => 'Reajuste del tiempo desbloqueado.',

        # Perl Module: Kernel/System/Ticket/Event/NotificationEvent/Transport/Email.pm
        'PGP sign only' => 'Solo Firma PGP',
        'PGP encrypt only' => 'Solo Cifrado PGP',
        'PGP sign and encrypt' => 'PGP firma y codificación',
        'SMIME sign only' => '',
        'SMIME encrypt only' => '',
        'SMIME sign and encrypt' => '',
        'PGP and SMIME not enabled.' => '',
        'Skip notification delivery' => 'Omitir notificación de entrega',
        'Send unsigned notification' => 'Enviar notificaciones sin firmar',
        'Send unencrypted notification' => '',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Panic, user authenticated but no user data can be found in OTRS DB!! Perhaps the user is invalid.' =>
            '',
        'Can`t remove SessionID.' => '',
        'Logout successful.' => 'Sesión cerrada con éxito.',
        'Panic! Invalid Session!!!' => '¡Pánico! ¡¡¡Sesión no válida!!!',
        'No Permission to use this frontend module!' => '',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            '',
        'Reset password unsuccessful. Please contact the administrator.' =>
            'No se pudo reestablecer la contraseña. Por favor contacte con el administrador.',
        'Added via Customer Panel (%s)' => 'Añadido a través de Panel de clientes (%s)',
        'Customer user can\'t be added!' => '¡El usuario del cliente no puede ser agregado!',
        'Can\'t send account info!' => '¡No se puede enviar información de la cuenta!',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'SecureMode active!' => '¡Modo seguro activo!',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            'Si desea volver a ejecutar el instalador, desactive el modo seguro en SysConfig.',
        'Action "%s" not found!' => '¡Acción "% s" no encontrada!',

        # Database XML Definition: scripts/database/otrs-initial_insert.xml
        'Group for default access.' => 'Grupo para acceso por defecto.',
        'Group of all administrators.' => 'Grupo de todos los administradores.',
        'Group for statistics access.' => 'Grupo para acceso a estadísticas.',
        'All new state types (default: viewable).' => 'Todos los nuevos tipos de estado (por defecto: visible). ',
        'All open state types (default: viewable).' => 'Todos los tipos de estado abierto (por defecto: visible). ',
        'All closed state types (default: not viewable).' => 'Todos los tipos de estado cerrado (por defecto: no visible). ',
        'All \'pending reminder\' state types (default: viewable).' => 'Todos los tipos de estado \'recordatorio en espera\' (por defecto: visible). ',
        'All \'pending auto *\' state types (default: viewable).' => 'Todos los tipos de estado \'en espera auto\' (por defecto: visible). ',
        'All \'removed\' state types (default: not viewable).' => 'Todos los tipos de estado \'eliminado\' (por defecto: no visible). ',
        'State type for merged tickets (default: not viewable).' => 'Tipo de estado para tickets fusionados (por defecto: no visible). ',
        'New ticket created by customer.' => 'Nuevo ticket creado por cliente.',
        'Ticket is closed successful.' => 'El ticket está cerrado con éxito.',
        'Ticket is closed unsuccessful.' => 'El ticket está cerrado sin éxito.',
        'Open tickets.' => 'Tickets abiertos.',
        'Customer removed ticket.' => 'El Cliente quitó el ticket.',
        'Ticket is pending for agent reminder.' => 'Ticket está pendiente de recordatorio de agente.',
        'Ticket is pending for automatic close.' => 'Ticket está pendiente para cierre automático.',
        'State for merged tickets.' => 'Estado para tickets fusionados.',
        'system standard salutation (en)' => 'saludo sistema estandar (en)',
        'Standard Salutation.' => 'Saludo Estándar',
        'system standard signature (en)' => 'firma sistema estandar (en)',
        'Standard Signature.' => 'Firma Estándar',
        'Standard Address.' => 'Dirección Estandar',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'Los seguimientos para tickets cerrados son posibles. El ticket será reabierto.',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'Los seguimientos para tickets cerrados no son posibles. No se creará un nuevo ticket.',
        'new ticket' => 'nuevo ticket',
        'Follow-ups for closed tickets are not possible. A new ticket will be created..' =>
            'Los seguimientos para tickets cerrados no son posibles. Un nuevo ticket será creado.',
        'Postmaster queue.' => 'Cola Postmaster',
        'All default incoming tickets.' => 'Todos los tickets entrantes por defecto.',
        'All junk tickets.' => 'Todos los tickets basura.',
        'All misc tickets.' => 'Todos los tickets genericos.',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            'Respuesta automática la cual será enviada después de que un nuevo ticket haya sido creado.',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'Rechazo automático el cual será enviado después de que un seguimiento haya sido rechazado (en caso de que la opción de seguimiento de cola sea "rechazo").',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'Confirmación automática que se envía después de que un seguimiento se haya recibido para un ticket ( en caso de que la opción de seguimiento de cola sea "posible").',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'Respuesta automática la cual será enviada después de que un seguimiento haya sido rechazado y un nuevo ticket haya sido creado (en caso de que la opción de seguimiento de cola sea "nuevo ticket").',
        'Auto remove will be sent out after a customer removed the request.' =>
            'Eliminar auto será enviado después de que un cliente elimine la petición.',
        'default reply (after new ticket has been created)' => 'respuesta por defecto (después de que un nuevo ticket haya sido creado)',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            'rechazo por defecto (después de seguimiento y rechazo de un ticket cerrado)',
        'default follow-up (after a ticket follow-up has been added)' => 'seguimiento por defecto (después de que un seguimiento de ticket haya sido añadido)',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            'rechazo por defecto/nuevo ticket creado (después de cerrar seguimiento con la creación de nuevo ticket)',
        'Unclassified' => 'Sin clasificar',
        'tmp_lock' => 'tmp_lock',
        'email-notification-ext' => 'email-notificacion-ext',
        'email-notification-int' => 'email-notificacion-int',
        'Ticket create notification' => 'Notificacion de creación de Ticket',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            'Recibirá una notificación cada vez que se cree un nuevo ticket en una de sus "Mis colas" o "Mis servicios".',
        'Ticket follow-up notification (unlocked)' => 'Notificación de seguimiento de Ticket (desbloqueada)',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'Recibirá una notificación cada vez que se cree una Notificación de seguimiento a un Ticket desbloqueado que se encuentre en  "Mis colas" o "Mis servicios".',
        'Ticket follow-up notification (locked)' => 'Notificación de seguimiento de Ticket (bloqueada)',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            '',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            'Recibirá una notificación tan pronto como un ticket del cual seas propietario sea automáticamente desbloqueado.',
        'Ticket owner update notification' => 'Notificación de actualización de propietario de Ticket',
        'Ticket responsible update notification' => 'Notificación de actualización de responsable de Ticket',
        'Ticket new note notification' => 'Notificación de nueva nota de ticket',
        'Ticket queue update notification' => 'Notificación de actualización de cola de Ticket',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            'Recibirá una notificación si un ticket es movido a "Mis colas".',
        'Ticket pending reminder notification (locked)' => 'Notificación de recordatorio de Ticket pendiente (bloqueada)',
        'Ticket pending reminder notification (unlocked)' => 'Notificación de recordatorio de Ticket pendiente (desbloqueada)',
        'Ticket escalation notification' => 'Notificación de escalamiento de Ticket',
        'Ticket escalation warning notification' => 'Notificación de advertencia de escalamiento de Ticket',
        'Ticket service update notification' => 'Notificación de actualización de servicio de Ticket',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            '',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '
Estimado Cliente,

Desafortunadamente no hemos podido detectar un número de ticket válido en su consulta, por lo que este email no puede ser procesado .

Por favor cree un nuevo ticket a través del panel de cliente.

¡Gracias por su ayuda!

Tu Equipo de Soporte

',
        ' (work units)' => '(unidades de trabajo)',
        '"%s" notification was sent to "%s" by "%s".' => 'Notificación "%s" fue enviada a "%s" por "%s".',
        '"Slim" skin which tries to save screen space for power users.' =>
            'La apariencia "Slim" intenta ahorrar espacio en la pantalla para usuarios avanzados.',
        '%s' => '%s',
        '%s time unit(s) accounted. Now total %s time unit(s).' => '%s unidad(es) de tiempo contabilizadas. Total ahora: %s unidad(es) de tiempo.',
        '(UserLogin) Firstname Lastname' => '(LoginUsuario) Nombre Apellidos',
        '(UserLogin) Lastname Firstname' => '(LoginUsuario) Apellidos Nombre ',
        '(UserLogin) Lastname, Firstname' => '(LoginUsuario) Apellidos, Nombre ',
        '*** out of office until %s (%s d left) ***' => '*** fuera de la oficina hasta el  %s (%s dias restantes) ***',
        '100 (Expert)' => '100 (Experto)',
        '200 (Advanced)' => '200 (Avanzado)',
        '300 (Beginner)' => '300 (Principiante)',
        'A TicketWatcher Module.' => '',
        'A Website' => 'Un Sitio Web',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            'Una lista de los campos dinámicos que se fusionó con el ticket principal durante una operación de combinación. Sólo los campos dinámicos que están vacíos en el ticket principal se establecerán.',
        'A picture' => 'Una foto',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'Módulo ACL que permite el cierre de tickets padre sólo si todos sus hijos ya están cerrados ("Estado" muestra que estados no están disponibles para ticket padre hasta que todas las entradas de sus hijos están cerradas).',
        'Access Control Lists (ACL)' => 'Listas de Control de Acceso (ACL)',
        'AccountedTime' => 'Tiempo Registrado',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Activa un mecanismo de parpadeo de la cola que contiene el ticket más antiguo.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Activa la función perdida de contraseña para los agentes, en la interfaz del agente.',
        'Activates lost password feature for customers.' => 'Activa la función perdida de contraseña para los clientes.',
        'Activates support for customer groups.' => 'Activa soporte para grupos de clientes.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Activa el filtro de artículo en la vista de zoom para especificar qué artículos se deben mostrar.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Activa los temas disponibles en el sistema. Valor 1 significa activo, 0 significa inactivo.',
        'Activates the ticket archive system search in the customer interface.' =>
            'Activa la búsqueda de sistema de archivo de tickets en la interfaz del cliente.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Activa el sistema de archivo de ticket para tener un sistema más rápido, moviendo algunos tickets fuera del ámbito cotidiano. Para buscar estos tickets, la bandera de archivo tiene que estar activada en la búsqueda de tickets .',
        'Activates time accounting.' => 'Activa la contabilidad del tiempo.',
        'ActivityID' => 'IDActividad',
        'Add an inbound phone call to this ticket' => 'Añadir una llamada telefónica entrante a este ticket ',
        'Add an outbound phone call to this ticket' => 'Añadir una llamada telefónica saliente a este ticket',
        'Added email. %s' => 'Correo añadido. %s',
        'Added link to ticket "%s".' => 'Añadido enlace al ticket «%s».',
        'Added note (%s)' => 'Nota añadida (%s)',
        'Added subscription for user "%s".' => 'Añadida suscripción para el usuario «%s».',
        'Address book of CustomerUser sources.' => '',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'Añade un sufijo con el año y mes actual para el archivo de registro de OTRS. Se creará un archivo de registro para cada mes .',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            'Añade direcciones de correo electrónico de clientes  a los destinatarios en la pantalla de composición de ticket de la interfaz del agente. No se añadirá la dirección de correo electrónico de los clientes si el tipo de artículo es email-interno.',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Añade los días de vacaciones en un tiempo para el calendario indicado . Por favor, utilice el patrón de un solo dígito para los números del 1 al 9 (en lugar de 01 - 09 ).',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Añade los días de vacaciones en un tiempo. Por favor, utilice el patrón de un solo dígito para los números del 1 al 9 (en lugar de 01 - 09 ).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Añade los días de vacaciones permanentes para el calendario indicado . Por favor, utilice el patrón de un solo dígito para los números del 1 al 9 (en lugar de 01 - 09 ).',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Añade los días de vacaciones permanentes. Por favor, utilice el patrón de un solo dígito para los números del 1 al 9 (en lugar de 01 - 09 ).',
        'Admin Area.' => 'Área de administración.',
        'After' => 'Después',
        'Agent Name' => 'Nombre del agente',
        'Agent Name + FromSeparator + System Address Display Name' => '',
        'Agent Preferences.' => 'Preferencias del Agente.',
        'Agent called customer.' => 'El agente llamó al cliente.',
        'Agent interface article notification module to check PGP.' => 'Módulo de notificación de artículo de la interfaz de agente para verificar PGP.',
        'Agent interface article notification module to check S/MIME.' =>
            'Módulo de notificación de artículo de la interfaz de agente para verificar S/MIME.',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Módulo de la interfaz de agente para comprobar los correos entrantes en la Vista-Zoom-Ticket si la clave S/MIME está disponible y es verdadera.',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'AgentCustomerSearch' => '',
        'AgentCustomerSearch.' => '',
        'AgentUserSearch' => '',
        'AgentUserSearch.' => '',
        'Agents <-> Groups' => 'Agentes <-> Grupos',
        'Agents <-> Roles' => 'Agentes <-> Roles',
        'All customer users of a CustomerID' => 'Todos los clientes de un IDCliente',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permite añadir notas en la pantalla de ticket cerrado de la interfaz de agente. Puede sobrescribirse por Ticket::Frontend::NeedAccountedTime.',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permite añadir notas en la pantalla texto libre de ticket de la interfaz de agente. Puede sobrescribirse por Ticket::Frontend::NeedAccountedTime.',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permite añadir notas en la pantalla nota de ticket de la interfaz de agente. Puede sobrescribirse por Ticket::Frontend::NeedAccountedTime.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permite añadir notas en la pantalla propietario de ticket de un ticket ampliado en la interfaz de agente. Puede sobrescribirse por Ticket::Frontend::NeedAccountedTime.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permite añadir notas en la pantalla de ticket pendiente de un ticket ampliado en la interfaz de agente. Puede sobrescribirse por Ticket::Frontend::NeedAccountedTime.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permite añadir notas en la pantalla prioridad de ticket de un ticket ampliado en la interfaz de agente. Puede sobrescribirse por Ticket::Frontend::NeedAccountedTime.',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permite añadir notas en la pantalla responsable de ticket de la interfaz de agente. Puede sobrescribirse por Ticket::Frontend::NeedAccountedTime.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Permite a los agentes intercambiar el eje de una estadística si generan una.',
        'Allows agents to generate individual-related stats.' => 'Permite a los agentes generar estadísticas individualmente relacionadas .',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Permite elegir entre mostrar los archivos adjuntos de un ticket en el navegador (en línea) o simplemente hacerlos descargables (archivo adjunto) .',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Permite elegir el siguiente estado de composición para los tickets de los clientes en la interfaz del cliente.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Permite a los clientes cambiar la prioridad de ticket en la interfaz del cliente.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Permite a los clientes establecer el SLA de ticket en la interfaz del cliente.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Permite a los clientes establecer la prioridad de ticket en la interfaz de cliente.',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            'Permite a los clientes establecer la cola de ticket en la interfaz del cliente. Si se establece a \'No\', la ColaPorDefecto debe ser configurada.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Permite a los clientes establecer el servicio de ticket en la interfaz del cliente.',
        'Allows customers to set the ticket type in the customer interface. If this is set to \'No\', TicketTypeDefault should be configured.' =>
            'Permite a los clientes establecer el tipo de ticket en la interfaz del cliente. Si se establece a \'No\', TipoTicketPorDefecto debe estar configurado.',
        'Allows default services to be selected also for non existing customers.' =>
            'Permito que los servicios por defecto sean seleccionados también por clientes no existentes.',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            'Permite definir nuevos tipos para ticket (si la función tipo de ticket está habilitada).',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Permite definir servicios y SLAs para los tickets (ej. email, escritorio, red...), y los atributos de escalada para los SLAs (si la función servicio/SLA de ticket está activada).',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permite tener un formato medio de la vista general de ticket (InfoCliente => 1 - muestra también la información de cliente).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permite tener un formato pequeño de la vista general de ticket (InfoCliente => 1 - muestra también la información de cliente).',
        'Allows invalid agents to generate individual-related stats.' => 'Permite a agentes no válidos el generar estadísticas relacionadas individualmente.',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'Permite a los administradores el acceso como otros clientes, vía el panel de administración del usuario cliente.',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Permite a los administradores el acceso como otros clientes, vía el panel de administración de usuario.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Permite establecer un nuevo estado de ticket en la pantalla mover ticket de la interfaz de agente.',
        'Always show RichText if available' => '',
        'Arabic (Saudi Arabia)' => 'Árabe (Arabia Saudita)',
        'Archive state changed: "%s"' => 'Cambiado el estado del archivo: «%s»',
        'ArticleTree' => 'Árbol de Artículos',
        'Attachments <-> Templates' => 'Archivos adjuntos <-> Plantillas',
        'Auto Responses <-> Queues' => 'Respuestas Automáticas <-> Colas',
        'AutoFollowUp sent to "%s".' => 'Seguimiento automático enviado a «%s».',
        'AutoReject sent to "%s".' => 'Rechazo automático enviado a «%s».',
        'AutoReply sent to "%s".' => 'Respuesta automática enviada a «%s».',
        'Automated line break in text messages after x number of chars.' =>
            'Salto de linea automático en mensajes de texto después de x número de caracteres.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            'Automáticamente bloqueado y establecido propietario el Agente actual después de abrir la pantalla mover ticket de la interfaz de agente.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Automáticamente bloqueado y establecido propietario el Agente actual después de seleccionar una Acción Masiva.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            '',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Automáticamente establece al responsable de un ticket (si no está establecido aún) después de la primera actualización de propietario.',
        'Balanced white skin by Felix Niklas (slim version).' => 'Apariencia blanca equilibrada por Felix Niklas (versión slim).',
        'Balanced white skin by Felix Niklas.' => 'Apariencia blanca equilibrada por Felix Niklas.',
        'Based on global RichText setting' => '',
        'Basic fulltext index settings. Execute "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild" in order to generate a new index.' =>
            'Ajustes básicos del índice de texto completo . Ejecutar "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild" con el fin de generar un nuevo índice.',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Bloquea todos los emails entrantes que no tengan un número de ticket válido en el asunto con Desde: la dirección @example.com.',
        'Bounced to "%s".' => 'Rebotado a «%s».',
        'Builds an article index right after the article\'s creation.' =>
            'Construye un índice de artículo justo después de la creación del artículo.',
        'Bulgarian' => 'Bulgaro',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            'Configurar ejemplo CMD. Ignora emails donde una externa CMD devuelve alguna salida STDOUT ( el email será canalizado en STDIN de algún.bin).',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            'Tiempo de caché en segundos para la autenticación de agente en la InterfazGenerica.',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            'Tiempo de caché en segundos para la autenticación de cliente en la InterfazGenerica.',
        'Cache time in seconds for the DB ACL backend.' => 'Tiempo de caché en segundos para el backend de la Base de datos de ACL.',
        'Cache time in seconds for the DB process backend.' => 'Tiempo de caché en segundos para el proceso backend DB.',
        'Cache time in seconds for the SSL certificate attributes.' => 'Tiempo de caché en segundos para los atributos de certificado SSL.',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            'Tiempo de caché en segundos para el módulo de salida de la barra de navegación del proceso de ticket.',
        'Cache time in seconds for the web service config backend.' => 'Tiempo de caché en segundos para la configuración backend del servicio web.',
        'Catalan' => 'Catalán',
        'Change password' => 'Cambiar Contraseña',
        'Change queue!' => '¡Cambiar cola!',
        'Change the customer for this ticket' => 'Cambiar el cliente de este ticket',
        'Change the free fields for this ticket' => 'Cambiar los campos libres de este ticket',
        'Change the priority for this ticket' => 'Cambiar la prioridad de este ticket',
        'Change the responsible for this ticket' => 'Cambiar el responsable para este ticket',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Cambiada prioridad de «%s» (%s) a «%s» (%s).',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Cambia el propietario de tickets a todos (útil para ASP). Normalmente se mostrará un único agente con permisos rw en la cola de ticket.',
        'Checkbox' => ' Casilla de verificación',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            'Comprueba si un E-Mail es un seguimiento a un ticket existente búscando en el tema por un número de ticket válido.',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            'Comprueba la ID del sistema  en la detección de número de ticket para seguimientos (usar "No" si la ID del sistema ha sido cambiado después de usar el sistema).',
        'Checks the availability of OTRS Business Solution™ for this system.' =>
            'Comprueba la disponibilidad de OTRS Business Solution™ para este sistema.',
        'Checks the entitlement status of OTRS Business Solution™.' => 'Comprueba el estado de la autorización de OTRS Business Solution™.',
        'Chinese (Simplified)' => 'Chino (Simplificado)',
        'Chinese (Traditional)' => 'Chino (Tradicional)',
        'Choose for which kind of ticket changes you want to receive notifications.' =>
            'Escoger para que tipo de cambios de ticket quiere recibir notificaciones.',
        'Closed tickets (customer user)' => 'Tickets cerrados (cliente usuario)',
        'Closed tickets (customer)' => 'Tickets cerrados (cliente)',
        'Cloud Services' => 'Servicios en la Nube',
        'Cloud service admin module registration for the transport layer.' =>
            'Módulo de registro de administración de servicios en la nube para la capa de transporte.',
        'Collect support data for asynchronous plug-in modules.' => 'Recolector datos de soporte para módulos plug-in asíncronos.',
        'Column ticket filters for Ticket Overviews type "Small".' => 'Filtros ticket de columna para Vistas Generales de Ticket tipo "Pequeña".',
        'Columns that can be filtered in the escalation view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Las columnas que pueden ser filtradas en la vista de escaladas de la interfaz del agente . Ajustes posibles: 0 = Desactivado , 1 = Disponible , 2 = Activado por defecto. Nota: Sólo los atributos de Ticket, Campos Dinámicos (DynamicField_NombreX ) y los atributos del Cliente ( por ejemplo CustomerUserPhone , CustomerCompanyName, ... ) están permitidos.',
        'Columns that can be filtered in the locked view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Las columnas que pueden ser filtradas en la vista de bloqueo de la interfaz del agente . Ajustes posibles: 0 = Desactivado , 1 = Disponible , 2 = Activado por defecto. Nota: Sólo los atributos de Ticket, Campos Dinámicos (CampoDinamico_NombreX ) y los atributos del Cliente ( por ejemplo ClienteUsuarioTelefono , ClienteCompañiaNombre, ... ) estan permitidos.',
        'Columns that can be filtered in the queue view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Las columnas que pueden ser filtradas en la vista de cola de la interfaz del agente . Ajustes posibles: 0 = Desactivado , 1 = Disponible , 2 = Activado por defecto. Nota: Sólo los atributos de Ticket, Campos Dinámicos (CampoDinamico_NombreX ) y los atributos del Cliente ( por ejemplo ClienteUsuarioTelefono , ClienteCompañiaNombre, ... ) estan permitidos.',
        'Columns that can be filtered in the responsible view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Las columnas que pueden ser filtradas en la vista de responsable de la interfaz del agente . Ajustes posibles: 0 = Desactivado , 1 = Disponible , 2 = Activado por defecto. Nota: Sólo los atributos de Ticket, Campos Dinámicos (CampoDinamico_NombreX ) y los atributos del Cliente ( por ejemplo ClienteUsuarioTelefono , ClienteCompañiaNombre, ... ) estan permitidos.',
        'Columns that can be filtered in the service view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Las columnas que pueden ser filtradas en la vista de servicio de la interfaz del agente. Ajustes posibles: 0 = Desactivado , 1 = Disponible , 2 = Activado por defecto. Nota: Sólo los atributos de Ticket, Campos Dinámicos (CampoDinamico_NombreX) y los atributos del Cliente ( por ejemplo ClienteUsuarioTelefono, ClienteCompañiaNombre, ... ) estan permitidos.',
        'Columns that can be filtered in the status view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Las columnas que pueden ser filtradas en la vista de estado de la interfaz del agente. Ajustes posibles: 0 = Desactivado , 1 = Disponible , 2 = Activado por defecto. Nota: Sólo los atributos de Ticket, Campos Dinámicos (CampoDinamico_NombreX) y los atributos del Cliente ( por ejemplo ClienteUsuarioTelefono, ClienteCompañiaNombre, ... ) estan permitidos.',
        'Columns that can be filtered in the ticket search result view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Las columnas que pueden ser filtradas en la vista resultados de búsqueda de ticket de la interfaz del agente. Ajustes posibles: 0 = Desactivado , 1 = Disponible , 2 = Activado por defecto. Nota: Sólo los atributos de Ticket, Campos Dinámicos (CampoDinamico_NombreX) y los atributos del Cliente ( por ejemplo ClienteUsuarioTelefono, ClienteCompañiaNombre, ... ) estan permitidos.',
        'Columns that can be filtered in the watch view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Las columnas que pueden ser filtradas en la vista de visor de la interfaz del agente. Ajustes posibles: 0 = Desactivado , 1 = Disponible , 2 = Activado por defecto. Nota: Sólo los atributos de Ticket, Campos Dinámicos (CampoDinamico_NombreX) y los atributos del Cliente ( por ejemplo ClienteUsuarioTelefono, ClienteCompañiaNombre, ... ) estan permitidos.',
        'Comment for new history entries in the customer interface.' => 'Comentario para nueva entrada de historico en la interfaz de usuario.',
        'Comment2' => 'Comentario2',
        'Communication' => 'Comunicación',
        'Company Status' => 'Estado de la Empresa',
        'Company Tickets.' => 'Tickets de Empresa.',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            'Nombre de la Empresa la cual será incluida en los emails salientes como una X-Cabecera.',
        'Compat module for AgentZoom to AgentTicketZoom.' => '',
        'Complex' => '',
        'Configure Processes.' => 'Configurar Procesos.',
        'Configure and manage ACLs.' => 'Configurar y administrar ACLs.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            'Configura base de datos espejo de sólo lectura adicional que quieras utilizar.',
        'Configure sending of support data to OTRS Group for improved support.' =>
            'Configura envío de datos de soporte a Grupo OTRS para soporte mejorado.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'Configura que pantalla debe ser mostrada después de que un nuevo ticket haya sido creado.',
        'Configure your own log text for PGP.' => 'Configure su propio texto de registro de PGP.',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://otrs.github.io/doc/), chapter "Ticket Event Module".' =>
            'Configura un ajuste por defecto de CampoDinamicoTicket. "Nombre" define el campo dinámico que debe ser usado, "Valor" es el dato que será establecido, y "Evento" define el disparador del evento. Por favor compruebe el manual del desarrollador (http://otrs.github.io/doc/), capítulo "Módulo Evento Ticket".',
        'Controls how to display the ticket history entries as readable values.' =>
            'Controla cómo mostrar el historial de entradas como valores legibles.',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            '',
        'Controls if CustomerID is read-only in the agent interface.' => '',
        'Controls if customers have the ability to sort their tickets.' =>
            'Controla si los clientes tienen la posibilidad de ordenar sus tickets.',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            'Controla si más de una de entrada se puede establecer en el nuevo ticket telefónico en la interfaz del agente.',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'Controla si el administrador está permitido para importar una configuración de sistema guardada en SysConfig .',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            'Controla si se permite al administrador para realizar cambios en la base de datos a través de AdminSelectBox.',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            'Controla si se quitan las banderas de las entradas y el artículo visto cuando un ticket se archiva.',
        'Converts HTML mails into text messages.' => 'Convierte correos HTML en mensajes de texto.',
        'Create New process ticket.' => 'Crear nuevo ticket de proceso.',
        'Create and manage Service Level Agreements (SLAs).' => 'Crea y gestiona Acuerdos de Nivel de Servicio (SLAs).',
        'Create and manage agents.' => 'Crea y gestiona agentes.',
        'Create and manage attachments.' => 'Crea y gestiona Archivos adjuntos.',
        'Create and manage customer users.' => 'Crea y gestiona usuarios clientes.',
        'Create and manage customers.' => 'Crea y gestiona clientes.',
        'Create and manage dynamic fields.' => 'Crea y gestiona campos dinámicos.',
        'Create and manage groups.' => 'Crea y gestiona grupos.',
        'Create and manage queues.' => 'Crea y gestiona colas.',
        'Create and manage responses that are automatically sent.' => 'Crea y gestiona las respuestas enviadas automáticamente.',
        'Create and manage roles.' => 'Crea y gestiona roles.',
        'Create and manage salutations.' => 'Crea y gestiona Saludos.',
        'Create and manage services.' => 'Crea y gestiona servicios.',
        'Create and manage signatures.' => 'Crea y gestiona firmas.',
        'Create and manage templates.' => 'Crea y gestiona plantillas.',
        'Create and manage ticket notifications.' => 'Crea y gestiona las notificaciones de ticket.',
        'Create and manage ticket priorities.' => 'Crea y gestiona prioridades de tickets.',
        'Create and manage ticket states.' => 'Crea y gestiona estado de los tickets.',
        'Create and manage ticket types.' => 'Crea y gestiona tipos de tickets.',
        'Create and manage web services.' => 'Crea y gestiona servicios web.',
        'Create new Ticket.' => 'Crear nuevo Ticket.',
        'Create new email ticket and send this out (outbound).' => 'Crea un nuevo ticket por correo y envíelo (saliente).',
        'Create new email ticket.' => 'Crear un nuevo ticket de correo electrónico.',
        'Create new phone ticket (inbound).' => 'Crea nuevo ticket telefónico (entrante).',
        'Create new phone ticket.' => 'Crea nuevo ticket telefónico.',
        'Create new process ticket.' => 'Crea nuevo ticket de proceso.',
        'Create tickets.' => 'Crear tickets.',
        'Croatian' => 'Croata',
        'Custom RSS Feed' => 'RSS Feed Personalizado',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            'Texto personalizado para la página que se muestra a los clientes que no tienen tickets todavía ( si necesita esos textos traducidos añadadalos a un módulo de traducción personalizado).',
        'Customer Administration' => 'Administración de Clientes',
        'Customer Information Center Search.' => 'Buscar en Centro de información al cliente.',
        'Customer Information Center.' => 'Centro de información al cliente.',
        'Customer Ticket Print Module.' => 'Módulo de impresión de tickets de cliente.',
        'Customer User <-> Groups' => 'Usuario Cliente <-> Grupos',
        'Customer User <-> Services' => 'Usuario Cliente <-> Servicios',
        'Customer User Administration' => 'Administración de los usuarios cliente',
        'Customer Users' => 'Clientes',
        'Customer called us.' => 'El cliente nos llamó.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Elemento cliente (icono) el cual muestra los tickets cerrados para este cliente como un bloque de información. Estableciendo ClienteUsuarioLogin a 1 busca por tickets basándose en el nombre de login en vez de IDCliente.',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Elemento cliente (icono) el cual muestra los tickets abiertos para este cliente como un bloque de información. Estableciendo ClienteUsuarioLogin a 1 busca por tickets basándose en el nombre de login en vez de IDCliente.',
        'Customer preferences.' => 'Preferencias del cliente.',
        'Customer request via web.' => 'Solicitud de cliente vía web.',
        'Customer ticket overview' => 'Resumen de Tickets de Cliente',
        'Customer ticket search.' => 'Busqueda de Ticket de Cliente',
        'Customer ticket zoom' => '',
        'Customer user search' => 'Búsqueda de usuario cliente',
        'CustomerID search' => 'Búsqueda de ClienteID',
        'CustomerName' => 'Nombre del cliente',
        'CustomerUser' => 'Usuario del cliente',
        'Customers <-> Groups' => 'Clientes <-> Grupos',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            'Palabras vacías personalizables para el índice de texto completo. Estas palabras serán eliminadas del índice de búsqueda.',
        'Czech' => 'Checo',
        'Danish' => 'Danes',
        'Data used to export the search result in CSV format.' => 'Datos usados para exportar el resultado de la búsqueda en formato CSV. ',
        'Date / Time' => 'Fecha / Hora',
        'Debug' => 'depurar',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            'Depura el conjunto de la traducción. Si está establecido a "Sí" todas las cadenas (texto ) sin traducciones se escriben en STDERR. Esto puede ser útil cuando se crea un nuevo archivo de traducción. De lo contrario, esta opción debe quedar establecida a "No".',
        'Default' => 'Predeterminado',
        'Default (Slim)' => 'Predeterminado (Slim)',
        'Default ACL values for ticket actions.' => 'Valores ACL por defecto para las acciones de tickets.',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'Prefijos entidad GestiónProceso por defecto para las IDs entidades que son generadas automaticamnete.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            'Datos por defecto a usar en el atributo para la pantalla buscar ticket. Ejemplo: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            'Datos por defecto a usar en el atributo para la pantalla buscar ticket. Ejemplo: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Tipo de pantalla por defecto para nombre del destinatario ( Para, CC) en AgenteTicketZoom y ClienteTicketZoom.',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Tipo de pantalla por defecto para nombres del remitente (De) en AgenteTicketZoom y ClienteTicketZoom.',
        'Default loop protection module.' => 'Módulo protección bucle por defecto.',
        'Default queue ID used by the system in the agent interface.' => 'ID cola por defecto usada por el sistema en la interfaz de agente.',
        'Default skin for the agent interface (slim version).' => 'Apariencia por defecto para la interfaz de agente (versión slim).',
        'Default skin for the agent interface.' => 'Apariencia por defecto para la interfaz de agente.',
        'Default skin for the customer interface.' => 'Apariencia por defecto para la interfaz de cliente.',
        'Default ticket ID used by the system in the agent interface.' =>
            'ID ticket por defecto usada por el sistema en la interfaz de agente.',
        'Default ticket ID used by the system in the customer interface.' =>
            'ID de ticket por defecto usada por el sistema en la interfaz de cliente.',
        'Default value for NameX' => 'Valor por defecto para NombreX',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            '',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definir un filtro para la salida html para agregar enlaces detrás de un string definido. El elemento Imagen permite dos tipos de entrada. Al mismo tiempo el nombre de una imagen (por ejemplo faq.png ). En este caso se utilizará la ruta de la imagen OTRS. La segunda posibilidad es insertar el enlace a la imagen.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the next setting below.' =>
            'Definir un mapeo entre las variables de los datos de usuario cliente (claves) y campos dinámicos de un ticket (valores). El propósito es almacenar datos de usuario cliente en campos dinámicos de ticket. Los campos dinámicos deben estar presentes en el sistema y debe ser habilitado para AgenteTicketTextoLibre , por lo que se pueden ajustar / modificar manualmente por el agente. No deben estar habilitados para AgenteTicketTelefonico, AgenteTicketEmail y AgenteTicketCliente. Si lo fueran, tendrían prioridad sobre los valores establecidos de forma automática. Para utilizar este mapeo, usted tiene también que activar el siguiente ajuste de abajo.',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Definir el nombre del campo dinámico para la hora de finalización. Este campo tiene que ser añadido manualmente al sistema como Ticket: "Fecha / Hora" y debe ser activado en las pantallas de creación de ticket y / o en otras pantallas de acción de ticket.',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Definir el nombre del campo dinámico para la hora de inicio. Este campo tiene que ser añadido manualmente al sistema como Ticket: "Fecha / Hora" y debe ser activado en las pantallas de creación de ticket y / o en otras pantallas de acción de ticket.',
        'Define the max depth of queues.' => 'Definir la profundidad máxima de colas.',
        'Define the queue comment 2.' => 'Definir el comentario 2 de cola.',
        'Define the service comment 2.' => 'Definir el comentario 2 de servicio.',
        'Define the sla comment 2.' => 'Definir el comentario 2 de sla.',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            'Definir el día de inicio de la semana para el selector de fecha para el calendario indicado.',
        'Define the start day of the week for the date picker.' => 'Definir el día de inicio de la semana para el selector de fecha.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Define un item del cliente, el cual genera un icono de LinkedIn en el extremo de un bloque de información del cliente.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Define un ítem del cliente, el cual genera un icono de XING en el extremo de un bloque de información del cliente.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Define un ítem del cliente, el cual genera un icono de google en el extremo de un bloque de información del cliente.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Define un ítem del cliente, el cual genera un icono de google maps en el extremo de un bloque de información del cliente.',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            'Definir una lista de palabras por defecto, que son ignoradas por el corrector ortográfico.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            '',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            '',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            '',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            '',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            '',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            '',
        'Defines a useful module to load specific user options or to display news.' =>
            'Define un módulo útil para cargar opciones de usuario específicas o para mostrar noticias.',
        'Defines all the X-headers that should be scanned.' => 'Define todos los X-headers que deben ser escaneados.',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            'Define todos los idiomas disponibles para la aplicación. Especifique sólo los nombres en inglés de los idiomas aquí.',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            '',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            '',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            '',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Define todos los parámetros de este elemento en las Preferencias del Cliente.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            '',
        'Defines all the parameters for this notification transport.' => 'Define todos los parámetros para este transporte de notificaciones.',
        'Defines all the possible stats output formats.' => 'Define todos los formatos de salida posibles para las estadísticas.',
        'Defines an alternate URL, where the login link refers to.' => 'Define una URL alternativa, a donde hace referencia el enlace de inicio de sesión.',
        'Defines an alternate URL, where the logout link refers to.' => 'Define una URL alternativa, a donde hace referencia el enlace de cierre de sesión.',
        'Defines an alternate login URL for the customer panel..' => 'Define una URL alternativa de inicio de sesión para el panel de cliente.',
        'Defines an alternate logout URL for the customer panel.' => 'Define una URL alternativa de cierre de sesión para el panel de cliente.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            '',
        'Defines from which ticket attributes the agent can select the result order.' =>
            'Define con que atributos del ticket el agente puede seleccionar el orden resultante.',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Define como debe lucir el campo From de los correos (enviados desde respuestas y tickets de correos).',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            '',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            '',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            '',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            'Define si los mensajes compuestos tienen que ser revisados ortográficamente en la interfaz del agente.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            '',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            '',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            '',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            '',
        'Defines if the values for filters should be retrieved from all available tickets. If set to "Yes", only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            '',
        'Defines if time accounting is mandatory in the agent interface. If activated, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            '',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            '',
        'Defines out of office message template. Two string parameters (%s) available: end date and number of days left.' =>
            '',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            '',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the OTRS Daemon).' =>
            '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            '',
        'Defines the URL CSS path.' => '',
        'Defines the URL base path of icons, CSS and Java Script.' => '',
        'Defines the URL image path of icons for navigation.' => '',
        'Defines the URL java script path.' => '',
        'Defines the URL rich text editor path.' => '',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            '',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            '',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            '',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            '',
        'Defines the body text for rejected emails.' => 'Define el cuerpo del texto para los emails rechazados.',
        'Defines the calendar width in percent. Default is 95%.' => 'Define el ancho del calendario en porcentaje. El valor predeterminado es 95%.',
        'Defines the cluster node identifier. This is only used in cluster configurations where there is more than one OTRS frontend system. Note: only values from 1 to 99 are allowed.' =>
            '',
        'Defines the column to store the keys for the preferences table.' =>
            '',
        'Defines the config options for the autocompletion feature.' => 'Define las opciones de configuración para la función de autocompletar.',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            '',
        'Defines the connections for http/ftp, via a proxy.' => 'Define las conexiones para http/ftp, a través de un proxy.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            '',
        'Defines the date input format used in forms (option or input fields).' =>
            '',
        'Defines the default CSS used in rich text editors.' => '',
        'Defines the default auto response type of the article for this operation.' =>
            '',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at http://otrs.github.io/doc/.' =>
            '',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            '',
        'Defines the default history type in the customer interface.' => '',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            '',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            '',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            '',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            '',
        'Defines the default priority of new tickets.' => 'Define la prioridad predeterminada de los nuevos tickets.',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Define la cola predeterminada para los nuevos tickets del cliente en la interfaz de cliente.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            '',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            '',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen (AllTickets/ArchivedTickets/NotArchivedTickets).' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen. Example: "Key" must have the name of the Dynamic Field in this case \'X\', "Content" must have the value of the Dynamic Field depending on the Dynamic Field type,  Text: \'a text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.' =>
            '',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            'Define los criterios de clasificación predeterminados para todas las colas que se muestran en la vista de cola.',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            '',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            '',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            '',
        'Defines the default spell checker dictionary.' => 'Define el diccionario del corrector ortográfico predeterminado.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Define el estado predeterminado de los nuevos tickets de cliente en la interfaz de cliente.',
        'Defines the default state of new tickets.' => 'Define el estado predeterminado de los nuevos tickets.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            '',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            '',
        'Defines the default ticket type.' => 'Define el tipo predeterminado de ticket.',
        'Defines the default type for article in the customer interface.' =>
            '',
        'Defines the default type of forwarded message in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the default type of the article for this operation.' => '',
        'Defines the default type of the message in the email outbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket zoom screen of the customer interface.' =>
            '',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            '',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            '',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            '',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            '',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            '',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            '',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            '',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            '',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every user for these groups).' =>
            '',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            '',
        'Defines the hours and week days to count the working time.' => 'Define las horas y los días de la semana para contar el tiempo de trabajo.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            '',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            '',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            '',
        'Defines the list of online repositories. Another installations can be used as repository, for example: Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Some Name".' =>
            '',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            '',
        'Defines the list of types for templates.' => 'Define la lista de tipos de plantillas.',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'Define la ubicación para obtener la lista de repositorios en línea para paquetes adicionales. Se utilizará el primer resultado disponible.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            '',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your OTRS instance to stop working (probably any mask which takes input from the user).' =>
            '',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            '',
        'Defines the maximum number of affected tickets per job.' => '',
        'Defines the maximum number of pages per PDF file.' => 'Define el número máximo de páginas por archivo PDF.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            'Define el número máximo de líneas citadas que se agregarán a las respuestas.',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            '',
        'Defines the maximum size (in MB) of the log file.' => 'Define el tamaño máximo (en MB) del archivo de registro.',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            '',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            '',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Define el módulo que muestra todos los agentes actualmente conectados en la interfaz del agente.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            'Define el módulo que muestra todos los clientes actualmente conectados en la interfaz del agente.',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            'Define el módulo que muestra los agentes actualmente conectados en la interfaz del cliente.',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            'Define el módulo que muestra los clientes actualmente conectados en la interfaz del cliente.',
        'Defines the module to authenticate customers.' => 'Define el módulo para autenticar clientes.',
        'Defines the module to display a notification if cloud services are disabled.' =>
            'Define el módulo para mostrar una notificación si los servicios en la nube están deshabilitados.',
        'Defines the module to display a notification in different interfaces on different occasions for OTRS Business Solution™.' =>
            'Define el módulo para mostrar una notificación en diferentes interfaces en diferentes ocasiones para OTRS Business Solution ™.',
        'Defines the module to display a notification in the agent interface if the OTRS Daemon is not running.' =>
            'Define el módulo para mostrar una notificación en la interfaz del agente si el Daemon de OTRS no se está ejecutando.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent session limit prior warning is reached.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            '',
        'Defines the module to generate code for periodic page reloads.' =>
            'Define el módulo para generar el código para las recargas periódicas de la página.',
        'Defines the module to send emails. "Sendmail" directly uses the sendmail binary of your operating system. Any of the "SMTP" mechanisms use a specified (external) mailserver. "DoNotSendEmail" doesn\'t send emails and it is useful for test systems.' =>
            '',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            '',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            '',
        'Defines the name of the column to store the data in the preferences table.' =>
            '',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'Define el nombre de la columna para almacenar el identificador de usuario en la tabla de preferencias.',
        'Defines the name of the indicated calendar.' => 'Define el nombre del calendario indicado',
        'Defines the name of the key for customer sessions.' => 'Define el nombre de la clave para las sesiones del cliente.',
        'Defines the name of the session key. E.g. Session, SessionID or OTRS.' =>
            '',
        'Defines the name of the table where the user preferences are stored.' =>
            'Define el nombre de la tabla donde se almacenan las preferencias del usuario.',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            '',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            '',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            '',
        'Defines the number of days to keep the daemon log files.' => 'Define el número de días para mantener los archivos de registro del daemon.',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            'Define el número de campos de encabezado en los módulos frontend para añadir y actualizar los filtros postmaster. Puede tener hasta 99 campos.',
        'Defines the parameters for the customer preferences table.' => 'Define los parámetros para la tabla de preferencias del cliente',
        'Defines the parameters for the dashboard backend. "Cmd" is used to specify command with parameters. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Define la contraseña para acceder al identificador SOAP (bin / cgi-bin / rpc.pl).',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            '',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            '',
        'Defines the path to PGP binary.' => '',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            '',
        'Defines the postmaster default queue.' => '',
        'Defines the priority in which the information is logged and presented.' =>
            '',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            '',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            '',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            '',
        'Defines the search limit for the stats.' => '',
        'Defines the sender for rejected emails.' => '',
        'Defines the separator between the agents real name and the given queue email address.' =>
            '',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            '',
        'Defines the standard size of PDF pages.' => 'Define el tamaño estándar de las páginas PDF.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            '',
        'Defines the state of a ticket if it gets a follow-up.' => '',
        'Defines the state type of the reminder for pending tickets.' => '',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            '',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            '',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the subject for rejected emails.' => '',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            '',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of OTRS).' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            '',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            '',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            '',
        'Defines the two-factor module to authenticate agents.' => '',
        'Defines the two-factor module to authenticate customers.' => '',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            '',
        'Defines the user identifier for the customer panel.' => '',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Defines the valid state types for a ticket.' => '',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/otrs.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            '',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            '',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            '',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            '',
        'Defines which items are available in first level of the ACL structure.' =>
            '',
        'Defines which items are available in second level of the ACL structure.' =>
            '',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            '',
        'Defines wich article type should be expanded when entering the overview. If nothing defined, latest article will be expanded.' =>
            '',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            '',
        'Delete expired cache from core modules.' => '',
        'Delete expired loader cache weekly (Sunday mornings).' => '',
        'Delete expired sessions.' => 'Borrar sesiones expiradas',
        'Deleted link to ticket "%s".' => 'Eliminado enlace al ticket «%s».',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            '',
        'Deletes requested sessions if they have timed out.' => '',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            '',
        'Deploy and manage OTRS Business Solution™.' => 'Implementar y administrar OTRS Business Solution ™.',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            '',
        'Determines if the statistics module may generate ticket lists.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            '',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            '',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            '',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            '',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            '',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            '',
        'Development' => 'Desarrollo',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow OTRS to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Disable restricted security for IFrames in IE. May be required for SSO to work in IE.' =>
            '',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be activated).' =>
            '',
        'Disables the communication between this system and OTRS Group servers that provides cloud services. If active, some functionality will be lost such as system registration, support data sending, upgrading to and use of OTRS Business Solution™, OTRS Verify™, OTRS News and product News dashboard widgets, among others.' =>
            '',
        'Disables the web installer (http://yourhost.example.com/otrs/installer.pl), to prevent the system from being hijacked. If set to "No", the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If not active, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            '',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            '',
        'Display settings to override defaults for Process Tickets.' => '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            '',
        'Dropdown' => '',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            'Palabras vacías en holandés para el índice de texto completo. Estas palabras serán eliminadas del índice de búsqueda.',
        'Dynamic Fields Checkbox Backend GUI' => '',
        'Dynamic Fields Date Time Backend GUI' => '',
        'Dynamic Fields Drop-down Backend GUI' => '',
        'Dynamic Fields GUI' => '',
        'Dynamic Fields Multiselect Backend GUI' => '',
        'Dynamic Fields Overview Limit' => '',
        'Dynamic Fields Text Backend GUI' => '',
        'Dynamic Fields used to export the search result in CSV format.' =>
            '',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields limit per page for Dynamic Fields Overview' => '',
        'Dynamic fields options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###DynamicField.' =>
            '',
        'Dynamic fields options shown in the ticket reply section in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the email outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the sidebar of the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket close screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket compose screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket email screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket forward screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket free text screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket move screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket note screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket owner screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket pending screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket priority screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket responsible screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Dynamic fields shown in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'DynamicField' => '',
        'DynamicField backend registration.' => '',
        'DynamicField object registration.' => '',
        'E-Mail Outbound' => 'E-Mail Saliente',
        'Edit Customer Companies.' => '',
        'Edit Customer Users.' => '',
        'Edit customer company' => 'Editar la Empresa del cliente',
        'Email Addresses' => 'Direcciones de Correo',
        'Email Outbound' => 'Email Saliente',
        'Email sent to "%s".' => 'Correo enviado a «%s».',
        'Email sent to customer.' => 'Correo enviado al cliente.',
        'Enable keep-alive connection header for SOAP responses.' => '',
        'Enabled filters.' => 'Habilitar Filtros',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the OTRS user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            '',
        'Enables S/MIME support.' => 'Habilitar soporte S/MIME.',
        'Enables customers to create their own accounts.' => 'Permite a los clientes crear sus propias cuentas.',
        'Enables fetch S/MIME from CustomerUser backend support.' => '',
        'Enables file upload in the package manager frontend.' => '',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            '',
        'Enables or disables the debug mode over frontend interface.' => '',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            '',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            '',
        'Enables spell checker support.' => '',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            '',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            '',
        'Enables ticket bulk action feature only for the listed groups.' =>
            '',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            '',
        'Enables ticket watcher feature only for the listed groups.' => '',
        'English (Canada)' => 'Inglés (Canadá)',
        'English (United Kingdom)' => 'Inglés (Reino unido)',
        'English (United States)' => 'Inglés (Estados Unidos)',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            'Palabras vacías en ingles para el índice de texto completo. Estas palabras serán eliminadas del índice de búsqueda.',
        'Enroll process for this ticket' => '',
        'Enter your shared secret to enable two factor authentication.' =>
            '',
        'Escalation response time finished' => '',
        'Escalation response time forewarned' => '',
        'Escalation response time in effect' => '',
        'Escalation solution time finished' => '',
        'Escalation solution time forewarned' => '',
        'Escalation solution time in effect' => '',
        'Escalation update time finished' => '',
        'Escalation update time forewarned' => '',
        'Escalation update time in effect' => '',
        'Escalation view' => 'Vista de escaladas',
        'EscalationTime' => 'Tiempo para escalada',
        'Estonian' => 'Estonio',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            '',
        'Event module that updates customer user search profiles if login changes.' =>
            '',
        'Event module that updates customer user service membership if login changes.' =>
            '',
        'Event module that updates customer users after an update of the Customer.' =>
            '',
        'Event module that updates tickets after an update of the Customer User.' =>
            '',
        'Event module that updates tickets after an update of the Customer.' =>
            '',
        'Events Ticket Calendar' => 'Calendario de eventos de Tickets',
        'Execute SQL statements.' => 'Ejecutar sentencias SQL.',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            '',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            '',
        'Fetch emails via fetchmail (using SSL).' => '',
        'Fetch emails via fetchmail.' => '',
        'Fetch incoming emails from configured mail accounts.' => '',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            '',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            '',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            '',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            '',
        'Filter incoming emails.' => 'Filtrar emails entrantes.',
        'Finnish' => 'Finlandés',
        'First Queue' => 'Primera Cola',
        'FirstLock' => 'PrimerBloqueo',
        'FirstResponse' => 'PrimeraRespuesta',
        'FirstResponseDiffInMin' => 'PrimeraRespuestaDifEnMin',
        'FirstResponseInMin' => 'PrimeraRespuestaEnMin',
        'Firstname Lastname' => 'Nombre Apellidos',
        'Firstname Lastname (UserLogin)' => 'Nombre Apellidos (LoginUsuario) ',
        'FollowUp for [%s]. %s' => 'Seguimiento para [%s]. %s',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            '',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            '',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Fuerza el desbloqueo de tickets luego de ser movidos a otra cola.',
        'Forwarded to "%s".' => 'Reenviado a "%s".',
        'French' => 'Francés',
        'French (Canada)' => 'Francés (Canadá)',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            'Palabras vacías en frances para el índice de texto completo. Estas palabras serán eliminadas del índice de búsqueda.',
        'Frontend' => '',
        'Frontend module registration (disable AgentTicketService link if Ticket Serivice feature is not used).' =>
            '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            '',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            '',
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            '',
        'Frontend module registration for the agent interface.' => '',
        'Frontend module registration for the customer interface.' => '',
        'Frontend theme' => 'Tema de la interfaz',
        'Full value' => 'Valor completo',
        'Fulltext index regex filters to remove parts of the text.' => '',
        'Fulltext search' => 'Búsqueda de texto completo',
        'Galician' => 'Gallego',
        'General ticket data shown in the ticket overviews (fall-back). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note that TicketNumber can not be disabled, because it is necessary.' =>
            '',
        'Generate dashboard statistics.' => '',
        'Generic Info module.' => '',
        'GenericAgent' => 'Agente Genérico',
        'GenericInterface Debugger GUI' => '',
        'GenericInterface Invoker GUI' => '',
        'GenericInterface Operation GUI' => '',
        'GenericInterface TransportHTTPREST GUI' => '',
        'GenericInterface TransportHTTPSOAP GUI' => '',
        'GenericInterface Web Service GUI' => '',
        'GenericInterface Webservice History GUI' => '',
        'GenericInterface Webservice Mapping GUI' => '',
        'GenericInterface module registration for the invoker layer.' => '',
        'GenericInterface module registration for the mapping layer.' => '',
        'GenericInterface module registration for the operation layer.' =>
            '',
        'GenericInterface module registration for the transport layer.' =>
            '',
        'German' => 'Alemán',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            'Palabras vacías en alemán para el índice de texto completo. Estas palabras serán eliminadas del índice de búsqueda.',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files.' =>
            '',
        'Global Search Module.' => '',
        'Go back' => 'Regresar',
        'Google Authenticator' => 'Google Authenticator',
        'Graph: Bar Chart' => 'Gráfico: Gráfico de barras',
        'Graph: Line Chart' => 'Gráfico: Gráfico de líneas',
        'Graph: Stacked Area Chart' => 'Gráfico: Gráfico de áreas apiladas',
        'Greek' => 'Griego',
        'HTML Reference' => 'Referencia HTML',
        'HTML Reference.' => 'Referencia HTML.',
        'Hebrew' => 'Hebreo',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). Runtime will do full-text searches on live data (it works fine for up to 50.000 tickets). StaticDB will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild".' =>
            '',
        'Hindi' => 'Hindi',
        'Hungarian' => 'Húngaro',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the crypt type of passwords must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            '',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            '',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and special paramaters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            '',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use OTRS. Specify the group, who may access the system.' =>
            '',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            '',
        'If "Sendmail" was selected as SendmailModule, the location of the sendmail binary and the needed options must be specified.' =>
            '',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            '',
        'If "SysLog" was selected for LogModule, a special log sock can be specified (on solaris you may need to use \'stream\').' =>
            '',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            '',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            '',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            '',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            '',
        'If enabled debugging information for ACLs is logged.' => '',
        'If enabled debugging information for transitions is logged.' => '',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            '',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            '',
        'If enabled, OTRS will deliver all CSS files in minified form. WARNING: If you turn this off, there will likely be problems in IE 7, because it cannot load more than 32 CSS files.' =>
            '',
        'If enabled, OTRS will deliver all JavaScript files in minified form.' =>
            '',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            '',
        'If enabled, the OTRS version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            '',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Si se habilita, las diferentes vistas generales (panel principal, vista de bloqueados, vista de colas) se actualizarán automáticamente tras el tiempo indicado.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            '',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            '',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            '',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            '',
        'If this option is enabled, then the decrypted data will be stored in the database if they are displayed in AgentTicketZoom.' =>
            '',
        'If this option is set to \'Yes\', tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is set to \'No\', no autoresponses will be sent.' =>
            '',
        'If this regex matches, no message will be send by the autoresponder.' =>
            '',
        'If this setting is active, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            '',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            '',
        'Include tickets of subqueues per default when selecting a queue.' =>
            'Incluya los tickets de subcolas por defecto al seleccionar una cola.',
        'Include unknown customers in ticket filter.' => '',
        'Includes article create times in the ticket search of the agent interface.' =>
            '',
        'Incoming Phone Call.' => '',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/otrs.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            '',
        'Indonesian' => 'Indonesio',
        'Input' => 'Entrada',
        'Install ispell or aspell on the system, if you want to use a spell checker. Please specify the path to the aspell or ispell binary on your operating system.' =>
            '',
        'Interface language' => 'Idioma de la interfaz',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'Italian' => 'Italiano',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            'Palabras vacías en italiano para el índice de texto completo. Estas palabras serán eliminadas del índice de búsqueda.',
        'Ivory' => 'Marfil',
        'Ivory (Slim)' => 'Marfil (Slim)',
        'Japanese' => 'Japonés',
        'JavaScript function for the search frontend.' => '',
        'Last customer subject' => 'Último asunto del cliente',
        'Lastname Firstname' => 'Apellidos Nombre',
        'Lastname Firstname (UserLogin)' => 'Apellidos Nombre (LoginUsuario) ',
        'Lastname, Firstname' => 'Apellidos, Nombre',
        'Lastname, Firstname (UserLogin)' => 'Apellidos, Nombre (LoginUsuario) ',
        'Latvian' => 'Letón',
        'Left' => 'Izquierda',
        'Link Object' => 'Enlazar objeto',
        'Link Object.' => 'Enlazar objeto.',
        'Link agents to groups.' => 'Crea enlace de Agentes a Grupos',
        'Link agents to roles.' => 'Crea enlace de Agentes a Roles',
        'Link attachments to templates.' => 'Crea enlace de Adjuntos a Plantillas',
        'Link customer user to groups.' => 'Crea enlace de Usuarios Clientes a Grupos',
        'Link customer user to services.' => 'Crea enlace de Usuarios Clientes a Servicios.',
        'Link queues to auto responses.' => 'Crea enlace de Colas a Respuestas Automáticas',
        'Link roles to groups.' => 'Crea enlace de Roles a Grupos.',
        'Link templates to queues.' => 'Crea enlace de Plantillas a Colas.',
        'Links 2 tickets with a "Normal" type link.' => 'Enlaza 2 tickets con un enlace tipo "Normal".',
        'Links 2 tickets with a "ParentChild" type link.' => 'Enlaza 2 tickets con un enlace tipo "ParentChild".',
        'List of CSS files to always be loaded for the agent interface.' =>
            '',
        'List of CSS files to always be loaded for the customer interface.' =>
            '',
        'List of JS files to always be loaded for the agent interface.' =>
            '',
        'List of JS files to always be loaded for the customer interface.' =>
            '',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            'Lista de todos los eventos de la Empresa del cliente que se mostrarán en la GUI.',
        'List of all CustomerUser events to be displayed in the GUI.' => '',
        'List of all DynamicField events to be displayed in the GUI.' => '',
        'List of all Package events to be displayed in the GUI.' => '',
        'List of all article events to be displayed in the GUI.' => '',
        'List of all queue events to be displayed in the GUI.' => '',
        'List of all ticket events to be displayed in the GUI.' => '',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            '',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            '',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            '',
        'List view' => '',
        'Lithuanian' => 'Lituano',
        'Lock / unlock this ticket' => 'Bloquear / Desbloquear este ticket',
        'Locked Tickets.' => 'Tickets bloqueados.',
        'Locked ticket.' => 'Ticket bloqueado.',
        'Log file for the ticket counter.' => 'Archivo de registro para el contador de tickets.',
        'Logout of customer panel.' => 'Salir del panel de cliente.',
        'Loop-Protection! No auto-response sent to "%s".' => '¡Protección contra bucles! No se envió respuesta automática a «%s».',
        'Mail Accounts' => 'Cuentas de Correo',
        'Main menu registration.' => 'Registro del menú principal.',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            '',
        'Makes the application check the syntax of email addresses.' => '',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            '',
        'Malay' => 'Malayo',
        'Manage OTRS Group cloud services.' => 'Gestionar los servicios en la nube de OTRS Group.',
        'Manage PGP keys for email encryption.' => 'Gestión de claves PGP para encriptación de correo electrónico.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'Gestionar cuentas POP3 o IMAP desde las que traer correo electrónico.',
        'Manage S/MIME certificates for email encryption.' => 'Gestionar certificados S/MIME para encriptación de correo electrónico.',
        'Manage existing sessions.' => 'Gestionar sesiones existentes.',
        'Manage support data.' => 'Gestionar datos de soporte.',
        'Manage system registration.' => 'Gestionar registro del sistema.',
        'Manage tasks triggered by event or time based execution.' => 'Gestionar tareas activadas por eventos o ejecuciones temporales.',
        'Mark this ticket as junk!' => '¡Marcar este ticket como basura!',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            '',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            'Tamaño máximo (en filas) del cuadro de agentes informados en la interfaz del agente.',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            'Tamaño máximo (en filas) del cuadro de agentes involucrados en la interfaz del agente.',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            '',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            '',
        'Maximum Number of a calendar shown in a dropdown.' => '',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            '',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            '',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            'Número máximo de tickets que se mostrarán en el resultado de esta operación.',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            '',
        'Merge this ticket and all articles into a another ticket' => 'Fusiona este ticket y todos los artículos en otro ticket ',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'Combinar Ticket  <OTRS_TICKET> con <OTRS_MERGE_TO_TICKET>.',
        'Miscellaneous' => 'Misceláneo',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            '',
        'Module to check if arrived emails should be marked as email-internal (because of original forwarded internal email). ArticleType and SenderType define the values for the arrived email/article.' =>
            '',
        'Module to check the group permissions for customer access to tickets.' =>
            '',
        'Module to check the group permissions for the access to tickets.' =>
            'Módulo para comprobar los permisos de grupo para el acceso a los tickets.',
        'Module to compose signed messages (PGP or S/MIME).' => 'Módulo para componer mensajes firmados (PGP or S/MIME).',
        'Module to crypt composed messages (PGP or S/MIME).' => '',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            '',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            '',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            '',
        'Module to filter encrypted bodies of incoming messages.' => '',
        'Module to generate accounted time ticket statistics.' => '',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            '',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            '',
        'Module to generate ticket solution and response time statistics.' =>
            '',
        'Module to generate ticket statistics.' => 'Módulo para generar estadísticas de tickets.',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            '',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            '',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            '',
        'Module to grant access to the agent responsible of a ticket.' =>
            '',
        'Module to grant access to the creator of a ticket.' => '',
        'Module to grant access to the owner of a ticket.' => 'Módulo para otorgar acceso al propietario de un ticket.',
        'Module to grant access to the watcher agents of a ticket.' => 'Módulo para otorgar acceso a los agentes observadores de un ticket.',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            '',
        'Module to use database filter storage.' => 'Módulo para usar el almacenamiento de filtros de base de datos.',
        'Multiselect' => 'Selección múltiple',
        'My Services' => 'Mis Servicios',
        'My Tickets.' => 'Mis Tickets.',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            '',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            '',
        'NameX' => 'Nombre X',
        'Nederlands' => 'Neerlandés',
        'New Ticket [%s] created (Q=%s;P=%s;S=%s).' => 'Nuevo ticket [%s] creado (Q=%s;P=%s;S=%s).',
        'New Window' => 'Nueva Ventana',
        'New owner is "%s" (ID=%s).' => 'El nuevo propietario es «%s» (ID=%s).',
        'New process ticket' => 'Nuevo ticket de Proceso',
        'New responsible is "%s" (ID=%s).' => 'El nuevo responsable es «%s» (ID=%s).',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Siguiente estado posible del ticket después de agregar una nota en la pantalla de llamada telefónica entrante para la interfaz de agente.',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Siguiente estado posible del ticket después de agregar una nota en la pantalla de llamada telefónica saliente para la interfaz de agente.',
        'None' => 'Ninguno',
        'Norwegian' => 'Noruego',
        'Notification sent to "%s".' => 'Notificación enviada a «%s».',
        'Number of displayed tickets' => 'Número de tickets mostrados',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            '',
        'OTRS can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            '',
        'Old: "%s" New: "%s"' => 'Antiguo: "%s". Nuevo: "%s"',
        'Online' => 'En linea',
        'Open tickets (customer user)' => 'Tickets abiertos (usuario cliente)',
        'Open tickets (customer)' => 'Tickets abiertos (cliente)',
        'Option' => 'Opción',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Out Of Office' => 'Fuera de la Oficina',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            '',
        'Overview Escalated Tickets.' => '',
        'Overview Refresh Time' => 'Tiempo de actualización de la vista general',
        'Overview of all escalated tickets.' => '',
        'Overview of all open Tickets.' => 'Vista general de todos los Tickets abiertos.',
        'Overview of all open tickets.' => 'Vista general de todos los tickets abiertos.',
        'Overview of customer tickets.' => 'Visión general de los tickets del cliente.',
        'PGP Key Management' => 'Administración de la Clave PGP',
        'PGP Key Upload' => 'Carga de Clave PGP',
        'Package event module file a scheduler task for update registration.' =>
            '',
        'Parameters for the CreateNextMask object in the preference view of the agent interface.' =>
            '',
        'Parameters for the CustomQueue object in the preference view of the agent interface.' =>
            '',
        'Parameters for the CustomService object in the preference view of the agent interface.' =>
            '',
        'Parameters for the RefreshTime object in the preference view of the agent interface.' =>
            '',
        'Parameters for the column filters of the small ticket overview.' =>
            '',
        'Parameters for the dashboard backend of the customer company information of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the queue overview widget of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "QueuePermissionGroup" is not mandatory, queues are only listed if they belong to this permission group if you enable it. "States" is a list of states, the key is the sort order of the state in the widget. "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview.' =>
            '',
        'Parameters of the example SLA attribute Comment2.' => '',
        'Parameters of the example queue attribute Comment2.' => '',
        'Parameters of the example service attribute Comment2.' => '',
        'ParentChild' => '',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            '',
        'People' => 'Gente',
        'Performs the configured action for each event (as an Invoker) for each configured Webservice.' =>
            '',
        'Permitted width for compose email windows.' => '',
        'Permitted width for compose note windows.' => '',
        'Persian' => 'Persa',
        'Phone Call.' => 'Llamada telefónica.',
        'Picture Upload' => 'Carga de imagen',
        'Picture upload module.' => 'Módulo de carga de imágenes.',
        'Picture-Upload' => 'Carga-de-imagen',
        'Polish' => 'Polaco',
        'Portuguese' => 'Portugués',
        'Portuguese (Brasil)' => 'Portugués (Brasileño)',
        'PostMaster Filters' => 'Filtros de Correo Electrónico',
        'PostMaster Mail Accounts' => 'Cuentas de Correo Electrónico',
        'Process Management Activity Dialog GUI' => '',
        'Process Management Activity GUI' => '',
        'Process Management Path GUI' => '',
        'Process Management Transition Action GUI' => '',
        'Process Management Transition GUI' => '',
        'Process Ticket.' => '',
        'Process pending tickets.' => '',
        'Process ticket' => '',
        'ProcessID' => 'ID de Proceso',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            '',
        'Provides a matrix overview of the tickets per state per queue.' =>
            'Proporciona una vista general matriz de los tickets por estado y por cola.',
        'Queue view' => 'Vista por colas',
        'Rebuild the ticket index for AgentTicketQueue.' => '',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number.' =>
            '',
        'Refresh interval' => 'Intervalo de actualización',
        'Removed subscription for user "%s".' => 'Eliminada suscripción para el usuario «%s».',
        'Removes the ticket watcher information when a ticket is archived.' =>
            '',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be active in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            '',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            '',
        'Reports' => 'Reportes',
        'Reports (OTRS Business Solution™)' => 'Reportes (OTRS Business Solution™)',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            '',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            '',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            '',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            '',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            '',
        'Responsible Tickets' => '',
        'Responsible Tickets.' => '',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            '',
        'Retains all services in listings even if they are children of invalid elements.' =>
            '',
        'Right' => 'Derecha',
        'Roles <-> Groups' => 'Roles <-> Grupos',
        'Run file based generic agent jobs (Note: module name need needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            '',
        'Running Process Tickets' => 'Corriendo Tickets de Proceso',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            '',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            '',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'Russian' => 'Ruso',
        'S/MIME Certificate Upload' => 'Carga de Certificado S/MIME',
        'SMS' => 'SMS',
        'SMS (Short Message Service)' => 'SMS (Short Message Service)',
        'Sample command output' => 'Ejemplo de comando de salida.',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            '',
        'Schedule a maintenance period.' => 'Programar un periodo de mantenimiento.',
        'Screen' => 'Pantalla',
        'Search Customer' => 'Búsqueda de un cliente',
        'Search Ticket.' => 'Buscar ticket.',
        'Search Tickets.' => 'Buscar tickets.',
        'Search User' => 'Buscar Usuario',
        'Search backend default router.' => '',
        'Search backend router.' => '',
        'Search.' => 'Buscar.',
        'Second Queue' => 'Cola Secundaria',
        'Select after which period ticket overviews should refresh automatically.' =>
            '',
        'Select how many tickets should be shown in overviews by default.' =>
            '',
        'Select the main interface language.' => '',
        'Select your frontend Theme.' => 'Seleccione su tema',
        'Select your preferred layout for OTRS.' => '',
        'Selects the cache backend to use.' => '',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send new outgoing mail from this ticket' => '',
        'Send notifications to users.' => 'Enviar notificaciones a usuarios.',
        'Sender type for new tickets from the customer inteface.' => '',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            '',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Envíar todos los correos electrónicos saliente a través de "Copia oculta"a la dirección especificada. Por favor, utilice esto sólo por razones de copia de seguridad.',
        'Sends customer notifications just to the mapped customer.' => '',
        'Sends registration information to OTRS group.' => 'Envía la información de registro a OTRS group.',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            '',
        'Sends the notifications which are configured in the admin interface under "Notfication (Event)".' =>
            '',
        'Serbian Cyrillic' => 'Serbio Cirílico',
        'Serbian Latin' => 'Serbio (Latino)',
        'Service view' => 'Vista de servicio',
        'ServiceView' => 'Vista del servicio',
        'Set a new password by filling in your current password and a new one.' =>
            '',
        'Set minimum loglevel. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages.' =>
            '',
        'Set sender email addresses for this system.' => 'Establecer direcciones de envío de correo electrónico para este sistema.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            '',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Sets if SLA must be selected by the agent.' => '',
        'Sets if SLA must be selected by the customer.' => '',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Sets if service must be selected by the agent.' => '',
        'Sets if service must be selected by the customer.' => '',
        'Sets if ticket owner must be selected by the agent.' => '',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            '',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            '',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            '',
        'Sets the default article type for new email tickets in the agent interface.' =>
            '',
        'Sets the default article type for new phone tickets in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            '',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            '',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            '',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            '',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            '',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            '',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            '',
        'Sets the default priority for new email tickets in the agent interface.' =>
            '',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            '',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            '',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default text for new email tickets in the agent interface.' =>
            '',
        'Sets the display order of the different items in the preferences view.' =>
            '',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            '',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime before a prior warning will be visible for the logged in agents.' =>
            '',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime.' =>
            '',
        'Sets the maximum number of active customers within the timespan defined in SessionActiveTime.' =>
            '',
        'Sets the maximum number of active sessions per agent within the timespan defined in SessionActiveTime.' =>
            '',
        'Sets the maximum number of active sessions per customers within the timespan defined in SessionActiveTime.' =>
            '',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            '',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            '',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            '',
        'Sets the options for PGP binary.' => '',
        'Sets the order of the different items in the customer preferences view.' =>
            '',
        'Sets the password for private PGP key.' => '',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            '',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            '',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the stats hook.' => '',
        'Sets the system time zone (required a system with UTC as system time). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the time (in seconds) a user is marked as active (minimum active time is 300 seconds).' =>
            '',
        'Sets the timeout (in seconds) for http/ftp downloads.' => '',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            '',
        'Sets the user time zone per user (required a system with UTC as system time and UTC under TimeZone). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the user time zone per user based on java script / browser time zone offset feature at login time.' =>
            '',
        'Shared Secret' => 'Secreto Compartido',
        'Should the cache data be held in memory?' => '',
        'Should the cache data be stored in the selected cache backend?' =>
            '',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'Mostrar una selección de responsable en tickets telefónicos y por email en la interfaz de agente.',
        'Show article as rich text even if rich text writing is disabled.' =>
            'Mostrar artículo como texto enriquecido incluso si el texto enriquecido está desactivado.',
        'Show queues even when only locked tickets are in.' => 'Mostrar colas incluso cuando solo se encuentren tickets bloqueados.',
        'Show the current owner in the customer interface.' => 'Mostrar el propietario actual en la interfaz de cliente.',
        'Show the current queue in the customer interface.' => 'Mostrar la cola actual en la interfaz de usuario.',
        'Show the history for this ticket' => 'Mostrar el historial para este ticket',
        'Shows a count of icons in the ticket zoom, if the article has attachments.' =>
            'Muestra una cuenta de iconos en la ampliación del ticket, si el artículo tiene adjuntos.',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to see the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to see a zoomed email ticket in plain text.' => '',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Shows a select of ticket attributes to order the queue view ticket list. The possible selections can be configured via \'TicketOverviewMenuSort###SortAttributes\'.' =>
            '',
        'Shows all both ro and rw queues in the queue view.' => '',
        'Shows all both ro and rw tickets in the service view.' => '',
        'Shows all open tickets (even if they are locked) in the escalation view of the agent interface.' =>
            '',
        'Shows all open tickets (even if they are locked) in the status view of the agent interface.' =>
            '',
        'Shows all the articles of the ticket (expanded) in the zoom view.' =>
            '',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            '',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            '',
        'Shows colors for different article types in the article table.' =>
            'Muestra colores para los diferentes tipos de artículos en la Vista General de Artículos,',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            '',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            '',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            '',
        'Shows information on how to start OTRS Daemon' => 'Muestra información sobre cómo iniciar OTRS Daemon',
        'Shows the activated ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            '',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            '',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            '',
        'Shows the customer user\'s info in the ticket zoom view.' => '',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.' =>
            '',
        'Shows the message of the day on login screen of the agent interface.' =>
            '',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            '',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the title fields in the close ticket screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket note screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows time in long format (days, hours, minutes), if set to "Yes"; or in short format (days, hours), if set to "No".' =>
            '',
        'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".' =>
            '',
        'Simple' => 'Simple',
        'Skin' => 'Apariencia',
        'Slovak' => 'Eslovaco',
        'Slovenian' => 'Esloveno',
        'Software Package Manager.' => 'Administrador de paquetes de software.',
        'SolutionDiffInMin' => '',
        'SolutionInMin' => '',
        'Some description!' => '¡Alguna descripción!',
        'Some picture description!' => 'Alguna descripción de imagen!',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            '',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            '',
        'Spam' => 'Spam',
        'Spam Assassin example setup. Ignores emails that are marked with SpamAssassin.' =>
            '',
        'Spam Assassin example setup. Moves marked mails to spam queue.' =>
            '',
        'Spanish' => 'Español',
        'Spanish (Colombia)' => 'Español (Colombia)',
        'Spanish (Mexico)' => 'Español (México)',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            'Palabras vacías en español para el índice de texto completo. Estas palabras serán eliminadas del índice de búsqueda.',
        'Specifies if an agent should receive email notification of his own actions.' =>
            '',
        'Specifies the available note types for this ticket mask. If the option is deselected, ArticleTypeDefault is used and the option is removed from the mask.' =>
            '',
        'Specifies the default article type for the ticket compose screen in the agent interface if the article type cannot be automatically detected.' =>
            '',
        'Specifies the different article types that will be used in the system.' =>
            '',
        'Specifies the different note types that will be used in the system.' =>
            '',
        'Specifies the directory to store the data in, if "FS" was selected for TicketStorageModule.' =>
            '',
        'Specifies the directory where SSL certificates are stored.' => '',
        'Specifies the directory where private SSL certificates are stored.' =>
            '',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            '',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            '',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            '',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com).' =>
            '',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            '',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png, 700 x 100 pixel).' =>
            '',
        'Specifies the path of the file for the performance log.' => '',
        'Specifies the path to the converter that allows the view of Microsoft Excel files, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of Microsoft Word files, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of PDF documents, in the web interface.' =>
            '',
        'Specifies the path to the converter that allows the view of XML files, in the web interface.' =>
            '',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            '',
        'Specifies user id of the postmaster data base.' => '',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            '',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            '',
        'Specify the channel to be used to fetch OTRS Business Solution™ updates. Warning: Development releases might not be complete, your system might experience unrecoverable errors and on extreme cases could become unresponsive!' =>
            '',
        'Specify the password to authenticate for the first mirror database.' =>
            '',
        'Specify the username to authenticate for the first mirror database.' =>
            '',
        'Spell checker.' => 'Corrector ortográfico.',
        'Stable' => 'Estable',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            '',
        'Start number for statistics counting. Every new stat increments this number.' =>
            '',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            '',
        'Stat#' => 'Estadística nº',
        'Status view' => 'Vista por estados',
        'Stores cookies after the browser has been closed.' => '',
        'Strips empty lines on the ticket preview in the queue view.' => '',
        'Strips empty lines on the ticket preview in the service view.' =>
            '',
        'Swahili' => 'Suajili',
        'Swedish' => 'Sueco',
        'System Address Display Name' => '',
        'System Maintenance' => 'Mantenimiento de Sistema',
        'System Request (%s).' => 'Petición del sistema (%s).',
        'Target' => 'Objetivo',
        'Templates <-> Queues' => 'Plantillas <-> Colas',
        'Textarea' => 'Área de texto',
        'Thai' => 'Tailandés',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            '',
        'The daemon registration for the scheduler cron task manager.' =>
            '',
        'The daemon registration for the scheduler future task manager.' =>
            '',
        'The daemon registration for the scheduler generic agent task manager.' =>
            '',
        'The daemon registration for the scheduler task worker.' => '',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            '',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            '',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            '',
        'The headline shown in the customer interface.' => '',
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "ivory". See "AgentLogo" for further description.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "ivory-slim". See "AgentLogo" for further description.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "slim". See "AgentLogo" for further description.' =>
            '',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown on top of the login box of the agent interface. The URL to the image must be relative URL to the skin image directory.' =>
            '',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            '',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            '',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            '',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            '',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            '',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see the setting above for how to configure the mapping.' =>
            '',
        'This is the default orange - black skin for the customer interface.' =>
            'Este es el aspecto predeterminado naranja - negro para la interfaz del cliente.',
        'This is the default orange - black skin.' => 'Este es el aspecto predeterminado naranja - negro.',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            '',
        'This module is part of the admin area of OTRS.' => 'Este módulo es parte del área de administración del OTRS.',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            '',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            '',
        'This option defines the process tickets default lock.' => '',
        'This option defines the process tickets default priority.' => '',
        'This option defines the process tickets default queue.' => '',
        'This option defines the process tickets default state.' => '',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            '',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            '',
        'This will allow the system to send text messages via SMS.' => 'Esto permitirá al sistema enviar mensajes de texto a través de SMS.',
        'Ticket Close.' => '',
        'Ticket Compose Bounce Email.' => '',
        'Ticket Compose email Answer.' => '',
        'Ticket Customer.' => 'Cliente del Ticket .',
        'Ticket Forward Email.' => '',
        'Ticket FreeText.' => '',
        'Ticket History.' => '',
        'Ticket Lock.' => '',
        'Ticket Merge.' => 'Ticket Fusionado.',
        'Ticket Move.' => 'Mover el Ticket.',
        'Ticket Note.' => 'Nota del Ticket.',
        'Ticket Notifications' => 'Notificaciones del Ticket',
        'Ticket Outbound Email.' => '',
        'Ticket Owner.' => 'Propietario del Ticket.',
        'Ticket Pending.' => 'Ticket pendiente.',
        'Ticket Print.' => 'Imprimir el ticket.',
        'Ticket Priority.' => 'Prioridad del ticket.',
        'Ticket Queue Overview' => 'Resumen de Tickets por Cola',
        'Ticket Responsible.' => 'Responsable del Ticket.',
        'Ticket Watcher' => '',
        'Ticket Zoom.' => 'Vista detallada del Ticket.',
        'Ticket bulk module.' => '',
        'Ticket event module that triggers the escalation stop events.' =>
            '',
        'Ticket moved into Queue "%s" (%s) from Queue "%s" (%s).' => 'Ticket movido a la cola «%s» (%s) de la cola «%s» (%s).',
        'Ticket notifications' => 'Notificaciones del ticket',
        'Ticket overview' => 'Vista general de tickets',
        'Ticket plain view of an email.' => '',
        'Ticket title' => 'Título del Ticket ',
        'Ticket zoom view.' => '',
        'TicketNumber' => 'Número de Ticket',
        'Tickets.' => 'Tickets.',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            '',
        'Title updated: Old: "%s", New: "%s"' => 'Título actualizado: Antiguo: «%s», Nuevo: «%s»',
        'To accept login information, such as an EULA or license.' => '',
        'To download attachments.' => 'Para descargar archivos adjuntos.',
        'Toggles display of OTRS FeatureAddons list in PackageManager.' =>
            '',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Transport selection for ticket notifications.' => '',
        'Tree view' => 'Vista en árbol',
        'Triggers ticket escalation events and notification events for escalation.' =>
            '',
        'Turkish' => 'Turco',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            '',
        'Turns on drag and drop for the main navigation.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Ukrainian' => 'Ucraniano',
        'Unlock tickets that are past their unlock timeout.' => 'Desbloquea los tickets que han superado el tiempo de espera de desbloqueo.',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            '',
        'Unlocked ticket.' => 'Ticket desbloqueado.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            '',
        'Updated SLA to %s (ID=%s).' => 'SLA actualizado a %s (ID=%s).',
        'Updated Service to %s (ID=%s).' => 'Servicio actualizado a %s (ID=%s).',
        'Updated Type to %s (ID=%s).' => 'Tipo actualizado a %s (ID=%s).',
        'Updated: %s' => 'Actualizado: %s',
        'Updated: %s=%s;%s=%s;%s=%s;' => 'Actualizado: %s=%s;%s=%s;%s=%s;',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            '',
        'Updates the ticket index accelerator.' => 'Actualiza el acelerador del índice de tickets.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            '',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            '',
        'UserFirstname' => 'Nombre de Usuario',
        'UserLastname' => 'Apellido de Usuario',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            '',
        'Uses richtext for viewing and editing ticket notification.' => 'Utiliza texto enriquecido para ver y editar la notificación de tickets .',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            '',
        'Vietnam' => 'Vietnamita',
        'View performance benchmark results.' => 'Ver resultados de la prueba de desempeño.',
        'Watch this ticket' => 'Vigilar este ticket',
        'Watched Tickets.' => 'Tickets vistos.',
        'We are performing scheduled maintenance.' => 'Estamos realizando un mantenimiento programado.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Estamos realizando un mantenimiento programado. Inicio de Sesión temporalmente no disponible.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Estamos realizando un mantenimiento programado. Estaremos nuevamente en linea en breve.',
        'Web View' => 'Vista de la Web',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            '',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            '',
        'Yes, but hide archived tickets' => 'Sí, pero ocultar tickets archivados',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Su correo con el número de ticket "<OTRS_TICKET>" ha sido rebotado a "<OTRS_BOUNCE_TO>". Póngase en contacto con esa dirección para obtener más información.',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            'Su selección de colas de sus colas preferidas. También se notifica sobre esas colas a través de correo electrónico si está habilitado.',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            'Su selección de servicios de sus servicios preferidos. También se notifica sobre esos servicios por correo electrónico si está habilitado.',
        'attachment' => 'archivo adjunto',
        'bounce' => 'rebotar',
        'compose' => 'componer',
        'debug' => 'depurar',
        'error' => 'error',
        'forward' => 'transmitido',
        'info' => 'Información',
        'inline' => 'en línea',
        'notice' => 'Nota',
        'pending' => 'pendiente',
        'responsible' => 'responsable',
        'stats' => 'estadísticas',

    };
    # $$STOP$$
    return;
}

1;
