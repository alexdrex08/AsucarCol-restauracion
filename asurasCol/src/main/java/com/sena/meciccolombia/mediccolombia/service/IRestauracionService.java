package com.sena.meciccolombia.mediccolombia.service;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import com.sena.meciccolombia.mediccolombia.web.dto.request.CambiarEstadoRequestDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.request.RestauracionRequestDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.EventoRestauracionDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionDetalleDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionResumenDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.UltimaRestauracionDTO;

public interface IRestauracionService {

    RestauracionResumenDTO crear(RestauracionRequestDTO dto, Long idUsuario, List<MultipartFile> fotos);

    RestauracionDetalleDTO obtenerDetalle(Long id);

    List<RestauracionResumenDTO> listar();

    List<RestauracionResumenDTO> listarPorCliente(Long idCliente);

    RestauracionDetalleDTO cambiarEstado(Long idRestauracion, CambiarEstadoRequestDTO dto, Long idUsuario,
            List<MultipartFile> fotos);

    RestauracionDetalleDTO agregarComentario(Long idRestauracion, String comentario, Long idUsuario,
            List<MultipartFile> fotos);

    void asignarGuia(List<Long> idsRestauraciones, String numeroGuia, String transportadora, Long idUsuario);

    UltimaRestauracionDTO obtenerUltimaPorCliente(Long idCliente);

    long contarRegistradasPorUsuario(Long idUsuario);

    long contarEntregadasPorUsuario(Long idUsuario);

    long contarActivasPorUsuario(Long idUsuario);

    List<EventoRestauracionDTO> ultimosEventosPorUsuario(Long idUsuario, int limite);

    void finalizarAutomaticamente(); // usado por scheduler
}