package com.sena.meciccolombia.mediccolombia.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sena.meciccolombia.mediccolombia.domain.FotoRestauracion;

@Repository
public interface FotoRestauracionDAO extends JpaRepository<FotoRestauracion, Long> {
    List<FotoRestauracion> findByHistorialId(Long historialId);
}
