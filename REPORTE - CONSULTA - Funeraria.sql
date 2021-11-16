SELECT
     servicio."id_servicio" AS servicio_id_servicio,
     servicio."id_servicioa" AS servicio_id_servicioa,
     servicio."id_empleado" AS servicio_id_empleado,
     servicio."id_sala" AS servicio_id_sala,
     servicio."id_solicitud" AS servicio_id_solicitud,
     servicio."tiposervicio" AS servicio_tiposervicio,
     servicio."costoservicio" AS servicio_costoservicio,
     servicio."totalser" AS servicio_totalser,
     servicio."ivaservicio" AS servicio_ivaservicio
FROM
     "public"."servicio" servicio