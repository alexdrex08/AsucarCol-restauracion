package com.sena.meciccolombia.mediccolombia.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sena.meciccolombia.mediccolombia.domain.RestauracionGuia;

@Repository 
public interface RestauracionGuiaDAO extends JpaRepository<RestauracionGuia, Long> {
    List<RestauracionGuia> findByRestauracionId(Long restauracionId);
    List<RestauracionGuia> findByGuiaId(Long guiaId);
}
