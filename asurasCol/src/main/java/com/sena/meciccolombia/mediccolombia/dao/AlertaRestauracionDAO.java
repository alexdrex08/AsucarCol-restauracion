package com.sena.meciccolombia.mediccolombia.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.sena.meciccolombia.mediccolombia.domain.AlertaRestauracion;

@Repository
public interface AlertaRestauracionDAO extends JpaRepository<AlertaRestauracion, Long> {
    List<AlertaRestauracion> findByRestauracionId(Long idRestauracion);

    List<AlertaRestauracion> findByRestauracionIdAndResueltaFalse(Long idRestauracion);

    List<AlertaRestauracion> findByResueltaFalseOrderByFechaGeneracionAsc();

    long countByResueltaFalse();
}