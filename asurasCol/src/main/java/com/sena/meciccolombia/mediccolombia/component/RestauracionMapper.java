package com.sena.meciccolombia.mediccolombia.component;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sena.meciccolombia.mediccolombia.domain.Restauracion;
import com.sena.meciccolombia.mediccolombia.web.dto.response.GuiaRestauracionResponseDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.HistorialResponseDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionDetalleDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionResumenDTO;

@Component 
public class RestauracionMapper {

    public RestauracionResumenDTO toResumenDTO(Restauracion r) {
        if (r == null) return null;
        return RestauracionResumenDTO.builder()
                .id(r.getId())
                .numeroSpv(r.getNumeroSpv())
                .nombreCliente(r.getCliente().getNombreCliente())
                .identificacionCliente(r.getCliente().getIdentificacion())
                .tipoRestauracion(r.getTipoRestauracion().getTipo())
                .descripcionTipo(r.getTipoRestauracion().getDescripcion())
                .articulo(r.getArticulo())
                .estadoActual(r.getEstadoActual().getNombre())
                .estadoOrden(r.getEstadoActual().getOrden())
                .fechaCreacion(r.getFechaCreacion())
                .fechaEntrega(r.getFechaEntrega())
                .build();
    }

    public RestauracionDetalleDTO toDetalleDTO(Restauracion r, List<HistorialResponseDTO> historial, List<GuiaRestauracionResponseDTO> guias) {
        if (r == null) return null;
        return RestauracionDetalleDTO.builder()
                .id(r.getId())
                .numeroSpv(r.getNumeroSpv())
                .cliente(RestauracionDetalleDTO.ClienteInfo.builder()
                        .id(r.getCliente().getId())
                        .nombre(r.getCliente().getNombreCliente())
                        .identificacion(r.getCliente().getIdentificacion())
                        .build())
                .telefonoContacto(r.getTelefonoContacto())
                .correoContacto(r.getCorreoContacto())
                .tipoRestauracionTipo(r.getTipoRestauracion().getDescripcion())
                .articulo(r.getArticulo())
                .descripcion(r.getDescripcion())
                .estadoActual(r.getEstadoActual().getNombre())
                .usuarioRegistra(r.getUsuarioRegistra().getNombre())
                .usuarioEntrega(r.getUsuarioEntrega() != null ? r.getUsuarioEntrega().getNombre() : null)
                .fechaCreacion(r.getFechaCreacion())
                .fechaLlegadaTienda(r.getFechaLlegadaTienda())
                .fechaEntrega(r.getFechaEntrega())
                .fechaDevolucion(r.getFechaDevolucion())
                .observaciones(r.getObservaciones())
                .historial(historial)
                .guias(guias)
                .build();
    }
}