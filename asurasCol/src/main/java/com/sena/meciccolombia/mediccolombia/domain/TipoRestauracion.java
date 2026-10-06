package com.sena.meciccolombia.mediccolombia.domain;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;

@Entity
@Table(name = "TipoRestauracion")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class TipoRestauracion implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tipo_restauracion")
    private Long id;

    @Column(name = "tipo", unique = true, nullable = false, length = 20)
    private String tipo;

    @Column(name = "descripcion", nullable = false, length = 200)
    private String descripcion;
}