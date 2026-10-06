package com.sena.meciccolombia.mediccolombia.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sena.meciccolombia.mediccolombia.domain.HistorialRestauracion;

@Repository 
public interface HistorialRestauracionDAO extends JpaRepository<HistorialRestauracion, Long> {
    List<HistorialRestauracion> findByRestauracionIdOrderByFechaAsc(Long restauracionId);
    List<HistorialRestauracion> findByRestauracionIdOrderByFechaDesc(Long restauracionId);
    List<HistorialRestauracion> findByUsuarioIdOrderByFechaDesc(Long idUsuario);
}
