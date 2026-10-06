package com.sena.meciccolombia.mediccolombia.domain;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "Restauracion")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
@EntityListeners(AuditingEntityListener.class)
public class Restauracion implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_restauracion")
    private Long id;

    @Column(name = "numero_spv", unique = true, nullable = false, length = 50)
    private String numeroSpv;

    @ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "usuario_registra_id", nullable = false)
    private Usuario usuarioRegistra;

    @ManyToOne
    @JoinColumn(name = "usuario_entrega_id")
    private Usuario usuarioEntrega;

    @ManyToOne
    @JoinColumn(name = "tipo_restauracion_id", nullable = false)
    private TipoRestauracion tipoRestauracion;

    @ManyToOne
    @JoinColumn(name = "estado_actual_id", nullable = false)
    private EstadoRestauracion estadoActual;

    @Column(name = "articulo", nullable = false, length = 200)
    private String articulo;

    @Column(name = "descripcion", columnDefinition = "TEXT")
    private String descripcion;

    @Column(name = "telefono_contacto", length = 30)
    private String telefonoContacto;

    @Column(name = "correo_contacto", length = 120)
    private String correoContacto;

    @CreatedDate
    @Column(name = "fecha_creacion", nullable = false, updatable = false)
    private LocalDateTime fechaCreacion;

    @Column(name = "fecha_llegada_tienda")
    private LocalDateTime fechaLlegadaTienda;

    @Column(name = "fecha_entrega")
    private LocalDateTime fechaEntrega;

    @Column(name = "fecha_devolucion")
    private LocalDateTime fechaDevolucion;

    @Column(name = "observaciones", columnDefinition = "TEXT")
    private String observaciones;

    private Boolean activo = true;

    @OneToMany(mappedBy = "restauracion", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private List<HistorialRestauracion> historial;

    @OneToMany(mappedBy = "restauracion", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private List<RestauracionGuia> guias;
}