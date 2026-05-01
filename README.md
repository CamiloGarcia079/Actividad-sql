# Sistema de Gestión de Asuntos Jurídicos

## Interpretación del problema
Una firma jurídica necesita un sistema para gestionar clientes, asuntos legales y procuradores. Cada cliente tiene un DNI único, y sobre cada asunto se registra su fecha de inicio, fecha de fin y estado. Un asunto pertenece a un único cliente, pero puede ser atendido por varios procuradores. Un procurador puede participar en varios asuntos.

## Entidades y atributos
- **CLIENTE**
  - DNI (PK)
  - nombre
  - direccion
  - fecha_nacimiento

- **ASUNTO**
  - num_expediente (PK)
  - fecha_inicio
  - fecha_fin
  - estado
  - DNI_cliente (FK)

- **PROCURADOR**
  - DNI (PK)
  - nombre
  - apellidos
  - num_colegiado
  - casos_ganados

- **ASUNTO_PROCURADOR** (tabla intermedia)
  - num_expediente (FK)
  - DNI_procurador (FK)
  - PK compuesta (num_expediente, DNI_procurador)

## Justificación de relaciones y cardinalidades
- **CLIENTE 1:N ASUNTO**: un cliente puede tener varios asuntos, pero cada asunto pertenece a un solo cliente.
- **ASUNTO N:M PROCURADOR**: un asunto puede ser manejado por varios procuradores y un procurador puede trabajar en varios asuntos.

## Transformación a modelo relacional
1. Se convierten las entidades en tablas.
2. Se define la clave primaria de cada tabla.
3. Se agrega la clave foránea `DNI_cliente` en `ASUNTO` para representar la relación 1:N entre cliente y asunto.
4. Para la relación N:M entre `ASUNTO` y `PROCURADOR`, se crea la tabla intermedia `ASUNTO_PROCURADOR` con una clave primaria compuesta.

## Decisiones tomadas
- Se mantiene el DNI como clave primaria para `CLIENTE` y `PROCURADOR` porque identifican de forma única a cada persona.
- `num_expediente` se usa como clave primaria de `ASUNTO` porque identifica cada caso legal.
- Se usa una tabla intermedia `ASUNTO_PROCURADOR` para resolver la relación muchos a muchos.
- Se incluye un `CHECK` opcional en `estado` para los valores admitidos: `en proceso`, `cerrado` y `suspendido`.

## Contenido del repositorio
- `diagramas/DER.svg`: Diagrama entidad-relación principal.
- `diagramas/DER_conceptual.svg`: Diagrama conceptual mejorado.
- `diagramas/modelo_logico.svg`: Representación visual del modelo lógico relacional.
- `modelo_logico/modelo_relacional.sql`: Script SQL con la definición de las tablas.
- `README.md`: Documentación del modelo y decisiones.
