CLASS zcl_aero_utilidades_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

*   Guardamos las 3 constantes que utilizaremos más adelante
      CONSTANTS:
*   Prefijo de matrícula
    c_prefijo_espana TYPE string VALUE 'EC-',
*    Longitud de matrícula
    c_longitud_matricula TYPE i VALUE 6,
*    Paso de horas a minutos
    c_minutos_por_hora TYPE i VALUE 60.


*   Declaramos los metodos estaticos

    CLASS-METHODS validar_matricula IMPORTING iv_matricula TYPE string RETURNING VALUE(rv_valida) TYPE abap_boolean.

    CLASS-METHODS convertir_horas_a_minutos IMPORTING iv_horas TYPE i RETURNING VALUE(rv_minutos) type i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aero_utilidades_20 IMPLEMENTATION.

  METHOD convertir_horas_a_minutos.
" Convierte las horas indicadas a minutos.
    rv_minutos = iv_horas * c_minutos_por_hora.

  ENDMETHOD.

  METHOD validar_matricula.
" Comprueba que una matrícula tenga el prefijo y longitud establecidos.

      rv_valida = abap_false.

      IF strlen( iv_matricula ) = c_longitud_matricula
         AND substring( val = iv_matricula off = 0 len = 3 ) = c_prefijo_espana.

        rv_valida = abap_true.

      ENDIF.

  ENDMETHOD.

ENDCLASS.