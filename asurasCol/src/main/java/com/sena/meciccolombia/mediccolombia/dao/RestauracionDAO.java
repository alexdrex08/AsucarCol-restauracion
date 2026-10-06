package com.sena.meciccolombia.mediccolombia.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sena.meciccolombia.mediccolombia.domain.Restauracion;

@Repository
public interface RestauracionDAO extends JpaRepository<Restauracion, Long> {
    Optional<Restauracion> findByNumeroSpv(String numeroSpv);

    List<Restauracion> findByClienteId(Long clienteId);

    List<Restauracion> findByEstadoActualId(Long estadoId);

    List<Restauracion> findByClienteIdentificacion(String identificacion);

    long countByEstadoActualId(Long estadoId);

    List<Restauracion> findByUsuarioRegistraId(Long idUsuario);

    List<Restauracion> findByUsuarioEntregaId(Long idUsuario);
}