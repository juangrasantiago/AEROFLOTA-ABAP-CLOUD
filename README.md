# AEROFLOTA – Gestión de Flota y Mantenimiento

## Descripción

AEROFLOTA es un proyecto desarrollado con **ABAP Cloud** que simula la gestión de una flota de aeronaves y sus operaciones de mantenimiento.

El proyecto aplica conceptos de programación orientada a objetos en ABAP, incluyendo herencia, encapsulación, redefinición de métodos, clases estáticas y pruebas funcionales.

## Funcionalidades principales

- Gestión de aeronaves.
- Diferenciación entre aviones de pasajeros y aviones de carga.
- Control de horas de vuelo y revisiones periódicas.
- Cálculo de costes operativos.
- Control de capacidad de pasajeros y carga.
- Registro y consulta de intervenciones de mantenimiento.
- Validación de matrículas.
- Conversión de horas a minutos.
- Pruebas individuales y pruebas de integración.

## Arquitectura

El proyecto está organizado mediante clases globales ABAP:

- `ZCL_AERONAVE_20`: clase principal de aeronaves.
- `ZCL_AVION_PASAJEROS_20`: gestión de aviones de pasajeros.
- `ZCL_AVION_CARGA_20`: gestión de aviones de carga.
- `ZCL_TALLER_20`: gestión de intervenciones de mantenimiento.
- `ZCL_AERO_UTILIDADES_20`: funciones auxiliares.
- Clases de pruebas individuales y de integración.

## Tecnologías

- SAP ABAP Cloud
- ABAP Development Tools (ADT)
- Programación orientada a objetos
- Pruebas ABAP

## Estructura del repositorio

```text
AEROFLOTA-ABAP-CLOUD/
├── src/
│   └── Clases ABAP del proyecto
├── tests/
├── docs/
│   ├── Memoria técnica
│   └── Matriz de trazabilidad
└── README.md
```

## Pruebas

El proyecto incluye pruebas individuales para las distintas clases y una clase de integración que verifica el funcionamiento conjunto de los componentes.

## Evolución futura

Se contempla ampliar el proyecto mediante ABAP RESTful Application Programming Model (RAP) y SAP Fiori, incorporando persistencia de datos y una interfaz de usuario empresarial.

---

**Proyecto formativo – AEROFLOTA**  
ABAP Cloud | Desarrollo SAP
Proyecto realizado por Juan Gabriel Santiago