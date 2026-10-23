package com.sena.meciccolombia.mediccolombia.domain;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "alerta_restauracion", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"restauracion_id", "mes_alerta"})
})
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class AlertaRestauracion implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_alerta")
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "restauracion_id", nullable = false)
    private Restauracion restauracion;

    @Column(name = "mes_alerta", nullable = false)
    private Integer mesAlerta;

    @Column(name = "fecha_generacion", nullable = false)
    private LocalDateTime fechaGeneracion;

    @Column(name = "observacion", columnDefinition = "TEXT")
    private String observacion;

    @Column(name = "resuelta", nullable = false)
    private Boolean resuelta = false;

    @Column(name = "fecha_resolucion")
    private LocalDateTime fechaResolucion;

    @ManyToOne
    @JoinColumn(name = "usuario_resolucion_id")
    private Usuario usuarioResolucion;
}