CLASS zcl_taller_test_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_taller_test_20 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   " Creamos una instancia del taller.
    DATA(lo_taller) = NEW zcl_taller_20(
      iv_nombre = 'Taller AEROFLOTA'
    ).
  " Registramos la primera intervención de EC-ABC:
  " una revisión de 5 horas.
    lo_taller->registrar_intervencion(
      iv_matricula = 'EC-ABC'
      iv_tipo      = 'R'
      iv_horas     = 5
    ).

    " Registramos una segunda intervención de EC-ABC:
    " una reparación correctiva de 3 horas.
    lo_taller->registrar_intervencion(
      iv_matricula = 'EC-ABC'
      iv_tipo      = 'C'
      iv_horas     = 3
    ).

    " Registramos una tercera intervención de EC-ABC:
    " una inspección de 2 horas.
    lo_taller->registrar_intervencion(
      iv_matricula = 'EC-ABC'
      iv_tipo      = 'I'
      iv_horas     = 2
    ).

    " Registramos una intervención de otra aeronave:
    " comprobamos que sus datos no se mezclan con EC-ABC.
    lo_taller->registrar_intervencion(
      iv_matricula = 'EC-XYZ'
      iv_tipo      = 'R'
      iv_horas     = 4
    ).

    " Comprobamos las horas acumuladas de EC-ABC.
    " Debe sumar 5 + 3 + 2 = 10 horas.
    out->write( |Horas EC-ABC: {
      lo_taller->consultar_horas_matricula( 'EC-ABC' ) }| ).

    " Comprobamos el número de intervenciones de EC-ABC.
    " Debe devolver 3.
    out->write( |Intervenciones EC-ABC: {
      lo_taller->contar_intervenciones( 'EC-ABC' ) }| ).

    " Comprobamos las horas acumuladas de EC-XYZ.
    " Debe devolver 4, sin incluir las de EC-ABC.
    out->write( |Horas EC-XYZ: {
      lo_taller->consultar_horas_matricula( 'EC-XYZ' ) }| ).

    " Comprobamos el número de intervenciones de EC-XYZ.
    " Debe devolver 1.
    out->write( |Intervenciones EC-XYZ: {
      lo_taller->contar_intervenciones( 'EC-XYZ' ) }| ).

    " Comprobamos una matrícula sin intervenciones.
    " Ambos métodos deben devolver 0.
    out->write( |Horas EC-999: {
      lo_taller->consultar_horas_matricula( 'EC-999' ) }| ).

    out->write( |Intervenciones EC-999: {
      lo_taller->contar_intervenciones( 'EC-999' ) }| ).



  ENDMETHOD.
ENDCLASS.