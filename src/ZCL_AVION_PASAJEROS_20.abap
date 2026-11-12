CLASS zcl_avion_pasajeros_20 DEFINITION
  PUBLIC
  INHERITING FROM zcl_aeronave_20
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

" Recargo de cabina por cada hora de vuelo, expresado en euros.
  CONSTANTS c_coste_cabina TYPE i VALUE 150.

  METHODS constructor
  IMPORTING
    iv_matricula TYPE string
    iv_modelo TYPE string
    iv_horas_totales TYPE i DEFAULT 0
    iv_horas_desde_revision TYPE i DEFAULT 0
    iv_capacidad_pasajeros TYPE i.

  METHODS obtener_capacidad_pasajeros RETURNING VALUE(rv_capacidad) TYPE i.

  METHODS calcular_coste_operativo REDEFINITION.

  METHODS obtener_ficha REDEFINITION.

" Calcula el porcentaje de ocupación del avión.
  METHODS calcular_ocupacion IMPORTING iv_pasajeros TYPE i RETURNING VALUE(rv_porcentaje) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

   DATA mv_capacidad_pasajeros TYPE i.

ENDCLASS.



CLASS zcl_avion_pasajeros_20 IMPLEMENTATION.
  METHOD constructor.

    super->constructor( iv_matricula = iv_matricula iv_modelo = iv_modelo iv_horas_totales = iv_horas_totales iv_horas_desde_revision = iv_horas_desde_revision ).
     mv_capacidad_pasajeros = iv_capacidad_pasajeros.

  ENDMETHOD.

  METHOD obtener_capacidad_pasajeros.
" Devuelve la capacidad máxima de pasajeros del avión.

     rv_capacidad = mv_capacidad_pasajeros.

  ENDMETHOD.

  METHOD calcular_coste_operativo.
" Calcula el coste base más el recargo de cabina.

   rv_coste = super->calcular_coste_operativo( iv_horas ).

   rv_coste = rv_coste + ( iv_horas * c_coste_cabina ).


  ENDMETHOD.

  METHOD obtener_ficha.
" Devuelve la ficha de la aeronave incluyendo sus plazas.
    rv_ficha = super->obtener_ficha( ).

    rv_ficha = rv_ficha && | - { mv_capacidad_pasajeros } plazas|.

  ENDMETHOD.

  METHOD calcular_ocupacion.
" Calcula el porcentaje de ocupación según los pasajeros embarcados.
      rv_porcentaje = 0.

      " Evitamos porcentajes inválidos y divisiones entre cero.
      IF iv_pasajeros <= 0 OR mv_capacidad_pasajeros <= 0.
        RETURN.
      ENDIF.

      " Si se alcanza o supera la capacidad, la ocupación es del 100 %.
      IF iv_pasajeros >= mv_capacidad_pasajeros.
        rv_porcentaje = 100.
      ELSE.
        rv_porcentaje = iv_pasajeros * 100 / mv_capacidad_pasajeros.
      ENDIF.

  ENDMETHOD.

ENDCLASS.