// ── Acumulativo de fotos (máx 4) ──
const MAX_FOTOS_ESTADO = 4;
const inputFotosEstado = document.getElementById('inputFotosEstado');
let fotosEstadoAcumuladas = [];
function renderPreviewFotosEstado() {
    const preview = document.getElementById('previewFotosEstado');
    preview.innerHTML = '';
    fotosEstadoAcumuladas.forEach((f, i) => {
        const reader = new FileReader();
        reader.onload = e => {
            const col = document.createElement('div');
            col.className = 'col-3 position-relative';
            col.innerHTML = `
                <img src="${e.target.result}" class="img-fluid rounded"
                     style="height:80px; width:100%; object-fit:cover;">
                <button type="button" class="btn btn-sm btn-danger position-absolute top-0 end-0 m-1 p-1 lh-1"
                        style="font-size:0.7rem;" title="Quitar">
                    <i class="fa-solid fa-xmark"></i>
                </button>`;
            col.querySelector('button').addEventListener('click', () => {
                fotosEstadoAcumuladas.splice(i, 1);
                renderPreviewFotosEstado();
            });
            preview.appendChild(col);
        };
        reader.readAsDataURL(f);
    });
}

inputFotosEstado?.addEventListener('change', function () {
    const nuevas = Array.from(this.files);
    let ignoradas = 0;
    for (const f of nuevas) {
        if (fotosEstadoAcumuladas.length >= MAX_FOTOS_ESTADO) { ignoradas++; continue; }
        fotosEstadoAcumuladas.push(f);
    }
    if (ignoradas > 0) {
        mostrarMensajeSistema(
            'Máximo 4 fotos',
            `Solo se permiten hasta ${MAX_FOTOS_ESTADO} fotos. Se ignoraron ${ignoradas} archivo(s).`,
            'warning'
        );
    }
    renderPreviewFotosEstado();
});

document.getElementById('selectEstadoNuevo')?.addEventListener('change', function () {
    const texto = this.options[this.selectedIndex].text;
    const bloqueGuia = document.getElementById('bloqueGuia');
    const inputTransp = document.getElementById('inputTransportadoraEstado');
    if (texto === 'Garantía') {
        bloqueGuia.classList.remove('d-none');
        if (inputTransp && !inputTransp.value.trim()) {
            inputTransp.value = 'COORDINADORA';
        }
    } else {
        bloqueGuia.classList.add('d-none');
    }
});

function cambiarEstado() {
    const idEstado = document.getElementById('selectEstadoNuevo').value;
    if (!idEstado) {
        mostrarMensajeSistema('Falta el estado', 'Selecciona un estado antes de continuar.', 'warning');
        return;
    }

    const estadoTexto = document.getElementById('selectEstadoNuevo').options[
        document.getElementById('selectEstadoNuevo').selectedIndex].text;

    mostrarModalConfirmacion(
        'Cambiar estado',
        `¿Confirmas el cambio al estado <strong>${estadoTexto}</strong>?`,
        'info',
        async function () {
            const formData = new FormData();
            formData.append('idEstadoNuevo', idEstado);
            formData.append('comentario', document.getElementById('inputComentarioEstado').value || '');

            const guia = document.getElementById('inputGuiaEstado')?.value || '';
            const transportadora = document.getElementById('inputTransportadoraEstado')?.value || '';
            if (guia) formData.append('numeroGuia', guia);
            if (transportadora) formData.append('transportadora', transportadora);

            for (let i = 0; i < Math.min(fotosEstadoAcumuladas.length, 4); i++) {
                formData.append('fotos', fotosEstadoAcumuladas[i]);
            }

            try {
                const res = await fetch(`/api/restauraciones/${RESTAURACION_ID}/estado`, {
                    method: 'POST',
                    body: formData
                });
                const data = await res.json();
                if (!res.ok) throw new Error(data.error || 'Error al cambiar estado');
                location.reload();
            } catch (e) {
                mostrarMensajeSistema('Error', e.message, 'danger');
            }
        },
        'Sí, cambiar'
    );
}