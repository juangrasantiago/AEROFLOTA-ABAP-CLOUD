CLASS zcl_avion_carga_20 DEFINITION
  PUBLIC
  INHERITING FROM zcl_aeronave_20
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

" Recargo de bodega por cada hora de vuelo, expresado en euros.
    CONSTANTS c_coste_bodega TYPE i VALUE 250.
    TYPES ty_tipo_mercancia TYPE c LENGTH 1.
  METHODS constructor
  IMPORTING
    iv_matricula TYPE string
    iv_modelo TYPE string
    iv_horas_totales TYPE i DEFAULT 0
    iv_horas_desde_revision TYPE i DEFAULT 0
    iv_capacidad_carga TYPE i.

  METHODS obtener_capacidad_carga RETURNING VALUE(rv_capacidad) TYPE i.

  METHODS calcular_coste_operativo REDEFINITION.

" Calcula el recargo según el tipo de mercancía.
  METHODS calcular_recargo_mercancia IMPORTING iv_tipo TYPE ty_tipo_mercancia RETURNING VALUE(rv_recargo) TYPE i.

" Comprueba que la carga esté dentro de los límites permitidos.
  METHODS validar_carga IMPORTING iv_kg TYPE i RETURNING VALUE(rv_valida) TYPE abap_boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.

   DATA mv_capacidad_carga TYPE i.

ENDCLASS.



CLASS zcl_avion_carga_20 IMPLEMENTATION.
  METHOD constructor.
" Inicializa el avión de carga y establece su capacidad máxima.
    super->constructor( iv_matricula = iv_matricula iv_modelo = iv_modelo iv_horas_totales = iv_horas_totales iv_horas_desde_revision = iv_horas_desde_revision ).

    mv_capacidad_carga = iv_capacidad_carga.

  ENDMETHOD.

  METHOD obtener_capacidad_carga.
" Devuelve la capacidad máxima de carga del avión.
    rv_capacidad = mv_capacidad_carga.

  ENDMETHOD.

  METHOD calcular_coste_operativo.
" Calcula el coste base más el recargo de bodega.

" Partimos del coste base calculado por la clase padre.
    rv_coste = super->calcular_coste_operativo( iv_horas ).

" Añadimos el recargo de bodega por cada hora de vuelo.
    rv_coste = rv_coste + ( iv_horas * c_coste_bodega ).

  ENDMETHOD.

  METHOD calcular_recargo_mercancia.
" Devuelve el recargo correspondiente al tipo de mercancía.
" Determinamos el recargo según el tipo de mercancía.
    CASE iv_tipo.
      WHEN 'G'.
        rv_recargo = 0.
      WHEN 'P'.
        rv_recargo = 200.
      WHEN 'M'.
        rv_recargo = 500.
      WHEN OTHERS.
        rv_recargo = 0.
    ENDCASE.

  ENDMETHOD.

  METHOD validar_carga.
" Comprueba que los kilogramos estén dentro de la capacidad permitida.
" La carga debe ser positiva y no superar la capacidad máxima.
    IF iv_kg > 0 AND iv_kg <= mv_capacidad_carga.
      rv_valida = abap_true.
    ELSE.
      rv_valida = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.