package com.sena.meciccolombia.mediccolombia.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sena.meciccolombia.mediccolombia.domain.Usuario;

import java.util.List;
import java.util.Optional;

@Repository
public interface UsuarioDAO extends JpaRepository<Usuario, Long> {

    Optional<Usuario> findByCorreo(String correo);

    boolean existsByCorreo(String correo);

    Optional<Usuario> findByIdentificacion(String identificacion);

    boolean existsByIdentificacion(String identificacion);

    List<Usuario> findByActivoTrue();


}