# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_MX;

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
    $Self->{Completeness}        = 0.669038422443586;

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Sí',
        'No' => 'No',
        'yes' => 'sí',
        'no' => 'no',
        'Off' => 'Apagado',
        'off' => 'apagado',
        'On' => 'Encendido',
        'on' => 'encendido',
        'top' => 'inicio',
        'end' => 'fin',
        'Done' => 'Hecho',
        'Cancel' => 'Cancelar',
        'Reset' => 'Resetear',
        'more than ... ago' => 'Desde hace más de ... ',
        'in more than ...' => 'en mas de ...',
        'within the last ...' => 'dentro del ultimo ...',
        'within the next ...' => 'dentro del siguiente ...',
        'Created within the last' => 'Creado dentro del ultimo',
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
        'quarter' => 'trimestre',
        'quarter(s)' => 'trimestre(s)',
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
        'Setting' => 'Configuración',
        'Settings' => 'Configuraciones',
        'Example' => 'Ejemplo',
        'Examples' => 'Ejemplos',
        'valid' => 'válido',
        'Valid' => 'Válido',
        'invalid' => 'inválido',
        'Invalid' => 'Invalido',
        '* invalid' => '* inválido',
        'invalid-temporarily' => 'temporalmente-inválido',
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
        '...Back' => '...Regresar',
        '-none-' => '-ninguno-',
        'none' => 'ninguno',
        'none!' => 'ninguno',
        'none - answered' => 'ninguno - respondido',
        'please do not edit!' => 'Por favor, no lo modifique',
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
        'Lite' => 'Reducida',
        'User' => 'Usuario',
        'Username' => 'Nombre de Usuario',
        'Language' => 'Idioma',
        'Languages' => 'Idiomas',
        'Password' => 'Contraseña',
        'Preferences' => 'Preferencias',
        'Salutation' => 'Saludo',
        'Salutations' => 'Saludos',
        'Signature' => 'Firma',
        'Signatures' => 'Firmas',
        'Customer' => 'Cliente',
        'CustomerID' => 'Identificador del cliente',
        'CustomerIDs' => 'Identificadores del cliente',
        'customer' => 'cliente',
        'agent' => 'agente',
        'system' => 'sistema',
        'Customer Info' => 'Información del Cliente',
        'Customer Information' => 'Información del Cliente',
        'Customer Companies' => 'Compañías de los Clientes',
        'Company' => 'Compañía',
        'go!' => 'ir',
        'go' => 'ir',
        'All' => 'Todo',
        'all' => 'todo',
        'Sorry' => 'Disculpe',
        'update!' => 'actualizar',
        'update' => 'actualizar',
        'Update' => 'Actualizar',
        'Updated!' => 'Actualizado',
        'submit!' => 'enviar',
        'submit' => 'enviar',
        'Submit' => 'Enviar',
        'change!' => 'modificar',
        'Change' => 'Modificar',
        'change' => 'modificar',
        'click here' => 'haga click aquí',
        'Comment' => 'Comentario',
        'Invalid Option!' => 'Opción Inválida',
        'Invalid time!' => 'Hora inválida.',
        'Invalid date!' => 'Fecha inválida.',
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
        'Item' => 'Artículo',
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
        'Added!' => 'Agregado.',
        'Category' => 'Categoría',
        'Viewer' => 'Visor',
        'Expand' => 'Expandir',
        'Small' => 'Pequeño',
        'Medium' => 'Mediano',
        'Large' => 'Grande',
        'Date picker' => 'Selector de fecha',
        'Show Tree Selection' => 'Mostrar el árbol de selección',
        'The field content is too long!' => 'El contenido del campo es demasiado largo!',
        'Maximum size is %s characters.' => 'El tamaño máximo es de %s caracteres.',
        'This field is required or' => 'Este campo es requerido o',
        'New message' => 'Mensaje nuevo',
        'New message!' => '¡Mensaje nuevo!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Por favor, responda a este(os) ticket(s) para regresar a la vista normal de la fila.',
        'You have %s new message(s)!' => 'Tiene %s mensaje(s) nuevo(s)',
        'You have %s reminder ticket(s)!' => 'Tiene %s recordatorio(s) de ticket',
        'The recommended charset for your language is %s!' => 'El juego de caracteres recomendado para su idioma es %s.',
        'Change your password.' => 'Cambiar contraseña',
        'Please activate %s first!' => '¡Favor de activar %s primero!',
        'No suggestions' => 'Sin sugerencias.',
        'Word' => 'Palabra',
        'Ignore' => 'Ignorar',
        'replace with' => 'reemplazar con',
        'There is no account with that login name.' => 'No existe una cuenta para ese nombre de usuario.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            '¡Inicio de sesión fallido! Nombre de usuario o contraseña incorrecto.',
        'There is no acount with that user name.' => 'No existe una cuenta para ese nombre de usuario',
        'Please contact your administrator' => 'Favor de contactar a su administrador',
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact your administrator.' =>
            'La autenticación fue exitosa, pero no se encontró ningún registro de cliente en el sistema. Por favor contacte a sus administrador.',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'Esta dirección de correo ya existe. Por favor inicie su sesión o reestablezca su contraseña.',
        'Logout' => 'Cerrar Sesión',
        'Logout successful. Thank you for using %s!' => 'Sesión terminada satisfactoriamente. ¡Gracias por utilizar %s!',
        'Feature not active!' => 'Funcionalidad inactiva.',
        'Agent updated!' => '¡Agente actualizado!',
        'Database Selection' => 'Selección de la Base de datos',
        'Create Database' => 'Crear Base de Datos',
        'System Settings' => 'Configuración del sistema',
        'Mail Configuration' => 'Configuración de Correo',
        'Finished' => 'Finalizado',
        'Install OTRS' => 'Instalar OTRS',
        'Intro' => 'Introducción',
        'License' => 'Licencia',
        'Database' => 'Base de Datos',
        'Configure Mail' => 'Configurar correo',
        'Database deleted.' => 'Base de dataos eliminada.',
        'Enter the password for the administrative database user.' => 'Introduzca la contraseña para el usuario administrador de la base de datos.',
        'Enter the password for the database user.' => 'Introduzca la contraseña para el usuario de base de datos.',
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Si ha establecido una contraseña para root en su base de datos, debe introducirla aquí. Si no, deje este campo en blanco.',
        'Database already contains data - it should be empty!' => 'La Base de datos ya contiene datos - debe estar vacía!',
        'Login is needed!' => 'Inicio de sesión requerido.',
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Actualmente no es posible iniciar sesión debido a un mantenimiento programado del sistema.',
        'Password is needed!' => 'Contraseña requerida.',
        'Take this Customer' => 'Utilizar este cliente',
        'Take this User' => 'Utilizar este usuario',
        'possible' => 'posible',
        'reject' => 'rechazar',
        'reverse' => 'revertir',
        'Facility' => 'Instalación',
        'Time Zone' => 'Zona Horaria',
        'Pending till' => 'Pendiente hasta',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            '¡No use la cuenta de Superusuario para trabajar con OTRS! Cree nuevos Agentes y trabaje con esas cuentas.',
        'Dispatching by email To: field.' => 'Despachar por el campo Para: del correo electrónico.',
        'Dispatching by selected Queue.' => 'Despachar por la fila seleccionada.',
        'No entry found!' => 'No se encontró entrada alguna.',
        'Session invalid. Please log in again.' => 'Sesión no válida. Por favor, entre de nuevo.',
        'Session has timed out. Please log in again.' => 'La sesión ha caducado. Por favor, conéctese nuevamente.',
        'Session limit reached! Please try again later.' => '¡Límite de sesiones alcanzado! Por favor intente más tarde.',
        'No Permission!' => 'No tiene Permiso.',
        '(Click here to add)' => '(Haga click aquí para añadir)',
        'Preview' => 'Vista Previa',
        'Package not correctly deployed! Please reinstall the package.' =>
            'El paquete no fue desplegado correctamente. Por favor, reinstale el paquete.',
        '%s is not writable!' => '%s no es modificable!',
        'Cannot create %s!' => 'No se puede crear %s!',
        'Check to activate this date' => 'Marcar para activar esta fecha',
        'You have Out of Office enabled, would you like to disable it?' =>
            'Tiene habilitado «Fuera de la oficina», ¿desea inhabilitarlo?',
        'News about OTRS releases!' => '¡Noticias sobre lanzamientos de OTRS!',
        'Go to dashboard!' => '¡Ir al panel principal!',
        'Customer %s added' => 'Cliente %s añadido',
        'Role added!' => '¡Rol añadido!',
        'Role updated!' => '¡Rol actualizado!',
        'Attachment added!' => '¡Archivo adjunto añadido!',
        'Attachment updated!' => '¡Archivo adjunto actualizado!',
        'Response added!' => '¡Respuesta añadida!',
        'Response updated!' => '¡Respuesta actualizada!',
        'Group updated!' => '¡Grupo actualizado!',
        'Queue added!' => '¡Fila añadida!',
        'Queue updated!' => '¡Fila actualizada!',
        'State added!' => '¡Estado añadido!',
        'State updated!' => '¡Estado actualizado!',
        'Type added!' => '¡Tipo añadido!',
        'Type updated!' => '¡Tipo actualizado!',
        'Customer updated!' => '¡Cliente actualizado!',
        'Customer company added!' => '¡Se agregó la compañía del cliente!',
        'Customer company updated!' => '¡La compañía del cliente se actualizó!',
        'Note: Company is invalid!' => 'Nota: La compañía es inválida.',
        'Mail account added!' => '¡Cuanta de correo agregada!',
        'Mail account updated!' => '¡Cuenta de correo actualizada!',
        'System e-mail address added!' => '¡Cuenta de correo del sistema actualizada!',
        'System e-mail address updated!' => '¡Cuenta de correo del sistema actualizada!',
        'Contract' => 'Contrato',
        'Online Customer: %s' => 'Cliente Conectado: %s',
        'Online Agent: %s' => 'Agente Conectado: %s',
        'Calendar' => 'Calendario',
        'File' => 'Archivo',
        'Filename' => 'Nombre del archivo',
        'Type' => 'Tipo',
        'Size' => 'Tamaño',
        'Upload' => 'Subir',
        'Directory' => 'Directorio',
        'Signed' => 'Firmado',
        'Sign' => 'Firma',
        'Crypted' => 'Encriptado',
        'Crypt' => 'Encriptar',
        'PGP' => 'PGP',
        'PGP Key' => 'Llave PGP',
        'PGP Keys' => 'Llaves PGP',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'Certificado S/MIME',
        'S/MIME Certificates' => 'Certificados S/MIME',
        'Office' => 'Oficina',
        'Phone' => 'Teléfono',
        'Fax' => 'Fax',
        'Mobile' => 'Móvil',
        'Zip' => 'CP',
        'City' => 'Ciudad',
        'Street' => 'Calle',
        'Country' => 'País',
        'Location' => 'Localidad',
        'installed' => 'instalado',
        'uninstalled' => 'desinstalado',
        'Security Note: You should activate %s because application is already running!' =>
            'Nota de seguridad: Debe activar %s porque la aplicación ya está ejecutándose',
        'Unable to parse repository index document.' => 'No es posible traducir el documento de índice del repositorio.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'No se encontraron paquetes en este repositorio para la versión del framework que ud. utiliza, sólo contiene paquetes para otras versiones.',
        'No packages, or no new packages, found in selected repository.' =>
            'No se encontraron paquetes (o paquetes nuevos) en el repositorio seleccionado.',
        'Edit the system configuration settings.' => 'Modificar la configuración del sistema.',
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'La información de las ACL en la base de datos no está sincronizada con la configuración del sistema, por favor, despliegue todas las ACLs.',
        'printed at' => 'impreso en',
        'Loading...' => 'Cargando...',
        'Dear Mr. %s,' => 'Apreciable Sr. %s,',
        'Dear Mrs. %s,' => 'Apreciable Sra. %s,',
        'Dear %s,' => 'Apreciable %s,',
        'Hello %s,' => 'Hola %s,',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Esta dirección de email no se puede usar para registrarse.  Por favor contacte al personal de soporte.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Cuenta nueva creada. Información de inicio de sesión enviada a %s. Por favor, revise su correo electrónico.',
        'Please press Back and try again.' => 'Por favor, presione Atrás e inténtelo de nuevo.',
        'Sent password reset instructions. Please check your email.' => 'Instrucciones de restablecimiento de contraseña enviadas. Por favor, revise su correo electrónico.',
        'Sent new password to %s. Please check your email.' => 'Contraseña nueva enviada a %s. Por favor, revise su correo electrónico.',
        'Upcoming Events' => 'Eventos Próximos',
        'Event' => 'Evento',
        'Events' => 'Eventos',
        'Invalid Token!' => 'Información inválida.',
        'more' => 'más',
        'Collapse' => 'Colapso',
        'Shown' => 'Mostrados (as)',
        'Shown customer users' => 'Los clientes mostrados',
        'News' => 'Noticias',
        'Product News' => 'Noticias de Productos',
        'OTRS News' => 'Novedades de OTRS',
        '7 Day Stats' => 'Estadísticas Semanales',
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'La información para la gestión de procesos no se encuentra sincronizada con la configuración del sistema, por favor sincronice todos los procesos.',
        'Package not verified by the OTRS Group! It is recommended not to use this package.' =>
            'El paquete no ha sido verificado por el Grupo OTRS! Se recomienda no utilizar este paquete.',
        '<br>If you continue to install this package, the following issues may occur!<br><br>&nbsp;-Security problems<br>&nbsp;-Stability problems<br>&nbsp;-Performance problems<br><br>Please note that issues that are caused by working with this package are not covered by OTRS service contracts!<br><br>' =>
            '<br>Si continua con la instalación de este paquete se pueden presentar los incidentes siguientes!<br><br>&nbsp;-Problemas de Seguridad<br>&nbsp;-Problemas de Estabilidad<br>&nbsp;-Problemas de Desempeño<br><br>Por favor, debe notar que los incidentes provocados por utilizar este paquete, no están cubiertos por los contratos de servicio que proporciona OTRS!<br><br>',
        'Mark' => 'Marcar',
        'Unmark' => 'Desmarcar',
        'Bold' => 'Negritas',
        'Italic' => 'Cursiva',
        'Underline' => 'Subrallado',
        'Font Color' => 'Color de la letra',
        'Background Color' => 'Color del fondo',
        'Remove Formatting' => 'Eliminar formato',
        'Show/Hide Hidden Elements' => 'Mostrar/Ocultar Elementos Ocultos',
        'Align Left' => 'Alinear a la izquierda',
        'Align Center' => 'Alinear al centro',
        'Align Right' => 'Alinear a la derecha',
        'Justify' => 'Justificar',
        'Header' => 'Encabezado',
        'Indent' => 'Aumentar sagría',
        'Outdent' => 'Reducir sangría',
        'Create an Unordered List' => 'Crear una Lista Desordenada',
        'Create an Ordered List' => 'Crear una Lista Ordenada',
        'HTML Link' => 'Enlace HTML',
        'Insert Image' => 'Insertar imagen',
        'CTRL' => 'CTRL',
        'SHIFT' => 'SHIFT',
        'Undo' => 'Deshacer',
        'Redo' => 'Rehacer',
        'OTRS Daemon is not running.' => 'El Daemon OTRS no está en ejecución.',
        'Can\'t contact registration server. Please try again later.' => 'No es posible contactar con el servidor de registro. Por favor, inténtelo de nuevo más tarde.',
        'No content received from registration server. Please try again later.' =>
            'No se ha recibido ningún contenido del servidor de registro. Por favor, inténtelo de nuevo más tarde.',
        'Problems processing server result. Please try again later.' => 'Problemas al procesar el resultado del servidor. Por favor, inténtelo de nuevo más tarde.',
        'Username and password do not match. Please try again.' => 'El nombre de usuario y contraseña no coinciden. Por favor intente de nuevo.',
        'The selected process is invalid!' => '¡El proceso seleccionado es inválido!',
        'Upgrade to %s now!' => '¡Actualice ahora a  %s!',
        '%s Go to the upgrade center %s' => '%s Vaya al centro de actualizaciones %s',
        'The license for your %s is about to expire. Please make contact with %s to renew your contract!' =>
            'La licencia de su %s esta por expirar. ¡Por favor, debe contactase con %s para renovar su contrato!',
        'An update for your %s is available, but there is a conflict with your framework version! Please update your framework first!' =>
            'Una actualización de su %s está disponible, pero existe un conflicto con la versión del framework! Por favor actualice su framework primero!',
        'Your system was successfully upgraded to %s.' => 'Su sistema fue actualizado satisfactoriamente a %s.',
        'There was a problem during the upgrade to %s.' => 'Hubo un problema al actualizar a %s.',
        '%s was correctly reinstalled.' => '%s fue reinstalado correctamente.',
        'There was a problem reinstalling %s.' => 'Hubo un problema al reinstalar %s.',
        'Your %s was successfully updated.' => 'Su %s ha sido actualizada correctamente.',
        'There was a problem during the upgrade of %s.' => 'Hubo un problema durante la actualización de %s.',
        '%s was correctly uninstalled.' => '%s fue desinstalado correctamente.',
        'There was a problem uninstalling %s.' => 'Hubo un problema durante la desinstalación de %s.',
        'Enable cloud services to unleash all OTRS features!' => 'Habilite servicios en la nube para desencadenar todas las características de OTRS!',

        # Template: AAACalendar
        'New Year\'s Day' => 'Año nuevo',
        'International Workers\' Day' => 'Día del trabajo',
        'Christmas Eve' => 'Noche buena',
        'First Christmas Day' => 'Navidad',
        'Second Christmas Day' => 'Segundo día de navidad',
        'New Year\'s Eve' => 'Víspera de año nuevo',

        # Template: AAAGenericInterface
        'OTRS as requester' => 'OTRS como solicitante',
        'OTRS as provider' => 'OTRS como proveedor',
        'Webservice "%s" created!' => '¡El webservice "%s" ha sido creado!',
        'Webservice "%s" updated!' => '¡El webservice "%s" ha sido actualizado!',

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
        'Preferences updated successfully!' => '¡Las preferencias se actualizaron satisfactoriamente!',
        'User Profile' => 'Perfil del Usuario',
        'Email Settings' => 'Configuración del Correo Electrónico',
        'Other Settings' => 'Otras Configuraciones',
        'Notification Settings' => 'Configuración de Notificaciones',
        'Change Password' => 'Cambiar Contraseña',
        'Current password' => 'Contraseña actual',
        'New password' => 'Nueva contraseña',
        'Verify password' => 'Verificar contraseña',
        'Spelling Dictionary' => 'Diccionario Ortográfico',
        'Default spelling dictionary' => 'Diccionario por predeterminado',
        'Max. shown Tickets a page in Overview.' => 'Cantidad máxima de Tickets a mostrar en vista Resumen.',
        'The current password is not correct. Please try again!' => '¡Contraseña incorrecta! Por favor, intente de nuevo.',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            '¡No se puede actualizar su contraseña, porque las contraseñas nuevas no coinciden! Por favor, intente de nuevo.',
        'Can\'t update password, it contains invalid characters!' => '¡No se puede actualizar su contraseña, porque contiene caracteres inválidos!',
        'Can\'t update password, it must be at least %s characters long!' =>
            '¡No se puede actualizar su contraseña, porque debe contener al menos %s caracteres!',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase characters!' =>
            '¡No se puede actualizar su contraseña, porque debe contener al menos 2 caracteres en mayúscula y 2 en minúscula!',
        'Can\'t update password, it must contain at least 1 digit!' => '¡No se puede actualizar su contraseña, porque debe contener al menos 1 dígito!',
        'Can\'t update password, it must contain at least 2 characters!' =>
            '¡No se puede actualizar su contraseña, porque debe contener al menos 2 caracteres!',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            '¡No se puede actualizar su contraseña, porque la que proporcinó ya se está usando! Por favor, elija una nueva.',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Seleccione el caracter de separación para los archivos CSV (estadísticas y búsquedas). En caso de que no lo seleccione, se usará el separador por defecto para su idioma.',
        'CSV Separator' => 'Separador CSV',

        # Template: AAATicket
        'Status View' => 'Vista de Estados',
        'Service View' => 'Vista del Servicio',
        'Bulk' => 'Acciones en Lote',
        'Lock' => 'Bloquear',
        'Unlock' => 'Desbloquear',
        'History' => 'Historial',
        'Zoom' => 'Detalle',
        'Age' => 'Antigüedad',
        'Bounce' => 'Rebotar',
        'Forward' => 'Reenviar',
        'From' => 'De',
        'To' => 'Para',
        'Cc' => 'Copia ',
        'Bcc' => 'Copia Oculta',
        'Subject' => 'Asunto',
        'Move' => 'Mover',
        'Queue' => 'Fila',
        'Queues' => 'Filas',
        'Priority' => 'Prioridad',
        'Priorities' => 'Prioridades',
        'Priority Update' => 'Actualizar Prioridad ',
        'Priority added!' => '¡Prioridad agregada!',
        'Priority updated!' => '¡Prioridad actualizada!',
        'Signature added!' => '¡Firma agregada!',
        'Signature updated!' => '¡Firma actualizada!',
        'SLA' => 'SLA',
        'Service Level Agreement' => 'Acuerdo de Nivel de Servicio',
        'Service Level Agreements' => 'Acuerdos de Nivel de Servicio',
        'Service' => 'Servicio',
        'Services' => 'Servicios',
        'State' => 'Estado',
        'States' => 'Estados',
        'Status' => 'Estado',
        'Statuses' => 'Estados',
        'Ticket Type' => 'Tipo de Ticket',
        'Ticket Types' => 'Tipos de Ticket',
        'Compose' => 'Redactar',
        'Pending' => 'Pendiente',
        'Owner' => 'Propietario',
        'Owner Update' => 'Modificar Propietario',
        'Responsible' => 'Responsable',
        'Responsible Update' => 'Modificar Responsable',
        'Sender' => 'Emisor',
        'Article' => 'Artículo',
        'Ticket' => 'Ticket',
        'Createtime' => 'Fecha de creación ',
        'plain' => 'texto plano',
        'Email' => 'Correo',
        'email' => 'correo',
        'Close' => 'Cerrar',
        'Action' => 'Acción',
        'Attachment' => 'Anexo',
        'Attachments' => 'Anexos',
        'This message was written in a character set other than your own.' =>
            'Este mensaje fue escrito usando un juego de caracteres distinto al suyo',
        'If it is not displayed correctly,' => 'Si no se muestra correctamente',
        'This is a' => 'Este es un',
        'to open it in a new window.' => 'para abrir en una nueva ventana',
        'This is a HTML email. Click here to show it.' => 'Este es un mensaje HTML. Haga click aquí para mostrarlo.',
        'Free Fields' => 'Campos Libres',
        'Merge' => 'Mezclar',
        'merged' => 'mezclado',
        'closed successful' => 'cerrado exitosamente',
        'closed unsuccessful' => 'cerrado sin éxito',
        'Locked Tickets Total' => 'Total de Tickets Bloqueados',
        'Locked Tickets Reminder Reached' => 'Recordatorio Alcanzado de Tickets Bloqueados',
        'Locked Tickets New' => 'Ticket Bloqueado Nuevo',
        'Responsible Tickets Total' => 'Total de Tickets bajo mi Responsabilidad',
        'Responsible Tickets New' => 'Ticket Nuevo bajo mi Responsabilidad',
        'Responsible Tickets Reminder Reached' => 'Recordatorio Alcanzado de Tickets bajo mi Responsabilidad',
        'Watched Tickets Total' => 'Total de Tickets Monitoreados',
        'Watched Tickets New' => 'Ticket a Monitorear Nuevo',
        'Watched Tickets Reminder Reached' => 'Recordatorio Alcanzado de Tickets Monitoreados',
        'All tickets' => 'Todos los tickets',
        'Available tickets' => 'Tickets disponibles',
        'Escalation' => 'Escalada',
        'last-search' => 'última-búsqueda',
        'QueueView' => 'Ver la fila',
        'Ticket Escalation View' => 'Vista de Escaladas de Ticket',
        'Message from' => 'Mensaje de',
        'End message' => 'Fin del mensaje',
        'Forwarded message from' => 'Mensaje reenviado por',
        'End forwarded message' => 'Fin del mensaje reenviado',
        'Bounce Article to a different mail address' => 'Rebotar el artículo a una dirección de correo diferente',
        'Reply to note' => 'Responder la nota',
        'new' => 'nuevo',
        'open' => 'abierto',
        'Open' => 'Abierto',
        'Open tickets' => 'Tickets abiertos',
        'closed' => 'cerrado',
        'Closed' => 'Cerrado',
        'Closed tickets' => 'Tickets cerrados',
        'removed' => 'eliminado',
        'pending reminder' => 'recordatorio pendiente',
        'pending auto' => 'pendiente automático',
        'pending auto close+' => 'pendiente auto close+',
        'pending auto close-' => 'pendiente auto close-',
        'email-external' => 'correo-externo',
        'email-internal' => 'correo-interno',
        'note-external' => 'nota-externa',
        'note-internal' => 'nota-interna',
        'note-report' => 'nota-informe',
        'phone' => 'teléfono',
        'sms' => 'sms',
        'webrequest' => 'solicitud vía web',
        'lock' => 'bloquear',
        'unlock' => 'desbloquear',
        'very low' => 'muy bajo',
        'low' => 'bajo',
        'normal' => 'normal',
        'high' => 'alto',
        'very high' => 'muy alto',
        '1 very low' => '1 muy bajo',
        '2 low' => '2 bajo',
        '3 normal' => '3 normal',
        '4 high' => '4 alto',
        '5 very high' => '5 muy alto',
        'auto follow up' => 'auto seguimiento',
        'auto reject' => 'auto rechazar',
        'auto remove' => 'auto eliminar',
        'auto reply' => 'auto responder',
        'auto reply/new ticket' => 'auto responder/nuevo ticket',
        'Create' => 'Crear',
        'Answer' => 'Responder',
        'Phone call' => 'Llamada telefónica',
        'Ticket "%s" created!' => 'Ticket "%s" creado',
        'Ticket Number' => 'Ticket Número',
        'Ticket Object' => 'Objeto Ticket',
        'No such Ticket Number "%s"! Can\'t link it!' => 'No existe el Ticket Número "%s", no se puede vincular',
        'You don\'t have write access to this ticket.' => 'Usted no tiene permisos de escritura para este ticket.',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Lo sentimos, Usted necesita ser el propietario del ticket para realizar esta acción.',
        'Please change the owner first.' => 'Por favor, primero cambie el propietario.',
        'Ticket selected.' => 'Ticket seleccionado.',
        'Ticket is locked by another agent.' => 'Ticket bloqueado por otro agente.',
        'Ticket locked.' => 'Ticket bloqueado.',
        'Don\'t show closed Tickets' => 'No mostrar los tickets cerrados',
        'Show closed Tickets' => 'Mostrar Tickets cerrados',
        'New Article' => 'Nuevo Artículo',
        'Unread article(s) available' => 'Artículo(s) sin leer disponible',
        'Remove from list of watched tickets' => 'Quitar de la lista de tickets monitoreados',
        'Add to list of watched tickets' => 'Agregar a la lista de tickets monitoreados',
        'Email-Ticket' => 'Ticket de Email',
        'Create new Email Ticket' => 'Crea nuevo Ticket de Email',
        'Phone-Ticket' => 'Ticket Telefónico',
        'Search Tickets' => 'Buscar Tickets',
        'Customer Realname' => 'Nombre Real del Cliente',
        'Customer History' => 'Historial del Cliente',
        'Edit Customer Users' => 'Editar Clientes',
        'Edit Customer' => 'Modificar Cliente',
        'Bulk Action' => 'Acción Múltiple',
        'Bulk Actions on Tickets' => 'Acción Múltiple sobre Tickets',
        'Send Email and create a new Ticket' => 'Enviar un correo y crear un nuevo ticket',
        'Create new Email Ticket and send this out (Outbound)' => 'Crea nuevo Ticket de Email y descartar este (saliente)',
        'Create new Phone Ticket (Inbound)' => 'Crea nuevo Ticket Telefónico (entrante)',
        'Address %s replaced with registered customer address.' => 'La dirección %s fue remplazada con la dirección del cliente registrado.',
        'Customer user automatically added in Cc.' => 'Cliente agregado automáticamente en Cc.',
        'Overview of all open Tickets' => 'Resumen de todos los tickets abiertos',
        'Locked Tickets' => 'Tickets Bloqueados',
        'My Locked Tickets' => 'Mis Tickets Bloqueados',
        'My Watched Tickets' => 'Mis Tickets Monitoreados',
        'My Responsible Tickets' => 'Tickets bajo mi Responsabilidad',
        'Watched Tickets' => 'Tickets Monitoreados',
        'Watched' => 'Monitoreado',
        'Watch' => 'Monitorear',
        'Unwatch' => 'Dejar de monitorear',
        'Lock it to work on it' => 'Bloquear para trabajar en el.',
        'Unlock to give it back to the queue' => 'Desbloquearlo para devolverlo a la fila',
        'Show the ticket history' => 'Mostrar el historial del ticket',
        'Print this ticket' => 'Imprimir este ticket',
        'Print this article' => 'Imprimir este artículo',
        'Split' => 'Separar',
        'Split this article' => 'Dividir este artículo',
        'Forward article via mail' => 'Reenviar artículo por email',
        'Change the ticket priority' => 'Cambiar prioridad del ticket',
        'Change the ticket free fields!' => 'Cambiar los campos libres del ticket',
        'Link this ticket to other objects' => 'Enlazar este ticket a otro objeto.',
        'Change the owner for this ticket' => 'Cambiar el propietario de este ticket',
        'Change the  customer for this ticket' => 'Cambiar el cliente para este ticket',
        'Add a note to this ticket' => 'Agregar una nota a este tieckt',
        'Merge into a different ticket' => 'Unir en un ticket diferente',
        'Set this ticket to pending' => 'Marcar este ticket como pendiente',
        'Close this ticket' => 'Cerrar este ticket',
        'Look into a ticket!' => 'Revisar un ticket',
        'Delete this ticket' => 'Eliminar este ticket',
        'Mark as Spam!' => 'Marcar como correo no deseado',
        'My Queues' => 'Mis Filas',
        'Shown Tickets' => 'Tickets Mostrados',
        'Shown Columns' => 'Mostrar columnas',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Su correo con número de ticket "<OTRS_TICKET>" se unió a "<OTRS_MERGE_TO_TICKET>".',
        'Ticket %s: first response time is over (%s)!' => 'Ticket %s: Tiempo para primera respuesta ha vencido (%s)',
        'Ticket %s: first response time will be over in %s!' => 'Ticket %s: Tiempo para primera respuesta vencerá en %s',
        'Ticket %s: update time is over (%s)!' => 'Ticket %s: Tiempo para actualización ha vencido (%s)',
        'Ticket %s: update time will be over in %s!' => 'Ticket %s: Tiempo para actualización vencerá en %s',
        'Ticket %s: solution time is over (%s)!' => 'Ticket %s: Tiempo para solución ha vencido (%s)',
        'Ticket %s: solution time will be over in %s!' => 'Ticket %s: Tiempo para solución vencerá en %s',
        'There are more escalated tickets!' => 'No hay más tickets escalados',
        'Plain Format' => 'Sin formato',
        'Reply All' => 'Responder a todos',
        'Direction' => 'Dirección',
        'New ticket notification' => 'Notificación de nuevos tickets',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Notifíqueme si hay un nuevo ticket en "Mis Filas".',
        'Send new ticket notifications' => 'Enviar notificaciones de ticket nuevo',
        'Ticket follow up notification' => 'Notificación de seguimiento de ticket',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Enviarme notificaciones si un cliente realiza un seguimiento y yo soy el propietario del ticket o si el ticket está desbloqueado y se encuentra en alguna de las filas en las que estoy suscrito.',
        'Send ticket follow up notifications' => 'Enviar notificaciones de seguimiento de tickets',
        'Ticket lock timeout notification' => 'Notificación de bloqueo de tickets por tiempo',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Notifíqueme si un ticket es desbloqueado por el sistema',
        'Send ticket lock timeout notifications' => 'Enviar notificaciones de ticket bloqueado por tiempo de espera',
        'Ticket move notification' => 'Notificación de reubicación de ticket',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Notifíqueme si un ticket es colocado en una de "Mis Filas".',
        'Send ticket move notifications' => 'Enviar notificaciones de reubicación de ticket',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            'La selección de sus listas de espera favoritas. También se le notifican estas listas por correo si se habilita.',
        'Custom Queue' => 'Fila personal',
        'QueueView refresh time' => 'Tiempo de actualización de la vista de filas',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'Si se habilita, la vista de filas se actualizará automáticamente después del tiempo especificado.',
        'Refresh QueueView after' => 'Actualizar la vista de filas después de',
        'Screen after new ticket' => 'Pantalla posterior a nuevo ticket',
        'Show this screen after I created a new ticket' => 'Mostrar esta pantalla después de crear un ticket nuevo',
        'Closed Tickets' => 'Tickets Cerrados',
        'Show closed tickets.' => 'Mostrar Tickets cerrados',
        'Max. shown Tickets a page in QueueView.' => 'Cantidad de Tickets a mostrar en la Vista de Fila',
        'Ticket Overview "Small" Limit' => 'Límite de vista de resumen "Pequeña" de tickets',
        'Ticket limit per page for Ticket Overview "Small"' => 'Límite de tickets por página mostrados en la vista de resumen "Pequeña"',
        'Ticket Overview "Medium" Limit' => 'Límite de la vista de resumen "Mediana" de tickets',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Límite de tickets por página mostrados en la vista de resumen "Mediana"',
        'Ticket Overview "Preview" Limit' => 'Límite de la vista de resumen "Preliminar" de tickets',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Límite de tickets por página mostrados en la vista de resumen "Preliminar"',
        'Ticket watch notification' => 'Notificación de ticket monitoreado',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Quiero recibir las mismas notificaciones que se envíen a los propietaios de mis tickets monitoreados',
        'Send ticket watch notifications' => 'Enviar notificaciones de ticket monitoreado',
        'Out Of Office Time' => 'Tiempo de ausencia de la oficina',
        'New Ticket' => 'Nuevo Ticket',
        'Create new Ticket' => 'Crear un nuevo Ticket',
        'Customer called' => 'Llamada de Cliente',
        'phone call' => 'llamada telefónica',
        'Phone Call Outbound' => 'Llamada telefónica saliente',
        'Phone Call Inbound' => 'Llamada Telefónica Entrante',
        'Reminder Reached' => 'Recordatorios alcanzados',
        'Reminder Tickets' => 'Tickets de recordatorios',
        'Escalated Tickets' => 'Tickets escalados',
        'New Tickets' => 'Nuevos tickets',
        'Open Tickets / Need to be answered' => 'Tickets Abiertos / Que necesitan de una respuesta',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'Todos los tickets abiertos en los que ya se trabajó, pero necesitan una respuesta',
        'All new tickets, these tickets have not been worked on yet' => 'Todos los tickets nuevos en los que aún no se ha trabajado',
        'All escalated tickets' => 'Todos los tickets escalados',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Todos los tickets que han llegado a la fecha de recordatorio',
        'Archived tickets' => 'Tickets Archivados',
        'Unarchived tickets' => 'Tickets No Archivados',
        'Ticket Information' => 'Información del Ticket',
        'including subqueues' => 'incluir subsecuencias',
        'excluding subqueues' => 'excluir subsecuencias',

        # Template: AAAWeekDay
        'Sun' => 'Dom',
        'Mon' => 'Lun',
        'Tue' => 'Mar',
        'Wed' => 'Mié',
        'Thu' => 'Jue',
        'Fri' => 'Vie',
        'Sat' => 'Sáb',

        # Template: AdminACL
        'ACL Management' => 'Administración de ACL',
        'Filter for ACLs' => 'Filtrar por ACLs',
        'Filter' => 'Filtro',
        'ACL Name' => 'Nombre de la ACL',
        'Actions' => 'Acciones',
        'Create New ACL' => 'Crear Nueva ACL',
        'Deploy ACLs' => 'Desplegar ACL',
        'Export ACLs' => 'Exportar ACL',
        'Configuration import' => 'Importar configuración',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Aquí puede cargar un archivo de configuración para importar ACLs a su sistema. El archivo debe estar en formato .yml tal y como lo exporta el módulo de edición de ACL.',
        'This field is required.' => 'Este es un campo obligatorio.',
        'Overwrite existing ACLs?' => '¿Sobre escribir ACLs existentes?',
        'Upload ACL configuration' => 'Cargar configuración de ACL',
        'Import ACL configuration(s)' => 'Importar configuración(es) de ACL',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Para crear una nueva ACL puede importar ACLs que hayan sido exportadas en otro sistema, o bien crear una completamente nueva.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'Los cambios a estas ACL sólo afectan al comportamiento del sistema, si despliega los datos de las ACL después. Al desplegar los datos de las ACL, los nuevos cambios realizados se escribirán en la configuración.',
        'ACLs' => 'ACLs',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Por favor, observe: Esta tabla representa el orden de ejecución de las ACL. Si necesita cambiar el orden en que se ejecutan las ACL, cambie los nombres de las ACL afectadas.',
        'ACL name' => 'Nombre de la ACL',
        'Validity' => 'Validez',
        'Copy' => 'Copiar',
        'No data found.' => 'No se encontraron datos.',

        # Template: AdminACLEdit
        'Edit ACL %s' => 'Editar ACL %s',
        'Go to overview' => 'Ir la vista de resumen',
        'Delete ACL' => 'Eliminar ACL',
        'Delete Invalid ACL' => 'Eliminar ACL Inválida',
        'Match settings' => 'Configuración de Coincidencias',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Establecer los criterios de coincidencia para esta ACL. Use \'Properties\' para coincidir con la pantalla actual o \'PropertiesDatabase\' para coincidir con los atributos del ticket actual que están en la base de datos.',
        'Change settings' => 'Cambiar configuración',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Configure lo que quiere cambiar si los criterios corresponden entre si. Tenga en cuenta que \'Possible\' es una lista blanca, \'PossibleNot\' una lista negra.',
        'Check the official' => 'Verificar el oficial',
        'documentation' => 'documentación',
        'Show or hide the content' => 'Mostrar u ocultar el contenido',
        'Edit ACL information' => 'Editar información de la ACL',
        'Stop after match' => 'Parar al coincidir',
        'Edit ACL structure' => 'Editar estructura de la ACL',
        'Save settings' => 'Grabar configuración',
        'Save ACL' => 'Guardar ACL',
        'Save' => 'Guardar',
        'or' => 'o',
        'Save and finish' => 'Guardar y terminar',
        'Do you really want to delete this ACL?' => '¿Realmente desea eliminar esta ACL?',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Este ítem todavía contiene sub ítems. Está seguro que desea eliminarlo incluyendo sus sub items?',
        'An item with this name is already present.' => 'Ya esta presente un item con el mismo nombre.',
        'Add all' => 'Agregar todo',
        'There was an error reading the ACL data.' => 'Se presentó un error al leer los datos de la ACL.',

        # Template: AdminACLNew
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            '',

        # Template: AdminAttachment
        'Attachment Management' => 'Administración de Anexos',
        'Add attachment' => 'Adjuntar archivo',
        'List' => 'Listar',
        'Download file' => 'Descargar archivo',
        'Delete this attachment' => 'Eliminar este archivo adjunto',
        'Do you really want to delete this attachment?' => 'Está seguro de eliminar este adjunto?',
        'Add Attachment' => 'Adjuntar Archivo',
        'Edit Attachment' => 'Modificar Archivo Adjunto',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Administración de Respuestas Automáticas',
        'Add auto response' => 'Agregar auto respuesta',
        'Add Auto Response' => 'Agregar Auto Respuesta',
        'Edit Auto Response' => 'Modificar Auto Respuesta',
        'Response' => 'Respuesta',
        'Auto response from' => 'Auto respuesta de',
        'Reference' => 'Referencia',
        'You can use the following tags' => 'Puede utilizar las siguientes etiquetas',
        'To get the first 20 character of the subject.' => 'Para obtener los primeros 20 caracteres del asunto.',
        'To get the first 5 lines of the email.' => 'Para obtener las primeras 5 líneas del correo.',
        'To get the name of the ticket\'s customer user (if given).' => '',
        'To get the article attribute' => 'Para obtener el atributo del artículo',
        ' e. g.' => 'Por ejemplo:',
        'Options of the current customer user data' => 'Opciones para los datos del cliente actual',
        'Ticket owner options' => 'Opciones para el propietario del ticket',
        'Ticket responsible options' => 'Opciones para el responsable del ticket',
        'Options of the current user who requested this action' => 'Opciones del usuario actual, quien solicitó esta acción',
        'Options of the ticket data' => 'Opciones de los datos del ticket',
        'Options of ticket dynamic fields internal key values' => 'Opciones de los valores de las claves internas de los campos dinámicos de los tickets',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Opciones de los valores mostrados de los campos dinámicos de los tickets, útil para los campos desplegables y de selección múltiple',
        'Config options' => 'Opciones de configuración',
        'Example response' => 'Respuesta de ejemplo',

        # Template: AdminCloudServiceSupportDataCollector
        'Cloud Service Management' => 'Gestión de Servicio en la Nube',
        'Support Data Collector' => 'Recolector  de Datos de Soporte',
        'Support data collector' => 'Recolector de datos de soporte',
        'Hint' => 'Consejo',
        'Currently support data is only shown in this system.' => 'Actualmente los datos de soporte sólo son mostrados en este sistema.',
        'It is highly recommended to send this data to OTRS Group in order to get better support.' =>
            'Se recomienda ampliamente que envié estos datos al Grupo OTRS con el fin de obtener un mejor soporte.',
        'Configuration' => 'Configuración',
        'Send support data' => 'Enviar datos de soporte',
        'This will allow the system to send additional support data information to OTRS Group.' =>
            'Esto permitirá al sistema enviar información de datos adicionales de soporte al Grupo OTRS.',
        'System Registration' => 'Registro del Sistema',
        'To enable data sending, please register your system with OTRS Group or update your system registration information (make sure to activate the \'send support data\' option.)' =>
            'Para habilitar el envío de datos, registre su sistema con Grupo OTRS o actualice la información de registro de su sistema ( asegúrese de activar la opción \'enviar datos de soporte\'.)',
        'Register this System' => 'Registrar este Sistema',
        'System Registration is disabled for your system. Please check your configuration.' =>
            'El Registro no está disponible para su sistema. Por favor revise su configuración.',

        # Template: AdminCloudServices
        'System registration is a service of OTRS Group, which provides a lot of advantages!' =>
            '!El registro del sistema es un servicio de Grupo OTRS, el cual provee innumerables ventajas!',
        'Please note that the use of OTRS cloud services requires the system to be registered.' =>
            'Por favor tenga en cuenta que el uso de servicios en la nube de OTRS requiere que el sistema esté registrado.',
        'Register this system' => 'Registrar este sistema',
        'Here you can configure available cloud services that communicate securely with %s.' =>
            'Aquí puede configurar los servicios en la nube disponibles que se comunican de forma segura con %s.',
        'Available Cloud Services' => 'Servicios en la Nube Disponibles ',
        'Upgrade to %s' => 'Actualizar a %s',

        # Template: AdminCustomerCompany
        'Customer Management' => 'Gestión de Clientes',
        'Wildcards like \'*\' are allowed.' => 'Están permitidos comodines como \'*\'.',
        'Add customer' => 'Añadir cliente',
        'Select' => 'Seleccionar',
        'List (only %s shown - more available)' => '',
        'List (%s total)' => '',
        'Please enter a search term to look for customers.' => 'Por favor, introduzca un parámetro de búsqueda para buscar clientes',
        'Add Customer' => 'Añadir Cliente',

        # Template: AdminCustomerUser
        'Customer User Management' => 'Gestión de Usuarios del Cliente',
        'Back to search results' => 'Regresar a los resultados de búsqueda',
        'Add customer user' => 'Agregar usuario del cliente',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Los usuarios del cliente necesitan tener un historial de cliente e iniciar sesión por medio del panel de cliente.',
        'Last Login' => 'Último inicio de sesión',
        'Login as' => 'Conectarse como',
        'Switch to customer' => 'Cambiar a cliente',
        'Add Customer User' => 'Agregar Usuario del Cliente',
        'Edit Customer User' => 'Editar Usuario del Cliente',
        'This field is required and needs to be a valid email address.' =>
            'Este es un campo obligatorio y tiene que ser una dirección de correo electrónico válida.',
        'This email address is not allowed due to the system configuration.' =>
            'Esta dirección de correo electrónico no está permitida, debido a la configuración del sistema.',
        'This email address failed MX check.' => 'Esta dirección de correo electrónico falló la verificación MX.',
        'DNS problem, please check your configuration and the error log.' =>
            'Problema con el DNS. Por favor, verifique su configuración y el registro de errores.',
        'The syntax of this email address is incorrect.' => 'La sintáxis de esta dirección de correo electrónico es incorrecta.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Gestionar Relaciones Cliente-Grupo',
        'Notice' => 'Aviso',
        'This feature is disabled!' => 'Esta característica está deshabilitada',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Utilice esta función únicamente si desea definir permisos de grupo para los clientes.',
        'Enable it here!' => 'Habilítelo aquí',
        'Edit Customer Default Groups' => 'Modificar los grupos por defecto de los clientes',
        'These groups are automatically assigned to all customers.' => 'Estos grupos se asignan automáticamente a todos los clientes.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Es posible gestionar estos grupos por medio de la configuración "CustomerGroupAlwaysGroups"',
        'Filter for Groups' => 'Filtro para Grupos',
        'Just start typing to filter...' => 'Comience a teclear para filtrar...',
        'Select the customer:group permissions.' => 'Seleccione los permisos cliente:grupo',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Si nada se selecciona, no habrá permisos para este grupo y los tickets no estarán disponibles para el cliente.',
        'Search Results' => 'Resultado de la búsqueda',
        'Customers' => 'Clientes',
        'No matches found.' => 'No se encontraron coincidencias.',
        'Groups' => 'Grupos',
        'Change Group Relations for Customer' => 'Modificar las Relaciones de Grupo de los Clientes',
        'Change Customer Relations for Group' => 'Modificar las Relaciones de Cliente de los Grupos',
        'Toggle %s Permission for all' => 'Activar permiso %s para todos',
        'Toggle %s permission for %s' => 'Activar permiso %s para %s',
        'Customer Default Groups:' => 'Grupos por defecto de los clientes:',
        'No changes can be made to these groups.' => 'Estos grupos no se pueden modificar.',
        'ro' => 'ro',
        'Read only access to the ticket in this group/queue.' => 'Acceso de sólo lectura a los tickets de este grupo/fila.',
        'rw' => 'rw',
        'Full read and write access to the tickets in this group/queue.' =>
            'Acceso completo de lectura y escritura a los tickets de este grupo/fila.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Administrar las relaciones Cliente-Servicios',
        'Edit default services' => 'Modificar los servicios por defecto',
        'Filter for Services' => 'Filtro para Servicios',
        'Allocate Services to Customer' => 'Asignar Servicios al Cliente',
        'Allocate Customers to Service' => 'Asignar Clientes al Servicio',
        'Toggle active state for all' => 'Habilitar estado activo para todos',
        'Active' => 'Activo',
        'Toggle active state for %s' => 'Habilitar estado activo para %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => 'Gestión de Campos Dinámicos',
        'Add new field for object' => 'Agregar nuevo campo para el objeto',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Para añadir un nuevo campo, seleccione el tipo de campo de la lista de objetos, el objeto define los limites del campo y no puede ser cambiado después de la creación del campo.',
        'Dynamic Fields List' => 'Lista de Campos Dinámicos',
        'Dynamic fields per page' => 'Campos dinámicos por página',
        'Label' => 'Etiqueta',
        'Order' => 'Orden',
        'Object' => 'Objeto',
        'Delete this field' => 'Eliminar este campo',
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            '¿Seguro que desea eliminar este campo dinámico? ¡Se PERDERÁN TODOS los datos asociados a este campo!',
        'Delete field' => 'Eliminar campo',
        'Deleting the field and its data. This may take a while...' => 'Eliminando el campo y su información. Esto puede tomar un tiempo...',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => 'Campos Dinámicos',
        'Field' => 'Campo',
        'Go back to overview' => 'Regresar al resumen',
        'General' => 'General',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Este campo es obligatorio, y el valor debe ser solo de caracteres alfabéticos y numéricos.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Debe ser único y sólo acepta caracteres alfabéticos y numéricos.',
        'Changing this value will require manual changes in the system.' =>
            'Cambiar este valor requerirá cambios manuales en el sistema.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Éste es el nombre a ser mostrado en las pantallas en las que el campo esté activo.',
        'Field order' => 'Orden del campo',
        'This field is required and must be numeric.' => 'Este campo es obligatorio y debe ser numérico.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Éste es el orden en que se mostrará este campo en las pantallas en las que esté activo.',
        'Field type' => 'Typo de campo',
        'Object type' => 'Tipo de objeto',
        'Internal field' => 'Campo interno',
        'This field is protected and can\'t be deleted.' => 'Este campo está protegido y no puede ser eliminado.',
        'Field Settings' => 'Configuración del Campo',
        'Default value' => 'Valor por defecto',
        'This is the default value for this field.' => 'Este es el valor predefinido para este campo.',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => 'Diferencia de fechas predeterminada',
        'This field must be numeric.' => 'Este campo debe ser numérico.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'La diferencia de AHORA (en segundos) para calcular el valor predeterminado del campo (p. ej. 3600 o -60).',
        'Define years period' => 'Años en el futuro',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Active esta característica para definir un rango fijo de años (en el futuro y en el pasado) para mostrar en la parte del campo año.',
        'Years in the past' => 'Años en el pasado',
        'Years in the past to display (default: 5 years).' => 'Años en el pasado a mostrar (valor predeterminado: 5 años).',
        'Years in the future' => 'Años en el futuro',
        'Years in the future to display (default: 5 years).' => 'Años en el futuro a mostrar (valor predeterminado: 5 años).',
        'Show link' => 'Mostrar enlace',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Aquí puede indicar un enlace HTTP opcional para el valor del campo en las pantallas de Vista general y Ampliación',
        'Link for preview' => 'Enlace para muestra',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            '',
        'Restrict entering of dates' => 'Restringir el ingreso de fechas',
        'Here you can restrict the entering of dates of tickets.' => 'Aquí puede restringir el ingreso de fechas para los tickets.',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => 'Valores posibles',
        'Key' => 'Clave',
        'Value' => 'Valor',
        'Remove value' => 'Eliminar valor',
        'Add value' => 'Agregar valor',
        'Add Value' => 'Agregar Valor',
        'Add empty value' => 'Agregar un valor vacío',
        'Activate this option to create an empty selectable value.' => 'Active esta opción para crear un valor seleccionable vacío.',
        'Tree View' => 'Viste de Árbol',
        'Activate this option to display values as a tree.' => 'Active esta opción para mostrar los valores como un árbol.',
        'Translatable values' => 'Valores traducibles',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Si activa esta opción los valores se traducirán al idioma definido por el usuario.',
        'Note' => 'Nota',
        'You need to add the translations manually into the language translation files.' =>
            'Necesita añadir las traducciones manualmente en los ficheros de traducción de idiomas.',

        # Template: AdminDynamicFieldText
        'Number of rows' => 'Número de renglones',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Indica la altura (en líneas) de este campo en el modo de edición.',
        'Number of cols' => 'Número de columnas',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Indica el ancho (en caracteres) para este campo en el modo de edición.',
        'Check RegEx' => 'Verificar RegEx',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Aquí puede especificar una expresión regular para comprobar el valor. El regex se ejecutara con los modificadores xms.',
        'RegEx' => 'RegEx',
        'Invalid RegEx' => 'RegEx inválido',
        'Error Message' => 'Mensaje de error',
        'Add RegEx' => 'Agregar RedEx',

        # Template: AdminEmail
        'Admin Notification' => 'Notificación del Administrador',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Con este módulo, los administradores pueden enviar mensajes a los agentes, a los miembros de un grupo o agentes con algún tipo de rol.',
        'Create Administrative Message' => 'Crear un Mmensaje Administrativo',
        'Your message was sent to' => 'Mensaje enviado a',
        'Send message to users' => 'Enviar mensaje a los usuarios',
        'Send message to group members' => 'Enviar mensaje a los miembros del grupo',
        'Group members need to have permission' => 'Los miembros del grupo necesitan tener permiso',
        'Send message to role members' => 'Enviar mensaje a los miembros del rol',
        'Also send to customers in groups' => 'También enviar a los clientes de los grupos',
        'Body' => 'Cuerpo',
        'Send' => 'Enviar',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Agente Genérico',
        'Add job' => 'Agregar tarea',
        'Last run' => 'Última ejecución',
        'Run Now!' => 'Ejecutar ahora',
        'Delete this task' => 'Eliminar esta tarea',
        'Run this task' => 'Ejecutar esta tarea',
        'Do you really want to delete this task?' => 'Está seguro de eliminar esta tarea?',
        'Job Settings' => 'Configuraciones de la Tarea',
        'Job name' => 'Nombre de la tarea',
        'The name you entered already exists.' => 'El nombre introdujo ya existe.',
        'Toggle this widget' => 'Activar este widget',
        'Automatic execution (multiple tickets)' => 'Ejecución automática (tickets múltiples)',
        'Execution Schedule' => 'Agenda de Ejecución',
        'Schedule minutes' => 'Fijar minutos',
        'Schedule hours' => 'Fijar horas',
        'Schedule days' => 'Fijar días',
        'Currently this generic agent job will not run automatically.' =>
            'Actualmente esta tarea del agente genérico no se ejecutará automáticamente',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Para habilitar la ejecución automática, seleccione al menos un valor de minutos, horas y días.',
        'Event based execution (single ticket)' => 'Ejecución basada en eventos (un solo ticket)',
        'Event Triggers' => 'Disparadores de Eventos',
        'List of all configured events' => 'Lista de todos los eventos configurados',
        'Delete this event' => 'Eliminar este evento',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Puede definir eventos de un ticket, de forma adicional o alternativa a un periodo de ejecución, que disparararán este trabajo',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Si se dispara un evento de ticket, se aplicará el filtro de tickets para comprobar si el ticket coincide. Sólo entonces se ejecuta el trabajo sobre ese ticket.',
        'Do you really want to delete this event trigger?' => '¿Realmente desea eliminar este disparador de evento?',
        'Add Event Trigger' => 'Agregar Disparador de Evento',
        'Add Event' => 'Agregar Evento',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Para añadir un nuevo evento debe seleccionar el objeto evento y el nombre del evento y después pulsar el botón "+"',
        'Duplicate event.' => 'Evento duplicado.',
        'This event is already attached to the job, Please use a different one.' =>
            'Este evento ya está ligado al trabajo. Por favor seleccione uno diferente.',
        'Delete this Event Trigger' => 'Eliminar este Disparador de Evento',
        'Remove selection' => 'Quitar selección',
        'Select Tickets' => 'Seleccionar Tickets',
        '(e. g. 10*5155 or 105658*)' => '(ej: 10*5155 o 105658*)',
        '(e. g. 234321)' => '(ej: 234321)',
        'Customer user' => 'Usuario del cliente',
        '(e. g. U5150)' => '(ej: U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Búsqueda en todo el texto del artículo (por ejemplo: "Mar*in" o "Baue*").',
        'Agent' => 'Agente',
        'Ticket lock' => 'Bloqueo de ticket',
        'Create times' => 'Tiempos de creación',
        'No create time settings.' => 'No existen configuraciones para tiempo de creación.',
        'Ticket created' => 'Ticket creado',
        'Ticket created between' => 'Ticket creado entre',
        'Last changed times' => 'Últimas veces que se cambió',
        'No last changed time settings.' => 'No hay configuración para las últimas veces que se cambió',
        'Ticket last changed' => 'Último cambio del ticket',
        'Ticket last changed between' => 'Últimos cambios del ticket entre',
        'Change times' => 'Tiempos en que se efectuaron los cambios',
        'No change time settings.' => 'Sin cambio de marca de tiempo',
        'Ticket changed' => 'Ticket modificado',
        'Ticket changed between' => 'Ticket modificado entre',
        'Close times' => 'Tiempos de cierre',
        'No close time settings.' => 'No existen configuraciones para tiempo de cierre.',
        'Ticket closed' => 'Ticket cerrado',
        'Ticket closed between' => 'Ticket cerrado entre',
        'Pending times' => 'Tiempos de espera',
        'No pending time settings.' => 'No existen configuraciones para tiempo en espera',
        'Ticket pending time reached' => 'El tiempo en espera del Ticket ha sido alcanzado',
        'Ticket pending time reached between' => 'El tiempo en espera del Ticket ha sido alcanzado entre',
        'Escalation times' => 'Tiempos para escalada',
        'No escalation time settings.' => 'No existen configuraciones de tiempo para escalada',
        'Ticket escalation time reached' => 'El tiempo para escalada del ticket ha sido alcanzado',
        'Ticket escalation time reached between' => 'El tiempo para escalada del ticket ha sido alcanzado entre',
        'Escalation - first response time' => 'Escalada - tiempo de primera respuesta',
        'Ticket first response time reached' => 'El tiempo para la primer respuesta del Ticket ha sido alcanzado',
        'Ticket first response time reached between' => 'El tiempo para la primer respuesta del Ticket ha sido alcanzado entre',
        'Escalation - update time' => 'Escalada - tiempo de actualización',
        'Ticket update time reached' => 'El tiempo para la actualización del Ticket ha sido alcanzado',
        'Ticket update time reached between' => 'El tiempo para la actualización del Ticket ha sido alcanzado entre',
        'Escalation - solution time' => 'Escalada - tiempo de solución',
        'Ticket solution time reached' => 'El tiempo para la solución del Ticket ha sido alcanzado',
        'Ticket solution time reached between' => 'El tiempo para la solución del Ticket ha sido alcanzado entre',
        'Archive search option' => 'Opción de búsqueda en el archivo',
        'Update/Add Ticket Attributes' => 'Actualizar/Añadir Atributos del Ticket',
        'Set new service' => 'Establecer servicio nuevo',
        'Set new Service Level Agreement' => 'Establecer Acuerdo de Nivel de Servicio nuevo',
        'Set new priority' => 'Establecer prioridad nueva',
        'Set new queue' => 'Establecer fila nueva',
        'Set new state' => 'Establecer estado nuevo',
        'Pending date' => 'Fecha pendiente',
        'Set new agent' => 'Establecer agente nuevo',
        'new owner' => 'propietario nuevo',
        'new responsible' => 'nuevo responsable',
        'Set new ticket lock' => 'Establecer bloqueo de ticket nuevo',
        'New customer user' => '',
        'New customer ID' => 'ID de cliente nuevo',
        'New title' => 'Título nuevo',
        'New type' => 'Tipo nuevo',
        'New Dynamic Field Values' => 'Nuevos valores de campo dinámico',
        'Archive selected tickets' => 'Tickets seleccionados del archivo',
        'Add Note' => 'Añadir Nota',
        'Time units' => 'Unidades de tiempo',
        'Execute Ticket Commands' => 'Ejecutar Comandos del Ticket',
        'Send agent/customer notifications on changes' => 'Enviar notificación de cambios al agente/cliente',
        'CMD' => 'CMD',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Este comando se ejecutará. ARG[0] será el número del ticket y ARG[0] el identificador del ticket.',
        'Delete tickets' => 'Eliminar tickets',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Advertencia: ¡Todos los tickets afectados serán eliminados de la base de datos y no se podrá restaurar!',
        'Execute Custom Module' => 'Ejecutar Módulo Personalizado',
        'Param %s key' => 'Parámetro %s llave',
        'Param %s value' => 'Parámetro %s valor',
        'Save Changes' => 'Guardar Cambios',
        'Results' => 'Resultados',
        '%s Tickets affected! What do you want to do?' => '¡%s Tickets afectados! ¿Qué desea hacer?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Advertencia: Eligió la opción ELIMINAR. ¡Todos los tickets eliminados se perderán!. ',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            '',
        'Edit job' => 'Modificar tarea',
        'Run job' => 'Ejecutar tarea',
        'Affected Tickets' => 'Tickets Afectados',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => 'Depurador de la interfaz genérica para el Web Service %s',
        'You are here' => 'Usted está aquí',
        'Web Services' => 'Web Services',
        'Debugger' => 'Depurador',
        'Go back to web service' => 'Regresar al web service',
        'Clear' => 'Limpiar',
        'Do you really want to clear the debug log of this web service?' =>
            '¿Está usted seguro que desea limpiar el registro de depuración de este web service?',
        'Request List' => 'Lista de solicitudes',
        'Time' => 'Tiempo',
        'Remote IP' => 'IP Remota',
        'Loading' => 'Cargando',
        'Select a single request to see its details.' => 'Seleccione una solicitud para ver sus detalles.',
        'Filter by type' => 'Filtro por tipo',
        'Filter from' => 'Filtro desde',
        'Filter to' => 'Filtro hasta',
        'Filter by remote IP' => 'Filtro por IP remota',
        'Limit' => 'Límite',
        'Refresh' => 'Refrescar',
        'Request Details' => 'Detalles de la petición',
        'An error occurred during communication.' => 'Sucedió un error durante la comunicación',
        'Show or hide the content.' => 'muestra u oculta el contenido',
        'Clear debug log' => 'Limpiar log de depuración',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => 'Añadir un Invocador nuevo al Servicio Web %s',
        'Change Invoker %s of Web Service %s' => 'Cambiar Invocador %s del Servicio Web %s',
        'Add new invoker' => 'Añadir nuevo invocador',
        'Change invoker %s' => 'Cambiar invocador %s',
        'Do you really want to delete this invoker?' => 'Realmente desea eliminar este invocador?',
        'All configuration data will be lost.' => 'Todos los datos de la configuración se perderán.',
        'Invoker Details' => 'Detalles del invocador',
        'The name is typically used to call up an operation of a remote web service.' =>
            'El nombre que se usa normalmente para llamar una operación de un web service remoto.',
        'Please provide a unique name for this web service invoker.' => 'Proporcione un nombre único para el invocador de este web service.',
        'Invoker backend' => 'Backend del invocador',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            '',
        'Mapping for outgoing request data' => 'Mapeo para los datos de la solicitud saliente',
        'Configure' => 'Configurar',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Los datos del invocador de OTRS serán procesador por este mapeo, para transformarlos al tipo de datos que el sistema remoto espera.',
        'Mapping for incoming response data' => 'Mapeo para los datos de la respuesta entrante',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            'Los datos de la respuesta serán procesados por este mapeo, para transformarlos al tipo de datos que el invocador de OTRS espera.',
        'Asynchronous' => 'Asíncrono ',
        'This invoker will be triggered by the configured events.' => 'Este invocador será disparado por los eventos configurados.',
        'Asynchronous event triggers are handled by the OTRS Scheduler Daemon in background (recommended).' =>
            'Los disparadores de evento asíncronos son manejados por el Daemon Planificador de OTRS en segundo plano (recomendado).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'Los disparadores de eventos asíncronos serían procesados directamente durante la solicitud web.',
        'Save and continue' => 'Grabar y continuar',
        'Delete this Invoker' => 'Eliminar este invocador',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => 'Mapeo Simple de la Interface Genérica para el Servicio Web %s',
        'Go back to' => 'Regresar a',
        'Mapping Simple' => 'Mapeo Simple ',
        'Default rule for unmapped keys' => 'Regla predeterminada para llaves sin mapear',
        'This rule will apply for all keys with no mapping rule.' => 'Esta regla se aplicara para todas las llaves sin reglas de mapeo.',
        'Default rule for unmapped values' => 'Regla predeterminada para valores sin mapear',
        'This rule will apply for all values with no mapping rule.' => '',
        'New key map' => 'Nueva llave de mapa',
        'Add key mapping' => '',
        'Mapping for Key ' => '',
        'Remove key mapping' => '',
        'Key mapping' => '',
        'Map key' => '',
        'matching the' => '',
        'to new key' => '',
        'Value mapping' => '',
        'Map value' => '',
        'to new value' => '',
        'Remove value mapping' => '',
        'New value map' => '',
        'Add value mapping' => '',
        'Do you really want to delete this key mapping?' => '',
        'Delete this Key Mapping' => '',

        # Template: AdminGenericInterfaceMappingXSLT
        'GenericInterface Mapping XSLT for Web Service %s' => '',
        'Mapping XML' => '',
        'Template' => 'Plantilla',
        'The entered data is not a valid XSLT stylesheet.' => 'La información ingresada no es una hoja de estilo XSLT válida.',
        'Insert XSLT stylesheet.' => 'Ingrese hoja de estilo XSLT.',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => 'Agregar nueva Operación al Servicio Web %s',
        'Change Operation %s of Web Service %s' => 'Cambiar Operación %s del Servicio Web %s',
        'Add new operation' => 'Agregar nueva operación',
        'Change operation %s' => 'Cambiar operación %s',
        'Do you really want to delete this operation?' => 'Está seguro de eliminar esta operación?',
        'Operation Details' => 'Detalles del a operación',
        'The name is typically used to call up this web service operation from a remote system.' =>
            '',
        'Please provide a unique name for this web service.' => 'Por favor ingrese un nombre único para este servicio web.',
        'Mapping for incoming request data' => '',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            '',
        'Operation backend' => '',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            '',
        'Mapping for outgoing response data' => '',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            '',
        'Delete this Operation' => 'Eliminar esta Operación',

        # Template: AdminGenericInterfaceTransportHTTPREST
        'GenericInterface Transport HTTP::REST for Web Service %s' => '',
        'Network transport' => 'Transporte de Red',
        'Properties' => 'Propiedades',
        'Route mapping for Operation' => '',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            '',
        'Valid request methods for Operation' => '',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            '',
        'Maximum message length' => 'Longitud máxima del mensaje',
        'This field should be an integer number.' => 'Este campo debe ser un número entero.',
        'Here you can specify the maximum size (in bytes) of REST messages that OTRS will process.' =>
            'Aquí puede especificar el tamaño máximo (en bytes) de mensajes REST que procesará OTRS.',
        'Send Keep-Alive' => 'Enviar Keep-Alive',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Esta configuración define si las conexiones entrantes deben quedar cerradas o mantenerse activas.',
        'Host' => 'Host',
        'Remote host URL for the REST requests.' => 'URL del host remoto para las solicitudes REST.',
        'e.g https://www.otrs.com:10745/api/v1.0 (without trailing backslash)' =>
            'ej. https://www.otrs.com:10745/api/v1.0 (sin la barra invertida)',
        'Controller mapping for Invoker' => 'Mapeo del Controlador para el Invocador',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            '',
        'Valid request command for Invoker' => 'Petición de comando válida para el Invocador',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'Un comando HTTP específico a usar en las peticiones con este invocador (opcional).',
        'Default command' => 'Comando por defecto',
        'The default HTTP command to use for the requests.' => 'El comando HTTP predeterminado para usar con las peticiones.',
        'Authentication' => 'Autenticación',
        'The authentication mechanism to access the remote system.' => 'El mecanismo de autenticación para acceder al sistema remoto.',
        'A "-" value means no authentication.' => 'Un valor "-" significa que no estás autenticado.',
        'The user name to be used to access the remote system.' => 'El nombre de usuario para ser usado al acceder al sistema remoto.',
        'The password for the privileged user.' => 'La contraseña para el usuario con privilegios.',
        'Use SSL Options' => 'Usar Opciones SSL',
        'Show or hide SSL options to connect to the remote system.' => 'Muestra u oculta las opciones de SSL para conectarse al sistema remoto.',
        'Certificate File' => 'Certificar Archivo',
        'The full path and name of the SSL certificate file.' => 'La ruta completa y el nombre de archivo del certificado SSL',
        'e.g. /opt/otrs/var/certificates/REST/ssl.crt' => 'ej. /opt/otrs/var/certificates/REST/ssl.crt',
        'Certificate Password File' => 'Archivo de la Contraseña del Certificado',
        'The full path and name of the SSL key file.' => 'Ruta completa y nombre del archivo de la llave SSL.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.key' => 'ej.  /opt/otrs/var/certificates/REST/ssl.key',
        'Certification Authority (CA) File' => 'Archivo de la Autoridad de Certificación (CA)',
        'The full path and name of the certification authority certificate file that validates the SSL certificate.' =>
            '',
        'e.g. /opt/otrs/var/certificates/REST/CA/ca.file' => 'p.e. /opt/otrs/var/certificates/REST/CA/ca.file',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => '',
        'Endpoint' => 'Punto final',
        'URI to indicate a specific location for accessing a service.' =>
            '',
        'e.g. http://local.otrs.com:8000/Webservice/Example' => '',
        'Namespace' => 'Namespace',
        'URI to give SOAP methods a context, reducing ambiguities.' => '',
        'e.g urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions' =>
            '',
        'Request name scheme' => 'Solicitar nombre de esquema',
        'Select how SOAP request function wrapper should be constructed.' =>
            '',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '',
        '\'FreeText\' is used as example for actual configured value.' =>
            '',
        'Request name free text' => '',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            '',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            '',
        'Response name scheme' => '',
        'Select how SOAP response function wrapper should be constructed.' =>
            '',
        'Response name free text' => '',
        'Here you can specify the maximum size (in bytes) of SOAP messages that OTRS will process.' =>
            '',
        'Encoding' => 'Codificación',
        'The character encoding for the SOAP message contents.' => 'La codificación de caracteres  para el contenidos del mensaje SOAP. ',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'ej. utf-8, latin1, iso-8859-1, cp1250, Etc.',
        'SOAPAction' => 'SOAPAction',
        'Set to "Yes" to send a filled SOAPAction header.' => 'Indique el valor "Si" para enviar una cabecera SOAPAccion completa.',
        'Set to "No" to send an empty SOAPAction header.' => 'Indique el valor "No" para enviar una cabecera SOAPAcción vacía.',
        'SOAPAction separator' => 'Separador SOAPAcción',
        'Character to use as separator between name space and SOAP method.' =>
            '',
        'Usually .Net web services uses a "/" as separator.' => '',
        'Proxy Server' => 'Servidor Proxy',
        'URI of a proxy server to be used (if needed).' => 'URI de un servidor proxy a usar (si es necesario)',
        'e.g. http://proxy_hostname:8080' => 'ej. http://proxy_hostname:8080',
        'Proxy User' => 'Usuario Proxy',
        'The user name to be used to access the proxy server.' => 'El nombre de usuario para acceder al servidor proxy',
        'Proxy Password' => 'Contraseña del proxy',
        'The password for the proxy user.' => 'La contraseña para el usuario proxy',
        'The full path and name of the SSL certificate file (must be in .p12 format).' =>
            'La ruta completa y nombre del archivo del certificado SSL (debe estar en formato .p12).',
        'e.g. /opt/otrs/var/certificates/SOAP/certificate.p12' => 'ej. /opt/otrs/var/certificates/SOAP/certificate.p12',
        'The password to open the SSL certificate.' => 'La contraseña para abrir el certificado SSL',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'La ruta completa y el nombre del archivo certificado por la autoridad de certificación que valida el certificado SSL.',
        'e.g. /opt/otrs/var/certificates/SOAP/CA/ca.pem' => 'ej.  /opt/otrs/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Directorio del Certificado de Autorización (CA)',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            '',
        'e.g. /opt/otrs/var/certificates/SOAP/CA' => '',
        'Sort options' => 'Opciones de Ordenado',
        'Add new first level element' => 'Agregar un nuevo elemento de primer nivel',
        'Element' => '',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            '',

        # Template: AdminGenericInterfaceWebservice
        'GenericInterface Web Service Management' => 'GenericInterface de Gestión del Servicio Web ',
        'Add web service' => 'Agregar un web service',
        'Clone web service' => 'Clonar el web service',
        'The name must be unique.' => 'El nombre debe ser único',
        'Clone' => 'Clon',
        'Export web service' => 'Exportar web service',
        'Import web service' => 'Importar web service',
        'Configuration File' => 'Archivo de configuración',
        'The file must be a valid web service configuration YAML file.' =>
            'Debe ser un archivo válido YAML de configuración de servicio web.',
        'Import' => 'Importar',
        'Configuration history' => 'Historial de la Configuración',
        'Delete web service' => 'Eliminar web service',
        'Do you really want to delete this web service?' => '¿Realmente desea eliminar este web service?',
        'Ready-to-run Web Services' => '',
        'Here you can activate ready-to-run web services showcasing our best practices that are a part of %s.' =>
            '',
        'Please note that these web services may depend on other modules only available with certain %s contract levels (there will be a notification with further details when importing).' =>
            '',
        'Import ready-to-run web service' => '',
        'Would you like to benefit from web services created by experts? Upgrade to %s to import some sophisticated ready-to-run web services.' =>
            '',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            '',
        'If you want to return to overview please click the "Go to overview" button.' =>
            '',
        'Web Service List' => 'Lista de Web Service',
        'Remote system' => 'Sistema remoto',
        'Provider transport' => 'Transporte de aprovicionameinto',
        'Requester transport' => 'Transporte de requerimiento',
        'Debug threshold' => 'Alncanse de Depuración',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            '',
        'In requester mode, OTRS uses web services of remote systems.' =>
            '',
        'Operations are individual system functions which remote systems can request.' =>
            '',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            '',
        'Controller' => 'Contolador',
        'Inbound mapping' => '',
        'Outbound mapping' => '',
        'Delete this action' => 'Eliminar esta acción',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            '',
        'Delete webservice' => 'Eliminar webservice',
        'Delete operation' => 'Eliminar operación',
        'Delete invoker' => 'Eliminar invocador',
        'Clone webservice' => 'Clonar webservice',
        'Import webservice' => 'Importar webservice',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => '',
        'Go back to Web Service' => 'Regresar al Web Service',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            '',
        'Configuration History List' => 'Lista del Historial de Configuración',
        'Version' => 'Versión',
        'Create time' => 'Hora de creación',
        'Select a single configuration version to see its details.' => 'Seleccionar solo una versión de la configuración para ver sus detalles.',
        'Export web service configuration' => 'Exportar configuración del web service',
        'Restore web service configuration' => 'Restaurar configuración del web service',
        'Do you really want to restore this version of the web service configuration?' =>
            '¿Está usted seguro de querer restablecer esta versión de la configuración del servicio web?',
        'Your current web service configuration will be overwritten.' => 'Su configuración actual del servicio web va a ser sobrescrita.',
        'Restore' => 'Restaurar',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'ATENCIÓN: Cuando cambia el nombre del grupo \'admin\', antes de realizar los cambios apropiados en SysConfig, bloqueará el panel de administración! Si esto sucediera, por favor vuelva a renombrar el grupo para administrar por declaración SQL.',
        'Group Management' => 'Administración de grupos',
        'Add group' => 'Añadir grupo',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'El grupo admin es para usar el área de administración y el grupo stats para usar el área estadisticas.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Crear grupos nuevos para manejar los permisos de acceso para los diferentes grupos de agentes (por ejemplo: departamento de compras, soporte técnico, ventas, etc.).',
        'It\'s useful for ASP solutions. ' => 'Es útil para soluciones ASP.',
        'total' => 'total',
        'Add Group' => 'Añadir Grupo',
        'Edit Group' => 'Modificar Grupo',

        # Template: AdminLog
        'System Log' => 'Log del Sistema',
        'Here you will find log information about your system.' => 'Aquí puede encontrar información de registros sobre su sistema.',
        'Hide this message' => 'Ocultar este mensaje',
        'Recent Log Entries' => 'Registros de eventos recientes',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Administración de Cuentas de Correo',
        'Add mail account' => 'Añadir dirección de correo',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Todos los correos entrantes con una cuenta serán enviados a la fila seleccionada',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Si su cuenta está validada, las cabeceras X-OTRS ya existentes en la llegada se utilizarán para la prioridad. El filtro Postmaster se usa de todas formas.',
        'Delete account' => 'Eliminar cuenta',
        'Fetch mail' => 'Obtener correo',
        'Add Mail Account' => 'Agregar Dirección de Correo',
        'Example: mail.example.com' => 'Ejemplo: correo.ejemplo.com',
        'IMAP Folder' => 'Carpeta IMAP',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Modifique esto solo si necesita obtener correos de un directorio distinto a INBOX',
        'Trusted' => 'Confiable',
        'Dispatching' => 'Remitiendo',
        'Edit Mail Account' => 'Modificar Dirección de Correo',

        # Template: AdminNavigationBar
        'Admin' => 'Administración',
        'Agent Management' => 'Gestión de Agentes',
        'Queue Settings' => 'Configuraciones de Fila',
        'Ticket Settings' => 'Configuraciones de Ticket',
        'System Administration' => 'Administración del Sistema',
        'Online Admin Manual' => 'Manual de Administración en Línea',

        # Template: AdminNotificationEvent
        'Ticket Notification Management' => 'Gestión de Notificaciones de Tickets',
        'Add notification' => 'Agregar notificación',
        'Export Notifications' => 'Exportar Notificaciones',
        'Configuration Import' => 'Configuración para Importar',
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            '',
        'Overwrite existing notifications?' => 'Sobrescribir las notificaciones existentes?',
        'Upload Notification configuration' => 'Cargar Configuración de Notificaciones',
        'Import Notification configuration' => 'Importar Configuración de Notificaciones',
        'Delete this notification' => 'Eliminar esta notificación',
        'Do you really want to delete this notification?' => '¿Está Usted seguro que desea eliminar esta notificación?',
        'Add Notification' => 'Agregar Notificación',
        'Edit Notification' => 'Modificar Notificación',
        'Show in agent preferences' => 'Mostrar en las preferencias del agente',
        'Agent preferences tooltip' => 'Preferencias de ayuda de agente',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            '',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            '',
        'Ticket Filter' => 'Filtro de Ticket',
        'Article Filter' => 'Filtro de Artículos',
        'Only for ArticleCreate and ArticleSend event' => '',
        'Article type' => 'Tipo de artículo',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            '',
        'Article sender type' => 'Tipo de remitente de artículo',
        'Subject match' => 'Coincidencia de asunto',
        'Body match' => 'Coincidencia del cuerpo',
        'Include attachments to notification' => 'Incluir archivos adjuntos en la notificación',
        'Recipients' => 'Recipientes',
        'Send to' => 'Enviar a',
        'Send to these agents' => '',
        'Send to all group members' => '',
        'Send to all role members' => '',
        'Send on out of office' => '',
        'Also send if the user is currently out of office.' => '',
        'Once per day' => 'Una vez al día',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            '',
        'Notification Methods' => '',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            '',
        'Enable this notification method' => '',
        'Transport' => 'Transporte',
        'At least one method is needed per notification.' => '',
        'Active by default in agent preferences' => '',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            '',
        'This feature is currently not available.' => '',
        'No data found' => 'No se encontraron datos',
        'No notification method found.' => 'Método de notificación no encontrado',
        'Notification Text' => 'Texto de Notificación',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            '',
        'Remove Notification Language' => '',
        'Message body' => '',
        'Add new notification language' => '',
        'Do you really want to delete this notification language?' => '',
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
        'Attributes of the current customer user data' => '',
        'Attributes of the current ticket owner user data' => '',
        'Attributes of the current ticket responsible user data' => '',
        'Attributes of the current agent user who requested this action' =>
            '',
        'Attributes of the recipient user for the notification' => '',
        'Attributes of the ticket data' => '',
        'Ticket dynamic fields internal key values' => '',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            '',
        'Example notification' => '',

        # Template: AdminNotificationEventTransportEmailSettings
        'Additional recipient email addresses' => '',
        'You can use OTRS-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            '',
        'Notification article type' => 'Tipo de notificaciones de artículo',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            '',
        'Email template' => '',
        'Use this template to generate the complete email (only for HTML emails).' =>
            '',
        'Enable email security' => '',
        'Email security level' => '',
        'If signing key/certificate is missing' => '',
        'If encryption key/certificate is missing' => '',

        # Template: AdminOTRSBusinessInstalled
        'Manage %s' => '',
        'Downgrade to OTRS Free' => '',
        'Read documentation' => '',
        '%s makes contact regularly with cloud.otrs.com to check on available updates and the validity of the underlying contract.' =>
            '',
        'Unauthorized Usage Detected' => '',
        'This system uses the %s without a proper license! Please make contact with %s to renew or activate your contract!' =>
            '',
        '%s not Correctly Installed' => '',
        'Your %s is not correctly installed. Please reinstall it with the button below.' =>
            '',
        'Reinstall %s' => '',
        'Your %s is not correctly installed, and there is also an update available.' =>
            '',
        'You can either reinstall your current version or perform an update with the buttons below (update recommended).' =>
            '',
        'Update %s' => '',
        '%s Not Yet Available' => '',
        '%s will be available soon.' => '',
        '%s Update Available' => '',
        'An update for your %s is available! Please update at your earliest!' =>
            '',
        '%s Correctly Deployed' => '',
        'Congratulations, your %s is correctly installed and up to date!' =>
            '',

        # Template: AdminOTRSBusinessNotInstalled
        '%s will be available soon. Please check again in a few days.' =>
            '',
        'Please have a look at %s for more information.' => '',
        'Your OTRS Free is the base for all future actions. Please register first before you continue with the upgrade process of %s!' =>
            '',
        'Before you can benefit from %s, please contact %s to get your %s contract.' =>
            '',
        'Connection to cloud.otrs.com via HTTPS couldn\'t be established. Please make sure that your OTRS can connect to cloud.otrs.com via port 443.' =>
            '',
        'With your existing contract you can only use a small part of the %s.' =>
            '',
        'If you would like to take full advantage of the %s get your contract upgraded now! Contact %s.' =>
            '',

        # Template: AdminOTRSBusinessUninstall
        'Cancel downgrade and go back' => '',
        'Go to OTRS Package Manager' => 'Ir al Gestor de Paquetes OTRS',
        'Sorry, but currently you can\'t downgrade due to the following packages which depend on %s:' =>
            '',
        'Vendor' => 'Vendedor',
        'Please uninstall the packages first using the package manager and try again.' =>
            '',
        'You are about to downgrade to OTRS Free and will lose the following features and all data related to these:' =>
            '',
        'Chat' => 'Chat',
        'Report Generator' => 'Generador de Reportes',
        'Timeline view in ticket zoom' => '',
        'DynamicField ContactWithData' => '',
        'DynamicField Database' => '',
        'SLA Selection Dialog' => '',
        'Ticket Attachment View' => '',
        'The %s skin' => '',

        # Template: AdminPGP
        'PGP Management' => 'Administración PGP',
        'PGP support is disabled' => '',
        'To be able to use PGP in OTRS, you have to enable it first.' => '',
        'Enable PGP support' => '',
        'Faulty PGP configuration' => '',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            '',
        'Configure it here!' => '',
        'Check PGP configuration' => '',
        'Add PGP key' => 'Agregar llave PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'De esta forma puede editar directamente el anillo de Claves configurado en Sysconfig',
        'Introduction to PGP' => 'Introducción a PGP',
        'Result' => 'Resultado',
        'Identifier' => 'Identificador',
        'Bit' => 'Bit',
        'Fingerprint' => 'Huella',
        'Expires' => 'Expira',
        'Delete this key' => 'Eliminar esta llave',
        'Add PGP Key' => 'Agregar Llave PGP',
        'PGP key' => 'Llave PGP',

        # Template: AdminPackageManager
        'Package Manager' => 'Gestor de paquetes',
        'Uninstall package' => 'Desinstalar paquete',
        'Do you really want to uninstall this package?' => '¿Está seguro de que desea desinstalar este paquete?',
        'Reinstall package' => 'Reinstalar paquete',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            '¿Está seguro de que desea reinstalar este paquete? Cualquier cambio manual se perderá.',
        'Continue' => 'Continuar',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            '',
        'Install' => 'Instalar',
        'Install Package' => 'Instalar Paquete',
        'Update repository information' => 'Actualizar la información del repositorio',
        'Cloud services are currently disabled.' => '',
        'OTRS Verify™ can not continue!' => '',
        'Enable cloud services' => '',
        'Online Repository' => 'Repositorio Online',
        'Module documentation' => 'Módulo de Documentación',
        'Upgrade' => 'Actualizar',
        'Local Repository' => 'Repositorio Local',
        'This package is verified by OTRSverify (tm)' => '',
        'Uninstall' => 'Desinstalar',
        'Reinstall' => 'Reinstalar',
        'Features for %s customers only' => '',
        'With %s, you can benefit from the following optional features. Please make contact with %s if you need more information.' =>
            '',
        'Download package' => 'Descargar paquete',
        'Rebuild package' => 'Reconstruir paquete',
        'Metadata' => 'Metadatos',
        'Change Log' => 'Registro de Cambios',
        'Date' => 'Fecha',
        'List of Files' => 'Lista de Archivos',
        'Permission' => 'Permiso',
        'Download' => 'Descargar',
        'Download file from package!' => 'Descargar archivo del paquete!',
        'Required' => 'Obligatorio',
        'Primary Key' => '',
        'Auto Increment' => '',
        'SQL' => 'SQL',
        'File differences for file %s' => 'Diferencias de archivo para %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Log de rendimiento',
        'This feature is enabled!' => 'Esta característica está habilitada',
        'Just use this feature if you want to log each request.' => 'Use esta característica sólo si desea registrar cada petición.',
        'Activating this feature might affect your system performance!' =>
            'Activar esta opción podría afectar el rendimiento de su sistema!',
        'Disable it here!' => 'Deshabilítelo aquí',
        'Logfile too large!' => 'Archivo de log muy grande',
        'The logfile is too large, you need to reset it' => 'El archivo de registros es muy grande, necesita restablecerlo',
        'Overview' => 'Resumen',
        'Range' => 'Rango',
        'last' => 'último',
        'Interface' => 'Interfase',
        'Requests' => 'Solicitudes',
        'Min Response' => 'Respuesta Mínima',
        'Max Response' => 'Respuesta Máxima',
        'Average Response' => 'Respuesta Promedio',
        'Period' => 'Periodo',
        'Min' => 'Min',
        'Max' => 'Max',
        'Average' => 'Promedio',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Administración del filtro maestro',
        'Add filter' => 'Agregar filtro',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Para remitir o filtrar correos electrónicos entrantes basándose en los encabezados de dichos correos. También es posible utilizar Expresiones Regulares para las coincidencias.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Si desea chequear sólo la dirección del email, use EMAILADDRESS:info@example.com en De, Para o Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Si utiliza Expresiones Regulares, también puede utilizar el valor de coincidencia en () como [***] en la acción de \'Establecer\'.',
        'Delete this filter' => 'Eliminar este filtro',
        'Do you really want to delete this filter?' => '',
        'Add PostMaster Filter' => 'Añadir Filtro de Administración de Correo',
        'Edit PostMaster Filter' => 'Modificar Filtro de Administración de Correo',
        'The name is required.' => 'El nombre es requerido.',
        'Filter Condition' => 'Condición del Filtro',
        'AND Condition' => 'Condición AND',
        'Check email header' => 'Comprobar encabezado del email',
        'Negate' => 'Negar',
        'Look for value' => 'Busque valor',
        'The field needs to be a valid regular expression or a literal word.' =>
            'El campo tiene que ser una expresión regular válida o una palabra literal.',
        'Set Email Headers' => 'Establecer los Encabezados del Correo Electrónico',
        'Set email header' => 'Establecer encabezado del Email',
        'Set value' => 'Establecer valor',
        'The field needs to be a literal word.' => 'El campo tiene que ser una palabra literal.',

        # Template: AdminPriority
        'Priority Management' => 'Administración de Prioridades',
        'Add priority' => 'Añadir prioridad',
        'Add Priority' => 'Añadir Prioridad',
        'Edit Priority' => 'Modificar Prioridad',

        # Template: AdminProcessManagement
        'Process Management' => 'Gestión de Procesos',
        'Filter for Processes' => 'Filtro por Proceso',
        'Create New Process' => 'Crear Nuevo Proceso',
        'Deploy All Processes' => 'Desplegar Todos los Procesos',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Aquí puede cargar un archivo de configuración para importar un proceso a su sistema. El archivo debe estar en formato .yml como se exporta por el módulo de gestión de procesos.',
        'Overwrite existing entities' => 'Sobrescribir entidades existentes',
        'Upload process configuration' => 'Cargar configuración de proceso',
        'Import process configuration' => 'Importar configuración de proceso',
        'Ready-to-run Processes' => '',
        'Here you can activate ready-to-run processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            '',
        'Would you like to benefit from processes created by experts? Upgrade to %s to import some sophisticated ready-to-run processes.' =>
            '',
        'Import ready-to-run process' => '',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            '',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            '',
        'Processes' => 'Procesos',
        'Process name' => 'Nombre del Proceso',
        'Print' => 'Imprimir',
        'Export Process Configuration' => 'Exportar Configuración de Procesos',
        'Copy Process' => 'Copiar Proceso',

        # Template: AdminProcessManagementActivity
        'Cancel & close' => 'Cancelar y cerrar',
        'Go Back' => 'Regresar',
        'Please note, that changing this activity will affect the following processes' =>
            '',
        'Activity' => 'Actividad',
        'Activity Name' => 'Nombre de la Actividad',
        'Activity Dialogs' => 'Dialogos de la Actividad',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Puede asignar Diálogos de la Actividad a esta Actividad arrastrándolos con el mouse de la lista izquierda a la lista de la derecha .',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'También es posible ordenar los elementos de la lista arrastrando y soltando los elementos .',
        'Filter available Activity Dialogs' => 'Filtros disponibles en Diálogos de la Actividad ',
        'Available Activity Dialogs' => 'Diálogos de Actividad Disponibles',
        'Name: %s, EntityID: %s' => '',
        'Create New Activity Dialog' => 'Crear un nuevo Diálogo para la Actividad',
        'Assigned Activity Dialogs' => 'Diálogos de Actividad Asignados',
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            '',

        # Template: AdminProcessManagementActivityDialog
        'Please note that changing this activity dialog will affect the following activities' =>
            '',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            '',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            '',
        'Activity Dialog' => 'Diálogo de Actividad',
        'Activity dialog Name' => 'Nombre del diálogo de actividad',
        'Available in' => 'Disponible en',
        'Description (short)' => 'Descripción (corta)',
        'Description (long)' => 'Descripción (larga)',
        'The selected permission does not exist.' => 'El permiso seleccionado no existe.',
        'Required Lock' => 'Bloqueo Requerido',
        'The selected required lock does not exist.' => 'El bloqueo requerido que ha seleccionado no existe.',
        'Submit Advice Text' => 'Envíe Texto del Aviso',
        'Submit Button Text' => 'Texto del Botón Enviar',
        'Fields' => 'Campos',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            '',
        'Filter available fields' => 'Filtrar campos disponibles',
        'Available Fields' => 'Campos Disponibles',
        'Name: %s' => '',
        'Assigned Fields' => 'Campos Asignados',
        'ArticleType' => 'ArticleType',
        'Display' => 'Mostrar',
        'Edit Field Details' => 'Editar Detalles del Campo',
        'Customer interface does not support internal article types.' => 'Interfaz de cliente no soporta tipos de artículos internos.',

        # Template: AdminProcessManagementPath
        'Path' => 'Ruta',
        'Edit this transition' => 'Editar esta transición',
        'Transition Actions' => 'Acciones de Transición',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Puede asignar Acciones esta Transición arrastrando con el mouse elementos de la lista izquierda a la lista de la derecha .',
        'Filter available Transition Actions' => 'Filtro para Acciones de Transición disponible',
        'Available Transition Actions' => 'Acciones de Transición Disponibles',
        'Create New Transition Action' => 'Crear Nueva Acción de Transición',
        'Assigned Transition Actions' => 'Acción de Transición Asignada',

        # Template: AdminProcessManagementProcessAccordion
        'Activities' => 'Actividades',
        'Filter Activities...' => 'Filtrar Actividades...',
        'Create New Activity' => 'Crear Nueva Actividad',
        'Filter Activity Dialogs...' => 'Filtrar Diálogos de Actividad...',
        'Transitions' => 'Transiciónes',
        'Filter Transitions...' => 'Filtrar Transiciones...',
        'Create New Transition' => 'Crear Nueva Transición',
        'Filter Transition Actions...' => 'Filtrar Acciones de Transición...',

        # Template: AdminProcessManagementProcessEdit
        'Edit Process' => 'Editar Proceso',
        'Print process information' => 'Imprimir información del proceso',
        'Delete Process' => 'Eliminar Proceso',
        'Delete Inactive Process' => 'Eliminar Proceso Inactivo',
        'Available Process Elements' => 'Elementos de Proceso Disponibles',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            '',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            '',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            '',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            '',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            '',
        'Edit Process Information' => 'Editar Información del Proceso',
        'Process Name' => 'Nombre del Proceso',
        'The selected state does not exist.' => 'El estado seleccionado no existe.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Añada y Edite Actividades, Diálogos de Actividad y Transiciones.',
        'Show EntityIDs' => 'Mostrar EntityIDs',
        'Extend the width of the Canvas' => 'Amplíe la ancho del Lienzo',
        'Extend the height of the Canvas' => 'Amplíe la altura del Lienzo',
        'Remove the Activity from this Process' => 'Elimine la Actividad de este Proceso',
        'Edit this Activity' => 'Editar esta Actividad',
        'Save Activities, Activity Dialogs and Transitions' => 'Guarde las Actividades, Diálogos de Actividad y Transiciones',
        'Do you really want to delete this Process?' => '¿Está Usted seguro de querer eliminar este Proceso?',
        'Do you really want to delete this Activity?' => '¿Está Usted seguro de querer eliminar esta Actividad?',
        'Do you really want to delete this Activity Dialog?' => '',
        'Do you really want to delete this Transition?' => '',
        'Do you really want to delete this Transition Action?' => '',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            '',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            '',
        'Hide EntityIDs' => 'Ocultar EntityIDs',
        'Delete Entity' => 'Eliminar Entidad',
        'Remove Entity from canvas' => 'Eliminar Entidad del Lienzo',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            '',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            '',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            '',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            '',
        'Remove the Transition from this Process' => 'Elimine la Transición de este Proceso',
        'No TransitionActions assigned.' => 'No hay TransitionActions asignadas.',
        'The Start Event cannot loose the Start Transition!' => '¡El Evento de Inicio no puede perder la Transición de Inicio!',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            '',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            '',

        # Template: AdminProcessManagementProcessNew
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            '',

        # Template: AdminProcessManagementProcessPrint
        'cancel & close' => '',
        'Start Activity' => 'Iniciar Actividad',
        'Contains %s dialog(s)' => 'Contiene %s diálogo(s)',
        'Assigned dialogs' => 'Diálogos Asignados',
        'Activities are not being used in this process.' => 'Las Actividades no están siendo usadas en este proceso.',
        'Assigned fields' => 'Campos asignados',
        'Activity dialogs are not being used in this process.' => 'Los Diálogos de Actividad no están siendo usados en este proceso.',
        'Condition linking' => '',
        'Conditions' => 'Condiciones',
        'Condition' => 'Condición',
        'Transitions are not being used in this process.' => 'Las Acciones de transición no están siendo usadas en este proceso.',
        'Module name' => 'Nombre del Módulo',
        'Transition actions are not being used in this process.' => '',

        # Template: AdminProcessManagementTransition
        'Please note that changing this transition will affect the following processes' =>
            '',
        'Transition' => 'Transición',
        'Transition Name' => 'Nombre de la Transición',
        'Conditions can only operate on non-empty fields.' => '',
        'Type of Linking between Conditions' => '',
        'Remove this Condition' => '',
        'Type of Linking' => '',
        'Add a new Field' => 'Agregar un nuevo Campo',
        'Remove this Field' => 'Eliminar este Campo',
        'And can\'t be repeated on the same condition.' => '',
        'Add New Condition' => 'Añadir Nueva Condición',

        # Template: AdminProcessManagementTransitionAction
        'Please note that changing this transition action will affect the following processes' =>
            '',
        'Transition Action' => 'Acción de Transición',
        'Transition Action Name' => 'Nombre de la Acción de Transición',
        'Transition Action Module' => 'Módulo Acción de Transición',
        'Config Parameters' => 'Parámetros de Configuración',
        'Add a new Parameter' => 'Añada un nuevo Parámetro',
        'Remove this Parameter' => 'Eliminar este Parámetro',

        # Template: AdminQueue
        'Manage Queues' => 'Gestionar Filas',
        'Add queue' => 'Agregar fila',
        'Add Queue' => 'Agregar Fila',
        'Edit Queue' => 'Modificar Fila',
        'A queue with this name already exists!' => '¡Ya existe una fila con este nombre!',
        'Sub-queue of' => 'Subfila de',
        'Unlock timeout' => 'Tiempo para desbloqueo automático',
        '0 = no unlock' => '0 = sin desbloqueo',
        'Only business hours are counted.' => 'Sólo se contarán las horas de trabajo',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Si un agente bloquea un ticket y no lo cierra antes de que el tiempo de espera termine, dicho ticket se desbloqueará y estará disponible para otros agentes.',
        'Notify by' => 'Notificado por',
        '0 = no escalation' => '0 = sin escalada',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Si no se ha contactado al cliente, ya sea por medio de una nota externa o por teléfono, de un ticket nuevo antes de que el tiempo definido aquí termine, el ticket escalará.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Si se añade un artículo, tal como un seguimiento, vía correo electrónico o interfaz del cliente, el tiempo para escalada por actualización se reinicia. Si no se ha contactado al cliente, ya sea por medio de una nota externa o por teléfono agregados a un ticket antes de que el tiempo definido aquí expire, el ticket escala.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Si el ticket no se cierra antes de que el tiempo definido aquí termine, dicho ticket escalará.',
        'Follow up Option' => 'Opción de seguimiento',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Especifica si seguimiento a tickets cerrados: reabrirá dichos tickets, se rechazará o generará un ticket nuevo.',
        'Ticket lock after a follow up' => 'Bloquear un ticket después del seguimiento',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Si un ticket está cerrado y el cliente le da seguimiento, el ticket se bloqueará para el antigüo propietario.',
        'System address' => 'Dirección del Sistema',
        'Will be the sender address of this queue for email answers.' => 'Será la dirección del emisor en esta fila para respuestas por correo.',
        'Default sign key' => 'Llave de firma por defecto',
        'The salutation for email answers.' => 'Saludo para respuestas por correo.',
        'The signature for email answers.' => 'Firma para respuestas por correo.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Administrar Relaciones Fila-Auto Respuesta',
        'This filter allow you to show queues without auto responses' => '',
        'Queues without auto responses' => '',
        'This filter allow you to show all queues' => '',
        'Show all queues' => '',
        'Filter for Queues' => 'Filtro para Filas',
        'Filter for Auto Responses' => 'Filtro para Auto Respuestas',
        'Auto Responses' => 'Respuestas Automáticas',
        'Change Auto Response Relations for Queue' => 'Modificar Relaciones de Auto Respuesta para las Filas',

        # Template: AdminQueueTemplates
        'Manage Template-Queue Relations' => '',
        'Filter for Templates' => 'Filtrar por Plantillas',
        'Templates' => 'Plantillas',
        'Change Queue Relations for Template' => '',
        'Change Template Relations for Queue' => '',

        # Template: AdminRegistration
        'System Registration Management' => '',
        'Edit details' => 'Editar detalles',
        'Show transmitted data' => 'Mostrar datos transmitidos',
        'Deregister system' => 'Dar de baja su sistema',
        'Overview of registered systems' => 'Vista general de sus sistemas registrados',
        'This system is registered with OTRS Group.' => 'Este sistema se encuentra registrado con Grupo OTRS',
        'System type' => 'Tipo de sistema',
        'Unique ID' => 'ID único ',
        'Last communication with registration server' => 'Última comunicación con el servidor de registro',
        'System registration not possible' => 'No es posible Registrar su Sistema',
        'Please note that you can\'t register your system if OTRS Daemon is not running correctly!' =>
            'Tenga en cuenta que no puede registrar su sistema si el Daemon OTRS no está funcionando correctamente!',
        'Instructions' => 'Instrucciones',
        'System deregistration not possible' => 'No es posible dar de baja su sistema',
        'Please note that you can\'t deregister your system if you\'re using the %s or having a valid service contract.' =>
            'Tenga en cuenta que no puede dar de baja su sistema si usted está utilizando el %s o si tiene un contrato de servicio válido.',
        'OTRS-ID Login' => 'Inicio de sesión con OTRS-ID',
        'Read more' => 'Leer más',
        'You need to log in with your OTRS-ID to register your system.' =>
            'Necesita iniciar sesión con su OTRS-ID para registrar su sistema.',
        'Your OTRS-ID is the email address you used to sign up on the OTRS.com webpage.' =>
            'Su OTRS-ID es la dirección de email que utilizó para registrarse en la página web OTRS.com',
        'Data Protection' => 'Protección de Datos',
        'What are the advantages of system registration?' => '¿Cuáles son las ventajas de registrar su sistema?',
        'You will receive updates about relevant security releases.' => '',
        'With your system registration we can improve our services for you, because we have all relevant information available.' =>
            '',
        'This is only the beginning!' => '',
        'We will inform you about our new services and offerings soon.' =>
            '',
        'Can I use OTRS without being registered?' => '',
        'System registration is optional.' => '',
        'You can download and use OTRS without being registered.' => '',
        'Is it possible to deregister?' => '',
        'You can deregister at any time.' => '',
        'Which data is transfered when registering?' => '',
        'A registered system sends the following data to OTRS Group:' => '',
        'Fully Qualified Domain Name (FQDN), OTRS version, Database, Operating System and Perl version.' =>
            '',
        'Why do I have to provide a description for my system?' => '',
        'The description of the system is optional.' => '',
        'The description and system type you specify help you to identify and manage the details of your registered systems.' =>
            '',
        'How often does my OTRS system send updates?' => '',
        'Your system will send updates to the registration server at regular intervals.' =>
            '',
        'Typically this would be around once every three days.' => '',
        'In case you would have further questions we would be glad to answer them.' =>
            '',
        'Please visit our' => '',
        'portal' => 'portal',
        'and file a request.' => '',
        'If you deregister your system, you will lose these benefits:' =>
            '',
        'You need to log in with your OTRS-ID to deregister your system.' =>
            '',
        'OTRS-ID' => 'OTRS-ID',
        'You don\'t have an OTRS-ID yet?' => '¿Aún no tiene su OTRS-ID?',
        'Sign up now' => 'Inscríbase ahora',
        'Forgot your password?' => '¿Olvidó su contraseña?',
        'Retrieve a new one' => 'Solicitar una nueva',
        'This data will be frequently transferred to OTRS Group when you register this system.' =>
            '',
        'Attribute' => 'Atributo',
        'FQDN' => 'Nombre de dominio totalmente calificado',
        'OTRS Version' => 'Versión de OTRS',
        'Operating System' => 'Sistema Operativo',
        'Perl Version' => 'Versión de Perl',
        'Optional description of this system.' => 'Descripción opcional de este sistema.',
        'Register' => 'Registrar',
        'Deregister System' => 'Dar de Baja Este Sistema',
        'Continuing with this step will deregister the system from OTRS Group.' =>
            '',
        'Deregister' => 'Dar de baja',
        'You can modify registration settings here.' => '',
        'Overview of transmitted data' => 'Resumen de los datos transmitidos',
        'There is no data regularly sent from your system to %s.' => '',
        'The following data is sent at minimum every 3 days from your system to %s.' =>
            '',
        'The data will be transferred in JSON format via a secure https connection.' =>
            '',
        'System Registration Data' => 'Datos de Registro del Sistema',
        'Support Data' => 'Datos de Soporte',

        # Template: AdminRole
        'Role Management' => 'Gestión de Roles',
        'Add role' => 'Añadir rol',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Cree un rol y coloque grupos en el mismo. Luego añada el rol a los usuarios.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'No hay roles definidos. Por favor, use el botón \'Añadir\' para crear un rol nuevo.',
        'Add Role' => 'Añadir Rol',
        'Edit Role' => 'Modificar Rol',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Administrar Relaciones Rol-Grupo',
        'Filter for Roles' => 'Filtro para Roles',
        'Roles' => 'Roles',
        'Select the role:group permissions.' => 'Seleccionar los permisos rol:grupo.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Si nada se selecciona, no habrá permisos para este grupo y los tickets no estarán disponibles para el rol.',
        'Change Role Relations for Group' => 'Modificar Relaciones de Rol para los Grupos',
        'Change Group Relations for Role' => 'Modificar Relaciones de Grupo para los Roles',
        'Toggle %s permission for all' => 'Activar permiso %s para todos',
        'move_into' => 'mover_a',
        'Permissions to move tickets into this group/queue.' => 'Permiso para mover tickets a este grupo/fila',
        'create' => 'crear',
        'Permissions to create tickets in this group/queue.' => 'Permiso para crear tickets en este grupo/fila',
        'note' => 'nota',
        'Permissions to add notes to tickets in this group/queue.' => 'Permisos para añadir notas a los tickets de este/a grupo/fila',
        'owner' => 'propietario',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Permisos para modificar el propietario de los tickets en este/a grupo/fila.',
        'priority' => 'prioridad',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Permiso para cambiar la prioridad del ticket en este grupo/fila',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Administrar Relaciones Agente-Rol',
        'Add agent' => 'Añadir agente',
        'Filter for Agents' => 'Filtro para Agentes',
        'Agents' => 'Agentes',
        'Manage Role-Agent Relations' => 'Administrar Relaciones Rol-Agente',
        'Change Role Relations for Agent' => 'Modificar Relacioes de Rol para los Agentes',
        'Change Agent Relations for Role' => 'Modificar Relacioes de Agente para los Roles',

        # Template: AdminSLA
        'SLA Management' => 'Administración de SLA',
        'Add SLA' => 'Añadir SLA',
        'Edit SLA' => 'Modificar SLA',
        'Please write only numbers!' => '¡Por favor, escriba sólo números!',

        # Template: AdminSMIME
        'S/MIME Management' => 'Gestion S/MIME',
        'SMIME support is disabled' => '',
        'To be able to use SMIME in OTRS, you have to enable it first.' =>
            '',
        'Enable SMIME support' => '',
        'Faulty SMIME configuration' => '',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            '',
        'Check SMIME configuration' => '',
        'Add certificate' => 'Añadir certificado',
        'Add private key' => 'Añadir llave privada',
        'Filter for certificates' => 'Filtro para certificados',
        'Filter for S/MIME certs' => 'Filtro para certificados S/MIME',
        'To show certificate details click on a certificate icon.' => '',
        'To manage private certificate relations click on a private key icon.' =>
            '',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Vea también',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'De esta forma Ud. puede editar directamente la certificación y claves privadas en el sistema de archivos.',
        'Hash' => 'De esta forma Ud. puede editar directamente la certificación y claves privadas en el sistema de archivos.',
        'Handle related certificates' => 'Maneje certificados relacionados',
        'Read certificate' => 'Leer certificado',
        'Delete this certificate' => 'Eliminar este certificado',
        'Add Certificate' => 'Añadir Certificado',
        'Add Private Key' => 'Añadir Clave Privada',
        'Secret' => 'Secreto',
        'Related Certificates for' => 'Certificados relacionados para',
        'Delete this relation' => 'Eliminar esta relación',
        'Available Certificates' => 'Certificados Disponibles',
        'Relate this certificate' => 'Relacionar este certificado',

        # Template: AdminSMIMECertRead
        'Close dialog' => '',
        'Certificate details' => 'Detalles del Certificado',

        # Template: AdminSalutation
        'Salutation Management' => 'Gestión de Saludos',
        'Add salutation' => 'Agregar saludo',
        'Add Salutation' => 'Agregar Saludo',
        'Edit Salutation' => 'Modificar Saludo',
        'e. g.' => 'p. ej.:',
        'Example salutation' => 'Saludo de ejemplo',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => '¡El modo seguro necesita estar habilitado!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'El Modo Seguro (normalmente) queda habilitado cuando la instalación inicial se completa.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Si el modo seguro no está activo aún, hágalo a través de la Configuración del Sistema, porque su aplicación ya se está ejecutando.',

        # Template: AdminSelectBox
        'SQL Box' => 'Consola SQL',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            '',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Aquí puede introducir SQL para ejecutarse directamente en la base de datos de la aplicación.',
        'Only select queries are allowed.' => 'Solo están permitidas las consultas select.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'La sintaxis de su consulta SQL tiene un error. Por favor, verifíquela.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Existe al menos un parámetro faltante para en enlace. Por favor, verifíquelo.',
        'Result format' => 'Formato del resultado',
        'Run Query' => 'Ejecutar Consulta',
        'Query is executed.' => 'Se ejecuta la consulta.',

        # Template: AdminService
        'Service Management' => 'Administración de Servicios',
        'Add service' => 'Añadir servicio',
        'Add Service' => 'Añadir Servicio',
        'Edit Service' => 'Modificar Servicio',
        'Sub-service of' => 'Subservicio de',

        # Template: AdminSession
        'Session Management' => 'Administración de Sesiones',
        'All sessions' => 'Todas las sesiones',
        'Agent sessions' => 'Sesiones de agente',
        'Customer sessions' => 'Sesiones de cliente',
        'Unique agents' => 'Agentes únicos',
        'Unique customers' => 'Clientes únicos',
        'Kill all sessions' => 'Finalizar todas las sesiones',
        'Kill this session' => 'Terminar esta sesión',
        'Session' => 'Sesión',
        'Kill' => 'Terminar',
        'Detail View for SessionID' => 'Vista detallada para el ID de sesión',

        # Template: AdminSignature
        'Signature Management' => 'Administración de Firmas',
        'Add signature' => 'Añadir firma',
        'Add Signature' => 'Añadir Firma',
        'Edit Signature' => 'Modificar Firma',
        'Example signature' => 'Firma de ejemplo',

        # Template: AdminState
        'State Management' => 'Administración de Estados',
        'Add state' => 'Añadir estado',
        'Please also update the states in SysConfig where needed.' => 'Actualice también los estados en SysConfig donde sea necesario.',
        'Add State' => 'Añadir Estado',
        'Edit State' => 'Modificar Estado',
        'State type' => 'Tipo de Estado',

        # Template: AdminSupportDataCollector
        'Sending support data to OTRS Group is not possible!' => '',
        'Enable Cloud Services' => '',
        'This data is sent to OTRS Group on a regular basis. To stop sending this data please update your system registration.' =>
            '',
        'You can manually trigger the Support Data sending by pressing this button:' =>
            '',
        'Send Update' => 'Enviar Actualización',
        'Sending Update...' => 'Enviando Actualización...',
        'Support Data information was successfully sent.' => 'Información de Datos de Soporte fue enviada satisfactoriamente.',
        'Was not possible to send Support Data information.' => 'No fue posible enviar los Datos de Soporte.',
        'Update Result' => '',
        'Currently this data is only shown in this system.' => '',
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            '',
        'Generate Support Bundle' => '',
        'Generating...' => 'Generando...',
        'It was not possible to generate the Support Bundle.' => '',
        'Generate Result' => 'Generar Resultado',
        'Support Bundle' => 'Paquete de Soporte',
        'The mail could not be sent' => 'El correo no pudo ser enviado',
        'The support bundle has been generated.' => 'El paquete de soporte ha sido generado.',
        'Please choose one of the following options.' => 'Por favor escoja una de las siguientes opciones.',
        'Send by Email' => 'Enviar por Email',
        'The support bundle is too large to send it by email, this option has been disabled.' =>
            '',
        'The email address for this user is invalid, this option has been disabled.' =>
            'La dirección de correo electrónico de este usuario es inválida, esta opción se ha deshabitado.',
        'Sending' => 'Emisor',
        'The support bundle will be sent to OTRS Group via email automatically.' =>
            '',
        'Download File' => 'Descargar Archivo',
        'A file containing the support bundle will be downloaded to the local system. Please save the file and send it to the OTRS Group, using an alternate method.' =>
            '',
        'Error: Support data could not be collected (%s).' => 'Error: Los datos de soporte no han podido ser recolectados (%s).',
        'Details' => 'Detalles',

        # Template: AdminSysConfig
        'SysConfig' => 'Configuración del sistema',
        'Navigate by searching in %s settings' => 'Navegar buscando en las configuraciones %s',
        'Navigate by selecting config groups' => 'Navegue seleccionando grupos de configuración',
        'Download all system config changes' => 'Descargar todos los cambios en la configuración del sistema',
        'Export settings' => 'Exportar configuraciones',
        'Load SysConfig settings from file' => 'Cargar la configuración del sistema desde archivo',
        'Import settings' => 'Importar configuraciones',
        'Import Settings' => 'Importar Configuraciones',
        'Please enter a search term to look for settings.' => 'Por favor, introduzca un parámetro de búsqueda para buscar configuraciones.',
        'Subgroup' => 'Subgrupo',
        'Elements' => 'Elementos',

        # Template: AdminSysConfigEdit
        'Edit Config Settings in %s → %s' => '',
        'This setting is read only.' => 'Esta opción es de sólo lectura.',
        'This config item is only available in a higher config level!' =>
            '¡Este elemento de configuración sólo está disponible en un nivel de configuración más alto!',
        'Reset this setting' => 'Restablecer esta configuración',
        'Error: this file could not be found.' => 'Error: no se encontró el archivo.',
        'Error: this directory could not be found.' => 'Error: no se encontró el directorio.',
        'Error: an invalid value was entered.' => 'Error: se introdujo un valor inválido.',
        'Content' => 'Contenido',
        'Remove this entry' => 'Eliminar esta entrada',
        'Add entry' => 'Añadir entrada',
        'Remove entry' => 'Eliminar entrada',
        'Add new entry' => 'Añadir una entrada nueva',
        'Delete this entry' => 'Eliminar esta entrada',
        'Create new entry' => 'Crear una entrada nueva',
        'New group' => 'Grupo nuevo',
        'Group ro' => 'Grupo ro',
        'Readonly group' => 'Grupo de sólo lectura',
        'New group ro' => 'Grupo ro nuevo',
        'Loader' => 'Cargador',
        'File to load for this frontend module' => 'Archivo a cargarse para este módulo frontend',
        'New Loader File' => 'Archivo nuevo para el Cargador',
        'NavBarName' => 'NombreBarraNavegación',
        'NavBar' => 'BarraNavegación',
        'LinkOption' => 'OpciónEnlace',
        'Block' => 'Bloquear',
        'AccessKey' => 'TeclaAcceso',
        'Add NavBar entry' => 'Añadir entrada de BarraNavegación',
        'NavBar module' => '',
        'Year' => 'Año',
        'Month' => 'Mes',
        'Day' => 'Día',
        'Invalid year' => 'Año inválido',
        'Invalid month' => 'Mes inválido',
        'Invalid day' => 'Día inválido',
        'Show more' => 'Mostrar más',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Administración de Direcciones de Correo del sistema',
        'Add system address' => 'Añadir dirección del sistema',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Todos los correos electrónicos entrantes con esta dirección en Para o Cc serán enviados a la fila seleccionada.',
        'Email address' => 'Dirección de correo electrónico',
        'Display name' => 'Nombre mostrado',
        'Add System Email Address' => 'Agregar Dirección de Correo Electrónico del Sistema',
        'Edit System Email Address' => 'Modificar Dirección de Correo Electrónico del Sistema',
        'The display name and email address will be shown on mail you send.' =>
            'El nombre a mostrar y la dirección de correo electrónico se agregarán en los correos que ud. envíe.',

        # Template: AdminSystemMaintenance
        'System Maintenance Management' => 'Gestión de Mantenimiento del Sistema',
        'Schedule New System Maintenance' => 'Programas Nuevo Mantenimiento del Sistema',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            '',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            '',
        'Start date' => 'Fecha de Inicio',
        'Stop date' => 'Fecha de Finalización',
        'Delete System Maintenance' => 'Eliminar Mantenimiento del Sisema',
        'Do you really want to delete this scheduled system maintenance?' =>
            '',

        # Template: AdminSystemMaintenanceEdit
        'Edit System Maintenance %s' => 'Editar el Mantenimiento del Sistema %s',
        'Edit System Maintenance Information' => '',
        'Date invalid!' => '¡Fecha inválida!',
        'Login message' => 'Mensaje de inicio de sesión',
        'Show login message' => 'Mostrar mensaje de inicio de sesión',
        'Notify message' => 'Mensaje de notificación',
        'Manage Sessions' => 'Gestionar Sesiones',
        'All Sessions' => 'Todas las Sesiones',
        'Agent Sessions' => 'Sesiones de Agentes',
        'Customer Sessions' => 'Sesiones de Clientes',
        'Kill all Sessions, except for your own' => 'Matar todas las Sesiones, excepto su propia sesión',

        # Template: AdminTemplate
        'Manage Templates' => 'Gestionar Plantillas',
        'Add template' => 'Agregar plantilla',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            '',
        'Don\'t forget to add new templates to queues.' => 'No olvide agregar las plantillas nuevas a las filas de espera',
        'Do you really want to delete this template?' => '',
        'Add Template' => 'Agregar Plantilla',
        'Edit Template' => 'Editar Plantilla',
        'A standard template with this name already exists!' => '¡Ya existe una plantilla estándar con este nombre!',
        'Create type templates only supports this smart tags' => '',
        'Example template' => 'Plantilla de ejemplo',
        'The current ticket state is' => 'El estado actual del ticket es',
        'Your email address is' => 'Su dirección de correo electrónico es',

        # Template: AdminTemplateAttachment
        'Manage Templates <-> Attachments Relations' => 'Gestión de Plantillas <-> Relaciones de Adjuntos',
        'Filter for Attachments' => 'Filtro para Archivos Adjuntos',
        'Change Template Relations for Attachment' => '',
        'Change Attachment Relations for Template' => '',
        'Toggle active for all' => 'Activar para todos',
        'Link %s to selected %s' => 'Vínculo %s a %s seleccionados(as)',

        # Template: AdminType
        'Type Management' => 'Administración de Tipos',
        'Add ticket type' => 'Añadir tipo de ticket',
        'Add Type' => 'Añadir Tipo',
        'Edit Type' => 'Modificar Tipo',
        'A type with this name already exists!' => '¡Ya existe un tipo con este nombre!',

        # Template: AdminUser
        'Agents will be needed to handle tickets.' => 'Los agentes se requieren para que se encarguen de los tickets.',
        'Don\'t forget to add a new agent to groups and/or roles!' => '¡Recuerde añadir a los agentes nuevos a grupos y/o roles!',
        'Please enter a search term to look for agents.' => 'Por favor, introduzca un parámetro de búsqueda para buscar agentes.',
        'Last login' => 'Último inicio de sesión',
        'Switch to agent' => 'Cambiar a agente',
        'Add Agent' => 'Añadir Agente',
        'Edit Agent' => 'Modificar Agente',
        'Title or salutation' => '',
        'Firstname' => 'Nombre',
        'Lastname' => 'Apellido',
        'A user with this username already exists!' => '¡Ya existe un usuario con el mismo nombre se usuario!',
        'Will be auto-generated if left empty.' => 'Si se deja vació, será generado automáticamente.',
        'Start' => 'Iniciar',
        'End' => 'Fin',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Gestionar Relaciones Agente-Grupo',
        'Change Group Relations for Agent' => 'Modificar Relaciones de Grupo para los Agentes',
        'Change Agent Relations for Group' => 'Modificar Relaciones de Agente para los Grupos',

        # Template: AgentBook
        'Address Book' => 'Libreta de Direcciones',
        'Search for a customer' => 'Buscar un cliente',
        'Add email address %s to the To field' => 'Añadir dirección de correo electrónico %s al campo Para',
        'Add email address %s to the Cc field' => 'Añadir dirección de correo electrónico %s al campo Cc',
        'Add email address %s to the Bcc field' => 'Añadir dirección de correo electrónico %s al campo Bcc',
        'Apply' => 'Aplicar',

        # Template: AgentCustomerInformationCenter
        'Customer Information Center' => 'Centro de Información de Clientes',

        # Template: AgentCustomerInformationCenterSearch
        'Customer User' => 'Cliente',

        # Template: AgentCustomerSearch
        'Duplicated entry' => 'Entrada duplicada',
        'This address already exists on the address list.' => 'Esta dirección ya existe en la lista de direcciones.',
        'It is going to be deleted from the field, please try again.' => '',

        # Template: AgentCustomerTableView
        'Note: Customer is invalid!' => 'Nota: ¡El cliente es inválido!',
        'Start chat' => 'Iniciar chat',
        'Video call' => '',
        'Audio call' => '',

        # Template: AgentDaemonInfo
        'The OTRS Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'El Servicio OTRS es un proceso de servicio que efectúa tareas asíncronas, por ejemplo disparo de escalada de tickets, envío de emails, etc.',
        'A running OTRS Daemon is mandatory for correct system operation.' =>
            'Es indispensable que el Daemon OTRS esté ejecutándose para que el sistema opere correctamente.',
        'Starting the OTRS Daemon' => 'Iniciando el Daemon OTRS',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the OTRS Daemon is running and start it if needed.' =>
            '',
        'Execute \'%s start\' to make sure the cron jobs of the \'otrs\' user are active.' =>
            '',
        'After 5 minutes, check that the OTRS Daemon is running in the system (\'bin/otrs.Daemon.pl status\').' =>
            '',

        # Template: AgentDashboard
        'Dashboard' => 'Panel principal',

        # Template: AgentDashboardCalendarOverview
        'in' => 'en',

        # Template: AgentDashboardCommon
        'Close this widget' => '',
        'Available Columns' => 'Columnas Disponibles',
        'Visible Columns (order by drag & drop)' => 'Columnas Visibles (ordenar arrastrando y soltando)',

        # Template: AgentDashboardCustomerIDStatus
        'Escalated tickets' => 'Tickets Escalados',

        # Template: AgentDashboardCustomerUserList
        'Customer login' => 'Inicio de sesión del cliente',
        'Customer information' => 'Información del cliente',
        'Phone ticket' => 'Teléfono del ticket',
        'Email ticket' => 'Email del ticket',
        '%s open ticket(s) of %s' => '%s tickets abiertos de %s',
        '%s closed ticket(s) of %s' => '%s tickets cerrados de %s',
        'New phone ticket from %s' => 'Nuevo ticket telefónico de %s',
        'New email ticket to %s' => 'Nuevo ticket por correo para %s',

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s está disponible!',
        'Please update now.' => 'Por favor, actualice ahora.',
        'Release Note' => 'Notas del Lanzamiento.',
        'Level' => 'Nivel',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Enviado hace %s.',

        # Template: AgentDashboardStats
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'La configuración de este widget estadístico contiene errores, por favor revise su configuración.',
        'Download as SVG file' => 'Descargar como archivo SVG',
        'Download as PNG file' => 'Descargar como archivo PNG',
        'Download as CSV file' => 'Descargar como archivo CSV',
        'Download as Excel file' => 'Descargar como archivo de  Excel',
        'Download as PDF file' => 'Descargar como archivo PDF',
        'Grouped' => 'Agrupado',
        'Stacked' => 'Apilado',
        'Expanded' => 'Expandido',
        'Stream' => 'Stream',
        'No Data Available.' => '',
        'Please select a valid graph output format in the configuration of this widget.' =>
            '',
        'The content of this statistic is being prepared for you, please be patient.' =>
            '',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            '',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => 'Mis tickets bloqueados',
        'My watched tickets' => 'Mis tickes en seguimiento',
        'My responsibilities' => 'Mis responsabilidades',
        'Tickets in My Queues' => 'Tickets en Mis Filas de Espera',
        'Tickets in My Services' => 'Tickets en Mis Servicios',
        'Service Time' => 'Tiempo de Servicio',
        'Remove active filters for this widget.' => 'Eliminar los filtros activos para este widget.',

        # Template: AgentDashboardTicketQueueOverview
        'Totals' => 'Total',

        # Template: AgentDashboardUserOnline
        'out of office' => 'fuera de la oficina',

        # Template: AgentDashboardUserOutOfOffice
        'until' => 'hasta',

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => 'El ticket ha sido bloqueado',
        'Undo & close' => 'Deshacer cambios y cerrar',

        # Template: AgentInfo
        'Info' => 'Información',
        'To accept some news, a license or some changes.' => 'Para aceptar noticias, una licencia o algunos cambios.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Objeto Vinculado: %s',
        'go to link delete screen' => 'ir a la ventana del vínculo de eliminar',
        'Select Target Object' => 'Seleccionar Objetivo',
        'Link object %s with' => '',
        'Unlink Object: %s' => 'Objecto desvinculado: %s',
        'go to link add screen' => 'ir a la ventana del vínculo de añadir',

        # Template: AgentOTRSBusinessBlockScreen
        'Unauthorized usage of %s detected' => '',
        'If you decide to downgrade to OTRS Free, you will lose all database tables and data related to %s.' =>
            '',

        # Template: AgentPreferences
        'Edit your preferences' => 'Modificar mis preferencias',
        'Did you know? You can help translating OTRS at %s.' => '¿Sabías que? Puedes ayudar a traducir OTRS en %s.',

        # Template: AgentSpelling
        'Spell Checker' => 'Chequeo Ortográfico',
        'spelling error(s)' => 'errores ortográficos',
        'Apply these changes' => 'Aplicar los cambios',

        # Template: AgentStatisticsAdd
        'Statistics » Add' => 'Estadísticas » Agregar',
        'Add New Statistic' => 'Agregar Nueva Estadística',
        'Dynamic Matrix' => 'Matriz Dinámica',
        'Tabular reporting data where each cell contains a singular data point (e. g. the number of tickets).' =>
            '',
        'Dynamic List' => 'Lista Dinámica',
        'Tabular reporting data where each row contains data of one entity (e. g. a ticket).' =>
            '',
        'Static' => 'Estático',
        'Complex statistics that cannot be configured and may return non-tabular data.' =>
            'Estadísticas complejas que no pueden ser configuradas y pueden regresar datos no tabulares.',
        'General Specification' => 'Especificación General',
        'Create Statistic' => 'Crear Estádística',

        # Template: AgentStatisticsEdit
        'Statistics » Edit %s%s — %s' => 'Estadísticas » Editar %s%s — %s',
        'Run now' => 'Ejecutar ahora',
        'Statistics Preview' => 'Vista Previa de Estadísticas',
        'Save statistic' => 'Guardar Estadística',

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
        'Sum rows' => 'Sumar filas',
        'Sum columns' => 'Sumar columnas',
        'Show as dashboard widget' => 'Mostrar como widget en el panel principal',
        'Cache' => 'Caché',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Esta estadísticas contiene errores de configuración y no puede ser utilizada en este momento.',

        # Template: AgentTicketActionCommon
        'Change Free Text of %s%s%s' => '',
        'Change Owner of %s%s%s' => '',
        'Close %s%s%s' => '',
        'Add Note to %s%s%s' => '',
        'Set Pending Time for %s%s%s' => '',
        'Change Priority of %s%s%s' => '',
        'Change Responsible of %s%s%s' => '',
        'All fields marked with an asterisk (*) are mandatory.' => 'Todos los campos marcados con un asterisco (*) son obligatorios.',
        'Service invalid.' => 'Servicio inválido.',
        'New Owner' => 'Propietario nuevo',
        'Please set a new owner!' => 'Por favor, defina un propietario nuevo.',
        'New Responsible' => 'Nuevo Responsable',
        'Next state' => 'Siguiente estado',
        'For all pending* states.' => 'Para todos los estados pendientes*.',
        'Add Article' => 'Añadir Artículo',
        'Create an Article' => 'Crear un Artículo',
        'Inform agents' => 'Informar a los agentes',
        'Inform involved agents' => 'Informar a los agentes involucrados',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Aquí puede seleccionar agentes adicionales que deben recibir una notificación sobre el nuevo artículo.',
        'Text will also be received by' => '',
        'Spell check' => 'Corrector ortográfico',
        'Text Template' => 'Plantilla de texto',
        'Setting a template will overwrite any text or attachment.' => 'Establecer una plantilla sobrescribirá cualquier texto o adjunto.',
        'Note type' => 'Tipo de nota',

        # Template: AgentTicketBounce
        'Bounce %s%s%s' => '',
        'Bounce to' => 'Rebotar a',
        'You need a email address.' => 'Se requiere una dirección de correo electrónico.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Se requiere una dirección de correo electrónica válida, que no sea local.',
        'Next ticket state' => 'Nuevo estado del ticket',
        'Inform sender' => 'Informar al emisor',
        'Send mail' => 'Enviar correo',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Acción múltiple con Tickets',
        'Send Email' => 'Enviar correo',
        'Merge to' => 'Fusionar con',
        'Invalid ticket identifier!' => '¡Identificador de ticket inválido!',
        'Merge to oldest' => 'Combinar con el mas viejo',
        'Link together' => 'Enlazar juntos',
        'Link to parent' => 'Enlazar al padre',
        'Unlock tickets' => 'Desbloquear tickets',
        'Execute Bulk Action' => '',

        # Template: AgentTicketCompose
        'Compose Answer for %s%s%s' => '',
        'This address is registered as system address and cannot be used: %s' =>
            'Esta dirección está registrada como una dirección del sistema y no puede ser usada: %s',
        'Please include at least one recipient' => 'Incluya al menos un destinatario',
        'Remove Ticket Customer' => 'Eliminar al cliente del ticket',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Elimine esta entrada e introduzca una nueva con el valor correcto.',
        'Remove Cc' => 'Eliminar Copia para',
        'Remove Bcc' => 'Eliminar Copia oculta',
        'Address book' => 'Agenda de direcciones',
        'Date Invalid!' => '¡Fecha Inválida!',

        # Template: AgentTicketCustomer
        'Change Customer of %s%s%s' => '',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Crear un Ticket nuevo de Correo Electrónico',
        'Example Template' => 'Plantilla de Ejemplo',
        'From queue' => 'De la fila',
        'To customer user' => 'Al usuario del cliente',
        'Please include at least one customer user for the ticket.' => 'Por favor, incluya en el ticket al menos un usuario del cliente.',
        'Select this customer as the main customer.' => 'Seleccionar a este cliente como el cliente principal.',
        'Remove Ticket Customer User' => 'Eliminar del Ticket al Usuario del Cliente',
        'Get all' => 'Obtener todos',

        # Template: AgentTicketEmailOutbound
        'Outbound Email for %s%s%s' => '',

        # Template: AgentTicketEscalation
        'Ticket %s: first response time is over (%s/%s)!' => '',
        'Ticket %s: first response time will be over in %s/%s!' => '',
        'Ticket %s: update time is over (%s/%s)!' => '',
        'Ticket %s: update time will be over in %s/%s!' => '',
        'Ticket %s: solution time is over (%s/%s)!' => '',
        'Ticket %s: solution time will be over in %s/%s!' => '',

        # Template: AgentTicketForward
        'Forward %s%s%s' => '',

        # Template: AgentTicketHistory
        'History of %s%s%s' => '',
        'History Content' => 'Contenido del Historial',
        'Zoom view' => 'Vista detallada',

        # Template: AgentTicketMerge
        'Merge %s%s%s' => '',
        'Merge Settings' => 'Unir Configuraciones',
        'You need to use a ticket number!' => '¡Necesita usar un número de ticket!',
        'A valid ticket number is required.' => 'Se requiere un número de ticket válido.',
        'Need a valid email address.' => 'Se require una dirección de correo electrónica válida.',

        # Template: AgentTicketMove
        'Move %s%s%s' => '',
        'New Queue' => 'Fila nueva',

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Seleccionar todos',
        'No ticket data found.' => 'No se encontraron datos de ticket.',
        'Open / Close ticket action menu' => ' Abrir / Cerrar el Menú de accion del ticket',
        'Select this ticket' => 'Seleccionar este ticket',
        'First Response Time' => 'Tiempo para Primera Respuesta',
        'Update Time' => 'Tiempo para Actualización',
        'Solution Time' => 'Tiempo para Solución',
        'Move ticket to a different queue' => 'Mover ticket a una fila diferente',
        'Change queue' => 'Modificar fila',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Cambiar opciones de búsqueda',
        'Remove active filters for this screen.' => 'Eliminar los filtros activos para esta pantalla.',
        'Tickets per page' => 'Tickets por página',

        # Template: AgentTicketOverviewSmall
        'Reset overview' => 'Restablecer la vista general',
        'Column Filters Form' => 'Formulario de filtros de columna',

        # Template: AgentTicketPhone
        'Split Into New Phone Ticket' => 'Dividir En Nuevo Ticket Telefónico',
        'Save Chat Into New Phone Ticket' => 'Guardar Chat En Nuevo Ticket Telefónico',
        'Create New Phone Ticket' => 'Crear un Ticket Telefónico Nuevo',
        'Please include at least one customer for the ticket.' => 'Por favor, Incluya al menos un cliente para el ticket',
        'To queue' => 'Para la fila de espera',
        'Chat protocol' => 'Protocolo de Chat',
        'The chat will be appended as a separate article.' => 'El chat se agregará como un artículo separado.',

        # Template: AgentTicketPhoneCommon
        'Phone Call for %s%s%s' => '',

        # Template: AgentTicketPlain
        'View Email Plain Text for %s%s%s' => '',
        'Plain' => 'Texto plano',
        'Download this email' => 'Descargar este correo electrónico',

        # Template: AgentTicketProcess
        'Create New Process Ticket' => 'Crear Nuevo Ticket de Proceso',
        'Process' => 'Proceso',

        # Template: AgentTicketProcessSmall
        'Enroll Ticket into a Process' => 'Registrar Ticket en un Proceso',

        # Template: AgentTicketSearch
        'Search template' => 'Buscar-Modelo',
        'Create Template' => 'Crear Plantilla',
        'Create New' => 'Crear Nuevo(a)',
        'Profile link' => 'Enlace al perfil',
        'Save changes in template' => 'Guardar los cambios en la plantilla',
        'Filters in use' => 'Filtros en uso',
        'Additional filters' => 'Filtros Adicionales',
        'Add another attribute' => 'Añadir otro atributo',
        'Output' => 'Modelo de Resultados',
        'Fulltext' => 'Texto Completo',
        'Remove' => 'Quitar',
        'Searches in the attributes From, To, Cc, Subject and the article body, overriding other attributes with the same name.' =>
            '',
        'CustomerID (complex search)' => '',
        '(e. g. 234*)' => '',
        'CustomerID (exact match)' => '',
        'Customer User Login (complex search)' => '',
        '(e. g. U51*)' => '',
        'Customer User Login (exact match)' => '',
        'Attachment Name' => 'Nombre del Archivo Adjunto',
        '(e. g. m*file or myfi*)' => '(ej. m*archivo o miarchi*)',
        'Created in Queue' => 'Creado en Fila',
        'Lock state' => 'Estado de bloqueo',
        'Watcher' => 'Observador',
        'Article Create Time (before/after)' => 'Hora de Creación del Artículo (antes/después)',
        'Article Create Time (between)' => 'Hora de Creación del Artículo (entre)',
        'Ticket Create Time (before/after)' => 'Hora de Creación del Ticket (antes/después)',
        'Ticket Create Time (between)' => 'Hora de Creación del Ticket (entre)',
        'Ticket Change Time (before/after)' => 'Hora de Modificación del Ticket (antes/después)',
        'Ticket Change Time (between)' => 'Hora de Modificación del Ticket (entre)',
        'Ticket Last Change Time (before/after)' => 'Hora de la Última Modificación del Ticket (antes/después)',
        'Ticket Last Change Time (between)' => 'Hora de la Última Modificación del Ticket (entre)',
        'Ticket Close Time (before/after)' => 'Hora en que fue Cerrado del Ticket (antes/después)',
        'Ticket Close Time (between)' => 'Hora en que fue Cerrado del Ticket (entre)',
        'Ticket Escalation Time (before/after)' => 'Hora en que fue Escalado el Ticket (antes/después)',
        'Ticket Escalation Time (between)' => 'Hora en que fue Escalado el Ticket (entre)',
        'Archive Search' => 'Búsqueda de Archivo',
        'Run search' => 'Ejecutar la búsqueda',

        # Template: AgentTicketZoom
        'Article filter' => 'Filtro de artículos',
        'Article Type' => 'Tipo de artículo',
        'Sender Type' => 'Tipo de remitente',
        'Save filter settings as default' => 'Grabar configuración de filtros como defecto',
        'Event Type Filter' => 'Filtro de Tipo Evento',
        'Event Type' => 'Tipo de Evento',
        'Save as default' => 'Guardar como predeterminado',
        'Archive' => 'Archivar',
        'This ticket is archived.' => 'Este ticket está archivado.',
        'Note: Type is invalid!' => 'Nota: El tipo es inválido!',
        'Locked' => 'Bloqueado',
        'Accounted time' => 'Tiempo contabilizado',
        'Linked Objects' => 'Objetos Enlazados',
        'Change Queue' => 'Cambiar Fila',
        'There are no dialogs available at this point in the process.' =>
            'No hay diálogos disponibles en este punto del proceso.',
        'This item has no articles yet.' => 'Este ítem todavía no tiene ningún artículo.',
        'Ticket Timeline View' => 'Vista de Linea Temporal del Ticket',
        'Article Overview' => 'Vista General del Artículo',
        'Article(s)' => 'Artículo(s)',
        'Page' => 'Página',
        'Add Filter' => 'Añadir Filtro',
        'Set' => 'Ajustar',
        'Reset Filter' => 'Restablecer Filtro',
        'Show one article' => 'Mostrar un artículo',
        'Show all articles' => 'Mostrar todos los artículos',
        'Show Ticket Timeline View' => 'Mostrar Vista de Linea Temporal del Ticket',
        'Unread articles' => 'Artículos no leídos',
        'No.' => 'Núm.',
        'Important' => 'Importante',
        'Unread Article!' => '¡Artículo sin leer!',
        'Incoming message' => 'Mensaje entrante',
        'Outgoing message' => 'Mensaje saliente',
        'Internal message' => 'Mensaje interno',
        'Resize' => 'Cambiar el tamaño',
        'Mark this article as read' => 'Marcar este artículo como leído',
        'Show Full Text' => 'Mostrar Texto Completo',
        'Full Article Text' => 'Texto Completo del Artículo',
        'No more events found. Please try changing the filter settings.' =>
            'No se encontraron más eventos. Por favor, pruebe cambiando las configuraciones del filtro.',
        'by' => 'por',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            '',
        'Close this message' => 'Cerrar este mensaje',
        'Article could not be opened! Perhaps it is on another article page?' =>
            '',
        'Scale preview content' => '',
        'Open URL in new tab' => '',
        'Close preview' => '',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            '',

        # Template: AttachmentBlocker
        'To protect your privacy, remote content was blocked.' => '',
        'Load blocked content.' => 'Cargar contenido bloqueado.',

        # Template: ChatStartForm
        'First message' => 'Primer mensaje',

        # Template: CloudServicesDisabled
        'This feature requires cloud services.' => '',
        'You can' => 'Usted puede',
        'go back to the previous page' => 'regresar a la página anterior',

        # Template: CustomerError
        'An Error Occurred' => '',
        'Error Details' => 'Detalles del error',
        'Traceback' => 'Determinar el origen',

        # Template: CustomerFooter
        'Powered by' => 'Impulsado por',

        # Template: CustomerFooterJS
        'One or more errors occurred!' => '¡Ha ocurrido al menos un error!',
        'Close this dialog' => 'Cerrar este diálogo',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'No se pudo abrir la ventana pop-up. Por favor, deshabilite cualquier bloqueador de pop-ups para esta aplicación.',
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Si sale de esta página ahora, todas las ventanas pop-up también se cerrarán.',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Ya hay una pop-up abierta de esta pantalla. ¿Desea cerrarla y cargar esta en su lugar?',
        'There are currently no elements available to select from.' => '',
        'Please turn off Compatibility Mode in Internet Explorer!' => '',
        'The browser you are using is too old.' => 'El explorador que está usando es muy antiguo.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS correo en una amplia lista de exploradores, por favor utilice alguno de ellos.',
        'Please see the documentation or ask your admin for further information.' =>
            'Por favor, refiérase a la documentación o pregunte a su administrador para obtener más información.',
        'Switch to mobile mode' => 'Cambiar a modo móvil',
        'Switch to desktop mode' => 'Cambiar a modo de escritorio',
        'Not available' => 'No disponible',
        'Clear all' => 'Limpiar todo',
        'Clear search' => 'Limpiar búsqueda',
        '%s selection(s)...' => '%s selección(es)...',
        'and %s more...' => 'y %s más...',
        'Filters' => 'Filtros',
        'Confirm' => 'Confirmar',
        'You have unanswered chat requests' => 'Tiene peticiones de chat sin responder',
        'Accept' => '',
        'Decline' => '',
        'An internal error occurred.' => '',
        'Connection error' => '',
        'Reload page' => '',
        'Your browser was not able to communicate with OTRS properly, there seems to be something wrong with your network connection. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            '',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            '',

        # Template: CustomerLogin
        'JavaScript Not Available' => 'JavaScript No Disponible',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Para utilizar OTRS correctamente, es necesario que habilite JavaScript en su explorador web.',
        'Browser Warning' => 'Advertencia del Explorador',
        'One moment please, you are being redirected...' => 'Un momento por favor, está siendo redirigido...',
        'Login' => 'Identificador',
        'User name' => 'Nombre de usuario',
        'Your user name' => 'Su nombre de usuario',
        'Your password' => 'Su contraseña',
        'Forgot password?' => '¿Olvidó su contraseña?',
        '2 Factor Token' => '',
        'Your 2 Factor Token' => '',
        'Log In' => 'Iniciar sesión',
        'Not yet registered?' => '¿Aún no se ha registrado?',
        'Request new password' => 'Solicitar una nueva contraseña',
        'Your User Name' => 'Su Nombre de Usuario',
        'A new password will be sent to your email address.' => 'Una contraseña nueva se enviará a su dirección de correo electrónico.',
        'Create Account' => 'Crear Cuenta',
        'Please fill out this form to receive login credentials.' => 'Por favor llene los campos de este formulario para recibir sus credenciales del sistema.',
        'How we should address you' => 'Cómo debemos contactarlo',
        'Your First Name' => 'Su Nombre',
        'Your Last Name' => 'Su Apellido',
        'Your email address (this will become your username)' => 'Su dirección de email (esta será su nombre de usuario)',

        # Template: CustomerNavigationBar
        'Incoming Chat Requests' => 'Petición de Chat Entrante',
        'Edit personal preferences' => 'Modificar preferencias presonales',
        'Logout %s %s' => 'Cerrar sesión %s %s',

        # Template: CustomerRichTextEditor
        'Split Quote' => 'Dividir Cita',
        'Open link' => '',

        # Template: CustomerTicketMessage
        'Service level agreement' => 'Acuerdo de nivel de servicio',

        # Template: CustomerTicketOverview
        'Welcome!' => '¡Bienvenido!',
        'Please click the button below to create your first ticket.' => 'Por favor haga click en el botón inferior para crear su primer ticket.',
        'Create your first ticket' => 'Crear su primer ticket',

        # Template: CustomerTicketSearch
        'Profile' => 'Perfil',
        'e. g. 10*5155 or 105658*' => 'Por ejemplo: 10*5155 ó 105658*',
        'Customer ID' => 'ID del Cliente',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Texto de búsqueda en los tickets (por ejemplo: "John*n" o "Will*")',
        'Recipient' => 'Destinatario',
        'Carbon Copy' => 'Copia al Carbón',
        'e. g. m*file or myfi*' => 'ej. m*archivo ó mifich* ',
        'Types' => 'Tipos',
        'Time restrictions' => 'Restricciones de tiempo',
        'No time settings' => 'Sin ajustes de tiempo',
        'Specific date' => 'Fecha específica',
        'Only tickets created' => 'Únicamente tickets creados',
        'Date range' => 'Rango de fechas',
        'Only tickets created between' => 'Únicamente tickets creados entre',
        'Ticket archive system' => 'Sistema de archivo de tickets',
        'Save search as template?' => '¿Guardar búsqueda como una plantilla?',
        'Save as Template?' => '¿Guardar como Plantilla?',
        'Save as Template' => 'Guardar como Plantilla',
        'Template Name' => 'Nombre de la Plantilla',
        'Pick a profile name' => 'Seleccione un nombre para el perfil',
        'Output to' => 'Salida a',

        # Template: CustomerTicketSearchResultShort
        'of' => 'de',
        'Search Results for' => 'Buscar Resultados para',
        'Remove this Search Term.' => 'Quitar este Término de Búsqueda.',

        # Template: CustomerTicketZoom
        'Start a chat from this ticket' => 'Iniciar un chat de este ticket',
        'Expand article' => 'Ampliar artículo',
        'Information' => 'Información',
        'Next Steps' => 'Pasos Siguientes',
        'Reply' => 'Responder',
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
        'Su' => 'Dom',
        'Mo' => 'Lun',
        'Tu' => 'Mar',
        'We' => 'Miér',
        'Th' => 'Jue',
        'Fr' => 'Vier',
        'Sa' => 'Sáb',
        'Event Information' => 'Información del Evento',
        'Ticket fields' => 'Campos del ticket',
        'Dynamic fields' => 'Campos Dinámicos',

        # Template: Datepicker
        'Invalid date (need a future date)!' => '¡Fecha inválida (se requiere una fecha futura)!',
        'Invalid date (need a past date)!' => '¡Fecha inválida (debe ser anterior)!',
        'Previous' => 'Previo(a)',
        'Open date selection' => 'Abrir fecha seleccionada',

        # Template: Error
        'An error occurred.' => 'Ocurrió un error.',
        'Really a bug? 5 out of 10 bug reports result from a wrong or incomplete installation of OTRS.' =>
            '',
        'With %s, our experts take care of correct installation and cover your back with support and periodic security updates.' =>
            '',
        'Contact our service team now.' => '',
        'Send a bugreport' => 'Enviar un reporte de error',

        # Template: FooterJS
        'Please enter at least one search value or * to find anything.' =>
            'Introduzca al menos un valor a buscar, o * para buscar todo.',
        'Please remove the following words from your search as they cannot be searched for:' =>
            'Por favor elimine las siguientes palabras a buscar pues estas no pueden ser buscadas por:',
        'Please check the fields marked as red for valid inputs.' => 'Compruebe que los campos marcados en rojo tienen datos válidos.',
        'Please perform a spell check on the the text first.' => 'Primero realice por favor una comprobación ortográfica en el texto.',
        'Slide the navigation bar' => 'Deslice la barra de navegación',
        'Unavailable for chat' => 'No disponible para chat',
        'Available for internal chats only' => 'Disponible solo para chats internos',
        'Available for chats' => 'Disponible para Chats',
        'Please visit the chat manager' => 'Por favor vaya al gestor de chat',
        'New personal chat request' => 'Nueva petición de chat personal',
        'New customer chat request' => 'Nueva petición de chat por un cliente',
        'New public chat request' => 'Nueva petición de chat público',
        'Selected user is not available for chat.' => '',
        'New activity' => 'Nueva actividad',
        'New activity on one of your monitored chats.' => 'Nueva actividad en uno de sus chats monitoreados.',
        'Your browser does not support video and audio calling.' => '',
        'Selected user is not available for video and audio call.' => '',
        'Target user\'s browser does not support video and audio calling.' =>
            '',
        'Do you really want to continue?' => '¿Desea continuar?',
        'Information about the OTRS Daemon' => 'Información acerca del Daemon de OTRS',
        'This feature is part of the %s.  Please contact us at %s for an upgrade.' =>
            'Esta función es parte de %s. Por favor contacte con nosotros en %s para una adquirir esta funcionalidad.',
        'Find out more about the %s' => 'Encontrar mas sobre %s',

        # Template: Header
        'You are logged in as' => 'Ud. inició sesión como',

        # Template: Installer
        'JavaScript not available' => 'JavaScript no disponible',
        'Step %s' => 'Paso %s',
        'Database Settings' => 'Configuraciones de la Base de Datos',
        'General Specifications and Mail Settings' => 'Especificaciones Generales y Configuraciones de Correo',
        'Finish' => 'Finalizar',
        'Welcome to %s' => 'Bienvenido a %s',
        'Web site' => 'Sitio web',
        'Mail check successful.' => 'Verificación satisfactoria de correo',
        'Error in the mail settings. Please correct and try again.' => 'Error en las configuraciones de lcorreo. Por favor, corríjalas y vuelva a intentarlo.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Configurar Correo Saliente',
        'Outbound mail type' => 'Tipo de correo saliente',
        'Select outbound mail type.' => 'Seleccione el tipo de correo saliente.',
        'Outbound mail port' => 'Puerto para el correo saliente',
        'Select outbound mail port.' => 'Selecione el puerto para el correo saliente.',
        'SMTP host' => 'Host SMTP',
        'SMTP host.' => 'Host SMTP.',
        'SMTP authentication' => 'Autenticación SMTP',
        'Does your SMTP host need authentication?' => '¿Su host SMTP requiere autenticación?',
        'SMTP auth user' => 'Autenticación de usuario SMTP',
        'Username for SMTP auth.' => 'Nombre de usuario para la autenticación SMTP.',
        'SMTP auth password' => 'Contraseña de autenticación SMTP',
        'Password for SMTP auth.' => 'Contraseña para la autenticación SMTP.',
        'Configure Inbound Mail' => 'Configurar Correo Entrante',
        'Inbound mail type' => 'Tipo de correo entrante',
        'Select inbound mail type.' => 'eleccione el tipo de correo entrante.',
        'Inbound mail host' => 'Host del correo entrante',
        'Inbound mail host.' => 'Host del correo entrante.',
        'Inbound mail user' => 'Usuario del correo entrante',
        'User for inbound mail.' => 'Usuario para el correo entrante.',
        'Inbound mail password' => 'Contraseña del correo entrante',
        'Password for inbound mail.' => 'Contraseña para el correo entrante.',
        'Result of mail configuration check' => 'Resultado de la verificación de la configuración de correo.',
        'Check mail configuration' => 'Verificar configuración de correo',
        'Skip this step' => 'Omitir este paso',

        # Template: InstallerDBResult
        'Database setup successful!' => '¡Base de Datos configurada con éxito!',

        # Template: InstallerDBStart
        'Install Type' => 'Tipo de Instalación',
        'Create a new database for OTRS' => 'Crear una nueva base de datos para OTRS',
        'Use an existing database for OTRS' => 'Usar una base de datos existente para OTRS',

        # Template: InstallerDBmssql
        'Database name' => 'Nombre de la Base de Datos',
        'Check database settings' => 'Verificar las configuraciones de la base de datos',
        'Result of database check' => 'Resultado de la verificación de la base de datos',
        'Database check successful.' => 'Verificación satisfactoria de la base de datos',
        'Database User' => 'Usuario de la Base de Datos',
        'New' => 'Nuevo',
        'A new database user with limited permissions will be created for this OTRS system.' =>
            'Un usuario nuevo, con permisos limitados, se creará en este sistema OTRS, para la base de datos.',
        'Repeat Password' => 'Repetir Contraseña',
        'Generated password' => 'Generar contraseña',

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
        'Don\'t accept license' => 'No aceptar licencia',
        'Accept license and continue' => 'Aceptar la licencia y continuar',

        # Template: InstallerSystem
        'SystemID' => 'ID de sistema',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'Identificador del sistema. Todos los números de tickets e ID\'s de sesiones HTTP contendrán este número.',
        'System FQDN' => 'FQDN del sistema',
        'Fully qualified domain name of your system.' => 'Nombre de dominio totalmente calificado de su sistema.',
        'AdminEmail' => 'Correo del Administrador.',
        'Email address of the system administrator.' => 'Dirección de correo electrónico del administrador del sistema.',
        'Organization' => 'Organización',
        'Log' => 'Log',
        'LogModule' => 'MóduloLog',
        'Log backend to use.' => 'Backend a usar para el log.',
        'LogFile' => 'ArchivoLog',
        'Webfrontend' => 'Interface Web',
        'Default language' => 'Idioma por defecto',
        'Default language.' => 'Idioma por defecto.',
        'CheckMXRecord' => 'Revisar record MX',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'Las direcciones de correo electrónico que se proporcionan manualmente, se verifican con los records MX encontrados en el DNS. No utilice esta opcion si su DNS es lento o no resuelve direcciones públicas.',

        # Template: LinkObject
        'Object#' => 'Objecto#',
        'Add links' => 'Agregar enlaces',
        'Delete links' => 'Eliminar enlaces',

        # Template: Login
        'Lost your password?' => '¿Perdió su contraseña?',
        'Request New Password' => 'Solicite una Contraseña Nueva',
        'Back to login' => 'Regresar al inicio de sesión',

        # Template: MobileNotAvailableWidget
        'Feature not available' => 'Característica no disponible',
        'Sorry, but this feature of OTRS is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'Lo sentimos, pero OTRS no tiene disponible esta característica para dispositivos móviles. Si aún desea usar la dicha característica, puede hacerlo en el modo escritorio o puede usar una laptop o equipo de escritorio.',

        # Template: Motd
        'Message of the Day' => 'Mensaje del día',
        'This is the message of the day. You can edit this in %s.' => '',

        # Template: NoPermission
        'Insufficient Rights' => 'Permisos insuficientes',
        'Back to the previous page' => 'Volver a la página anterior',

        # Template: Pagination
        'Show first page' => 'Mostrar la primera página',
        'Show previous pages' => 'Mostrar la página anterior',
        'Show page %s' => 'Mostrar la página %s',
        'Show next pages' => 'Mostrar la página siguiente',
        'Show last page' => 'Mostrar la última página',

        # Template: PictureUpload
        'Need FormID!' => 'Se necesita el ID del Formulario',
        'No file found!' => '¡No se encontró el archivo!',
        'The file is not an image that can be shown inline!' => '¡El archivo no es una imagen que se pueda mostrar en línea!',

        # Template: PreferencesNotificationEvent
        'Notification' => 'Notificaciones',
        'No user configurable notifications found.' => 'No se han encontrado notificaciones configurables para el usuario',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Recibir mensajes para notificación \'%s\' por el método de transporte \'%s\'.',
        'Please note that you can\'t completely disable notifications marked as mandatory.' =>
            'Por favor tome en cuenta que no puede deshabilitar completamente las notificaciones marcadas como obligatorias.',
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            '',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            '',

        # Template: ActivityDialogHeader
        'Process Information' => 'Información del Proceso',
        'Dialog' => 'Diálogo',

        # Template: Article
        'Inform Agent' => 'Notificar a Agente',

        # Template: PublicDefault
        'Welcome' => 'Bienvenido',
        'This is the default public interface of OTRS! There was no action parameter given.' =>
            '',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            '',

        # Template: RichTextEditor
        'Remove Quote' => '',

        # Template: GeneralSpecificationsWidget
        'Permissions' => 'Permisos',
        'You can select one or more groups to define access for different agents.' =>
            'Puede seleccionar uno o más grupos para definir el acceso para los diferentes agentes.',
        'Result formats' => 'Apariencia del resultado',
        'The selected time periods in the statistic are time zone neutral.' =>
            'Los periodos de tiempo seleccionados en la estadística son de zona horaria neutral.',
        'Create summation row' => 'Crear una fila de agregación',
        'Generate an additional row containing sums for all data rows.' =>
            '',
        'Create summation column' => 'Crear una columna de agregación',
        'Generate an additional column containing sums for all data columns.' =>
            '',
        'Cache results' => 'Cache de resultados',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            '',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            '',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            '',
        'If set to invalid end users can not generate the stat.' => 'Si se define como inválida, los usuarios finales no podrán generar la estadística.',

        # Template: PreviewWidget
        'There are problems in the configuration of this statistic:' => 'Existe un problema con la configuración de esta estadística:',
        'You may now configure the X-axis of your statistic.' => 'Ahora puede configurar el eje-X de su estadística.',
        'This statistic does not provide preview data.' => 'Esta estadística no provee datos de vista previa.',
        'Preview format:' => 'Vista previa del formato:',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Por favor tome en cuenta que la Vista Previa usa datos aleatorios y no considera los filtros de datos.',
        'Configure X-Axis' => 'Configurar Eje-X',
        'X-axis' => 'Eje-X',
        'Configure Y-Axis' => 'Configurar Eje-Y',
        'Y-axis' => 'Eje-Y',
        'Configure Filter' => 'Configurar Filtro',

        # Template: RestrictionsWidget
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Por favor seleccione sólo un elemento o desactive el botón \'Fijo\'.',
        'Absolute period' => 'Periodo absoluto',
        'Between' => 'Entre',
        'Relative period' => 'Periodo relativo',
        'The past complete %s and the current+upcoming complete %s %s' =>
            '',
        'Do not allow changes to this element when the statistic is generated.' =>
            'No permitir cambios en este elemento mientras la estadística es generada.',

        # Template: StatsParamsWidget
        'Format' => 'Formato',
        'Exchange Axis' => 'Intercambiar Ejes',
        'Configurable params of static stat' => 'Parámetro configurable de estadística estática',
        'No element selected.' => 'No hay elemento seleccionado',
        'Scale' => 'Escala',
        'show more' => '',
        'show less' => '',

        # Template: D3
        'Download SVG' => 'Descargar SVG',
        'Download PNG' => 'Descargar PNG',

        # Template: XAxisWidget
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            '',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            '',

        # Template: YAxisWidget
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            '',

        # Template: Test
        'OTRS Test Page' => 'Página de Prueba de OTRS',
        'Welcome %s %s' => 'Bienvenido %s %s',
        'Counter' => 'Contador',

        # Template: Warning
        'Go back to the previous page' => 'Regresar a la página anterior',

        # Perl Module: Kernel/Config/Defaults.pm
        'View system log messages.' => 'Ver los mensajes del log del sistema.',
        'Update and extend your system with software packages.' => 'Actualizar y extender su sistema con paquetes de software.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACLs could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            '',
        'The following ACLs have been added successfully: %s' => '',
        'The following ACLs have been updated successfully: %s' => '',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            '',
        'This field is required' => '',
        'There was an error creating the ACL' => '',
        'Need ACLID!' => '',
        'Could not get data for ACLID %s' => '',
        'There was an error updating the ACL' => '',
        'There was an error setting the entity sync status.' => '',
        'There was an error synchronizing the ACLs.' => '',
        'ACL %s could not be deleted' => '',
        'There was an error getting data for ACL with ID %s' => '',
        'Exact match' => '',
        'Negated exact match' => '',
        'Regular expression' => '',
        'Regular expression (ignore case)' => '',
        'Negated regular expression' => '',
        'Negated regular expression (ignore case)' => '',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer Company %s already exists!' => '',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'New phone ticket' => 'Ticket telefónico nuevo',
        'New email ticket' => 'Ticket de correo electrónico nuevo',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => '',
        'Objects configuration is not valid' => '',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            '',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => '',
        'Need %s' => '',
        'The field does not contain only ASCII letters and numbers.' => '',
        'There is another field with the same name.' => '',
        'The field must be numeric.' => '',
        'Need ValidID' => '',
        'Could not create the new field' => '',
        'Need ID' => '',
        'Could not get data for dynamic field %s' => '',
        'The name for this field should not change.' => '',
        'Could not update the field %s' => '',
        'Currently' => 'Actualmente',
        'Unchecked' => '',
        'Checked' => '',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => '',
        'Prevent entry of dates in the past' => '',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => '',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => '',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'archive tickets' => '',
        'restore tickets from archive' => '',
        'Need Profile!' => '',
        'Got no values to check.' => '',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Por favor, elimine las siguientes palabras ya que no pueden ser usadas para la selección de ticket:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => '',
        'Could not get data for WebserviceID %s' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Need InvokerType' => '',
        'Invoker %s is not registered' => '',
        'InvokerType %s is not registered' => '',
        'Need Invoker' => '',
        'Could not determine config for invoker %s' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Could not get registered configuration for action type %s' => '',
        'Could not get backend for %s %s' => '',
        'Could not update configuration data for WebserviceID %s' => '',
        'Keep (leave unchanged)' => '',
        'Ignore (drop key/value pair)' => '',
        'Map to (use provided value as default)' => '',
        'Exact value(s)' => '',
        'Ignore (drop Value/value pair)' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'Could not find required library %s' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Need OperationType' => '',
        'Operation %s is not registered' => '',
        'OperationType %s is not registered' => '',
        'Need Operation' => '',
        'Could not determine config for operation %s' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need Subaction!' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => '',
        'There was an error updating the web service.' => '',
        'Web service "%s" updated!' => '¡Web service "%s" actualizado!',
        'There was an error creating the web service.' => '',
        'Web service "%s" created!' => '¡Web service "%s" creado!',
        'Need Name!' => '',
        'Need ExampleWebService!' => '',
        'Could not read %s!' => '',
        'Need a file to import!' => '',
        'The imported file has not valid YAML content! Please check OTRS log for details' =>
            '',
        'Web service "%s" deleted!' => '¡Web service "%s" eliminado!',
        'New Web service' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => '',
        'Could not get history data for WebserviceHistoryID %s' => '',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Notification updated!' => '',
        'Notification added!' => '',
        'There was an error getting data for Notification with ID:%s!' =>
            '',
        'Unknown Notification %s!' => '',
        'There was an error creating the Notification' => '',
        'Notifications could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            '',
        'The following Notifications have been added successfully: %s' =>
            '',
        'The following Notifications have been updated successfully: %s' =>
            '',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            '',
        'Agent who owns the ticket' => 'Agente propietario del ticket',
        'Agent who is responsible for the ticket' => 'El agente responsable por el ticket',
        'All agents watching the ticket' => 'Agentes dando seguimiento al ticket',
        'All agents with write permission for the ticket' => 'Todos los agentes con permisos de escritura para el ticket',
        'All agents subscribed to the ticket\'s queue' => 'Todos los agentes suscritos a la fila de espera del ticket',
        'All agents subscribed to the ticket\'s service' => 'Todos los agentes suscritos al servicio del ticket',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'Todos los agentes suscritos tanto a la fila de espera, como al servicio del ticket',
        'Customer of the ticket' => 'Cliente del ticket',
        'Yes, but require at least one active notification method' => 'Si, pero requiere al menos un método de notificación activo',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            '',
        'Need param Key to delete!' => '',
        'Key %s deleted!' => '',
        'Need param Key to download!' => '',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/otrs.Console.pl to install packages!' =>
            '',
        'No such package!' => '',
        'No such file %s in package!' => '',
        'No such file %s in local file system!' => '',
        'Can\'t read %s!' => '',
        'File is OK' => '',
        'Package has locally modified files.' => '',
        'No packages or no new packages found in selected repository.' =>
            '',
        'Package not verified due a communication issue with verification server!' =>
            'Paquete no verificado debido a un problema en la comunicación con el servidor de verificación!',
        'Can\'t connect to OTRS Feature Add-on list server!' => '',
        'Can\'t get OTRS Feature Add-on list from server!' => '',
        'Can\'t get OTRS Feature Add-on from server!' => '',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Need ExampleProcesses!' => '',
        'Need ProcessID!' => '',
        'Yes (mandatory)' => '',
        'Unknown Process %s!' => '',
        'There was an error generating a new EntityID for this Process' =>
            '',
        'The StateEntityID for state Inactive does not exists' => '',
        'There was an error creating the Process' => '',
        'There was an error setting the entity sync status for Process entity: %s' =>
            '',
        'Could not get data for ProcessID %s' => '',
        'There was an error updating the Process' => '',
        'Process: %s could not be deleted' => '',
        'There was an error synchronizing the processes.' => '',
        'The %s:%s is still in use' => '',
        'The %s:%s has a different EntityID' => '',
        'Could not delete %s:%s' => '',
        'There was an error setting the entity sync status for %s entity: %s' =>
            '',
        'Could not get %s' => '',
        'Need %s!' => '',
        'Process: %s is not Inactive' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            '',
        'There was an error creating the Activity' => '',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            '',
        'Need ActivityID!' => '',
        'Could not get data for ActivityID %s' => '',
        'There was an error updating the Activity' => '',
        'Missing Parameter: Need Activity and ActivityDialog!' => '',
        'Activity not found!' => '',
        'ActivityDialog not found!' => '',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            '',
        'Error while saving the Activity to the database!' => '',
        'This subaction is not valid' => '',
        'Edit Activity "%s"' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            '',
        'There was an error creating the ActivityDialog' => '',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            '',
        'Need ActivityDialogID!' => '',
        'Could not get data for ActivityDialogID %s' => '',
        'There was an error updating the ActivityDialog' => '',
        'Edit Activity Dialog "%s"' => '',
        'Agent Interface' => '',
        'Customer Interface' => '',
        'Agent and Customer Interface' => '',
        'Do not show Field' => '',
        'Show Field' => '',
        'Show Field As Mandatory' => '',
        'fax' => 'fax',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            '',
        'There was an error creating the Transition' => '',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            '',
        'Need TransitionID!' => '',
        'Could not get data for TransitionID %s' => '',
        'There was an error updating the Transition' => '',
        'Edit Transition "%s"' => '',
        'xor' => '',
        'String' => '',
        'Transition validation module' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => '',
        'There was an error generating a new EntityID for this TransitionAction' =>
            '',
        'There was an error creating the TransitionAction' => '',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            '',
        'Need TransitionActionID!' => '',
        'Could not get data for TransitionActionID %s' => '',
        'There was an error updating the TransitionAction' => '',
        'Edit Transition Action "%s"' => '',
        'Error: Not all keys seem to have values or vice versa.' => '',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Don\'t use :: in queue name!' => '',
        'Click back and change it!' => '',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => '',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            '',
        'Need param Filename to delete!' => '',
        'Need param Filename to download!' => '',
        'Needed CertFingerprint and CAFingerprint!' => '',
        'CAFingerprint must be different than CertFingerprint' => '',
        'Relation exists!' => '',
        'Relation added!' => '',
        'Impossible to add relation!' => '',
        'Relation doesn\'t exists' => '',
        'Relation deleted!' => '',
        'Impossible to delete relation!' => '',
        'Certificate %s could not be read!' => '',
        'Needed Fingerprint' => '',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation updated!' => '',
        'Salutation added!' => '',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => '',

        # Perl Module: Kernel/Modules/AdminSysConfig.pm
        'Import not allowed!' => '',
        'Need File!' => '',
        'Can\'t write ConfigItem!' => '',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => '',
        'There was an error creating the System Maintenance' => '',
        'Need SystemMaintenanceID!' => '',
        'Could not get data for SystemMaintenanceID %s' => '',
        'System Maintenance was saved successfully!' => '',
        'Session has been killed!' => '',
        'All sessions have been killed, except for your own.' => '',
        'There was an error updating the System Maintenance' => '',
        'Was not possible to delete the SystemMaintenance entry: %s!' => '',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => '',
        'Template added!' => '',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => '',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => '',
        'Statistic' => 'Estadísticas',
        'No preferences for %s!' => '',
        'Can\'t get element data of %s!' => '',
        'Can\'t get filter content data of %s!' => '',
        'Customer Company Name' => '',
        'Customer User ID' => '',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => '',
        'Please contact the administrator.' => 'Por favor contacte el administrador.',
        'You need ro permission!' => '',
        'Can not delete link with %s!' => '¡No se puede borrar el enlace con %s!',
        'Can not create link with %s! Object already linked as %s.' => '',
        'Can not create link with %s!' => 'No se puede eliminar el enlace con %s!',
        'The object %s cannot link with other object!' => '',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => '',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => '',
        'Invalid Subaction.' => '',
        'Statistic could not be imported.' => 'Las estadísticas no pudieron ser importadas.',
        'Please upload a valid statistic file.' => 'Por favor suba un archivo estadístico válido.',
        'Export: Need StatID!' => '',
        'Delete: Get no StatID!' => '',
        'Need StatID!' => '',
        'Could not load stat.' => '',
        'Could not create statistic.' => '',
        'Run: Get no %s!' => '',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => '',
        'You need %s permissions!' => '',
        'Could not perform validation on field %s!' => '',
        'No subject' => 'Sin título',
        'Previous Owner' => 'Propietario Anterior',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '',
        'Plain article not found for article %s!' => '',
        'Article does not belong to ticket %s!' => '',
        'Can\'t bounce email!' => '',
        'Can\'t send email!' => '',
        'Wrong Subaction!' => '',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => '',
        'Ticket (%s) is not unlocked!' => '',
        'Bulk feature is not enabled!' => '',
        'No selectable TicketID is given!' => '',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            '',
        'You need to select at least one ticket.' => '',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            '',
        'The following tickets were locked: %s.' => '',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Can not determine the ArticleType!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'No Subaction!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => '',
        'System Error!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Invalid Filter: %s!' => '',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => '',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => '',
        'Sorry, the current owner is %s!' => '',
        'Please become the owner first.' => '',
        'Ticket (ID=%s) is locked by %s!' => '',
        'Change the owner!' => '',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => '',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => '',

        # Perl Module: Kernel/Modules/AgentTicketPhone.pm
        'Chat is not active.' => '',
        'No permission.' => '',
        '%s has left the chat.' => '%s ha dejado la conversación.',
        'This chat has been closed and will be removed in %s hours.' => 'Esta conversación ha sido cerrada y será eliminada en %s horas.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => '',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            '',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => '',
        'printed by' => 'impreso por',
        'Ticket Dynamic Fields' => 'Campos Dinámicos del Ticket',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => '',
        'No Process configured!' => '',
        'Process %s is invalid!' => '',
        'Subaction is invalid!' => '',
        'Parameter %s is missing in %s.' => '',
        'No ActivityDialog configured for %s in _RenderAjax!' => '',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            '',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => '',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            '',
        'Process::Default%s Config Value missing!' => '',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            '',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            '',
        'Can\'t get Ticket "%s"!' => '',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            '',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            '',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            '',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => '',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            '',
        'Pending Date' => 'Fecha pendiente',
        'for pending* states' => 'en estado pendiente*',
        'ActivityDialogEntityID missing!' => '',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => '',
        'Couldn\'t use CustomerID as an invisible field.' => '',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            '',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            '',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            '',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => '',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => '',
        'Could not store ActivityDialog, invalid TicketID: %s!' => '',
        'Invalid TicketID: %s!' => '',
        'Missing ActivityEntityID in Ticket %s!' => '',
        'This step does not belong anymore the current activity in process for Ticket %s!' =>
            '',
        'Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            '',
        'Missing ProcessEntityID in Ticket %s!' => '',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            '',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Default Config for Process::Default%s missing!' => '',
        'Default Config for Process::Default%s invalid!' => '',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'Untitled' => '',
        'Customer Name' => '',
        'Invalid Users' => 'Usuarios Inválidos ',
        'CSV' => '',
        'Excel' => '',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => '',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => '',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'Link Deleted' => 'Enlace Eliminado',
        'Ticket Locked' => 'Ticket Bloqueado',
        'Pending Time Set' => '',
        'Dynamic Field Updated' => 'Campo Dinámico Actualizado',
        'Outgoing Email (internal)' => '',
        'Ticket Created' => 'Ticket Creado',
        'Type Updated' => '',
        'Escalation Update Time In Effect' => '',
        'Escalation Update Time Stopped' => '',
        'Escalation First Response Time Stopped' => '',
        'Customer Updated' => 'Cliente Actualizado',
        'Internal Chat' => 'Chat Interno',
        'Automatic Follow-Up Sent' => '',
        'Note Added' => 'Nota Agregada',
        'Note Added (Customer)' => 'Nota Agregada (Cliente)',
        'State Updated' => 'Estado Actualizado',
        'Outgoing Answer' => '',
        'Service Updated' => '',
        'Link Added' => 'Enlace Agregado',
        'Incoming Customer Email' => '',
        'Incoming Web Request' => '',
        'Priority Updated' => '',
        'Ticket Unlocked' => 'Ticket Desbloqueado',
        'Outgoing Email' => 'Correo Saliente',
        'Title Updated' => '',
        'Ticket Merged' => 'Ticket Fucionado',
        'Outgoing Phone Call' => '',
        'Forwarded Message' => '',
        'Removed User Subscription' => '',
        'Time Accounted' => '',
        'Incoming Phone Call' => '',
        'System Request.' => '',
        'Incoming Follow-Up' => '',
        'Automatic Reply Sent' => '',
        'Automatic Reject Sent' => '',
        'Escalation Solution Time In Effect' => '',
        'Escalation Solution Time Stopped' => '',
        'Escalation Response Time In Effect' => '',
        'Escalation Response Time Stopped' => '',
        'SLA Updated' => 'SLA Actualizado',
        'Queue Updated' => '',
        'External Chat' => 'Chat Externo',
        'Queue Changed' => '',
        'Notification Was Sent' => '',
        'We are sorry, you do not have permissions anymore to access this ticket in its current state.' =>
            'Lo sentimos, usted ya no tiene permisos para acceder a este ticket en su estado actual.',
        'Can\'t get for ArticleID %s!' => '',
        'Article filter settings were saved.' => '',
        'Event type filter settings were saved.' => '',
        'Need ArticleID!' => '',
        'Invalid ArticleID!' => '',
        'Offline' => '',
        'User is currently offline.' => '',
        'User is currently active.' => '',
        'Away' => '',
        'User was inactive for a while.' => '',
        'Unavailable' => '',
        'User set their status to unavailable.' => '',
        'Fields with no group' => 'Campos sin grupo',
        'View the source for this Article' => '',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => '',
        'No TicketID for ArticleID (%s)!' => '',
        'No such attachment (%s)!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => '',
        'Check SysConfig setting for %s::TicketTypeDefault.' => '',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => '',
        'My Tickets' => 'Mis Tickets',
        'Company Tickets' => 'Tickets de la Compañía',
        'Untitled!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Please remove the following words because they cannot be used for the search:' =>
            '',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => '',
        'Create a new ticket!' => '',

        # Perl Module: Kernel/Modules/Installer.pm
        'Directory "%s" doesn\'t exist!' => '',
        'Configure "Home" in Kernel/Config.pm first!' => '',
        'File "%s/Kernel/Config.pm" not found!' => '',
        'Directory "%s" not found!' => '',
        'Kernel/Config.pm isn\'t writable!' => '',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            '',
        'Unknown Check!' => '',
        'The check "%s" doesn\'t exist!' => '',
        'Database %s' => '',
        'Configure MySQL' => '',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => '',
        'Please go back.' => '',
        'Install OTRS - Error' => '',
        'File "%s/%s.xml" not found!' => '',
        'Contact your Admin!' => '',
        'Syslog' => '',
        'Can\'t write Config file!' => '',
        'Unknown Subaction %s!' => '',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            '',
        'Can\'t connect to database, read comment!' => '',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            '',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            '',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => '',
        'Authentication failed from %s!' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Sent message crypted to recipient!' => '',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '',
        'Ticket decrypted before' => '',
        'Impossible to decrypt: private key for email was not found!' => '',
        'Successful decryption' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/News.pm
        'Can\'t connect to OTRS News server!' => '',
        'Can\'t get OTRS News from server!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/ProductNotify.pm
        'Can\'t connect to Product News server!' => '',
        'Can\'t get Product News from server!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'sorted ascending' => '',
        'sorted descending' => '',
        'filter not active' => '',
        'filter active' => '',
        'This ticket has no title or subject' => 'Este ticket no tiene título o asunto',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'We are sorry, you do not have permissions anymore to access this ticket in its current state. You can take one of the following actions:' =>
            '',
        'No Permission' => '',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Enlazado como',
        'Search Result' => '',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => '',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOTRSBusiness.pm
        '%s Upgrade to %s now! %s' => '%s ¡Actualizar ahora a %s! %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'A system maintenance period will start at: ' => 'Un periodo de mantenimiento del sistema comenzará a las:',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(en proceso)',

        # Perl Module: Kernel/Output/HTML/Preferences/NotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            'Por favor asegúrese de haber seleccionado al menos un método de transporte para las notificaciones obligatorias.',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'Por favor especifique una fecha de término posterior a la fecha de inicio.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Please supply your new password!' => '¡Por favor ingrese una nueva contraseña!',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'No (not supported)' => 'No (no soportado)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            '',
        'The selected time period is larger than the allowed time period.' =>
            '',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            '',
        'The selected date is not valid.' => 'La fecha seleccionada no es válida.',
        'The selected end time is before the start time.' => '',
        'There is something wrong with your time selection.' => '',
        'Please select only one element or allow modification at stat generation time.' =>
            '',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            '',
        'Please select one element for the X-axis.' => 'Por favor seleccione un elemento para el Eje-X.',
        'You can only use one time element for the Y axis.' => '',
        'You can only use one or two elements for the Y axis.' => '',
        'Please select at least one value of this field.' => '',
        'Please provide a value or allow modification at stat generation time.' =>
            '',
        'Please select a time scale.' => 'Por favor seleccione una escala de tiempo.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            '',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            '',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Ordenar por',

        # Perl Module: Kernel/System/AuthSession.pm
        'You have exceeded the number of concurrent agents - contact sales@otrs.com.' =>
            '',
        'Please note that the session limit is almost reached.' => '',
        'Login rejected! You have exceeded the maximum number of concurrent Agents! Contact sales@otrs.com immediately!' =>
            '',
        'Session per user limit reached!' => '',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'Referencia de las Opciones de Configuración',
        'This setting can not be changed.' => 'Esta configuración no puede ser cambiada.',
        'This setting is not active by default.' => 'Esta configuración no está activa por omisión.',
        'This setting can not be deactivated.' => 'Esta configuración no puede ser desactivada.',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => '',
        'File is not installed!' => '',
        'File is different!' => '',
        'Can\'t read file!' => '',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Inactivo',
        'FadeAway' => '',

        # Perl Module: Kernel/System/Registration.pm
        'Can\'t get Token from sever' => '',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Suma',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Tipo de Estado',
        'Created Priority' => 'Prioridad de Creación',
        'Created State' => 'Estado de Creación',
        'Create Time' => 'Tiempo de Creación',
        'Close Time' => 'Fecha de Cierre',
        'Escalation - First Response Time' => 'Escalada - Tiempo de Primera Respuesta',
        'Escalation - Update Time' => 'Escalada - Tiempo de Actualización',
        'Escalation - Solution Time' => 'Escalada - Tiempo de Solución',
        'Agent/Owner' => 'Agente/Propietario',
        'Created by Agent/Owner' => 'Creado por Agente/Propietario',
        'CustomerUserLogin' => 'Cuenta de inicio de sesión del Cliente',
        'CustomerUserLogin (complex search)' => '',
        'CustomerUserLogin (exact match)' => '',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Evaluación por',
        'Ticket/Article Accounted Time' => 'Tiempo utilizado por el Ticket/Articulo',
        'Ticket Create Time' => 'Tiempo de creación del ticket',
        'Ticket Close Time' => 'Tiempo de cierre del ticket',
        'Accounted time by Agent' => 'Tiempo utilizado por el Agente',
        'Total Time' => 'Tiempo Total',
        'Ticket Average' => 'Ticket-Promedio',
        'Ticket Min Time' => 'Ticket-Tiempo Mín',
        'Ticket Max Time' => 'Ticket-Tiempo Máx',
        'Number of Tickets' => 'Número de tickets',
        'Article Average' => 'Artículo-Promedio',
        'Article Min Time' => 'Artículo-Tiempo Mín',
        'Article Max Time' => 'Artículo-Tiempo Máx',
        'Number of Articles' => 'Número de artículos',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => '',
        'ascending' => 'ascendente',
        'descending' => 'descendente',
        'Attributes to be printed' => 'Atributos a imprimir',
        'Sort sequence' => 'Secuencia de ordenamiento',
        'State Historic' => 'Historial del Estado',
        'State Type Historic' => 'Historial del Tipo de Estado',
        'Historic Time Range' => 'Rango Tiempo Histórico',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => '',
        'Solution Min Time' => '',
        'Solution Max Time' => '',
        'Solution Average (affected by escalation configuration)' => '',
        'Solution Min Time (affected by escalation configuration)' => '',
        'Solution Max Time (affected by escalation configuration)' => '',
        'Solution Working Time Average (affected by escalation configuration)' =>
            '',
        'Solution Min Working Time (affected by escalation configuration)' =>
            '',
        'Solution Max Working Time (affected by escalation configuration)' =>
            '',
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
        'Number of Tickets (affected by escalation configuration)' => '',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'Días',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => '',
        'Internal Error: Could not open file.' => 'Error Interno: No es posible abrir el archivo.',
        'Table Check' => 'Comprobación De Tablas',
        'Internal Error: Could not read file.' => 'Error Interno: No es posible leer el archivo.',
        'Tables found which are not present in the database.' => 'Se encontraron tablas que no están presentes en la base de datos.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Tamaño de Base de datos',
        'Could not determine database size.' => 'No fué posible determinar el tamaño de la Base de datos.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Versión de la Base de datos',
        'Could not determine database version.' => 'No fué posible determinar la versión de la Base de datos.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Juego de Caracteres de la Conexión del Cliente',
        'Setting character_set_client needs to be utf8.' => 'Configura character_set_client a un valor de utf8.',
        'Server Database Charset' => 'Juego de Caracteres del Servidor de Base de Datos',
        'Setting character_set_database needs to be UNICODE or UTF8.' => 'La configuración de character_set_database necesita ser UNICODE o UTF8.',
        'Table Charset' => 'Juego de Caracter de la Tabla',
        'There were tables found which do not have utf8 as charset.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'Tamaño del Archivo Log de InnoDB',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'La variable  \'innodb_log_file_size\' debe ser de al menos 256 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Tamaño Máximo de Consulta',
        'The setting \'max_allowed_packet\' must be higher than 20 MB.' =>
            'La variable \'max_allowed_packet\' debe ser mayor a 20 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Performance.pm
        'Query Cache Size' => 'Tamaño del Cache de la Consulta',
        'The setting \'query_cache_size\' should be used (higher than 10 MB but not more than 512 MB).' =>
            'La varialbe \'query_cache_size\' debe ser usada ( y ser mayor de 10 MB pero no mas de 512 MB).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Motor de Almacenamiento Predeterminado',
        'Table Storage Engine' => 'Motor de Almacenamiento de Tabla',
        'Tables with a different storage engine than the default engine were found.' =>
            'Se encontraron tablas con diferente motor de almacenamiento que el motor configurado como predeterminado.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'Se requiere MySQL 5.x o superior.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'Variable NLS_LANG ',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            '',
        'NLS_DATE_FORMAT Setting' => '',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => '',
        'NLS_DATE_FORMAT Setting SQL Check' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => '',
        'Setting server_encoding needs to be UNICODE or UTF8.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Formato de fecha',
        'Setting DateStyle needs to be ISO.' => 'La configuración DateStyle necesita ser ISO.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 8.x or higher is required.' => 'Se requiere PostgreSQL 8.x o superior.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionOTRS.pm
        'OTRS Disk Partition' => 'Partición en disco para OTRS',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Uso del disco',
        'The partition where OTRS is located is almost full.' => 'La partición donde se encuentra localizado OTRS está casi llena.',
        'The partition where OTRS is located has no disk space problems.' =>
            'La partición donde se encuentra OTRS no tiene problemas de espacioen disco.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'Uso de las particiones en disco',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Distribución',
        'Could not determine distribution.' => 'No fué posible determinar la distribución.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Versión de Kernel',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Carga del Sistema',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'La carga del sistema debe ser como máximo el número de CPUs que el sistema tiene (ej. una carga de 8 o menos en un sistema con 8 CPUs es adecuado).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Módulos Perl',
        'Not all required Perl modules are correctly installed.' => 'No todos los módulos Perl necesarios están instalados correctamente.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Espacio Swap libre (%)',
        'No swap enabled.' => 'Swap no habilitado',
        'Used Swap Space (MB)' => 'Swap utilizado (MB)',
        'There should be more than 60% free swap space.' => 'Debe estar libre mas del 60% del swap.',
        'There should be no more than 200 MB swap space used.' => 'No deben de usarse más de 200 MB del swap.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ConfigSettings.pm
        'OTRS' => 'OTRS',
        'Config Settings' => '',
        'Could not determine value.' => 'No es posible determinar el valor',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DaemonRunning.pm
        'Daemon' => 'Daemon',
        'Daemon is running.' => '',
        'Daemon is not running.' => 'El daemon no está en ejecución.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DatabaseRecords.pm
        'Database Records' => '',
        'Tickets' => 'Tickets',
        'Ticket History Entries' => 'Entradas del Historial de Tickets',
        'Articles' => 'Artículos',
        'Attachments (DB, Without HTML)' => 'Adjuntos (BD, Sin HTML)',
        'Customers With At Least One Ticket' => 'Clientes Con Al Menos Un ticket',
        'Dynamic Field Values' => 'Valores para campos dinámicos.',
        'Invalid Dynamic Fields' => 'Campos Dinámicos Invalidos',
        'Invalid Dynamic Field Values' => 'Valorres del Campo Dinámico Invalidos',
        'GenericInterface Webservices' => '',
        'Process Tickets' => '',
        'Months Between First And Last Ticket' => 'Meses Entre el Primer y Último Ticket',
        'Tickets Per Month (avg)' => 'Tickets por Mes (promedio)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'Nombre de Usuario y Contraseña SOAP Predeterminados',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultUser.pm
        'Default Admin Password' => 'Contraseña predeterminada del Administrador',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Riesgo de seguridad: la cuenta del agente root@localhost todavía tiene la contraseña predeterminada. Por favor cambie la contraseña o invalide la cuenta.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ErrorLog.pm
        'Error Log' => 'Registro de Errores',
        'There are error reports in your system log.' => 'Existen reportes de error en el registro del sistema.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FQDN.pm
        'FQDN (domain name)' => 'FQDN (nombre de dominio)',
        'Please configure your FQDN setting.' => 'Por favor configure su FQDN.',
        'Domain Name' => 'Nombre de Dominio',
        'Your FQDN setting is invalid.' => 'La configuración de su FQDN (nombre de  dominio totalmente calificado) es inválido.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FileSystemWritable.pm
        'File System Writable' => 'Sistema de Archivo con permisos de Escritura',
        'The file system on your OTRS partition is not writable.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageDeployment.pm
        'Package Installation Status' => 'Estado de la Instalación del Paquete',
        'Some packages have locally modified files.' => '',
        'Some packages are not correctly installed.' => '',
        'Package Verification Status' => '',
        'Some packages are not verified by the OTRS Group! It is recommended not to use this packages.' =>
            '',
        'Package Framework Version Status' => '',
        'Some packages are not allowed for the current framework version.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageList.pm
        'Package List' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SessionConfigSettings.pm
        'Session Config Settings' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SpoolMails.pm
        'Spooled Emails' => '',
        'There are emails in var/spool that OTRS could not process.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/DefaultType.pm
        'Default Ticket Type' => 'Tipo de Ticket Predeterminado',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Módulo de Indices de Tickets',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => '',
        'There are invalid users with locked tickets.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/OpenTickets.pm
        'Open Tickets' => 'Tickets Abiertos',
        'You should not have more than 8,000 open tickets in your system.' =>
            'No debería tener más de 8,000 tickets abiertos en su sistema.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'Módulo Búsquedas Indexadas de Tickets',
        'You have more than 50,000 articles and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => '',
        'Table ticket_lock_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            '',
        'Orphaned Records In ticket_index Table' => '',
        'Table ticket_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/TimeSettings.pm
        'Time Settings' => '',
        'Server time zone' => 'Zona horaria del servidor',
        'Computed server time offset' => 'Desfase calculado de hora del servidor',
        'OTRS TimeZone setting (global time offset)' => 'Configuración de la Zona Horaria OTRS (compensación del horario global) ',
        'TimeZone may only be activated for systems running in UTC.' => '',
        'OTRS TimeZoneUser setting (per-user time zone support)' => '',
        'TimeZoneUser may only be activated for systems running in UTC that don\'t have an OTRS TimeZone set.' =>
            '',
        'OTRS TimeZone setting for calendar ' => 'Configuración de la Zona Horaria OTRS  para el calendario',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Servidor Web',
        'Loaded Apache Modules' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'Modelo MPM',
        'OTRS requires apache to be run with the \'prefork\' MPM model.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'Uso Del Acelerador de CGI',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            '',
        'mod_deflate Usage' => 'Uso de mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => '',
        'mod_filter Usage' => 'Uso de mod_filter',
        'Please install mod_filter if mod_deflate is used.' => '',
        'mod_headers Usage' => 'Uso de mod_headers',
        'Please install mod_headers to improve GUI speed.' => '',
        'Apache::Reload Usage' => '',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            '',
        'Apache2::DBI Usage' => '',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => '',
        'Support data could not be collected from the web server.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Versión del Servidor Web',
        'Could not determine webserver version.' => 'No se puedo determinar la versión del servidor web.',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/OTRS/ConcurrentUsers.pm
        'Concurrent Users Details' => '',
        'Concurrent Users' => 'Usuarios Concurrentes',

        # Perl Module: Kernel/System/SupportDataCollector/PluginBase.pm
        'Unknown' => 'Desconocido',
        'OK' => 'Aceptar',
        'Problem' => 'Problema',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => '',

        # Perl Module: Kernel/System/Ticket/Event/NotificationEvent/Transport/Email.pm
        'PGP sign only' => '',
        'PGP encrypt only' => '',
        'PGP sign and encrypt' => '',
        'SMIME sign only' => '',
        'SMIME encrypt only' => '',
        'SMIME sign and encrypt' => '',
        'PGP and SMIME not enabled.' => '',
        'Skip notification delivery' => '',
        'Send unsigned notification' => '',
        'Send unencrypted notification' => '',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Panic, user authenticated but no user data can be found in OTRS DB!! Perhaps the user is invalid.' =>
            '',
        'Can`t remove SessionID.' => '',
        'Logout successful.' => '',
        'Panic! Invalid Session!!!' => '¡Alerta! ¡¡¡Sesión Inválida!!!',
        'No Permission to use this frontend module!' => '',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            '',
        'Reset password unsuccessful. Please contact the administrator.' =>
            '',
        'Added via Customer Panel (%s)' => '',
        'Customer user can\'t be added!' => '',
        'Can\'t send account info!' => '',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'SecureMode active!' => '',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            '',
        'Action "%s" not found!' => '',

        # Database XML Definition: scripts/database/otrs-initial_insert.xml
        'Group for default access.' => 'Grupo de acceso predeterminado.',
        'Group of all administrators.' => 'Grupo para todos los administradores.',
        'Group for statistics access.' => 'Grupo para acceder a las estadísticas.',
        'All new state types (default: viewable).' => '',
        'All open state types (default: viewable).' => '',
        'All closed state types (default: not viewable).' => '',
        'All \'pending reminder\' state types (default: viewable).' => '',
        'All \'pending auto *\' state types (default: viewable).' => '',
        'All \'removed\' state types (default: not viewable).' => '',
        'State type for merged tickets (default: not viewable).' => '',
        'New ticket created by customer.' => 'Nuevo ticket abierto por un cliente.',
        'Ticket is closed successful.' => 'Ticket cerrado exitosamente.',
        'Ticket is closed unsuccessful.' => 'Ticket cerrado sin éxito.',
        'Open tickets.' => 'Tickets abiertos.',
        'Customer removed ticket.' => 'El cliente eliminó el ticket.',
        'Ticket is pending for agent reminder.' => 'Este ticket está pendiente para efectuar un recordatorio al agente.',
        'Ticket is pending for automatic close.' => 'Ticket está pendiente para cierre automático.',
        'State for merged tickets.' => 'Estado de los tickets mezclados.',
        'system standard salutation (en)' => 'saludo estándar del sistema (en)',
        'Standard Salutation.' => 'Saludo Estándar.',
        'system standard signature (en)' => 'firma estándar del sistema (en)',
        'Standard Signature.' => 'Firma Estándar',
        'Standard Address.' => 'Dirección Estandar.',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            '',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            '',
        'new ticket' => 'nuevo ticket',
        'Follow-ups for closed tickets are not possible. A new ticket will be created..' =>
            '',
        'Postmaster queue.' => 'Cola Postmaster.',
        'All default incoming tickets.' => 'Todo los tickers entrantes predeterminados.',
        'All junk tickets.' => 'Todo los tickets basura.',
        'All misc tickets.' => 'Todos los tickets misceláneos.',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            '',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            '',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            '',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            '',
        'Auto remove will be sent out after a customer removed the request.' =>
            '',
        'default reply (after new ticket has been created)' => '',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            '',
        'default follow-up (after a ticket follow-up has been added)' => '',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            '',
        'Unclassified' => 'No clasificado',
        'tmp_lock' => 'tmp_lock',
        'email-notification-ext' => '',
        'email-notification-int' => '',
        'Ticket create notification' => 'Notificación de ticket creado',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            '',
        'Ticket follow-up notification (unlocked)' => '',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            '',
        'Ticket follow-up notification (locked)' => '',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            '',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            '',
        'Ticket owner update notification' => 'Notificación para cambio del propietario del ticket',
        'Ticket responsible update notification' => 'Notificación para cambio del responsable de ticket',
        'Ticket new note notification' => 'Notificación para nueva nota de ticket',
        'Ticket queue update notification' => 'Notificación de cambio en la fila de espera de ticket',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            '',
        'Ticket pending reminder notification (locked)' => '',
        'Ticket pending reminder notification (unlocked)' => '',
        'Ticket escalation notification' => '',
        'Ticket escalation warning notification' => '',
        'Ticket service update notification' => '',
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
' => '',
        ' (work units)' => '(unidades de trabajo)',
        '"%s" notification was sent to "%s" by "%s".' => '',
        '"Slim" skin which tries to save screen space for power users.' =>
            '',
        '%s' => '%s',
        '%s time unit(s) accounted. Now total %s time unit(s).' => '%s unidad(es) de tiempo contabilizadas. Nuevo total : %s unidad(es) de tiempo.',
        '(UserLogin) Firstname Lastname' => '',
        '(UserLogin) Lastname Firstname' => '',
        '(UserLogin) Lastname, Firstname' => '',
        '*** out of office until %s (%s d left) ***' => '',
        '100 (Expert)' => '',
        '200 (Advanced)' => '',
        '300 (Beginner)' => '',
        'A TicketWatcher Module.' => '',
        'A Website' => 'Un sito web',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            '',
        'A picture' => 'Una imagen',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'Módulo ACL que permite cerrar los tickets padre únicamente si todos sus hijos ya están cerrados ("Estado" muestra cuáles estados no están disponibles para el ticket padre, hasta que todos sus hijos estén cerrados).',
        'Access Control Lists (ACL)' => 'Listas de Control de Acceso (ACL)',
        'AccountedTime' => 'AccountedTime',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Activa un mecanismo de parpadeo para la fila que contiene el ticket más antiguo.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Activa la función de contraseña perdida para agentes, en la interfaz de los mismos.',
        'Activates lost password feature for customers.' => 'Activa la función de contraseña perdida para clientes.',
        'Activates support for customer groups.' => 'Activa soporte para grupos de clientes.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Activa el filtro de artículos en la vista detallada para especificar qué artículos deben mostrarse.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Activa los temas disponibles en el sistema. Valor 1 significa activo, 0 es inactivo.',
        'Activates the ticket archive system search in the customer interface.' =>
            '',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Activa el sistema de archivo de tickets para tener un sistema más rápido, al mover algunos tickets fuera del ámbito diario. Para buscar estos tickets, la bandera de archivo tiene que estar habilitada en la ventana de búsqueda.',
        'Activates time accounting.' => 'Activa la contatibilidad de tiempo.',
        'ActivityID' => 'ActivityID',
        'Add an inbound phone call to this ticket' => '',
        'Add an outbound phone call to this ticket' => '',
        'Added email. %s' => 'Correo añadido. %s',
        'Added link to ticket "%s".' => 'Añadido enlace al ticket "%s".',
        'Added note (%s)' => 'Nota añadida (%s)',
        'Added subscription for user "%s".' => 'Añadida subscripción para el usuario "%s".',
        'Address book of CustomerUser sources.' => '',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'Añade un sufijo con el año y mes actuales al archivo log de OTRS. Se generará un archivo log distinto para cada mes.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            '',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Añade los días de vacaciones, únicos para cada año. Por favor, utilice el patrón de un solo dígito para los números del 1 al 9 (en lugar de 01 - 09).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Añade los días de vacaciones fijos (iguales para todos los años). Por favor, utilice el patrón de un solo dígito para los números del 1 al 9 (en lugar de 01 - 09).',
        'Admin Area.' => '',
        'After' => '',
        'Agent Name' => '',
        'Agent Name + FromSeparator + System Address Display Name' => '',
        'Agent Preferences.' => '',
        'Agent called customer.' => 'El agente llamó al cliente.',
        'Agent interface article notification module to check PGP.' => 'Módulo de notificación de artículos de la interfaz del agente para verificar PGP.',
        'Agent interface article notification module to check S/MIME.' =>
            'Módulo de notificación de artículos de la interfaz del agente para verificar S/MIME.',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Módulo de la interfaz del agente para verificar los correos electrónicos entrantes, en la vista detallada del ticket, si la llave S/MIME está disponible y es verdadera.',
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
        'All customer users of a CustomerID' => 'Todos los usuarios de cliente de un CustomerID',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Permite a los agentes intercambiar los ejes de la estadística al generar una.',
        'Allows agents to generate individual-related stats.' => 'Permite a los agentes generar estadísticas relacionadas individualmente.',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Permite elegir entre mostrar los archivos adjuntos de un ticket en el explorador (en línea), o simplemente permitir descargarlos.',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Permite elegir el siguiente estado del ticket al redactar un artículo, en la interfaz del cliente.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Permite a los clientes cambiar la prioridad del ticket en la interfaz del cliente.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Permite a los clientes definir el SLA del ticket en la interfaz del cliente.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Permite a los clientes definir la prioridad del ticket en la interfaz del cliente.',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            'Permite a los clientes definir la fila del ticket en la interfaz del cliente. Si se selecciona \'No\', es necesario que se configure la fila por defecto.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Permite a los clientes definir el servicio del ticket en la interfaz del cliente.',
        'Allows customers to set the ticket type in the customer interface. If this is set to \'No\', TicketTypeDefault should be configured.' =>
            '',
        'Allows default services to be selected also for non existing customers.' =>
            '',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            'Permite definir nuevos tipos para los tickets (si la funcionalidad de tipo de ticket está habilitada).',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Permite definir servicios y SLAs para los tickets (por ejemplo: correo electrónico, escritorio, red, etc.), así mismo como atributos para los SLAs (si la funcionalidad servicio/SLA está habilitada).',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permite tener un formato de vista mediana para los tickets (InformaciónCliente => 1 - muestra además la información del cliente).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permite tener un formato de vista pequeña para los tickets (InformaciónCliente => 1 - muestra además la información del cliente).',
        'Allows invalid agents to generate individual-related stats.' => '',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            '',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Permite al administrador iniciar sesión como otros usuarios, a través del panel de administración de los mismos.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Permite definir el estado de un ticket nuevo, en la ventana de mover ticket de la interfaz del agente.',
        'Always show RichText if available' => '',
        'Arabic (Saudi Arabia)' => 'Árabe (Arabia Saudita)',
        'Archive state changed: "%s"' => 'Cambió el estado del archivo: "%s"',
        'ArticleTree' => 'ArticleTree',
        'Attachments <-> Templates' => 'Archivos Adjuntos <-> Plantilla',
        'Auto Responses <-> Queues' => 'Respuestas Automáticas <-> Filas',
        'AutoFollowUp sent to "%s".' => 'Seguimiento automático enviado a "%s".',
        'AutoReject sent to "%s".' => 'Rechazo automático enviado a "%s".',
        'AutoReply sent to "%s".' => 'Respuesta automática enviada a "%s".',
        'Automated line break in text messages after x number of chars.' =>
            'Salto de línea automático en los mensajes de texto después de x número de caracteres.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            '',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Bloquear automáticamente y establecer como propietario al agente actual, luego de elegir realizar una Acción múltiple con Tickets.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            '',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Establecer automáticamente el responsable de un ticket (si no está definido aún), luego de realizar la primera actualización de propietario.',
        'Balanced white skin by Felix Niklas (slim version).' => '',
        'Balanced white skin by Felix Niklas.' => 'Piel blanca balanceda diseñada por Felix Niklas.',
        'Based on global RichText setting' => '',
        'Basic fulltext index settings. Execute "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild" in order to generate a new index.' =>
            '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Bloquea todos los correos electrónicos entrantes que no tienen un número de ticket válido en el asunto con dirección De: @ejemplo.com.',
        'Bounced to "%s".' => 'Reenviado a "%s".',
        'Builds an article index right after the article\'s creation.' =>
            'Crea un índice de artículos justo después de la creación del artículo.',
        'Bulgarian' => 'Búlgaro',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            'Ejemplo de configuración CMD. Ignora correos electrónicos donde el CMD externo regresa alguna salida en STDOUT (los correos electrónicos serán dirigidos a STDIN de some.bin).',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for the DB ACL backend.' => '',
        'Cache time in seconds for the DB process backend.' => '',
        'Cache time in seconds for the SSL certificate attributes.' => '',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            '',
        'Cache time in seconds for the web service config backend.' => '',
        'Catalan' => 'Catalán',
        'Change password' => 'Cambiar contraseña',
        'Change queue!' => 'Cambiar fila',
        'Change the customer for this ticket' => 'Cambiar el cliente para este ticket',
        'Change the free fields for this ticket' => 'Cambiar los campos libres para este ticket',
        'Change the priority for this ticket' => 'Cambiar la prioridad para este ticket',
        'Change the responsible for this ticket' => 'Cambiar al responsable para este ticket',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Cambiar prioridad de "%s" (%s) a "%s" (%s).',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Cambia el propietario de los tickets a todos (útil para ASP). Normalmente sólo se mostrarán los agentes con permiso rw en la fila del ticket.',
        'Checkbox' => 'Casilla de verificación',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            '',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            'Verifica el ID del sistema en la detección de números de tickets para los seguimientos (use "No" si el ID del sistema se cambió después de empezar a utilizar OTRS).',
        'Checks the availability of OTRS Business Solution™ for this system.' =>
            '',
        'Checks the entitlement status of OTRS Business Solution™.' => '',
        'Chinese (Simplified)' => 'Chino (Simplificado)',
        'Chinese (Traditional)' => 'Chino (Tradicional)',
        'Choose for which kind of ticket changes you want to receive notifications.' =>
            '',
        'Closed tickets (customer user)' => 'Tickets cerrados (usuario del cliente)',
        'Closed tickets (customer)' => 'Tickets Cerrados (cliente)',
        'Cloud Services' => 'Servicios en la Nube',
        'Cloud service admin module registration for the transport layer.' =>
            '',
        'Collect support data for asynchronous plug-in modules.' => '',
        'Column ticket filters for Ticket Overviews type "Small".' => '',
        'Columns that can be filtered in the escalation view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Columnas que pueden ser filtradas en la vista de escaladas de la interfaz de agente. Configuraciones posibles: 0 = Deshabilitado, 1 = Disponible, 2 = Habilitado por defecto. Nota: Sólo atributos de Ticket, Campos Dinámicos (DynamicField_NombreX) y atributos de Cliente (por ej. CustomerUserPhone, CustomerCompanyName, ...) están disponibles.',
        'Columns that can be filtered in the locked view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the queue view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the responsible view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the service view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the status view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the ticket search result view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the watch view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Comment for new history entries in the customer interface.' => 'Comentario para entradas nuevas en la historia, en la interfaz del cliente.',
        'Comment2' => '',
        'Communication' => 'Comunicación',
        'Company Status' => 'Estado de la Compañía',
        'Company Tickets.' => '',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            '',
        'Compat module for AgentZoom to AgentTicketZoom.' => '',
        'Complex' => 'Complejo',
        'Configure Processes.' => 'Configurar Procesos.',
        'Configure and manage ACLs.' => 'Configurar y manejar ACLs',
        'Configure any additional readonly mirror databases that you want to use.' =>
            '',
        'Configure sending of support data to OTRS Group for improved support.' =>
            '',
        'Configure which screen should be shown after a new ticket has been created.' =>
            '',
        'Configure your own log text for PGP.' => 'Configure su propio texto largo para PGP',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://otrs.github.io/doc/), chapter "Ticket Event Module".' =>
            '',
        'Controls how to display the ticket history entries as readable values.' =>
            '',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            '',
        'Controls if CustomerID is read-only in the agent interface.' => '',
        'Controls if customers have the ability to sort their tickets.' =>
            'Define es posible que los clientes ordenen sus tickets.',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            '',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            '',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            '',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            '',
        'Converts HTML mails into text messages.' => 'Convierte correos HTML en mensajes de texto.',
        'Create New process ticket.' => '',
        'Create and manage Service Level Agreements (SLAs).' => 'Crear y gestionar Acuerdos de Nivel de Servicio (SLAs).',
        'Create and manage agents.' => 'Crear y gestionar agentes.',
        'Create and manage attachments.' => 'Crear y gestionar archivos adjuntos.',
        'Create and manage customer users.' => 'Crear y gestionar usuarios de clientes.',
        'Create and manage customers.' => 'Crear y gestionar clientes.',
        'Create and manage dynamic fields.' => 'Crear y gestionar campos dinámicos.',
        'Create and manage groups.' => 'Crear y gestionar grupos.',
        'Create and manage queues.' => 'Crear y gestionar filas.',
        'Create and manage responses that are automatically sent.' => 'Crear y gestionar respuestas enviadas de forma automática.',
        'Create and manage roles.' => 'Crear y gestionar roles.',
        'Create and manage salutations.' => 'Crear y gestionar saludos.',
        'Create and manage services.' => 'Crear y gestionar servicios.',
        'Create and manage signatures.' => 'Crear y gestionar firmas.',
        'Create and manage templates.' => 'Crear y gestionar plantillas.',
        'Create and manage ticket notifications.' => 'Crear y gestionar notificaciones de tickets.',
        'Create and manage ticket priorities.' => 'Crear y gestionar las prioridades del ticket.',
        'Create and manage ticket states.' => 'Crear y gestionar los estados del ticket.',
        'Create and manage ticket types.' => 'Crear y gestionar los tipos de ticket.',
        'Create and manage web services.' => 'Crear y gestionar web services.',
        'Create new Ticket.' => '',
        'Create new email ticket and send this out (outbound).' => '',
        'Create new email ticket.' => '',
        'Create new phone ticket (inbound).' => '',
        'Create new phone ticket.' => '',
        'Create new process ticket.' => '',
        'Create tickets.' => '',
        'Croatian' => 'Croata',
        'Custom RSS Feed' => 'Feed RSS personalizado',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            '',
        'Customer Administration' => 'Administración de Clientes',
        'Customer Information Center Search.' => '',
        'Customer Information Center.' => '',
        'Customer Ticket Print Module.' => '',
        'Customer User <-> Groups' => '',
        'Customer User <-> Services' => '',
        'Customer User Administration' => '',
        'Customer Users' => 'Clientes',
        'Customer called us.' => 'El cliente llamó.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer preferences.' => '',
        'Customer request via web.' => 'Solicitud de cliente vía web.',
        'Customer ticket overview' => '',
        'Customer ticket search.' => '',
        'Customer ticket zoom' => '',
        'Customer user search' => '',
        'CustomerID search' => '',
        'CustomerName' => '',
        'CustomerUser' => '',
        'Customers <-> Groups' => 'Clientes <-> Grupos',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Czech' => 'Checo',
        'Danish' => 'Danés',
        'Data used to export the search result in CSV format.' => 'Datos usados para exportar el resultado de la búsqueda a formato CSV.',
        'Date / Time' => 'Fecha / Hora',
        'Debug' => '',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            'Depura el conjunto de traducción. Si se selecciona "Sí", todas las cadenas de texto sin traducción se escriben en STDERR. Esto puede ser útil al crear archivos de traducción, de otra manera, esta opción debería permanecer en "No".',
        'Default' => '',
        'Default (Slim)' => '',
        'Default ACL values for ticket actions.' => 'Valores ACL por defecto para las acciones de ticket.',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            '',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            '',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            '',
        'Default loop protection module.' => 'Módulo de protección de bucle por defecto.',
        'Default queue ID used by the system in the agent interface.' => 'ID de fila usado por defecto por el sistema, en la interfaz del agente.',
        'Default skin for the agent interface (slim version).' => '',
        'Default skin for the agent interface.' => '',
        'Default skin for the customer interface.' => '',
        'Default ticket ID used by the system in the agent interface.' =>
            'ID de ticket usado por defecto por el sistema, en la interfaz del agente.',
        'Default ticket ID used by the system in the customer interface.' =>
            'ID de ticket usado por defecto por el sistema, en la interfaz del cliente.',
        'Default value for NameX' => '',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            '',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Define un filtro para la salida html para añadir vínculos a ciertas cadenas. El elemento Imagen permite dos tipos de entrada: un nombre de imagen (por ejemplo: faq.png). En este caso, se usa la ruta de imágenes de OTRS. La otra posibilidad es insertar el vínculo a la imagen.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the next setting below.' =>
            '',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            '',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            '',
        'Define the max depth of queues.' => '',
        'Define the queue comment 2.' => '',
        'Define the service comment 2.' => '',
        'Define the sla comment 2.' => '',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            '',
        'Define the start day of the week for the date picker.' => 'Define el día inicial de la para el selector de fecha.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Define un artículo de cliente que genera un ícono de VinculadoEn, al final de un bloque de información de cliente.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Define un artículo de cliente que genera un ícono de XING, al final de un bloque de información de cliente.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Define un artículo de cliente que genera un ícono de google, al final de un bloque de información de cliente.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Define un artículo de cliente que genera un ícono de mapas google, al final de un bloque de información de cliente.',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            'Define una lista de palabras por defecto, que son ignoradas por el corrector de ortografía.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Define un filtro para salida html para añadir vínculos a los números CVE. El elemento Imagen permite dos tipos de entrada: un nombre de imagen (por ejemplo: faq.png). En este caso, se usa la ruta de imágenes de OTRS. La otra posibilidad es insertar el vínculo a la imagen.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Define un filtro para salida html para añadir vínculos a los números MSBulletin. El elemento Imagen permite dos tipos de entrada: un nombre de imagen (por ejemplo: faq.png). En este caso, se usa la ruta de imágenes de OTRS. La otra posibilidad es insertar el vínculo a la imagen.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Define un filtro para salida html para añadir vínculos a una cadena definida. El elemento Imagen permite dos tipos de entrada: un nombre de imagen (por ejemplo: faq.png). En este caso, se usa la ruta de imágenes de OTRS. La otra posibilidad es insertar el vínculo a la imagen.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Define un filtro para salida html para añadir vínculos a los números bugtraq. El elemento Imagen permite dos tipos de entrada: un nombre de imagen (por ejemplo: faq.png). En este caso, se usa la ruta de imágenes de OTRS. La otra posibilidad es insertar el vínculo a la imagen.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            '',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Define un filtro para procesar el texto de los artículos, con la finalidad de resaltar las palabras llave predefinidas.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Define una expresión regular que excluye algunas direcciones de la verificación de sintaxis (si se seleccionó "Sí" en "CheckEmailAddresses"). Por favor, introduzca una expresión regular en este campo para direcciones de correo electrónico que, sintácticamente son inválidas, pero son necesarias para el sistema (por ejemplo: "root@localhost").',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Define una expresión regular que filtra todas las direcciones de correo electrónico que no deberían usarse en la aplicación.',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            '',
        'Defines a useful module to load specific user options or to display news.' =>
            'Define un módulo para cargar opciones de usuario específicas o para mostrar noticias.',
        'Defines all the X-headers that should be scanned.' => 'Define todos los encabezados-X que deberán escanearse.',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            '',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            '',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Define todos los parámetros para el objeto TiempoDeActualización, en las preferencias del cliente de la interfaz del mismo.',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Define todos los parámetros para el objeto TicketsMostrados, en las preferencias del cliente de la interfaz del mismo.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Define todos los parámetros para este elemento, en las preferencias del cliente.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            '',
        'Defines all the parameters for this notification transport.' => '',
        'Defines all the possible stats output formats.' => 'Define todos los formatos de salida posibles de las estadísticas.',
        'Defines an alternate URL, where the login link refers to.' => 'Define una URL sustituta, a la que el vínculo de inicio de sesión se refiera.',
        'Defines an alternate URL, where the logout link refers to.' => 'Define una URL sustituta, a la que el vínculo de término de sesión se refiera.',
        'Defines an alternate login URL for the customer panel..' => 'Define una URL sustituta para el inicio de sesión, en la interfaz del cliente.',
        'Defines an alternate logout URL for the customer panel.' => 'Define una URL sustituta para el término de sesión, en la interfaz del cliente.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            '',
        'Defines from which ticket attributes the agent can select the result order.' =>
            '',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Define cómo debe lucir el campo De en los correos electrónicos (enviados como respuestas y tickets).',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            '',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            '',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para cerrar dicho ticket, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para rebotar dicho ticket, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para redactar, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para reenviar dicho ticket, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana de campos libres de dicho ticket, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para mezclar dicho ticket, en su vista detallada, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para agregar una nota a dicho ticket de la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para cambiar el propietario de dicho ticket, en su vista detallada, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para definir como pendiente dicho ticket, en su vista detallada, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para añadir una llamada saliente a dicho ticket, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para cambiar la prioridad de dicho ticket, en su vista detallada, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para cambiar el agente responsable de dicho ticket, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Define si se requiere un bloqueo de ticket en la ventana para cambiar el cliente de dicho ticket, en la interfaz del agente (si el ticket aún no está bloqueado, se bloquea y el agente actual se convierte automáticamente en el propietario).',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            '',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            'Define si la ortografía de los mensajes redactados debe verificarse en la interfaz del agente.',
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
            'Define la expresión regular IP para acceder al repositorio local. Es necesario que esto se habilite para tener acceso al repositorio local y el paquete::ListaRepositorio se requiere en el host remoto.',
        'Defines the URL CSS path.' => 'Define la URL de la ruta CSS.',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Define la URL de la ruta base para los íconos, CSS y Java Script.',
        'Defines the URL image path of icons for navigation.' => 'Define la URL de la ruta de los íconos para la navegación.',
        'Defines the URL java script path.' => 'Define la URL de la ruta Java Script.',
        'Defines the URL rich text editor path.' => 'Define la URL de la ruta del editor de texto enriquecido.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Define la dirección de un servidor DNS dedicado, si se necesita, para las búsquedas de verificación de registro MX.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            '',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            'Define el texto para el cuerpo de las notificaciones electrónicas que se envían a los agentes, acerca de una contraseña nueva (dicha contraseña se enviará luego de usar este vínculo).',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            'Define el texto para el cuerpo de las notificaciones electrónicas que se envían a los agentes, con un token referente a la petición de una contraseña nueva (dicha contraseña se enviará luego de usar este vínculo).',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Define el texto para el cuerpo de las notificaciones electrónicas que se envían a los clientes, acerca de una cuenta nueva.',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            'Define el texto para el cuerpo de las notificaciones electrónicas que se envían a los clientes, acerca de una contraseña nueva (dicha contraseña se enviará luego de usar este vínculo).',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            'Define el texto para el cuerpo de las notificaciones electrónicas que se envían a los clientes, con un token referente a la petición de una contraseña nueva (dicha contraseña se enviará luego de usar este vínculo).',
        'Defines the body text for rejected emails.' => 'Define el texto para el cuerpo de los correos electrónicos electrónicos rechazados.',
        'Defines the calendar width in percent. Default is 95%.' => '',
        'Defines the cluster node identifier. This is only used in cluster configurations where there is more than one OTRS frontend system. Note: only values from 1 to 99 are allowed.' =>
            '',
        'Defines the column to store the keys for the preferences table.' =>
            'Define la columna para guardar las llaves en la tabla de preferencias.',
        'Defines the config options for the autocompletion feature.' => '',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Define los parámetros de configuración de este elemento, para que se muestren en la vista de preferencias.',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            'Define los parámetros de configuración de este elemento, para que se muestren en la vista de preferencias. Asegúrese de mantener los diccionarios instalados en el sistema, en la sección de datos.',
        'Defines the connections for http/ftp, via a proxy.' => 'Define la conexión para http/ftp, a través de un proxy.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            '',
        'Defines the date input format used in forms (option or input fields).' =>
            'Define el formato de entrada de las fechas, usado en los formularios (opción o campos de entrada).',
        'Defines the default CSS used in rich text editors.' => 'Define valor por defecto para el CSS de los editores de texto enriquecidos.',
        'Defines the default auto response type of the article for this operation.' =>
            '',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'Define el contenido por defecto del cuerpo de una nota, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at http://otrs.github.io/doc/.' =>
            '',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'Define el lenguaje por defecto del front-end. Todos los valores posibles se determinan por los archivos de idiomas disponible en el sistema (vea la siguiente configuración).',
        'Defines the default history type in the customer interface.' => 'Define el tipo de historia por defecto en la interfaz del cliente.',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'Define el número máximo por defecto de atributos para el eje X, en la escala de tiempo.',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            '',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de agregar una nota en la ventana para cerrar dicho ticket, en la interfaz del agente.',
        'Defines the default next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de agregar una nota en la ventana de acción múltiple sobre tickets, en la interfaz del agente.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de agregar una nota en la ventana de campos libres de ticket, en la interfaz del agente.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de agregar una nota en la ventana de nota para dicho ticket, en la interfaz del agente.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de agregar una nota en la ventana para cambiar el propietario de dicho ticket, en su vista detallada, en la interfaz del agente.',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de agregar una nota en la ventana para definir dicho ticket como pendiente, en su vista detallada, en la interfaz del agente.',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de agregar una nota en la ventana para cambiar la prioridad de dicho ticket, en su vista detallada, en la interfaz del agente.',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de agregar una nota en la ventana para cambiar el responsable de dicho ticket, en la interfaz del agente.',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de haber sido rebotado, en la ventana para rebotar dicho ticket, en la interfaz del agente.',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de haber sido reenviado, en la ventana para reenviar dicho ticket, en la interfaz del agente.',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de haberlo redactado / respondido, en la ventana de redacción de dicho ticket, en la interfaz del agente.',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Define el contenido por defecto del cuerpo de una nota, para tickets telefónicos en la ventana de llamada telefónica saliente de dicho ticket, en la interfaz del agente.',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            '',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'Define la prioridad por defecto para los tickets nuevos de clientes, en la interfaz del cliente.',
        'Defines the default priority of new tickets.' => 'Define la prioridad por defecto para los tickets nuevos.',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Define la fila por defecto para los tickets nuevos de clientes, en la interfaz del cliente.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'Define el valor seleccionado por defecto en la lista desplegable para objetos dinámicos (Formulario: Especificación Común).',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'Define el valor seleccionado por defecto en la lista desplegable para permisos (Formulario: Especificación Común).',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'Define el valor seleccionado por defecto en la lista desplegable de formatos para las estadisticas (Formulario: Especificación Común).',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Define el tipo de remitente por defecto para los tickets telefónicos, en la ventana de ticket telefónico saliente de la interfaz del agente.',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'Define el tipo de remitente por defecto para tickets, en la ventana de vista detallada del ticket de la interfaz del agente.',
        'Defines the default shown ticket search attribute for ticket search screen (AllTickets/ArchivedTickets/NotArchivedTickets).' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            'Define el atributo mostrado por defecto para la búsqueda de tickets, en la ventana de búsqueda.',
        'Defines the default shown ticket search attribute for ticket search screen. Example: "Key" must have the name of the Dynamic Field in this case \'X\', "Content" must have the value of the Dynamic Field depending on the Dynamic Field type,  Text: \'a text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.' =>
            '',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            '',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            '',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'Define el orden por defecto para todas las filas mostradas en la vista de filas, luego de haberse ordenado por prioridad.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            '',
        'Defines the default spell checker dictionary.' => 'Define el diccionario por defecto para la verificación ortográfica.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Define el estado por defecto de los tickets nuevos de clientes, en la interfaz del cliente.',
        'Defines the default state of new tickets.' => 'Define el estado por defecto para los tickets nuevos.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Define el asunto por defecto de los tickets telefónicos, en la ventana de ticket telefónico saliente de la interfaz del agente.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            'Define el asunto por defecto de las notas, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            'Define el atributo de ticket por defecto para ordenar los tickets en la búsqueda, en la interfaz del cliente.',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            'Define el atributo de ticket por defecto para ordenar los tickets en la vista de escaladas, en la interfaz del agente.',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            'Define el atributo de ticket por defecto para ordenar los tickets en la vista de tickets bloqueados, en la interfaz del agente.',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            'Define el atributo de ticket por defecto para ordenar los tickets en la vista de responsables, en la interfaz del agente.',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            'Define el atributo de ticket por defecto para ordenar los tickets en la vista de estados, en la interfaz del agente.',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            'Define el atributo de ticket por defecto para ordenar los tickets en la vista de monitoreo, en la interfaz del agente.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            'Define el atributo de ticket por defecto para ordenar los tickets del resultado de una búsqueda, en la interfaz del agente.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            '',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            'Define la notificación por defecto para tickets rebotados, que se enviará al cliente/remitente, en la ventana de rebotar un ticket, en la interfaz del agente.',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Define el valor por defecto del siguiente estado de un ticket, luego de haber añadido una nota telefónica, en la ventana de ticket telefónico saliente de la interfaz del agente.',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Define el orden por defecto de los tickets (luego de haberse ordenado por prioridad), en la vista de escaladas de la interfaz del agente. Arriba: más antiguo al principio. Abajo: más reciente al principio.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Define el orden por defecto de los tickets (luego de haberse ordenado por prioridad), en la vista de estados de la interfaz del agente. Arriba: más antiguo al principio. Abajo: más reciente al principio.',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Define el orden por defecto de los tickets, en la vista de responsables de la interfaz del agente. Arriba: más antiguo al principio. Abajo: más reciente al principio.',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Define el orden por defecto de los tickets, en la vista de tickets bloqueados de la interfaz del agente. Arriba: más antiguo al principio. Abajo: más reciente al principio.',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Define el orden por defecto de los tickets, resultado de una búsqueda de tickets en la interfaz del agente. Arriba: más antiguo al principio. Abajo: más reciente al principio.',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Define el orden por defecto de los tickets, en la vista de tickets monitoreados de la interfaz del agente. Arriba: más antiguo al principio. Abajo: más reciente al principio.',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'Define el orden por defecto de los tickets, resultado de una búsqueda de tickets en la interfaz del cliente. Arriba: más antiguo al principio. Abajo: más reciente al principio.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'Define la prioridad por defecto de los tickets, en la ventana para cerrar un ticket, en la interfaz del agente.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            'Define la prioridad por defecto de los tickets, en la ventana de acción múltiple sobre tickets de la interfaz del agente.',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            'Define la prioridad por defecto de los tickets, en la ventana de campos libres de ticket, en la interfaz del agente.',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            'Define la prioridad por defecto de los tickets, en la ventana para agregar una nota al ticket, en la interfaz del agente.',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Define la prioridad por defecto de los tickets, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Define la prioridad por defecto de los tickets, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Define la prioridad por defecto de los tickets, en la ventana para modificar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            'Define la prioridad por defecto de los tickets, en la ventana para cambiar el agente responsable de un ticket, en la vista detallada de dicho ticket, en la interfaz del agente.',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            '',
        'Defines the default ticket type.' => 'Define el tipo de ticket predeterminado.',
        'Defines the default type for article in the customer interface.' =>
            'Define el tipo por defecto para los artículos, en la interfaz del cliente.',
        'Defines the default type of forwarded message in the ticket forward screen of the agent interface.' =>
            'Define el tipo por defecto de un mensaje reenviado, en la ventana de reenvío de tickets de la interfaz del agente.',
        'Defines the default type of the article for this operation.' => '',
        'Defines the default type of the message in the email outbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the close ticket screen of the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Defines the default type of the note in the ticket bulk screen of the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana de acción múltiple sobre tickets de la interfaz del agente.',
        'Defines the default type of the note in the ticket free text screen of the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Defines the default type of the note in the ticket note screen of the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Defines the default type of the note in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Defines the default type of the note in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Defines the default type of the note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone outbound screen of the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana de ticket telefónico saliente de la interfaz del agente.',
        'Defines the default type of the note in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Defines the default type of the note in the ticket responsible screen of the agent interface.' =>
            'Define el tipo de nota por defecto, en la ventana para cambiar el responsable de un ticket, en la interfaz del agente.',
        'Defines the default type of the note in the ticket zoom screen of the customer interface.' =>
            'Define el tipo de nota por defecto, en la ventana de vista detalla del ticket, en la interfaz del agente.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            'Define el módulo frontend usado por defecto si no se proporciona el parámetro Acción en la URL de la interfaz del agente.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            'Define el módulo frontend usado por defecto si no se proporciona el parámetro Acción en la URL de la interfaz del cliente.',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            'Define el valor por defecto para el parámetro Acción de la interfaz pública. Dicho parámetro se usa en los scripts del sistema.',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            'Define los valores visibles por defecto para el tipo de remitente de un ticket (por defecto: cliente).',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            '',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            '',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            'Define el filtro que procesa el texto en los artículos, para resaltar las URLs,',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            '',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Define el nombre del dominio totalmente calificado del sistema. Esta configuración es usada como la variable OTRS_CONFIG_FQDN, misma que se encuentra en todos los tipos de mensajes usados en la aplicación, para construir vínculos a los tickets del sistema.',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every user for these groups).' =>
            'Define los grupos en los que estarán todos los clientes (si CustomerGroupSupport está habilitado y se desea evitar el gestionar cada usuario para estos grupos).',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana de cerrar un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana de ticket de correo electrónico. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana de ticket telefónico. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            'Define el comentario histórico para la acción de la ventana de campos libres de ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana para agregar una nota al ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana para cambiar el propietario de un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana para definir un ticket como pendiente. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana de ticket telefónico saliente. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana para cambiar la prioridad de un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Define el comentario histórico para la acción de la ventana para cambiar el responsable de un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Define el comentario histórico para la acción de la ventana de vista detallada de un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana de cerrar un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana de ticket de correo electrónico. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana de ticket telefónico. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            'Define el tipo histórico para la acción de la ventana de campos libres de ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana para agregar una nota al ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana para cambiar el propietario de un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana para definir un ticket como pendiente. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana de ticket telefónico saliente. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana para cambiar la prioridad de un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Define el tipo histórico para la acción de la ventana para cambiar el responsable de un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Define el tipo histórico para la acción de la ventana de vista detallada de un ticket. Dicho comentario es usado para la historia del ticket, en la interfaz del agente.',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            '',
        'Defines the hours and week days to count the working time.' => 'Define las horas y los días laborales de la semana.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            'Define la llave que se verificará con el módulo Kernel::Modules::AgentInfo. Si esta llave de preferencias de usuario es verdadera, el mensaje es aceptado por el sistema.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            'Define la llave que se verificará con CustomerAccept. Si esta llave de preferencias de usuario es verdadera, el mensaje es aceptado por el sistema.',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Define el tipo de vínculo \'Normal\'. Si los nombres fuente y objetivo contienen el mismo valor, el vínculo resultante es no-direccional; de lo contrario, se obtiene un vínculo direccional.',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Define el tipo de vínculo \'PadreHijo\'. Si los nombres fuente y objetivo contienen el mismo valor, el vínculo resultante es no-direccional; de lo contrario, se obtiene un vínculo direccional.',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            'Define el tipo de vínculo \'Grupos\'. Los tipos de vínculo del mismo grupo se cancelan mutuamente. Por ejemplo: Si el ticket A está enlazado con el ticket B por un vínculo \'Normal\', no es posible que estos mismos tickets además estén enlazados por un vínculo de relación \'PadreHijo\'.',
        'Defines the list of online repositories. Another installations can be used as repository, for example: Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Some Name".' =>
            '',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            '',
        'Defines the list of types for templates.' => '',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'Define la ubicación para obtener una lista de repositorios en línea para paquetes adicionales. Se usará el primer resultado disponible.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            'Define el módulo log del sistema. "Archivo" escribe todos los mensajes en un archivo log, "SysLog" usa el demonio syslog del sistema, por ejemplo: syslogd.',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your OTRS instance to stop working (probably any mask which takes input from the user).' =>
            '',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Define el tiempo máximo (en segundos) válido para un id de sesión.',
        'Defines the maximum number of affected tickets per job.' => '',
        'Defines the maximum number of pages per PDF file.' => 'Define el número máximo de páginas por archivo PDF.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            '',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            '',
        'Defines the maximum size (in MB) of the log file.' => 'Define el tamaño máximo (en MG) del archivo log.',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            '',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            '',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Define el módulo que muestra, en la interfaz del agente, una lista de todos los agentes con sesión activa.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            '',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            '',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            '',
        'Defines the module to authenticate customers.' => 'Define el módulo para autenticar clientes.',
        'Defines the module to display a notification if cloud services are disabled.' =>
            '',
        'Defines the module to display a notification in different interfaces on different occasions for OTRS Business Solution™.' =>
            '',
        'Defines the module to display a notification in the agent interface if the OTRS Daemon is not running.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent session limit prior warning is reached.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            'Define el módulo para desplegar una notificación, en la interfaz del agente, si el sistema está siendo usado por el usuario adminstrador (normalmente no es recomendable trabajar como administrador).',
        'Defines the module to generate code for periodic page reloads.' =>
            '',
        'Defines the module to send emails. "Sendmail" directly uses the sendmail binary of your operating system. Any of the "SMTP" mechanisms use a specified (external) mailserver. "DoNotSendEmail" doesn\'t send emails and it is useful for test systems.' =>
            'Define el módulo para enviar correos electrónicos. "Sendmail" usa directamente el sendmail binario de su sistema operativo. Cualquiera de los mecanismos "SMTP" utiliza un servidor de correos (externo) específico. "DoNotSendEmail" no envía correos electrónicos, lo cual es útil en sistemas de prueba.',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            'Define el módulo usado para almacenar los datos de sesión. Con "DB" el servidor frontend puede separarse del servidor de la base de datos. "FS" es más rápido.',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'Define el nombre de la aplicación, mostrado en la interfaz web, lengüetas (tabs) y en la barra de título del explorador web.',
        'Defines the name of the column to store the data in the preferences table.' =>
            'Define el nombre de la columna para guardar los datos en la tabla de preferencias.',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'Define el nombre de la columna para guardar el identificador del usuario en la tabla de preferencias.',
        'Defines the name of the indicated calendar.' => 'Define el nombre del calendario indicado.',
        'Defines the name of the key for customer sessions.' => 'Define el nombre de la llave para las sesiones de los clientes.',
        'Defines the name of the session key. E.g. Session, SessionID or OTRS.' =>
            'Define el nombre de las llaves de sesión. Por ejemplo: Sesión, SesiónID u OTRS.',
        'Defines the name of the table where the user preferences are stored.' =>
            '',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            'Define la lista de posibles estados siguientes de ticket, luego de redactar / responder un ticket, en la ventana de redacción de la interfaz del agente.',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            'Define la lista de posibles estados siguientes de ticket, luego de reenviar un ticket, en la ventana de reenvío de tickets de la interfaz del agente.',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            '',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            'Define la lista de posibles estados siguientes para los tickets de los clientes, en la interfaz del cliente.',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de agregar una nota, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Defines the next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de agregar una nota, en la ventana de acción múltiple sobre tickets de la interfaz del agente.',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de agregar una nota, en la ventana de campos libres de ticket, en la interfaz del agente.',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de agregar una nota, en la ventana para añadir una nota al ticket, en la interfaz del agente.',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de agregar una nota, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de agregar una nota, en la ventana para establecer un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de agregar una nota, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de agregar una nota, en la ventana para cambiar el responsable de un ticket, en su vista detallada de la interfaz del agente.',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de haber sido rebotado, en la ventana para rebotar dicho ticket, en la interfaz del agente.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            'Define el siguiente estado de un ticket, luego de moverlo a otra fila, en la ventana para mover un ticket, en la interfaz del agente.',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            '',
        'Defines the number of days to keep the daemon log files.' => '',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            '',
        'Defines the parameters for the customer preferences table.' => 'Define los parámetros para la tabla de preferencias del cliente.',
        'Defines the parameters for the dashboard backend. "Cmd" is used to specify command with parameters. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Define los parámetros para el backend del panel principal. "Group" se usa para restringir el acceso al plugin (por ejemplo, Grupo: admin;grupo1;grupo2;). "Default" indica si el plugin está habilitado por defecto o si el usuario necesita habilitarlo manualmente. "CacheTTL" indica el periodo de expiración (en minutos) del caché para el plugin.',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            'Define los parámetros para el backend del panel principal. "Group" se usa para restringir el acceso al plugin (por ejemplo, Grupo: admin;grupo1;grupo2;). "Default" indica si el plugin está habilitado por defecto o si el usuario necesita habilitarlo manualmente. "CacheTTLLocal" indica el periodo de expiración (en minutos) del caché para el plugin.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Define los parámetros para el backend del panel principal. "Limit" define el número de entradas mostradas por defecto. "Group" se usa para restringir el acceso al plugin (por ejemplo, Grupo: admin;grupo1;grupo2;). "Default" indica si el plugin está habilitado por defecto o si el usuario necesita habilitarlo manualmente. "CacheTTL" indica el periodo de expiración (en minutos) del caché para el plugin.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            'Define los parámetros para el backend del panel principal. "Limit" define el número de entradas mostradas por defecto. "Group" se usa para restringir el acceso al plugin (por ejemplo, Grupo: admin;grupo1;grupo2;). "Default" indica si el plugin está habilitado por defecto o si el usuario necesita habilitarlo manualmente. "CacheTTLLocal" indica el periodo de expiración (en minutos) del caché para el plugin.',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Define la contraseña para acceder al manejo SOAP (bin/cgi-bin/rpc.pl).',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            'Define la ruta y el archivo TTF para manejar el tipo de letra negrita cursiva monoespaciado, en los documentos PDF.',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            'Define la ruta y el archivo TTF para manejar el tipo de letra negrita cursiva proporcional, en los documentos PDF.',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            'Define la ruta y el archivo TTF para manejar el tipo de letra negrita monoespaciado, en los documentos PDF.',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            'Define la ruta y el archivo TTF para manejar el tipo de letra negrita proporcional, en los documentos PDF.',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            'Define la ruta y el archivo TTF para manejar el tipo de letra cursiva monoespaciado, en los documentos PDF.',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            'Define la ruta y el archivo TTF para manejar el tipo de letra cursiva proporcional, en los documentos PDF.',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            'Define la ruta y el archivo TTF para manejar el tipo de letra con monoespaciado, en los documentos PDF.',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            'Define la ruta y el archivo TTF para manejar el tipo de letra proporcional, en los documentos PDF.',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            '',
        'Defines the path to PGP binary.' => 'Define la ruta al PGP binario.',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            'Define la ruta al ssl abierto binario.',
        'Defines the postmaster default queue.' => 'Define la fila por defecto del administrador de correos.',
        'Defines the priority in which the information is logged and presented.' =>
            '',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            '',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            '',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            'Define los permisos requeridos para mostrar un ticket en la vista de escaladas de la interfaz del agente.',
        'Defines the search limit for the stats.' => 'Define el límite de búsqueda para las estadísticas.',
        'Defines the sender for rejected emails.' => '',
        'Defines the separator between the agents real name and the given queue email address.' =>
            'Define el separador entre el nombre real de los agentes y la dirección de correo electrónico de la fila proporcionada.',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            'Define los permisos estándar, disponibles para los clientes en la aplicación. Si se requieren más permisos, pueden agregarse aquí, sin embargo, es necesario codificarlos para que funcionen. Por favor, cuando agregue algún permiso, asegúrese de que "rw" permanezca como la última entrada.',
        'Defines the standard size of PDF pages.' => 'Define el tamaño estándar de las páginas PDF.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'Define el estado de un ticket si se le da seguimiento y ya estaba cerrado.',
        'Defines the state of a ticket if it gets a follow-up.' => 'Define el estado de un ticket si se le da seguimiento.',
        'Defines the state type of the reminder for pending tickets.' => 'Define el tipo de estado para el recordatorio para los tickets pendientes.',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            'Define el asunto para las notificaciones electrónicas enviadas a los agentes, sobre una contraseña nueva.',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            'Define el asunto para las notificaciones electrónicas enviadas a los agentes, con token sobre una contraseña nueva solicitada.',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            'Define el asunto para las notificaciones electrónicas enviadas a los clientes, sobre una cuenta nueva.',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            'Define el asunto para las notificaciones electrónicas enviadas a los clientes, sobre una contraseña nueva.',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            'Define el asunto para las notificaciones electrónicas enviadas a los clientes, con token sobre una contraseña nueva solicitada.',
        'Defines the subject for rejected emails.' => 'Define el asunto para los correos electrónicos rechazados.',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            'Define la dirección de correo electrónico del administrador del sistema, misma que se desplegará en las ventanas de error de la aplicación.',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of OTRS).' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            'Define el atributo objetivo en el vínculo para una base de datos de cliente externa. Por ejemplo: \'target="cdb"\'.',
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
        'Defines the user identifier for the customer panel.' => 'Define el identificador de usuario para la interfaz del cliente.',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Define el nombre de usuario para acceder al manejo SOAP (bin/cgi-bin/rpc.pl).',
        'Defines the valid state types for a ticket.' => 'Define los tipos de estado válidos para un ticket.',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/otrs.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            '',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            '',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Define la anchura del editor de texto enriquecido. Proporcione un número (pixeles) o un porcentaje (relativo).',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            '',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            '',
        'Defines which items are available in first level of the ACL structure.' =>
            '',
        'Defines which items are available in second level of the ACL structure.' =>
            '',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            'Define los estados deberán ajustarse automáticamente (Contenido), después de que se cumpla el tiempo pendiente del estado (Llave).',
        'Defines wich article type should be expanded when entering the overview. If nothing defined, latest article will be expanded.' =>
            '',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            '',
        'Delete expired cache from core modules.' => '',
        'Delete expired loader cache weekly (Sunday mornings).' => '',
        'Delete expired sessions.' => 'Eliminar sesiones expiradas.',
        'Deleted link to ticket "%s".' => 'Eliminado enlace al ticket "%s".',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            'Elimina la sesión si el identificador de la misma está siendo usado con una dirección IP remota inválida.',
        'Deletes requested sessions if they have timed out.' => 'Elimina las sesiones solicitadas, si ya expiraron.',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            '',
        'Deploy and manage OTRS Business Solution™.' => '',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            'Determina si la lista de filas posibles a las que los tickets pueden ser movidos, deberá mostrarse en una lista desplegable o en una nueva ventana, en la interfaz del agente. Si se elije "Ventana nueva", es posible añadir una nota al mover el ticket.',
        'Determines if the statistics module may generate ticket lists.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            'Define la lista de posibles estados siguientes de ticket, luego de haber creado un ticket de correo electrónico nuevo en la interfaz del agente.',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            'Define la lista de posibles estados siguientes de ticket, luego de haber creado un ticket telefónico nuevo en la interfaz del agente.',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            '',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            'Determina la pantalla siguiente, luego de haber creado un ticket en la interfaz del cliente.',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            '',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            '',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            'Determina los estados posibles para tickets pendientes que cambiaron de estado al alcanzar el tiempo límite.',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            'Determina la forma en la que los objetos vinculados se despliegan en cada vista detallada.',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            'Determina las filas que serán válidas coom remitentes de los ticket, en la interfaz del cliente.',
        'Development' => 'Desarrollo',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow OTRS to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Disable restricted security for IFrames in IE. May be required for SSO to work in IE.' =>
            '',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be activated).' =>
            'Deshabilita el envío de notificaciones de recordatorio al agente responsable de un ticket (Ticket::Responsible tiene que estar activo).',
        'Disables the communication between this system and OTRS Group servers that provides cloud services. If active, some functionality will be lost such as system registration, support data sending, upgrading to and use of OTRS Business Solution™, OTRS Verify™, OTRS News and product News dashboard widgets, among others.' =>
            '',
        'Disables the web installer (http://yourhost.example.com/otrs/installer.pl), to prevent the system from being hijacked. If set to "No", the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If not active, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            '',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            '',
        'Display settings to override defaults for Process Tickets.' => '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            'Despliega la contabilidad de tiempo para un artículo, en la vista detallada del ticket.',
        'Dropdown' => '',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            '',
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
        'E-Mail Outbound' => 'Correo saliente',
        'Edit Customer Companies.' => '',
        'Edit Customer Users.' => '',
        'Edit customer company' => 'Editar compañía del cliente',
        'Email Addresses' => 'Direcciones de Correo',
        'Email Outbound' => '',
        'Email sent to "%s".' => 'Correo enviado a "%s".',
        'Email sent to customer.' => 'Correo enviado al cliente.',
        'Enable keep-alive connection header for SOAP responses.' => '',
        'Enabled filters.' => 'Filtros Habilitados.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the OTRS user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            '',
        'Enables S/MIME support.' => 'Habilita el soporte S/MIME.',
        'Enables customers to create their own accounts.' => 'Permite a los clientes crear sus propias cuentas.',
        'Enables fetch S/MIME from CustomerUser backend support.' => '',
        'Enables file upload in the package manager frontend.' => 'Permite cargar archivos en el frontend del administrador de paquetes.',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            '',
        'Enables or disables the debug mode over frontend interface.' => '',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            'Habilita o deshabilita la funcionalidad de monitoreo, para realizar un seguimiento de los tickets, sin ser el propietario o el responsable.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            'Habilita el log de desempeño (para registrar el tiempo de respuesta de las páginas). El desempeño del sistema se verá afectado. Frontend::Module###AdminPerformanceLog tiene que estar habilitado.',
        'Enables spell checker support.' => 'Habilita el soporte para la revisión ortográfica.',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            '',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            'Habilita la funcionalidad de acción múltiple sobre tickets para la interfaz del agente.',
        'Enables ticket bulk action feature only for the listed groups.' =>
            'Habilita la funcionalidad de acción múltiple sobre tickets únicamente para los grupos listados.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            'Habilita la funcionalidad de responsable del ticket, para realizar un seguimiento de los tickets.',
        'Enables ticket watcher feature only for the listed groups.' => 'Habilita la funcionalidad de monitoreo de tickets sólo para los grupos listados.',
        'English (Canada)' => 'Inglés (Canadá)',
        'English (United Kingdom)' => 'Inglés (Reino Unido)',
        'English (United States)' => 'Inglés (Estados Unidos)',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Enroll process for this ticket' => '',
        'Enter your shared secret to enable two factor authentication.' =>
            '',
        'Escalation response time finished' => 'Tiempo para escalada por respuesta, finalizado',
        'Escalation response time forewarned' => 'Tiempo para escalada por respuesta, advertido',
        'Escalation response time in effect' => 'Tiempo para escalada por respuesta, en vigor',
        'Escalation solution time finished' => 'Tiempo para escalada por solución, finalizado',
        'Escalation solution time forewarned' => 'Tiempo para escalada por solución, advertido',
        'Escalation solution time in effect' => 'Tiempo para escalada por solución, en vigor',
        'Escalation update time finished' => 'Tiempo para escalada por actualización, finalizado',
        'Escalation update time forewarned' => 'Tiempo para escalada por actualización, advertido',
        'Escalation update time in effect' => 'Tiempo para escalada por actualización, en vigor',
        'Escalation view' => 'Vista de escaladas',
        'EscalationTime' => '',
        'Estonian' => '',
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
        'Events Ticket Calendar' => '',
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
            'Exporta el árbol de artículo completo en el resultado de la búsqueda. Esto puede afectar el desempeño del sistema.',
        'Fetch emails via fetchmail (using SSL).' => 'Recuperar email via fetchmail (usando SSL).',
        'Fetch emails via fetchmail.' => 'Recuperar email via fetchmail.',
        'Fetch incoming emails from configured mail accounts.' => 'Recuperar correos entrantes de las cuentas de email configuradas.',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            'Obtiene paquetes vía proxy. Sobrescribe "WebUserAgent::Proxy".',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            '',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            '',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            '',
        'Filter incoming emails.' => 'Filtrar correos electrónicos entrantes.',
        'Finnish' => 'Finlandés',
        'First Queue' => 'Primera Fila de Espera',
        'FirstLock' => '',
        'FirstResponse' => '',
        'FirstResponseDiffInMin' => '',
        'FirstResponseInMin' => '',
        'Firstname Lastname' => 'Nombre Apellido',
        'Firstname Lastname (UserLogin)' => '',
        'FollowUp for [%s]. %s' => 'Seguimiento para [%s]. %s',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'Fuerza la codificación de correos electrónicos salientes (7bit|8bit|quoted-printable|base64).',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            'Fuerza a elegir un estado de ticket distinto al actual, luego de bloquear dicho ticket. Define como llave al estado actual y como contenido al estado posterior al bloqueo.',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Fuerza a desbloquear los tickets, luego de moverlos a otra fila.',
        'Forwarded to "%s".' => 'Reenviado a "%s".',
        'French' => 'Francés',
        'French (Canada)' => 'Francés (Canadá)',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Frontend' => '',
        'Frontend module registration (disable AgentTicketService link if Ticket Serivice feature is not used).' =>
            '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            'Registro de módulo frontend (deshabilita el vínculo de compañía si no se está usando la funcionalidad de compañía).',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            '',
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            '',
        'Frontend module registration for the agent interface.' => 'Registro de módulo frontend para la interfaz del agente.',
        'Frontend module registration for the customer interface.' => 'Registro de módulo frontend para la interfaz del cliente.',
        'Frontend theme' => 'Tema frontend',
        'Full value' => 'Valor completo',
        'Fulltext index regex filters to remove parts of the text.' => '',
        'Fulltext search' => 'Búsqueda de texto completo',
        'Galician' => 'Gallego',
        'General ticket data shown in the ticket overviews (fall-back). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note that TicketNumber can not be disabled, because it is necessary.' =>
            '',
        'Generate dashboard statistics.' => 'Generar estadísticas del panel.',
        'Generic Info module.' => '',
        'GenericAgent' => 'AgenteGenérico',
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
            '',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files.' =>
            'Proporciona a los usuarios finales la posibilidad de sobrescribir el caracter de separación de los archivos CSV, definido en los archivos de traducción.',
        'Global Search Module.' => '',
        'Go back' => 'Regresar',
        'Google Authenticator' => 'Autenticador de Google',
        'Graph: Bar Chart' => '',
        'Graph: Line Chart' => '',
        'Graph: Stacked Area Chart' => '',
        'Greek' => 'Griego',
        'HTML Reference' => '',
        'HTML Reference.' => '',
        'Hebrew' => 'Hebrep',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). Runtime will do full-text searches on live data (it works fine for up to 50.000 tickets). StaticDB will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild".' =>
            '',
        'Hindi' => 'Hindú',
        'Hungarian' => 'Húngaro',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'Si "DB" se eligió como Customer::AuthModule, puede especificarse un manejador de base de datos (normalmente se utiliza detección automática).',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'Si "DB" se eligió como Customer::AuthModule, puede especificarse una contraseña para conectarse a la tabla del cliente.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'Si "DB" se eligió como Customer::AuthModule, puede especificarse un nombre de usuario para conectarse a la tabla del cliente.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'Si "DB" se eligió como Customer::AuthModule, puede especificarse un DSN para la conexión con la tabla del cliente.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'Si "DB" se eligió como Customer::AuthModule, puede especificarse el nombre de la columna de la tabla del cliente para la contraseña.',
        'If "DB" was selected for Customer::AuthModule, the crypt type of passwords must be specified.' =>
            'Si "DB" se eligió como Customer::AuthModule, puede especificarse el tipo de encriptado de los passwords.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'Si "DB" se eligió como Customer::AuthModule, puede especificarse el nombre de la columna de la tabla del cliente para el identificador (llave).',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'Si "DB" se eligió como Customer::AuthModule, puede especificarse el nombre de la tabla en la que se guardarán los datos de los clientes.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'Si "DB" se eligió como SessionModule, puede especificarse el nombre de la tabla en la que se guardarán los datos de sesión.',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            'Si "FS" se eligió como SessionModule, puede especificarse un directorio en la que se guardarán los datos de sesión.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            'Si "HTTPBasicAuth" se eligió como Customer::AuthModule, puede especificarse (usando una expresión regular) la eliminación de partes del REMOTE_USER (por ejmplo: para quitar dominios finales). Nota de expresión regular: $1 será el nuevo inicio de sesión.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'Si "HTTPBasicAuth" se eligió como Customer::AuthModule, puede especificarse la eliminación de algunas partes de los nombres de usuario (por ejemplo: para los dominios que usan nombres de usuario como dominio_de_ejemplo\nombre_usuario).',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'Si "LDAP" se eligió como Customer::AuthModule y se desea añadir un sufijo a cada nombre de inicio de sesión de los clientes, especifíquelo aquí. Por ejemplo: se desea escribir únicamente el nombre de usuario, pero en el directorio LDAP está registrado como usuario@dominio.',
        'If "LDAP" was selected for Customer::AuthModule and special paramaters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'Si "LDAP" se eligió como Customer::AuthModule y se requieren parámetros especiales para el módulo perl Net::LDAP, pueden especificarse aquí. Refiérase a "perldoc Net::LDAP" para mayor información sobre los parámetros.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'Si "LDAP" se eligió como Customer::AuthModule y sus usuarios sólo tienen acceso anónimo al árbol LDAP, pero se desea buscar en los datos; esto puede lograrse con un usuario que tenga acceso al directorio LDAP. Especifique aquí la contraseña para dicho usuario.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'Si "LDAP" se eligió como Customer::AuthModule y sus usuarios sólo tienen acceso anónimo al árbol LDAP, pero se desea buscar en los datos; esto puede lograrse con un usuario que tenga acceso al directorio LDAP. Especifique aquí el nombre para dicho usuario.',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'Si "LDAP" se eligió como Customer::AuthModule, puede especificarse la BaseDN.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'Si "LDAP" se eligió como Customer::AuthModule, puede especificarse el host LDAP.',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'Si "LDAP" se eligió como Customer::AuthModule, puede especificarse el identificador de usuario.',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'Si "LDAP" se eligió como Customer::AuthModule, pueden especificarse atributos de usuario. Para GruposPosix LDAP, use UID y para los demás, utilice el usuario DN completo.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'Si "LDAP" se eligió como Customer::AuthModule, pueden especificarse aquí atributos de acceso.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Si "LDAP" se eligió como Customer::AuthModule, puede especificarse si las aplicaciones se detendrán si, por ejemplo, no se puede establecer una conexión con el servidor por problemas en la red.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use OTRS. Specify the group, who may access the system.' =>
            'Si "LDAP" se eligió como Customer::AuthModule, puede verificarse si al usuario se le permite autenticarse por estar en un GrupoPosix, por ejemplo: el usuario tiene que estar en el grupo xyz para usar OTRS. Especifique el grupo que puede acceder al sistema.',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'Si "LDAP" se eligió como Customer::AuthModule, es posible añadir un filtro a cada consulta LDAP, por ejemplo: (mail=*), (objectclass=user) o (!objectclass=computer).',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'Si "Radius" se eligió como Customer::AuthModule, puede especificarse una contraseña para autenticar al host radius.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'Si "Radius" se eligió como Customer::AuthModule, puede especificarse el host radius.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Si "Radius" se eligió como Customer::AuthModule, puede especificarse si las aplicaciones se detendrán si, por ejemplo, no se puede establecer una conexión con el servidor por problemas en la red.',
        'If "Sendmail" was selected as SendmailModule, the location of the sendmail binary and the needed options must be specified.' =>
            'Si "Sendamail" se eligió como SendmailModule, puede especificarse la ubicación del sendmail binario y las opciones necesarias.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            'Si "SysLog" se eligió como LogModule, puede especificarse un log especial.',
        'If "SysLog" was selected for LogModule, a special log sock can be specified (on solaris you may need to use \'stream\').' =>
            'Si "SysLog" se eligió como LogModule, puede especificarse un log sock especial (en solaris es posible que deba usar \'stream\').',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            'Si "SysLog" se eligió como LogModule, puede especificarse el juego de caracteres que debe usarse para el inicio de sesión.',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            'Si "File" se eligió como LogModule, puede especificarse el archivo log. Si dicho archivo no existe, será creado por el sistema.',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            '',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'Si cualquiera de los mecanismos "SMTP" se eligió como SendmailModule y se requiere autenticación para el servidor de correos, debe especificarse una contraseña.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'Si cualquiera de los mecanismos "SMTP" se eligió como SendmailModule y se requiere autenticación para el servidor de correos, debe especificarse un nombre de usuario.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'Si cualquiera de los mecanismos "SMTP" se eligió como SendmailModule, debe especificarse el host que envía los correos.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'Si cualquiera de los mecanismos "SMTP" se eligió como SendmailModule, debe especificarse el puerto en el que el servidor de correos estará escuchando para conexiones entrantes.',
        'If enabled debugging information for ACLs is logged.' => '',
        'If enabled debugging information for transitions is logged.' => '',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            '',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            '',
        'If enabled, OTRS will deliver all CSS files in minified form. WARNING: If you turn this off, there will likely be problems in IE 7, because it cannot load more than 32 CSS files.' =>
            'Si se habilita, OTRS entregará todos los archivos CSS en forma reducida (minified). ADVERTENCIA: Si ud. desactiva esta opción, es muy probable que se generen problemas en IE 7, porque no puede cargar más de 32 archivos CSS.',
        'If enabled, OTRS will deliver all JavaScript files in minified form.' =>
            'Si se habilita, OTRS entregará todos los archivos JavaScript en forma reducida (minified).',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'Si se habilita, los módulos de tickets telefónico y de correo electrónico, se abrirán en una ventana nueva.',
        'If enabled, the OTRS version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            '',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            '',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            'Si se habilita, el primer nivel del menú principal se abre al posicionar el cursor sobre él (en lugar de hacer click).',
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
            'Si esta expresión regular coincide, ningún mensaje se mandará por el contestador automático.',
        'If this setting is active, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            '',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            '',
        'Include tickets of subqueues per default when selecting a queue.' =>
            '',
        'Include unknown customers in ticket filter.' => '',
        'Includes article create times in the ticket search of the agent interface.' =>
            'Incluye los tiempos de creación de los artículos en la búsqueda de tickets de la interfaz del agente.',
        'Incoming Phone Call.' => '',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/otrs.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            '',
        'Indonesian' => '',
        'Input' => '',
        'Install ispell or aspell on the system, if you want to use a spell checker. Please specify the path to the aspell or ispell binary on your operating system.' =>
            'Instala ispell o aspell en el sistema, si se desea usar el corrector ortográfico. Por favor, especifique la ruta al aspell o ispell binario en su sistema operativo.',
        'Interface language' => 'Idioma de la interfaz',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Es posible configurar diferentes pieles, por ejemplo: para diferenciar entre distintos agentes, para usarse una base por-dominio en la aplicación. Al definir una expresión regular, puede configurarse un par Llave/Contenido para coincidir con el dominio. El valor en "Key" debe coincidir con el dominio, y "Content" tiene que ser una piel válida en el sistema. Por favor, verifique las entradas de ejemplo para la forma de expresión regular correcta.',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Es posible configurar diferentes pieles, por ejemplo: para diferenciar entre distintos clientes, para usarse una base por-dominio en la aplicación. Al definir una expresión regular, puede configurarse un par Llave/Contenido para coincidir con el dominio. El valor en "Key" debe coincidir con el dominio, y "Content" tiene que ser una piel válida en el sistema. Por favor, verifique las entradas de ejemplo para la forma de expresión regular correcta.',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            'Es posible configurar diferentes pieles, por ejemplo: para diferenciar entre agentes y clientes, para usarse una base por-dominio en la aplicación. Al definir una expresión regular, puede configurarse un par Llave/Contenido para coincidir con el dominio. El valor en "Key" debe coincidir con el dominio, y "Content" tiene que ser una piel válida en el sistema. Por favor, verifique las entradas de ejemplo para la forma de expresión regular correcta.',
        'Italian' => 'Italiano',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Ivory' => '',
        'Ivory (Slim)' => '',
        'Japanese' => 'Japonés',
        'JavaScript function for the search frontend.' => '',
        'Last customer subject' => '',
        'Lastname Firstname' => '',
        'Lastname Firstname (UserLogin)' => '',
        'Lastname, Firstname' => 'Apellido, Nombre',
        'Lastname, Firstname (UserLogin)' => '',
        'Latvian' => '',
        'Left' => '',
        'Link Object' => 'Enlazar Objeto',
        'Link Object.' => '',
        'Link agents to groups.' => 'Vincular agentes con grupos.',
        'Link agents to roles.' => 'Vincular agentes con roles.',
        'Link attachments to templates.' => 'Vincular archivo adjuntos con plantillas.',
        'Link customer user to groups.' => 'Vincular usuario de clientes  con grupos.',
        'Link customer user to services.' => 'Vincular usuarios de clientes con servicios,',
        'Link queues to auto responses.' => 'Vincular filas de espera con auto-respuestas.',
        'Link roles to groups.' => 'Vincular roles con grupos.',
        'Link templates to queues.' => 'Vincular plantillas con filas de espera.',
        'Links 2 tickets with a "Normal" type link.' => 'Vincular 2 tickets con un vículo de tipo "Normal".',
        'Links 2 tickets with a "ParentChild" type link.' => 'Vincular 2 tickets con un vículo de tipo "PadreHijo".',
        'List of CSS files to always be loaded for the agent interface.' =>
            'Lista de archivos CSS que siempre se cargarán para la interfaz del agente.',
        'List of CSS files to always be loaded for the customer interface.' =>
            'Lista de archivos CSS que siempre se cargarán para la interfaz del cliente.',
        'List of JS files to always be loaded for the agent interface.' =>
            'Lista de archivos JS que siempre se cargarán para la interfaz del agente.',
        'List of JS files to always be loaded for the customer interface.' =>
            'Lista de archivos JS que siempre se cargarán para la interfaz del cliente.',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            '',
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
        'List view' => 'Vista de Lista',
        'Lithuanian' => 'Lituano',
        'Lock / unlock this ticket' => '',
        'Locked Tickets.' => '',
        'Locked ticket.' => 'Ticket bloqueado.',
        'Log file for the ticket counter.' => 'Archivo log para el contador de tickets.',
        'Logout of customer panel.' => '',
        'Loop-Protection! No auto-response sent to "%s".' => 'Protección de bucle! NO se envió auto-respuesta a "%s".',
        'Mail Accounts' => 'Cuentas de Correo',
        'Main menu registration.' => '',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'Hace que la aplicación verifique el registro MX de las direcciones de correo electrónico, antes de enviar un correo o crear un ticket, ya sea telefónico o de correo electrónico.',
        'Makes the application check the syntax of email addresses.' => 'Hace que la aplicación verifique la sintaxis de las direcciones de correo electrónico.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'Hace que la gestión de sesiones utilice cookies html. Si las cookies html están deshabilitadas o si el explorador del cliente las tiene deshabilitadas, el sistema trabajará normalmente y agregará el identificador de sesión a los vínculos.',
        'Malay' => '',
        'Manage OTRS Group cloud services.' => '',
        'Manage PGP keys for email encryption.' => 'Gestionar las llaves PGP para encriptación de correos electrónicos.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'Gestionar las cuentas POP3 o IMAP de las que se extraen correos.',
        'Manage S/MIME certificates for email encryption.' => 'Gestionar certificados S/MIME para encriptación de correos electrónicos.',
        'Manage existing sessions.' => 'Gestionar sesiones existentes.',
        'Manage support data.' => 'Gestionar datos de soporte.',
        'Manage system registration.' => 'Gestionar registro del sistema.',
        'Manage tasks triggered by event or time based execution.' => '',
        'Mark this ticket as junk!' => 'Marcar este ticket como basura!',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'Tamaño máximo (en caracteres) para la tabla de información del cliente (teléfono y correo electrónico) en la ventana de redacción.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            '',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            '',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'Número máximo de respuestas automáticas (vía correos electrónicos) al día para la dirección de correo electrónico propia (protección de bucle).',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'Tamaño máximo en KBytes para correos que pueden obtenerse vía POP3/POP3S/IMAP/IMAPS.',
        'Maximum Number of a calendar shown in a dropdown.' => '',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            '',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'Número máximo de tickets para ser mostrados en el resultado de una búsqueda, en la interfaz del agente.',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'Número máximo de tickets para ser mostrados en el resultado de una búsqueda, en la interfaz del cliente.',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            '',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'Número máximo (en caracteres) de la tabla de información del cliente en la vista detallada del ticket.',
        'Merge this ticket and all articles into a another ticket' => '',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => '',
        'Miscellaneous' => '',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'Módulo para la selección del destinatario en la ventana de ticket nuevo, en la interfaz del cliente.',
        'Module to check if arrived emails should be marked as email-internal (because of original forwarded internal email). ArticleType and SenderType define the values for the arrived email/article.' =>
            '',
        'Module to check the group permissions for customer access to tickets.' =>
            '',
        'Module to check the group permissions for the access to tickets.' =>
            '',
        'Module to compose signed messages (PGP or S/MIME).' => 'Módulo para redactar mensajes firmados (PGP o S/MIME).',
        'Module to crypt composed messages (PGP or S/MIME).' => 'Módulo para encriptar mensajes firmados (PGP o S/MIME).',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            '',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'Módulo para filtrar y manipular mensajes entrantes. Bloquea/ignora todos los correos no deseados con direcciones De: noreply@.',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            'Módulo para filtrar y manipular mensajes entrantes. Obtenga un número de 4 dígitos para el texto libre de ticket, use una expresión regular en Match, por ejemplo: From => \'(.+?)@.+?\', y utilice () como [***] en Set =>.',
        'Module to filter encrypted bodies of incoming messages.' => '',
        'Module to generate accounted time ticket statistics.' => 'Módulo para generar estadísticas de la contabilidad de tiempo de los tickets.',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            'Módulo para generar perfil OpenSearch html para búsqueda simple de tickets en la interfaz del agente.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            'Módulo para generar perfil OpenSearch html para búsqueda simple de tickets en la interfaz del cliente.',
        'Module to generate ticket solution and response time statistics.' =>
            'Módulo para generar estadísticas del tiempo de solución y respuesta de los tickets.',
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
        'Module to grant access to the owner of a ticket.' => '',
        'Module to grant access to the watcher agents of a ticket.' => '',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            'Módulo para mostrar notificaciones y escaladas (ShownMax: Número máximo de escaladas que se muestran, EscalationInMinutes: Muestra el ticket que escalará en estos minutos, CacheTime: Caché de las escaladas calculadas, en segundos).',
        'Module to use database filter storage.' => 'Módulo para utilizar el almacenamiento de base de datos del filtro.',
        'Multiselect' => 'Selección múltiple',
        'My Services' => 'Mis Servicios',
        'My Tickets.' => '',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            'Nombre de fila personalizada, misma que es una selección de sus filas de preferencia y puede elegirse en las configuraciones de sus preferencias.',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            '',
        'NameX' => '',
        'Nederlands' => '',
        'New Ticket [%s] created (Q=%s;P=%s;S=%s).' => 'Nuevo Ticket [%s] creado (Q=%s;P=%s;S=%s).',
        'New Window' => 'Nueva Ventana',
        'New owner is "%s" (ID=%s).' => 'El nuevo propietario es "%s" (ID=%s).',
        'New process ticket' => 'Nuevo ticket de Proceso',
        'New responsible is "%s" (ID=%s).' => 'El responsable nuevo es "%s" (ID=%s).',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Lista de posibles estados siguientes de ticket, luego de haber añadido una nota telefónica a un ticket, en la ventana de ticket telefónico slaiente de la interfaz del agente.',
        'None' => 'Ninguno',
        'Norwegian' => 'Noruego',
        'Notification sent to "%s".' => 'Notificación; enviada a "%s".',
        'Number of displayed tickets' => 'Número de tíckets desplegados',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'Número de líneas (por ticket) que se muestran por la utilidad de búsqueda de la interfaz del agente.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'Número de tickets desplegados en cada página del resultado de una búsqueda, en la interfaz del agente.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'Número de tickets desplegados en cada página del resultado de una búsqueda, en la interfaz del cliente.',
        'OTRS can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            '',
        'Old: "%s" New: "%s"' => 'Antiguo: "%s". Nuevo: "%s"',
        'Online' => 'En Línea',
        'Open tickets (customer user)' => 'Tickets Abiertos (usuario del cliente)',
        'Open tickets (customer)' => 'Tickets Abiertos (Cliente)',
        'Option' => '',
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
            'Sobrecarga (redefine) funciones existentes en Kernel::System::Ticket. Útil para añadir personalizaciones fácilmente.',
        'Overview Escalated Tickets.' => '',
        'Overview Refresh Time' => 'Tiempo de actualización de la vista general',
        'Overview of all escalated tickets.' => '',
        'Overview of all open Tickets.' => ' Resumen de todos los Tickets abiertos',
        'Overview of all open tickets.' => '',
        'Overview of customer tickets.' => '',
        'PGP Key Management' => 'Administración de Llave PGP',
        'PGP Key Upload' => 'Carga de Llave PGP',
        'Package event module file a scheduler task for update registration.' =>
            '',
        'Parameters for the CreateNextMask object in the preference view of the agent interface.' =>
            'Parámetros para el objeto CrearMáscaraNueva, en la vista de preferencias de la interfaz del agente.',
        'Parameters for the CustomQueue object in the preference view of the agent interface.' =>
            'Parámetros para el objeto QueuePersonalizada, en la vista de preferencias de la interfaz del agente.',
        'Parameters for the CustomService object in the preference view of the agent interface.' =>
            '',
        'Parameters for the RefreshTime object in the preference view of the agent interface.' =>
            'Parámetros para el objeto TiempoActualización, en la vista de preferencias de la interfaz del agente.',
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
            'Define los parámetros para el backend del widget de vista general por filas en el panel principal. "Group" se usa para restringir el acceso al plugin (por ejemplo, Grupo: admin;grupo1;grupo2;). "QueuePermissionGroup" no es obligatorio, las filas son listadas unicamente si estas pertenecen a este grupo de permisos si lo activa. "States" es una lista de estados, la llave indica el orden de clasificación del estado en el widget. "Default" indica si el plugin está habilitado por defecto o si el usuario necesita habilitarlo manualmente. "CacheTTL" indica el periodo de expiración (en minutos) del caché para el plugin.',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Parámetros para el backend del panel de control de la vista general de escaladas de ticket, de la interfaz del agente. "Límite" es el número de entradas mostradas por defecto. "Grupo" es usado para restringir el acceso al plugin (por ej., Grupo: admin;grupo1;grupo2;). "Por defecto" determina si el plugin está habilitado por defecto o si el usuario necesita habilitarlo manualmente. "CacheTTLLocal" es el tiempo de cache en minutos para el plugin. Nota: Sólo los atributos del Ticket y los Campos Dinámicos (DynamicField_NombreX) están permitidos para DefaultColumns. Configuraciones posibles: 0 = Deshabilitado, 1 = Disponible, 2 = Habilitado por defecto.',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parámetros para el backend del panel principal de las estadísticas de ticket de la interfaz del agente. "Limit" es el número de entradas mostradas por defecto. "Group" se usa para restringir el acceso al plugin (por ejemplo, Group: admin;group1;group2;). "Default" determina si el plugin está habilitado por defecto o si el usuario tiene que habilitarlo manualmente. "CacheTTLLocal" es el tiempo en minutos para la caché del plugin.',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview.' =>
            'Parámetros para las páginas (en las que se muestran los tickets) de la vista de resumen mediana.',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview.' =>
            'Parámetros para las páginas (en las que se muestran los tickets) de la vista de resumen peqyeña.',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview.' =>
            'Parámetros para las páginas (en las que se muestran los tickets) de la vista de resumen previa.',
        'Parameters of the example SLA attribute Comment2.' => 'Parámetros del ejemplo del atributo de SLA, Comment2.',
        'Parameters of the example queue attribute Comment2.' => 'Parámetros del ejemplo del atributo de fila, Comment2.',
        'Parameters of the example service attribute Comment2.' => 'Parámetros del ejemplo del atributo de servicio, Comment2.',
        'ParentChild' => '',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            'Ruta para el archivo log (aplica únicamente si "FS" se eligió como LoopProtectionModule y si es obligatorio).',
        'People' => 'Personas',
        'Performs the configured action for each event (as an Invoker) for each configured Webservice.' =>
            '',
        'Permitted width for compose email windows.' => 'Anchura permitida para las ventanas de redacción de correos electrónicos.',
        'Permitted width for compose note windows.' => 'Anchura permitida para las ventanas de redacción de notas.',
        'Persian' => 'Persa',
        'Phone Call.' => '',
        'Picture Upload' => '',
        'Picture upload module.' => '',
        'Picture-Upload' => 'Cargar Imagen',
        'Polish' => 'Polaco',
        'Portuguese' => 'Portugués',
        'Portuguese (Brasil)' => 'Portugués (Brasil) ',
        'PostMaster Filters' => 'Filtros del Administrador de Correos',
        'PostMaster Mail Accounts' => 'Cuentas del Administrador de Correos',
        'Process Management Activity Dialog GUI' => '',
        'Process Management Activity GUI' => '',
        'Process Management Path GUI' => '',
        'Process Management Transition Action GUI' => '',
        'Process Management Transition GUI' => '',
        'Process Ticket.' => '',
        'Process pending tickets.' => 'Tickets pendientes de procesar',
        'Process ticket' => '',
        'ProcessID' => 'ProcessID',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            'Protección contra CSRF (Solicitud de Falsificación de Sitios Cruzada). Consulte http://en.wikipedia.org/wiki/Cross-site_request_forgery para mayor información.',
        'Provides a matrix overview of the tickets per state per queue.' =>
            'Provee una vista general del total de tickets por estado y por fila.',
        'Queue view' => 'Vista de Filas',
        'Rebuild the ticket index for AgentTicketQueue.' => '',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number.' =>
            '',
        'Refresh interval' => 'Intervalo de actualización',
        'Removed subscription for user "%s".' => 'Eliminada subscripción para el usuario "%s".',
        'Removes the ticket watcher information when a ticket is archived.' =>
            '',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be active in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            '',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            'Reemplaza el destinatario original con la dirección de correo electrónico del cliente actual, al redactar una respuesta en la ventana de redacción de tickets de la interfaz del agente.',
        'Reports' => 'Reportes',
        'Reports (OTRS Business Solution™)' => 'Reportes (OTRS Business Solution™)',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            '',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'Permisos necesarios para cambiar el cliente de un ticket, en la interfaz del agente.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'Permisos necesarios usar la ventana para cerrar tickets, en la interfaz del agente.',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            'Permisos necesarios usar la ventana para rebotar tickets, en la interfaz del agente.',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'Permisos necesarios usar la ventana para redactar tickets, en la interfaz del agente.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            'Permisos necesarios usar la ventana para reenviar tickets, en la interfaz del agente.',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            'Permisos necesarios usar la ventana de campos libres de texto de ticket, en la interfaz del agente.',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            'Permisos necesarios usar la ventana para mezclar tickets, en la interfaz del agente.',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            'Permisos necesarios usar la ventana para añadir notas a los tickets, en la interfaz del agente.',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Permisos necesarios usar la ventana para cambiar el propietario de un ticket, en la interfaz del agente.',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Permisos necesarios usar la ventana para definir un ticket como pendiente, en la vista detallada de dicho ticket de la interfaz del agente.',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            'Permisos necesarios usar la ventana de ticket telefónico saliente, en la interfaz del agente.',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Permisos necesarios usar la ventana para cambiar la prioridad de un ticket, en la interfaz del agente.',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            'Permisos necesarios usar la ventana para cambiar el responsable de un ticket, en la interfaz del agente.',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'Reinicializa y desbloquea al propietario de un ticket, si este último se mueve a otra fila.',
        'Responsible Tickets' => '',
        'Responsible Tickets.' => '',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            '',
        'Retains all services in listings even if they are children of invalid elements.' =>
            '',
        'Right' => '',
        'Roles <-> Groups' => 'Roles <-> Grupos',
        'Run file based generic agent jobs (Note: module name need needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            '',
        'Running Process Tickets' => 'Procesos de Tickets en Ejecución',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            '',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            '',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            'Ejecuta el sistema en modo "Demo". Si se selecciona "Sí", los agentes pueden modificar preferencias, como elegir el idioma y el tema, a través de la interfaz del agente. Estos cambios sólo serán válidos en la sesión actual. No se les permitirá a los agentes que cambien su contraseña.',
        'Russian' => 'Ruso',
        'S/MIME Certificate Upload' => 'Cargar Certificado S/MIME',
        'SMS' => 'SMS',
        'SMS (Short Message Service)' => '',
        'Sample command output' => 'Resultado de ejemplo del comando',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            '',
        'Schedule a maintenance period.' => '',
        'Screen' => 'Pantalla',
        'Search Customer' => 'Búsqueda de cliente',
        'Search Ticket.' => '',
        'Search Tickets.' => '',
        'Search User' => 'Buscar Usuario',
        'Search backend default router.' => 'Buscar el router por defecto del backend.',
        'Search backend router.' => 'Buscar el router del backend.',
        'Search.' => '',
        'Second Queue' => 'Segunda Fila de Espera',
        'Select after which period ticket overviews should refresh automatically.' =>
            '',
        'Select how many tickets should be shown in overviews by default.' =>
            '',
        'Select the main interface language.' => '',
        'Select your frontend Theme.' => 'Seleccione su tema.',
        'Select your preferred layout for OTRS.' => '',
        'Selects the cache backend to use.' => '',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            'Selecciona el módulo para manejar las cargas de archivos en la interfaz web. "DB" almacena todos en la base de datos, mientras que "FS" usa el sistema de archivos.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            'Selecciona el módulo generador de números de ticket. "AutoIncrement" incrementa el número de ticket, se usan el ID del sistema y el contador, en la forma IDSistema.contador (por ejemplo: 1010138, 1010139). Con "Date", el número de ticket se genera con la fecha actual, el ID de sistema y el contador, con el formato: Año.Mes.Día.IDSistema.Contador.SumaDeComprobación (por ejemplo: 2002070110101520, 2002070110101535). "Random" genera números de tickets aleatorios, con el formato IDSistema.Aleatorio (por ejemplo: 100057866352, 103745394596).',
        'Send new outgoing mail from this ticket' => '',
        'Send notifications to users.' => 'Enviar notificaciones a usuarios.',
        'Sender type for new tickets from the customer inteface.' => 'Tipo de destinatario para tickets nuevos, creados  en la interfaz del cliente.',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'Enviar notificaciones de seguimiento únicamente al agente propietario, si el ticket se desbloquea (por defecto se envían notificaciones a todos los agentes).',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Envía todos los correos electrónicos salientes vía bcc a la dirección especificada. Por favor, utilice esta opción únicamente por motivos de copia de seguridad).',
        'Sends customer notifications just to the mapped customer.' => '',
        'Sends registration information to OTRS group.' => 'Enviar información de registro a Grupo OTRS.',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'Envía notificaciones de recordatorio de tickets desbloqueados a sus propietarios, luego que alcanzaron la fecha de recordatorio.',
        'Sends the notifications which are configured in the admin interface under "Notfication (Event)".' =>
            'Envía las notificaciones que se configuran en la interfaz de administración, bajo "Notificación (Evento)".',
        'Serbian Cyrillic' => 'Servio Cirílico',
        'Serbian Latin' => 'Servio Latino',
        'Service view' => 'Vista del Servicio',
        'ServiceView' => '',
        'Set a new password by filling in your current password and a new one.' =>
            '',
        'Set minimum loglevel. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages.' =>
            '',
        'Set sender email addresses for this system.' => 'Define la dirección de correo electrónico remitente del sistema.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Define la altura por defecto (en pixeles) de artículos HTML en línea en la vista detallada del ticket de la interfaz del agente.',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            '',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Define la altura máxima (en pixeles) de artículos HTML en línea en la vista detallada del ticket de la interfaz del agente.',
        'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Sets if SLA must be selected by the agent.' => '',
        'Sets if SLA must be selected by the customer.' => '',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Sets if service must be selected by the agent.' => '',
        'Sets if service must be selected by the customer.' => '',
        'Sets if ticket owner must be selected by the agent.' => 'Define si el propietario del ticket tiene que ser seleccionado por el agente.',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            'Fija el tiempo pendiente de un ticket a 0, si el estado se cambia a uno no pendiente.',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            'Fija la edad en minutos (primer nivel) para resaltar filas que contienen tickets sin tocar.',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            'Fija la edad en minutos (segundo nivel) para resaltar filas que contienen tickets sin tocar.',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            'Fija el nivel de configuración del administrador. Dependiendo del nivel de configuración, algunas configuraciones del sistema no se mostrarán. Los niveles están en orden ascendente: Experto, Avanzado, Principiante. Entre más alto sea el nivel de configuración (por ejemplo: Beginner es el más alto), es menos probable que el usuario pueda configurar accidentalemente el sistema de una forma que quede inutilizable.',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            '',
        'Sets the default article type for new email tickets in the agent interface.' =>
            'Fija el tipo de artículo por defecto para los tickets de correo electrónico nuevos, en la interfaz del agente.',
        'Sets the default article type for new phone tickets in the agent interface.' =>
            'Fija el tipo de artículo por defecto para los tickets telefónicos nuevos, en la interfaz del agente.',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            'Define el contenido por defecto del cuerpo de las notas que se añaden en la ventana para cerrar tickets, en la interfaz del agente.',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            'Define el contenido por defecto del cuerpo de las notas que se añaden en la ventana para mover tickets, en la interfaz del agente.',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            'Define el contenido por defecto del cuerpo de las notas que se añaden en la ventana para agregar notas a los tickets, en la interfaz del agente.',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Define el contenido por defecto del cuerpo de las notas que se añaden en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Establece el contenido por defecto del cuerpo de las notas que se añaden en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Define el contenido por defecto del cuerpo de las notas que se añaden en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            'Define el contenido por defecto del cuerpo de las notas que se añaden en la ventana para cambiar el responsable de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            '',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            'Define el tipo de vínculo por defecto de tickets divididos, en la interfaz del agente.',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            '',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            '',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            'Define el estado siguiente por defecto para tickets telefónicos nuevos, en la interfaz del agente.',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            'Define el estado siguiente por defecto para tickets de correo electrónico nuevos, en la interfaz del agente.',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            'Define el contenido por defecto del cuerpo de las notas para tickets telefónicos nuevos, en la interfaz del agente. Por ejemplo: \'Ticket nuevo vía llamada\'.',
        'Sets the default priority for new email tickets in the agent interface.' =>
            'Define la prioridad por defecto para tickets de correo electrónico nuevos, en la interfaz del agente.',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            'Define la prioridad por defecto para tickets telefónicos nuevos, en la interfaz del agente.',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            'Define el tipo de remitente por defecto para tickets de correo electrónico nuevos, en la interfaz del agente.',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            'Define el tipo de remitente por defecto para tickets telefónicos nuevos, en la interfaz del agente.',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            'Define el asunto por defecto para tickets de correo electrónico nuevos, en la interfaz del agente. Por ejemplo: \'Correo electrónico saliente\'.',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            'Define el asunto por defecto para tickets telefónicos nuevos, en la interfaz del agente. Por ejemplo: \'Llamada telefónica\'.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            'Define el asunto por defecto del cuerpo de las notas que se añaden en la ventana para cerrar tickets, en la interfaz del agente.',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            'Define el asunto por defecto del cuerpo de las notas que se añaden en la ventana para mover tickets, en la interfaz del agente.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            'Define el asunto por defecto del cuerpo de las notas que se añaden en la ventana para agregar notas a los tickets, en la interfaz del agente.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Define el asunto por defecto del cuerpo de las notas que se añaden en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Establece el asunto por defecto del cuerpo de las notas que se añaden en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Define el asunto por defecto del cuerpo de las notas que se añaden en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            'Define el asunto por defecto del cuerpo de las notas que se añaden en la ventana para cambiar el responsable de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the default text for new email tickets in the agent interface.' =>
            'Define el contenido por defecto del cuerpo de los tickets de correo electrónico nuevos, en la interfaz del agente.',
        'Sets the display order of the different items in the preferences view.' =>
            'Define el orden por defecto en el que se mostrarán los diferentes elementos, en la vista de preferencias.',
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
            'Define el número de líneas mostradas en los mensajes de texto (por ejemplo: renglones de ticket en la vista detallada de las filas).',
        'Sets the options for PGP binary.' => 'Define las opciones para PGP binario.',
        'Sets the order of the different items in the customer preferences view.' =>
            'Define el orden de los diferentes elementos, en la vista de preferencias de la interfaz del cliente.',
        'Sets the password for private PGP key.' => 'Define la contraseña para la llave PGP privada.',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'Define las unidades de tiempo preferidas (por ejemplo: unidades laborales, horas, minutos).',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            'Define el prefijo para la carpeta que contiene los scripts en el servidor, tal y como se configuró en el servidor web. Esta configuración se usa como una variable (OTRS_CONFIG_ScriptAlias) y está presente en todas las formas de mensajes que maneja la aplicación, con la finalidad de crear vínculos a los tickets dentro del sistema.',
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
            'Define el agente responsable de un ticket, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            'Define el agente responsable de un ticket, en la ventana de acción múltiple sobre tickets de la interfaz del agente.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            'Define el agente responsable de un ticket, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            'Define el agente responsable de un ticket, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Define el agente responsable de un ticket, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Define el agente responsable de un ticket, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Define el agente responsable de un ticket, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            'Define el agente responsable de un ticket, en la ventana para cambiar el responsable de un ticket, en la interfaz del agente.',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Define el servicio, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Define el servicio, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Define el servicio, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Define el servicio, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Define el servicio, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Define el servicio, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Define el servicio, en la ventana para cambiar el responsable de un ticket, en la interfaz del agente.',
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
        'Sets the stats hook.' => 'Define el candado para las estadísticas.',
        'Sets the system time zone (required a system with UTC as system time). Otherwise this is a diff time to the local time.' =>
            'Define la zona horaria del sistema (se requiere un sistema con UTC como hora, de lo contrario, habría una diferencia con la hora local).',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            'Define el agente propietario de un ticket, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            'Define el agente propietario de un ticket, en la ventana de acción múltiple sobre tickets de la interfaz del agente.',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            'Define el agente propietario de un ticket, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            'Define el agente propietario de un ticket, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Define el agente propietario de un ticket, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Define el agente propietario de un ticket, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Define el agente propietario de un ticket, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            'Define el agente propietario de un ticket, en la ventana para cambiar el responsable de un ticket, en la interfaz del agente.',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Define el tipo de ticket, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Define el tipo de ticket, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Define el tipo de ticket, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Define el tipo de ticket, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Define el tipo de ticket, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Define el tipo de ticket, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Define el tipo de ticket, en la ventana para cambiar el responsable de un ticket, en la interfaz del agente.',
        'Sets the time (in seconds) a user is marked as active (minimum active time is 300 seconds).' =>
            '',
        'Sets the timeout (in seconds) for http/ftp downloads.' => 'Define el tiempo de espera (en segundos) para descargas http/ftp.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            'Define el tiempo de espera (en segundos) para descargas de paquetes.',
        'Sets the user time zone per user (required a system with UTC as system time and UTC under TimeZone). Otherwise this is a diff time to the local time.' =>
            'Define la zona horaria del usuario (se requiere un sistema con UTC como hora, de lo contrario, habría una diferencia con la hora local).',
        'Sets the user time zone per user based on java script / browser time zone offset feature at login time.' =>
            'Define la zona horaria del usuario, basándose en java script / zona horaria del navegador, al iniciar sesión en el sistema.',
        'Shared Secret' => '',
        'Should the cache data be held in memory?' => '',
        'Should the cache data be stored in the selected cache backend?' =>
            '',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'Muestra una selección del agente responsable, en los tickets telefónico y de correo electrónico de la interfaz del agente.',
        'Show article as rich text even if rich text writing is disabled.' =>
            '',
        'Show queues even when only locked tickets are in.' => '',
        'Show the current owner in the customer interface.' => '',
        'Show the current queue in the customer interface.' => '',
        'Show the history for this ticket' => 'Mostrar el historial de este ticket',
        'Shows a count of icons in the ticket zoom, if the article has attachments.' =>
            'Muestra un recuento de íconos en la vista detallada del ticket, si el artículo tiene archivos adjuntos.',
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
            'Muestra un vínculo en el menú, que permite añadir una nota a un ticket, en todas y cada una de las vistas de resumen de la interfaz del agente.',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            'Muestra un vínculo en el menú, que permite cerrar un ticket en todas y cada una de las vistas de resumen de la interfaz del agente.',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Muestra un vínculo en el menú, que permite eliminar un ticket en todas y cada una de las vistas de resumen de la interfaz del agente. Puede proporcionarse control de acceso adicional para mostrar u ocultar este vínculo, al usar Key = "Group" y Content algo parecido a "rw:grupo1;move_into:grupo2".',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            'Muestra un vínculo en el menú, que permite bloquear / desbloquear un ticket en todas y cada una de las vistas de resumen de la interfaz del agente.',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            'Muestra un vínculo en el menú, que permite mover un ticket en todas y cada una de las vistas de resumen de la interfaz del agente.',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            'Muestra un vínculo en el menú, que permite acceder a la historia de dicho ticket en todas y cada una de las vistas de resumen de la interfaz del agente.',
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
            'Muestra un vínculo en el menú, que permite modificar la prioridad de un ticket en todas y cada una de las vistas de resumen de la interfaz del agente.',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            'Muestra un vínculo en el menú, que permite acceder a la vista detallada de un ticket en todas y cada una de las vistas de resumen de la interfaz del agente.',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            'Muestra un vínculo para acceder a los archivos adjuntos de un artículo a través de un visualizador html en línea, en la vista detallada de dicho artículo de la interfaz del agente.',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            'Muestra un vínculo para descargar los archivos adjuntos de un artículo, en la vista detallada de dicho artículo de la interfaz del agente.',
        'Shows a link to see a zoomed email ticket in plain text.' => 'Muestra un vínculo para visualizar un ticket de correo electrónico en texto plano, en la vista detallada de dicho ticket.',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            'Muestra una lista de todos los agentes involucrados en un ticket, en la ventana para cerrar dicho ticket de la interfaz del agente.',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            'Muestra una lista de todos los agentes involucrados en un ticket, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            'Muestra una lista de todos los agentes involucrados en un ticket, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Muestra una lista de todos los agentes involucrados en un ticket, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Muestra una lista de todos los agentes involucrados en un ticket, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Muestra una lista de todos los agentes involucrados en un ticket, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            'Muestra una lista de todos los agentes involucrados en un ticket, en la ventana para cambiar el responsable de un ticket, en la interfaz del agente.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            'Muestra una lista de todos los agentes posibles (quienes tienen permiso para añadir notas en la fila/ticket), para determinar quién debe ser informado acerca de esta nota, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            'Muestra una lista de todos los agentes posibles (quienes tienen permiso para añadir notas en la fila/ticket), para determinar quién debe ser informado acerca de esta nota, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            'Muestra una lista de todos los agentes posibles (quienes tienen permiso para añadir notas en la fila/ticket), para determinar quién debe ser informado acerca de esta nota, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Muestra una lista de todos los agentes posibles (quienes tienen permiso para añadir notas en la fila/ticket), para determinar quién debe ser informado acerca de esta nota, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Muestra una lista de todos los agentes posibles (quienes tienen permiso para añadir notas en la fila/ticket), para determinar quién debe ser informado acerca de esta nota, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Muestra una lista de todos los agentes posibles (quienes tienen permiso para añadir notas en la fila/ticket), para determinar quién debe ser informado acerca de esta nota, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            'Muestra una lista de todos los agentes posibles (quienes tienen permiso para añadir notas en la fila/ticket), para determinar quién debe ser informado acerca de esta nota, en la ventana para cambiar el responsable de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            'Muestra una vista previa de la vista de resumen de los tickets (CustomerInfo => 1 - muestra también la información del cliente y CustomerInfoMaxSize define el tamaño máximo, en caracteres, de dicha información).',
        'Shows a select of ticket attributes to order the queue view ticket list. The possible selections can be configured via \'TicketOverviewMenuSort###SortAttributes\'.' =>
            '',
        'Shows all both ro and rw queues in the queue view.' => 'Muestra las filas ro y rw en la vista de filas.',
        'Shows all both ro and rw tickets in the service view.' => '',
        'Shows all open tickets (even if they are locked) in the escalation view of the agent interface.' =>
            'Muestra todos los tickets abiertos (inclusive si están bloqueados), en la vista de escaladas, de la interfaz del agente.',
        'Shows all open tickets (even if they are locked) in the status view of the agent interface.' =>
            'Muestra todos los tickets abiertos (inclusive si están bloqueados), en la vista de estados de la interfaz del agente.',
        'Shows all the articles of the ticket (expanded) in the zoom view.' =>
            'Muestra todos los artículos de un ticket (expandidos), en la vista detallada de dicho ticket.',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            'Muestra todos los identificadores de clientes en un campo de selección múltiple (no es útil si existen muchos identificadores).',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'Muestra una selección de propietario en los tickets telefónico y de correo electrónico de la interfaz del agente.',
        'Shows colors for different article types in the article table.' =>
            '',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            'Muestra tickets del historial del cliente en los tickets telefónico y de correo electrónico, en la interfaz del agente; y en la ventana para añadir un ticket, en la interfaz del cliente.',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            'Muestra el asunto del último artículo añadido por el cliente o el título del ticket, en el formato pequeño de la vista de resumen.',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            'Muestra las filas padre/hijo existentes en el sistema, ya sea en forma de árbol o de lista.',
        'Shows information on how to start OTRS Daemon' => '',
        'Shows the activated ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            'Muestra los atributos de ticket activos en la interfaz del cliente (0 = Deshabilitado y 1 = Habilitado).',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            'Muestra los artículos ordenados normalmente o de forma inversa, en la vista detallada de un ticket, en la interfaz del agente.',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            'Muestra la información del cliente (número telefónico y cuenta de correo electrónico) en la ventana de redacción de artículos.',
        'Shows the customer user\'s info in the ticket zoom view.' => 'Muestra la información del cliente en la vista detallada de un ticket, en la interfaz del agente.',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.' =>
            'Muestra el mensaje del día en el panel principal del agente. "Group" se usa para restringir el acceso al plugin (por ejemplo: Group: admin;grupo1;grupo2;). "Default" indica si el plugin está habilitado por defecto o si el usuario tiene que activarlo manualmente.',
        'Shows the message of the day on login screen of the agent interface.' =>
            'Muestra el mensaje del día en la ventana de inicio de sesión de la interfaz del agente.',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            'Muestra la historia del ticket (ordenada inversamente) en la interfaz del agente.',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana para mover tickets, en la interfaz del agente.',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana de acción múltiple sobre tickets de la interfaz del agente.',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana de campos libres de ticket de la interfaz del agente.',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            'Muestra las opciones de prioridad del ticket, en la ventana para cambiar el responsable de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the title fields in the close ticket screen of the agent interface.' =>
            'Muestra los campos de título, en la ventana para cerrar un ticket de la interfaz del agente.',
        'Shows the title fields in the ticket note screen of the agent interface.' =>
            'Muestra los campos de título, en la ventana para agregar una nota al ticket de la interfaz del agente.',
        'Shows the title fields in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Muestra los campos de título, en la ventana para cambiar el propietario de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows the title fields in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Muestra los campos de título, en la ventana para definir un ticket como pendiente, en su vista detallada de la interfaz del agente.',
        'Shows the title fields in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Muestra los campos de título, en la ventana para cambiar la prioridad de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows the title fields in the ticket responsible screen of the agent interface.' =>
            'Muestra los campos de título, en la ventana para cambiar el responsable de un ticket, en su vista detallada de la interfaz del agente.',
        'Shows time in long format (days, hours, minutes), if set to "Yes"; or in short format (days, hours), if set to "No".' =>
            'Si se elige "Yes", muestra el tiempo en formato largo (días, horas, minutos); de lo contrario, se usa el formato corto (días, horas).',
        'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".' =>
            '',
        'Simple' => '',
        'Skin' => 'Apariencia',
        'Slovak' => 'Eslovaco',
        'Slovenian' => 'Esloveno',
        'Software Package Manager.' => '',
        'SolutionDiffInMin' => '',
        'SolutionInMin' => '',
        'Some description!' => '',
        'Some picture description!' => '',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            'Ordena los tickets (ascendente o descendentemente), luego de haberse ordenado por prioridad, cuando una sola fila se selecciona en la vista de filas. Values: 0 = ascendente (por defecto, más antiguo arriba), 1 = descendente (más reciente arriba). Use el identificador de la fila como Key y 0 ó 1 como Valor.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            '',
        'Spam' => '',
        'Spam Assassin example setup. Ignores emails that are marked with SpamAssassin.' =>
            'Ejemplo de configuración del eliminador de correo basura. Ignora los correos electrónicos que están marcados con SpamAssasin.',
        'Spam Assassin example setup. Moves marked mails to spam queue.' =>
            'Ejemplo de configuración del eliminador de correo basura. Mueve los correos marcados a la fila basura.',
        'Spanish' => 'Español',
        'Spanish (Colombia)' => 'Español (Colombia)',
        'Spanish (Mexico)' => 'Español (México)',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Specifies if an agent should receive email notification of his own actions.' =>
            'Especifica si un agente debe recibir notificaciones en su correo electrónico, acerca de sus propias acciones.',
        'Specifies the available note types for this ticket mask. If the option is deselected, ArticleTypeDefault is used and the option is removed from the mask.' =>
            '',
        'Specifies the default article type for the ticket compose screen in the agent interface if the article type cannot be automatically detected.' =>
            '',
        'Specifies the different article types that will be used in the system.' =>
            'Especifica los diferentes tipos de artículo que se usarán en el sistema.',
        'Specifies the different note types that will be used in the system.' =>
            'Especifica los diferentes tipos de nota que se usarán en el sistema.',
        'Specifies the directory to store the data in, if "FS" was selected for TicketStorageModule.' =>
            'Especifica el directorio en el que se guardarán los datos, si "FS" se eligió como TicketStorageModule.',
        'Specifies the directory where SSL certificates are stored.' => 'Especifica el directorio donde se guardan los certificados SSL.',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Especifica el directorio donde se guardan los certificados privados SSL.',
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
            'Especifica la ruta del archivo que corresponde al logo del encabezado de la página (gif|jpg|png, 700 x 100 pixeles).',
        'Specifies the path of the file for the performance log.' => 'Especifica la ruta del archivo que corresponde al log de desempeño.',
        'Specifies the path to the converter that allows the view of Microsoft Excel files, in the web interface.' =>
            'Especifica la ruta del convertidor, que permite visualizar archivos de Microsoft Excel en la interfaz web.',
        'Specifies the path to the converter that allows the view of Microsoft Word files, in the web interface.' =>
            'Especifica la ruta del convertidor, que permite visualizar archivos de Microsoft Word en la interfaz web.',
        'Specifies the path to the converter that allows the view of PDF documents, in the web interface.' =>
            'Especifica la ruta del convertidor, que permite visualizar documentos PDF en la interfaz web.',
        'Specifies the path to the converter that allows the view of XML files, in the web interface.' =>
            'Especifica la ruta del convertidor, que permite visualizar archivos XML en la interfaz web.',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            'Especifica el texto que debe aparecer en el archivo de desempeño para denotar una entrada de script CGI.',
        'Specifies user id of the postmaster data base.' => 'Especifica el identificador de usuario de la base de datos del administrador de correos.',
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
        'Spell checker.' => '',
        'Stable' => '',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            'Permisos estándar disponibles para los agentes en la aplicación. Si se requieren más permisos, pueden especificarse aquí, pero para que sean efectivos, es necesario definirlos. Otros permisos útiles también se proporcionaron, incorporados al sistema: nota, cerrar, pendiente, cliente, texto libre, mover, redactar, responsable, reenviar y rebotar. Asegúrese de que "rw" permanezca siempre como el último permiso registrado.',
        'Start number for statistics counting. Every new stat increments this number.' =>
            'Número de inicio para el conteo de estadísticas. Cada estadística nueva incrementa este número.',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            '',
        'Stat#' => 'Estadística#',
        'Status view' => 'Vista de estados',
        'Stores cookies after the browser has been closed.' => 'Guarda las cookies después de que el explorador se cerró.',
        'Strips empty lines on the ticket preview in the queue view.' => 'Elimina las líneas en blanco de la vista previa de tickets, en la vista de filas.',
        'Strips empty lines on the ticket preview in the service view.' =>
            'Elimina las líneas en blanco de la vista previa de tickets, en la vista de servicio.',
        'Swahili' => 'Suajili',
        'Swedish' => 'Sueco',
        'System Address Display Name' => '',
        'System Maintenance' => 'Mantenimiento del Sistema',
        'System Request (%s).' => 'Petición del Sistema (%s).',
        'Target' => '',
        'Templates <-> Queues' => 'Plantillas <-> Filas de Espera',
        'Textarea' => 'Área de Texto',
        'Thai' => 'Tailandés',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            'El nombre interno de la piel que debe usarse en la interfaz del agente. Por favor, verifique las pieles disponibles en Frontend::Agent::Skins.',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            'El nombre interno de la piel que debe usarse en la interfaz del cliente. Por favor, verifique las pieles disponibles en Frontend::Customer::Skins.',
        'The daemon registration for the scheduler cron task manager.' =>
            '',
        'The daemon registration for the scheduler future task manager.' =>
            '',
        'The daemon registration for the scheduler generic agent task manager.' =>
            '',
        'The daemon registration for the scheduler task worker.' => '',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'El divisor entre el candado y el número de ticket. Por ejemplo, \': \'.',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            'La duración en minutos después de emitir un evento, en el cual la notificación de nueva escalada, y los eventos de inicio, son suprimidos.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            '',
        'The headline shown in the customer interface.' => 'El encabezado mostrado en la interfaz del cliente.',
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            'El identificador para un ticket, por ejemplo: Ticket#, Llamada#, MiTicket#. El valor por defecto es Ticket#.',
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
            'El logo mostrado en la parte superior de la caja de inicio de sesión de la interfaz del agente. La URL a la imagen tiene que ser relativa a la URL del directorio de imágenes de piel.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            '',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            '',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            '',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'El texto para anteponer al asunto en una respuesta de correo electrónico, por ejemplo: RE, AW, o AS.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'El texto para anteponer al asunto cuando un correo electrónico se reenvía, por ejemplo: FW, Fwd, o WG.',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see the setting above for how to configure the mapping.' =>
            '',
        'This is the default orange - black skin for the customer interface.' =>
            '',
        'This is the default orange - black skin.' => '',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'Este módulo y su función PreRun() se ejecutarán, si así se define, por cada petición. Este módulo es útil para verificar algunas opciones de usuario o para desplegar noticias acerca de aplicaciones novedosas.',
        'This module is part of the admin area of OTRS.' => '',
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
        'This will allow the system to send text messages via SMS.' => '',
        'Ticket Close.' => '',
        'Ticket Compose Bounce Email.' => '',
        'Ticket Compose email Answer.' => '',
        'Ticket Customer.' => '',
        'Ticket Forward Email.' => '',
        'Ticket FreeText.' => '',
        'Ticket History.' => '',
        'Ticket Lock.' => '',
        'Ticket Merge.' => '',
        'Ticket Move.' => '',
        'Ticket Note.' => '',
        'Ticket Notifications' => 'Notificaciones de Ticket',
        'Ticket Outbound Email.' => '',
        'Ticket Owner.' => '',
        'Ticket Pending.' => '',
        'Ticket Print.' => '',
        'Ticket Priority.' => '',
        'Ticket Queue Overview' => 'Vista general por fila',
        'Ticket Responsible.' => '',
        'Ticket Watcher' => '',
        'Ticket Zoom.' => '',
        'Ticket bulk module.' => '',
        'Ticket event module that triggers the escalation stop events.' =>
            'Módulo de eventos de Ticket, que dispara los eventos de finalización de tiempo para escalada.',
        'Ticket moved into Queue "%s" (%s) from Queue "%s" (%s).' => 'Ticket movido a la fila "%s" (%s) de la fila "%s" (%s).',
        'Ticket notifications' => 'Notificaciones del ticket',
        'Ticket overview' => 'Vista de resumen de los tickets',
        'Ticket plain view of an email.' => '',
        'Ticket title' => '',
        'Ticket zoom view.' => '',
        'TicketNumber' => '',
        'Tickets.' => '',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Tiempo en segundos que se añade al tiempo actual, si se define un estado-pendiente (por defecto: 86400 = 1 día).',
        'Title updated: Old: "%s", New: "%s"' => '',
        'To accept login information, such as an EULA or license.' => '',
        'To download attachments.' => '',
        'Toggles display of OTRS FeatureAddons list in PackageManager.' =>
            '',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Transport selection for ticket notifications.' => '',
        'Tree view' => 'Vista de árbol',
        'Triggers ticket escalation events and notification events for escalation.' =>
            '',
        'Turkish' => 'Turco',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            '',
        'Turns on drag and drop for the main navigation.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            'Activa las animaciones uadas en la GUI. Si tiene dificultados con dichas animaciones (por ejemplo: problemas de rendimiento), puede desactivarlas aquí.',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            'Activa la verificación de direcciones ip remotas. Debe elegirse "No" si la aplicación se usa, por ejemplo, a través de un servidor proxy o una conexión de acceso telefónico, ya que la dirección ip remota es, en general, diferente para las peticiones.',
        'Ukrainian' => 'Ucraniano',
        'Unlock tickets that are past their unlock timeout.' => '',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            '',
        'Unlocked ticket.' => 'Ticket desbloqueado.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            'Actualizar la bandera de ticket "Seen" ("Visto"), si ya se vió cada artículo o si se creó un artículo nuevo.',
        'Updated SLA to %s (ID=%s).' => 'SLA actualizado a %s (ID=%s).',
        'Updated Service to %s (ID=%s).' => 'Servicio actualizado a %s (ID=%s).',
        'Updated Type to %s (ID=%s).' => 'Tipo actualizado a %s (ID=%s).',
        'Updated: %s' => 'Actualizado: %s',
        'Updated: %s=%s;%s=%s;%s=%s;' => 'Actualizado: %s=%s;%s=%s;%s=%s;',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'Actualiza el índice de escaladas de ticket, luego de que un atributo de ticket se actualizó.',
        'Updates the ticket index accelerator.' => 'Actualiza el acelerador de índice de ticket.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            '',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            '',
        'UserFirstname' => '',
        'UserLastname' => '',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            'Usa los destinatarios Cc, en la lista de respuesta Cc, al redactar una respuesta electrónica en la ventana de redacción de la interfaz del agente.',
        'Uses richtext for viewing and editing ticket notification.' => '',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            '',
        'Vietnam' => 'Vietnam',
        'View performance benchmark results.' => 'Ver los resultados de rendimiento.',
        'Watch this ticket' => 'Dar seguimiento a este ticket',
        'Watched Tickets.' => '',
        'We are performing scheduled maintenance.' => '',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            '',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            '',
        'Web View' => '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'Cuando los tickets se mezclan, el cliente puede ser informado por correo electrónico al seleccionar "Inform Sender". Es posible predefinir el contenido de dicha notificación en esta área de texto, que luego puede ser modificada por los agentes.',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            '',
        'Yes, but hide archived tickets' => '',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            '',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            '',
        'attachment' => 'Adjuntar Archivo',
        'bounce' => '',
        'compose' => '',
        'debug' => 'Depuración',
        'error' => 'Error',
        'forward' => '',
        'info' => 'Información',
        'inline' => 'En Línea',
        'notice' => 'Aviso',
        'pending' => '',
        'responsible' => '',
        'stats' => '',

    };
    # $$STOP$$
    return;
}

1;
