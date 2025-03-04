{
    'name': 'formAABT',
    'version': '1.0.0',
    'summary': 'Generación de informes de clientes',
    'description': 'Módulo para generar informes personalizados de clientes en Odoo.',
    'category': 'Reporting',
    'author': 'Alvaro',
    'license': 'LGPL-3',
    'website': 'https://github.com/alvarowau',
    'depends': ['base'],
    'data': [
        'views/report.xml',
        'views/res_partner_views.xml',
    ],
    'installable': True,
    'application': False,
}
