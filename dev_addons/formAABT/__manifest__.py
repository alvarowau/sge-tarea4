{
    # Nombre del módulo
    'name': 'formAABT',

    # Versión del módulo
    'version': '1.0.0',

    # Resumen breve sobre la funcionalidad del módulo
    'summary': 'Generación de informes de clientes',

    # Descripción más detallada sobre el módulo
    'description': 'Módulo para generar informes personalizados de clientes en Odoo.',

    # Categoría dentro del sistema Odoo
    'category': 'Reporting',

    # Autor del módulo
    'author': 'Alvaro',

    # Licencia del módulo (LGPL-3 es una licencia de código abierto)
    'license': 'LGPL-3',

    # URL del repositorio o sitio web del proyecto
    'website': 'https://github.com/alvarowau/sge-tarea4',

    # Dependencias: módulos que deben estar instalados antes de instalar este módulo
    'depends': ['base'],

    # Archivos de datos que serán cargados en el sistema
    'data': [
        'views/report.xml',  # Definición de la estructura de los informes
        'views/res_partner_views.xml',  # Personalización de la vista de clientes
    ],

    # Indica si el módulo es instalable
    'installable': True,

    # Define si el módulo se considera una aplicación en el menú principal de Odoo
    'application': False,
}
