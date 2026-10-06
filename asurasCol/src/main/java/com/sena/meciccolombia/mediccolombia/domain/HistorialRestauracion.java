package com.sena.meciccolombia.mediccolombia.domain;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "HistorialRestauracion")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
@EntityListeners(AuditingEntityListener.class)
public class HistorialRestauracion implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_historial_restauracion")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "restauracion_id", nullable = false)
    private Restauracion restauracion;

    @ManyToOne
    @JoinColumn(name = "estado_anterior_id")
    private EstadoRestauracion estadoAnterior;

    @ManyToOne
    @JoinColumn(name = "estado_nuevo_id", nullable = false)
    private EstadoRestauracion estadoNuevo;

    @ManyToOne
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @Column(name = "comentario", columnDefinition = "TEXT")
    private String comentario;

    @Column(name = "es_automatico", nullable = false)
    private Boolean esAutomatico = false;

    @CreatedDate
    @Column(name = "fecha", nullable = false, updatable = false)
    private LocalDateTime fecha;

    @OneToMany(mappedBy = "historial", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private List<FotoRestauracion> fotos;
}