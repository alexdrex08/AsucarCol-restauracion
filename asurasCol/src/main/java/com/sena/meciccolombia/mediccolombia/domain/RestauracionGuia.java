package com.sena.meciccolombia.mediccolombia.domain;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "RestauracionGuia", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"restauracion_id", "guia_id"})
})
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class RestauracionGuia implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "restauracion_id", nullable = false)
    private Restauracion restauracion;

    @ManyToOne
    @JoinColumn(name = "guia_id", nullable = false)
    private GuiaRestauracion guia;

    @Column(name = "fecha_asignacion", nullable = false)
    private LocalDateTime fechaAsignacion;
}