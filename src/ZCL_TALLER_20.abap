CLASS zcl_taller_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  TYPES ty_tipo_intervencion TYPE c LENGTH 1.

  " Estructura que representa una intervención de mantenimiento.
  TYPES:
    BEGIN OF ty_intervencion,
      matricula TYPE string,
      tipo      TYPE ty_tipo_intervencion,
      horas     TYPE i,
    END OF ty_intervencion.

  " Tabla interna que almacena todas las intervenciones.
  TYPES ty_intervenciones TYPE STANDARD TABLE OF ty_intervencion
    WITH EMPTY KEY.

  " Inicializa el taller con su nombre.
  METHODS constructor IMPORTING iv_nombre TYPE string.


  " Registra una intervención de mantenimiento de una aeronave.
  METHODS registrar_intervencion IMPORTING
                                            iv_matricula TYPE string
                                            iv_tipo      TYPE ty_tipo_intervencion
                                            iv_horas     TYPE i.

  " Consulta las horas acumuladas de intervención de una aeronave.
  METHODS consultar_horas_matricula IMPORTING iv_matricula TYPE string RETURNING VALUE(rv_horas) TYPE i.

  " Cuenta las intervenciones registradas para una aeronave.
  METHODS contar_intervenciones IMPORTING iv_matricula TYPE string RETURNING VALUE(rv_total) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

  " Nombre identificativo del taller.
  DATA mv_nombre TYPE string.

  " Tabla interna con las intervenciones registradas.
  DATA mt_intervenciones TYPE ty_intervenciones.

ENDCLASS.



CLASS zcl_taller_20 IMPLEMENTATION.
  METHOD constructor.

 " Guardamos el nombre del taller.
  mv_nombre = iv_nombre.

  ENDMETHOD.

  METHOD registrar_intervencion.

 " Incorporamos una nueva intervención a la tabla del taller.
  APPEND VALUE ty_intervencion(
    matricula = iv_matricula
    tipo      = iv_tipo
    horas     = iv_horas
    ) TO mt_intervenciones.

  ENDMETHOD.

  METHOD consultar_horas_matricula.

  " Recorremos las intervenciones registradas.
  LOOP AT mt_intervenciones INTO DATA(ls_intervencion).

  " Sumamos las horas de la matrícula solicitada.
    IF ls_intervencion-matricula = iv_matricula.
      rv_horas = rv_horas + ls_intervencion-horas.
    ENDIF.

  ENDLOOP.

  ENDMETHOD.

  METHOD contar_intervenciones.

    " Recorremos las intervenciones registradas.
  LOOP AT mt_intervenciones INTO DATA(ls_intervencion).

    " Contamos únicamente las de la matrícula solicitada.
    IF ls_intervencion-matricula = iv_matricula.
      rv_total = rv_total + 1.
    ENDIF.

  ENDLOOP.

  ENDMETHOD.

ENDCLASS.