package com.sena.meciccolombia.mediccolombia.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sena.meciccolombia.mediccolombia.domain.GuiaRestauracion;

@Repository 
public interface GuiaRestauracionDAO extends JpaRepository<GuiaRestauracion, Long> {
    Optional<GuiaRestauracion> findByNumeroGuia(String numeroGuia);
    boolean existsByNumeroGuia(String numeroGuia);
}