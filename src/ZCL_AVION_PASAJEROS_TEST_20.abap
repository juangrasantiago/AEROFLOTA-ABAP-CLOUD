CLASS zcl_avion_pasajeros_test_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_avion_pasajeros_test_20 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      DATA(lo_avion) = NEW zcl_avion_pasajeros_20(
      iv_matricula = 'EC-PAX'
      iv_modelo = 'AIRBUS A320'
      iv_horas_totales = 12000
      iv_horas_desde_revision = 100
      iv_capacidad_pasajeros = 180
        ).

" Creacion avión de pasajeros
    out->write( 'Avion de pasajeros creado correctamente' ).
" Obtener capacidad de pasajeros
    out->write( lo_avion->obtener_capacidad_pasajeros( ) ).
" Ficha heredada de métodos padres
    out->write( lo_avion->obtener_ficha( ) ).
" Obtener estado de método padre
    out->write( lo_avion->obtener_estado_revision( ) ).
" Registramos 50 horas
    out->write( lo_avion->registrar_vuelo( 50 ) ).
" Obtenemos horas totales para ver la suma las 50 h anteriores
    out->write( lo_avion->obtener_horas_totales( ) ).
" Obtenemos horas de revisión totales
    out->write( lo_avion->obtener_horas_desde_revision( ) ).
" Coste avión pasajeros
    out->write( lo_avion->calcular_coste_operativo( 10 ) ).
" Comprobación de ocupantes en el avión en porcentaje
    out->write( |Ocupacion 120 pasajeros: {
      lo_avion->calcular_ocupacion( 120 ) } %| ).

    out->write( |Ocupacion 200 pasajeros: {
      lo_avion->calcular_ocupacion( 200 ) } %| ).

    out->write( |Ocupacion 0 pasajeros: {
      lo_avion->calcular_ocupacion( 0 ) } %| ).


  ENDMETHOD.
ENDCLASS.