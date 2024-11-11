# Cloud Computing Project

Este proyecto configura y despliega una infraestructura básica en AWS utilizando Terraform. La infraestructura incluye balanceo de carga, autoescalado de instancias, monitoreo de rendimiento y alertas para garantizar disponibilidad y escalabilidad.

## Tabla de Contenidos
- [Descripción General](#descripción-general)
- [Características Principales](#características-principales)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Requisitos Previos](#requisitos-previos)
- [Configuración del Proyecto](#configuración-del-proyecto)
- [Uso](#uso)

## Descripción General
Este repositorio contiene configuraciones de Terraform para construir una infraestructura basada en AWS. La infraestructura está diseñada para soportar una aplicación con alta disponibilidad mediante balanceo de carga y escalabilidad automática. Además, se implementan alarmas para monitorear la carga de trabajo y enviar notificaciones en caso de uso excesivo de CPU en las instancias de EC2.

## Características Principales
- **Balanceador de Carga**: Se implementa un Load Balancer de tipo `application` que distribuye el tráfico entre instancias de EC2.
- **Auto Scaling Group**: Se configura un grupo de autoescalado que permite agregar o reducir instancias automáticamente según la demanda.
- **Monitoreo y Alertas**: Se configura CloudWatch para monitorear el uso de CPU de las instancias y un tema de SNS que envía alertas por correo electrónico en caso de que el umbral definido se supere.
- **Infraestructura como Código (IaC)**: Todo está gestionado con Terraform para asegurar consistencia, flexibilidad y facilidad de mantenimiento.

## Estructura del Proyecto
├── autoscaling.tf
├── cloudwatch.tf 
├── encryption.tf
├── iam.tf 
├── loadbalancer.tf
├── main.tf 
├── outputs.tf
├── security_group.tf 
├── sns.tf 
├── variables.tf 
├── .gitignore # Archivos y carpetas ignoradas en el repositorio 
└── README.md # Documentación del proyecto


## Requisitos Previos
- **AWS CLI**: Instalado y configurado con credenciales para acceder a tu cuenta de AWS.
- **Terraform**: Versión 1.0 o superior.
- **Cuenta de AWS**: Para desplegar los recursos.
- **Git**: Para clonar y gestionar el repositorio.

## Configuración del Proyecto
1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/tu-repositorio.git
   cd tu-repositorio
2. Configura las variables necesarias en el archivo variables.tf, como el ID de la AMI y el tipo de instancia

3. Inicializa Terraform:
   ```bash
   terraform init

4. Revisa la estructura
   ```bash
   terraform plan

5. Aplica la configuración para crear los recursos en AWS:
   ```bash
   terraform apply
## Uso

Despliegue: Ejecuta terraform apply para crear los recursos.
Actualización: Modifica los archivos .tf según las necesidades y aplica nuevamente terraform apply.
Eliminación: Usa terraform destroy para eliminar los recursos y evitar costos innecesarios.

