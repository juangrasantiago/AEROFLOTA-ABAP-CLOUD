CLASS zcl_aeroflota_test_20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aeroflota_test_20 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   out->write( 'AEROFLOTA: entorno preparado' ).

  " Creamos un avión de pasajeros.
  DATA(lo_pasajeros) = NEW zcl_avion_pasajeros_20(
    iv_matricula = 'EC-PAX'
    iv_modelo = 'AIRBUS A320'
    iv_horas_totales = 0
    iv_horas_desde_revision = 0
    iv_capacidad_pasajeros = 150
  ).

  " Creamos un avión de carga.
  DATA(lo_carga) = NEW zcl_avion_carga_20(
    iv_matricula = 'EC-CGO'
    iv_modelo = 'BOEING B737F'
    iv_horas_totales = 0
    iv_horas_desde_revision = 0
    iv_capacidad_carga = 20000
  ).

  " Creamos el taller de mantenimiento.
  DATA(lo_taller) = NEW zcl_taller_20(
    iv_nombre = 'Taller AEROFLOTA'
  ).

  " Mostramos las fichas de las aeronaves.
  out->write( lo_pasajeros->obtener_ficha( ) ).
  out->write( lo_carga->obtener_ficha( ) ).

  " Confirmamos que el taller se ha creado.
  out->write( 'Taller AEROFLOTA creado correctamente' ).

  " Registramos un vuelo de 10 horas en el avión de pasajeros.
  lo_pasajeros->registrar_vuelo( 10 ).

  " Registramos un vuelo de 10 horas en el avión de carga.
  lo_carga->registrar_vuelo( 10 ).

  " Consultamos el coste operativo del avión de pasajeros.
  out->write( |Coste pasajeros: {
    lo_pasajeros->calcular_coste_operativo( 10 ) } EUR| ).

  " Consultamos el coste operativo del avión de carga.
  out->write( |Coste carga: {
    lo_carga->calcular_coste_operativo( 10 ) } EUR| ).

  " Comprobamos las horas totales después de los vuelos.
  out->write( |Horas pasajeros: {
    lo_pasajeros->obtener_horas_totales( ) }| ).

  out->write( |Horas carga: {
    lo_carga->obtener_horas_totales( ) }| ).

  " Registramos una revisión de 5 horas para el avión de pasajeros.
  lo_taller->registrar_intervencion(
    iv_matricula = 'EC-PAX'
    iv_tipo      = 'R'
    iv_horas     = 5
  ).

  " Registramos una reparación de 3 horas para el avión de pasajeros.
  lo_taller->registrar_intervencion(
    iv_matricula = 'EC-PAX'
    iv_tipo      = 'C'
    iv_horas     = 3
  ).

  " Registramos una inspección de 4 horas para el avión de carga.
  lo_taller->registrar_intervencion(
    iv_matricula = 'EC-CGO'
    iv_tipo      = 'I'
    iv_horas     = 4
  ).

  " Consultamos las horas de mantenimiento del avión de pasajeros.
  out->write( |Mantenimiento EC-PAX: {
    lo_taller->consultar_horas_matricula( 'EC-PAX' ) } horas| ).

  " Consultamos las horas de mantenimiento del avión de carga.
  out->write( |Mantenimiento EC-CGO: {
    lo_taller->consultar_horas_matricula( 'EC-CGO' ) } horas| ).

  " Contamos las intervenciones de cada aeronave.
  out->write( |Intervenciones EC-PAX: {
    lo_taller->contar_intervenciones( 'EC-PAX' ) }| ).

  out->write( |Intervenciones EC-CGO: {
    lo_taller->contar_intervenciones( 'EC-CGO' ) }| ).

  " Comprobamos la validación de una matrícula española.
  out->write( |Matricula EC-ABC valida: {
    zcl_aero_utilidades_20=>validar_matricula( 'EC-ABC' ) }| ).

  " Comprobamos el rechazo de una matrícula incorrecta.
  out->write( |Matricula XX-ABC valida: {
    zcl_aero_utilidades_20=>validar_matricula( 'XX-ABC' ) }| ).

  " Convertimos dos horas de vuelo a minutos.
  out->write( |2 horas en minutos: {
    zcl_aero_utilidades_20=>convertir_horas_a_minutos( 2 ) }| ).

  " Comprobamos la ocupación del avión de pasajeros.
  out->write( |Ocupacion con 120 pasajeros: {
    lo_pasajeros->calcular_ocupacion( 120 ) } %| ).

  " Comprobamos que la ocupación no supere el 100 %.
  out->write( |Ocupacion con 200 pasajeros: {
    lo_pasajeros->calcular_ocupacion( 200 ) } %| ).

  " Comprobamos la validación de carga del avión de mercancías.
  out->write( |Carga de 15000 kg valida: {
    lo_carga->validar_carga( 15000 ) }| ).

  " Comprobamos el rechazo de una carga superior a la capacidad.
  out->write( |Carga de 20001 kg valida: {
    lo_carga->validar_carga( 20001 ) }| ).

  ENDMETHOD.
ENDCLASS.