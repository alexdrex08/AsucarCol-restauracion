package com.sena.meciccolombia.mediccolombia.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sena.meciccolombia.mediccolombia.domain.TipoRestauracion;

@Repository 
public interface TipoRestauracionDAO extends JpaRepository<TipoRestauracion, Long> {
    Optional<TipoRestauracion> findByTipo(String tipo);
    List<TipoRestauracion> findByDescripcionContainingIgnoreCase(String descripcion);
}