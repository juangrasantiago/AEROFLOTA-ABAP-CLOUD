CLASS zcl_aero_utilidades_test_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aero_utilidades_test_20 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    out->write( zcl_aero_utilidades_20=>validar_matricula( iv_matricula = 'ECAABC' ) ).

    out->write( zcl_aero_utilidades_20=>convertir_horas_a_minutos( 0 ) ).

  ENDMETHOD.
ENDCLASS.