CLASS zcl_aeronave_test_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aeronave_test_20 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    out->write( zcl_aeronave_20=>obtener_total_aeronaves( ) ).

    DATA: lo_a1 TYPE REF TO zcl_aeronave_20,
          lo_a2 TYPE REF TO zcl_aeronave_20,
          lo_a3 TYPE REF TO zcl_aeronave_20,
          lo_a4 TYPE REF TO zcl_aeronave_20.

    lo_a1 = NEW zcl_aeronave_20(
      iv_matricula = 'EC-ABC'
      iv_modelo = 'A320'
    ).

    lo_a2 = NEW zcl_aeronave_20(
      iv_matricula = 'EC-XYZ'
      iv_modelo = 'ATR72'
      iv_horas_totales = 12000
      iv_horas_desde_revision = 440
    ).

    lo_a3 = NEW zcl_aeronave_20(
      iv_matricula = 'EC-DEF'
      iv_modelo = 'B737'
      iv_horas_totales = 0
      iv_horas_desde_revision = 120
    ).

    lo_a4 = NEW zcl_aeronave_20(
      iv_matricula = 'EC-GHI'
      iv_modelo = 'A350'
      iv_horas_desde_revision = 500
    ).
*
*    out->write( lo_a1->obtener_ficha( ) ).
*    out->write( lo_a2->obtener_ficha( ) ).

*    Mostrar aeronave
*    out->write( zcl_aeronave_20=>obtener_total_aeronaves( ) ).

*    Estado de revisión
*    out->write( lo_a1->obtener_estado_revision( ) ).
*    out->write( lo_a2->obtener_estado_revision( ) ).
*    out->write( lo_a3->obtener_estado_revision( ) ).
*    out->write( lo_a4->obtener_estado_revision( ) ).

*   Registramos vuelo de 5 horas
*    out->write( lo_a2->registrar_vuelo( 5 ) ).
*    out->write( lo_a2->obtener_estado_revision( ) ).
*   Registramos vuelo de 10 horas
*    out->write( lo_a2->registrar_vuelo( 10 ) ).
*    out->write( lo_a2->obtener_estado_revision( ) ).

*   Dandole valores invalidos
*    out->write( lo_a2->registrar_vuelo( 0 ) ).
*    out->write( lo_a2->registrar_vuelo( -3 ) ).

*   Registramos un vuelo de 50 horas
*    out->write( lo_a2->registrar_vuelo( 50 ) ).
*    out->write( lo_a2->obtener_estado_revision( ) ).

*   Vuelo despues de superar el límite
*    out->write( lo_a2->registrar_vuelo( 1 ) ).

*   Comprobar horas totales
*    out->write( lo_a2->obtener_horas_totales( ) ).

*   Registrar revisión
*    lo_a2->registrar_revision( ).
*
*    out->write( lo_a2->obtener_estado_revision( ) ).
*    out->write( lo_a2->registrar_vuelo( 10 ) ).
*    out->write( lo_a2->obtener_horas_totales( ) ).
*    out->write( lo_a2->obtener_horas_desde_revision( ) ).

*   Vuelos Programados
*   Le añadimos 10 vuelos de 100 horas, solo mostrará 5 porque llega a 500 horas de vuelo
*    out->write( lo_a1->registrar_vuelos_programados( iv_vuelos = 10 iv_horas_por_vuelo = 100 ) ).
*    out->write( lo_a1->obtener_estado_revision( ) ).
*    out->write( lo_a1->obtener_horas_totales( ) ).
*    out->write( lo_a1->obtener_horas_desde_revision( ) ).

*   Vuelos hasta revisión
*   out->write( lo_a3->calcular_vuelos_hasta_revision( 0 ) ).

*   Vuerlos disponibles de lo_a1
*    out->write( lo_a1->calcular_vuelos_hasta_revision( 100 ) ).

*    out->write( lo_a3->registrar_vuelo( 0 ) ).
*    out->write( lo_a3->obtener_horas_desde_revision( ) ).

*    DATA: lv_matricula TYPE string,
*      lv_modelo TYPE string,
*      lv_horas_totales TYPE i.
*
*      lo_a1->obtener_datos(
*  IMPORTING
*    ev_matricula = lv_matricula
*    ev_modelo = lv_modelo
*    ev_horas_totales = lv_horas_totales
*    ).
*
*    out->write( lv_matricula ).
*    out->write( lv_modelo ).
*    out->write( lv_horas_totales ).

*   Calcular coste
*
*    out->write( lo_a1->calcular_coste_operativo( 10 ) ).
*
*   Contador total de Aeronaves
*
*    out->write( zcl_aeronave_20=>obtener_total_aeronaves( ) ).
*
*   Reinicio de Aeronaves y comprobación
*
*    zcl_aeronave_20=>reiniciar_contador( ).
*
*    out->write( zcl_aeronave_20=>obtener_total_aeronaves( ) ).

  ENDMETHOD.

ENDCLASS.