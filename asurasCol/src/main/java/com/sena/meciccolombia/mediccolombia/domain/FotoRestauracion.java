package com.sena.meciccolombia.mediccolombia.domain;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "FotoRestauracion")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
@EntityListeners(AuditingEntityListener.class)
public class FotoRestauracion implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_foto_restauracion")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "historial_id", nullable = false)
    private HistorialRestauracion historial;

    @Column(name = "url_foto", nullable = false, length = 255)
    private String urlFoto;

    @Column(name = "tipo", length = 30)
    private String tipo;

    @CreatedDate
    @Column(name = "fecha", nullable = false, updatable = false)
    private LocalDateTime fecha;
}