CLASS zcl_avion_carga_test_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_avion_carga_test_20 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " Creación de avión de carga

      DATA(lo_avion) = NEW zcl_avion_carga_20(
      iv_matricula = 'EC-CAR'
      iv_modelo = 'AIRBUS A330F'
      iv_horas_totales = 15000
      iv_horas_desde_revision = 200
      iv_capacidad_carga = 25000
    ).

    out->write( 'Avion de carga creado correctamente' ).
" Obtener capacidad de carga guardada
    out->write( lo_avion->obtener_capacidad_carga( ) ).
" Obtener ficha creada
    out->write( lo_avion->obtener_ficha( ) ).
" Comprobar estado revisión
    out->write( lo_avion->obtener_estado_revision( ) ).
" Registro de carga
    out->write( lo_avion->registrar_vuelo( 100 ) ).
" Comprobar horas totales y de revision actualizadas
    out->write( lo_avion->obtener_horas_totales( ) ).

    out->write( lo_avion->obtener_horas_desde_revision( ) ).

" Coste operativo avion de carga

    out->write( lo_avion->calcular_coste_operativo( 10 ) ).
" Comprobación recargos
    out->write( |Mercancia G: { lo_avion->calcular_recargo_mercancia( 'G' ) } EUR| ).
    out->write( |Mercancia P: { lo_avion->calcular_recargo_mercancia( 'P' ) } EUR| ).
    out->write( |Mercancia M: { lo_avion->calcular_recargo_mercancia( 'M' ) } EUR| ).
    out->write( |Mercancia X: { lo_avion->calcular_recargo_mercancia( 'X' ) } EUR| ).

" Validación de kg permitidos
    out->write( |Carga 15000 kg: { lo_avion->validar_carga( 15000 ) }| ).
    out->write( |Carga 25000 kg: { lo_avion->validar_carga( 25000 ) }| ).
    out->write( |Carga 25001 kg: { lo_avion->validar_carga( 25001 ) }| ).
    out->write( |Carga 0 kg: { lo_avion->validar_carga( 0 ) }| ).

  ENDMETHOD.
ENDCLASS.