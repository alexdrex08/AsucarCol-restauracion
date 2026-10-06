package com.sena.meciccolombia.mediccolombia.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sena.meciccolombia.mediccolombia.domain.EstadoRestauracion;

@Repository 
public interface EstadoRestauracionDAO extends JpaRepository<EstadoRestauracion, Long> {
    Optional<EstadoRestauracion> findByNombre(String nombre);
    List<EstadoRestauracion> findAllByOrderByOrdenAsc();
}