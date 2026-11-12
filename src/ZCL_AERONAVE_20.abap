" Representa una aeronave y gestiona sus horas de vuelo y revisiones.
CLASS zcl_aeronave_20 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
" Constantes con sus valores fijos
  CONSTANTS:
      c_intervalo_revision TYPE i VALUE 500,
      c_umbral_aviso TYPE i VALUE 450,
      c_coste_hora_base TYPE i VALUE 1000.
" Inicializa una aeronave con su matrícula, modelo y horas de servicio.
      METHODS constructor IMPORTING

      iv_matricula              TYPE string
      iv_modelo                 TYPE string
      iv_horas_totales          TYPE i DEFAULT 0
      iv_horas_desde_revision   TYPE i DEFAULT 0.
" Devuelve el número total de horas de vuelo acumuladas por la aeronave.
      METHODS obtener_horas_totales         RETURNING VALUE(rv_horas) TYPE i.
" Devuelve las horas de vuelo acumuladas desde la última revisión.
      METHODS obtener_horas_desde_revision  RETURNING VALUE(rv_horas) TYPE i.
" Determina el estado actual de revisión de la aeronave.
      METHODS obtener_estado_revision       RETURNING VALUE(rv_estado) TYPE string.
" Registra un vuelo y actualiza las horas acumuladas.
      METHODS registrar_vuelo               IMPORTING iv_horas TYPE i RETURNING VALUE(rv_ok) TYPE abap_boolean.
" Devuelve una ficha descriptiva de la aeronave.
      METHODS obtener_ficha                 RETURNING VALUE(rv_ficha) TYPE string.
" Registra una revisión y reinicia las horas desde revisión.
      METHODS registrar_revision.
" Registra vuelos programados hasta alcanzar el límite de revisión.
      METHODS registrar_vuelos_programados   IMPORTING  iv_vuelos TYPE i
                                                        iv_horas_por_vuelo TYPE i
                                                        RETURNING VALUE(rv_registrados) TYPE i.
" Calcula cuántos vuelos pueden realizarse hasta la siguiente revisión.
      METHODS calcular_vuelos_hasta_revision IMPORTING iv_horas_por_vuelo TYPE i
                                                        RETURNING VALUE(rv_num_vuelos) TYPE i.
" Devuelve los datos principales de la aeronave.
      METHODS obtener_datos EXPORTING
                                        ev_matricula TYPE string
                                        ev_modelo TYPE string
                                        ev_horas_totales TYPE i.
" Calcula el coste operativo de un número determinado de horas.
      METHODS calcular_coste_operativo IMPORTING iv_horas TYPE i RETURNING VALUE(rv_coste) TYPE i.
" Devuelve el número total de aeronaves creadas.
      CLASS-METHODS obtener_total_aeronaves RETURNING VALUE(rv_total) TYPE i.
" Reinicia el contador estático de aeronaves.
      CLASS-METHODS reiniciar_contador.

  PROTECTED SECTION.

    DATA:
        mv_matricula TYPE string,
        mv_modelo    TYPE string.

  PRIVATE SECTION.

    DATA:
    mv_horas_totales         TYPE i,
    mv_horas_desde_revision  TYPE i.

    CLASS-DATA gv_total_aeronaves TYPE i.

ENDCLASS.



CLASS zcl_aeronave_20 IMPLEMENTATION.
  METHOD constructor.

    mv_matricula = iv_matricula.
    mv_modelo = iv_modelo.
    mv_horas_totales = iv_horas_totales.
    mv_horas_desde_revision = iv_horas_desde_revision.

    gv_total_aeronaves = gv_total_aeronaves + 1.

  ENDMETHOD.

  METHOD obtener_horas_totales.
" Devuelve las horas totales acumuladas.
    rv_horas = mv_horas_totales.

  ENDMETHOD.

  METHOD obtener_horas_desde_revision.
" Devuelve las horas acumuladas desde la última revisión.
    rv_horas = mv_horas_desde_revision.

  ENDMETHOD.

  METHOD obtener_ficha.
 " Construye y devuelve la ficha descriptiva de la aeronave.
    rv_ficha = |Matrícula: { mv_matricula } | &&
               |Modelo: { mv_modelo } | &&
               |Horas totales: { mv_horas_totales } | &&
               |Horas desde revisión: { mv_horas_desde_revision }|.

  ENDMETHOD.

  METHOD obtener_total_aeronaves.
" Devuelve el contador estático de aeronaves creadas.
    rv_total = gv_total_aeronaves.

  ENDMETHOD.

  METHOD reiniciar_contador.
" Establece el contador estático de aeronaves a cero.
    gv_total_aeronaves = 0.

  ENDMETHOD.

  METHOD obtener_estado_revision.
 " Comprueba las horas desde revisión y determina el estado.
    IF mv_horas_desde_revision < c_umbral_aviso.
    rv_estado = 'OPERATIVA'.

  ELSEIF mv_horas_desde_revision < c_intervalo_revision.
    rv_estado = 'REVISIÓN PRÓXIMA'.

  ELSE.
    rv_estado = 'REVISION OBLIGATORIA'.

  ENDIF.


  ENDMETHOD.

  METHOD registrar_vuelo.
 " Valida y registra un vuelo actualizando las horas.
     rv_ok = abap_false.

      IF iv_horas <= 0.
        RETURN.
      ENDIF.

      IF mv_horas_desde_revision >= c_intervalo_revision.
        RETURN.
      ENDIF.

       mv_horas_totales = mv_horas_totales + iv_horas.
       mv_horas_desde_revision = mv_horas_desde_revision + iv_horas.

       rv_ok = abap_true.

  ENDMETHOD.

  METHOD registrar_revision.
" Reinicia las horas desde revisión sin alterar el total.
    mv_horas_desde_revision = 0.

  ENDMETHOD.

  METHOD registrar_vuelos_programados.
" Registra vuelos sucesivos hasta alcanzar el límite de revisión.
     rv_registrados = 0.

      DO iv_vuelos TIMES.

        IF registrar_vuelo( iv_horas_por_vuelo ) = abap_false.
          EXIT.
        ENDIF.

        rv_registrados = rv_registrados + 1.

      ENDDO.


  ENDMETHOD.

    METHOD calcular_vuelos_hasta_revision.
" Simula vuelos y calcula cuántos caben antes de la revisión.
      rv_num_vuelos = 0.

      IF iv_horas_por_vuelo <= 0.
        RETURN.
      ENDIF.

      IF mv_horas_desde_revision >= c_intervalo_revision.
        RETURN.
      ENDIF.

      DATA(lv_horas_simuladas) = mv_horas_desde_revision.

      WHILE lv_horas_simuladas < c_intervalo_revision.

        lv_horas_simuladas = lv_horas_simuladas + iv_horas_por_vuelo.

        rv_num_vuelos = rv_num_vuelos + 1.

      ENDWHILE.

      ENDMETHOD.

  METHOD obtener_datos.
" Devuelve matrícula, modelo y horas totales.
      ev_matricula = mv_matricula.
      ev_modelo = mv_modelo.
      ev_horas_totales = mv_horas_totales.

  ENDMETHOD.

  METHOD calcular_coste_operativo.
" Calcula el coste multiplicando horas por coste base.
    rv_coste = iv_horas * c_coste_hora_base.

  ENDMETHOD.

ENDCLASS.