let clienteEncontrado = false;

// ── Buscar cliente ──
async function buscarClientePorCc() {
    const cc = document.getElementById('inputCcCliente').value.trim();
    if (!cc) {
        mostrarMensajeSistema('Falta la cédula', 'Ingresa el número de documento para buscar.', 'warning');
        return;
    }

    const res = await fetch('/api/restauraciones/cliente/buscar?identificacion=' + encodeURIComponent(cc));
    const data = await res.json();

    if (data.encontrado) {
        clienteEncontrado = true;
        document.getElementById('nombreClienteEncontrado').textContent =
            data.cliente.nombre + ' - ' + data.cliente.identificacion;
        document.getElementById('clienteEncontrado').classList.remove('d-none');
        document.getElementById('formClienteNuevo').classList.add('d-none');
    } else {
        clienteEncontrado = false;
        document.getElementById('clienteEncontrado').classList.add('d-none');
        document.getElementById('formClienteNuevo').classList.remove('d-none');
    }
}

function limpiarCliente() {
    clienteEncontrado = false;
    document.getElementById('clienteEncontrado').classList.add('d-none');
    document.getElementById('formClienteNuevo').classList.add('d-none');
    document.getElementById('inputCcCliente').value = '';
}

// ── Buscar tipo de restauración ──
const inputTipo = document.getElementById('inputTipoRestauracion');
const resultadosTipo = document.getElementById('resultadosTipo');
let debounceTipo;

inputTipo?.addEventListener('input', function () {
    clearTimeout(debounceTipo);
    const q = this.value.trim();
    if (q.length < 2) { resultadosTipo.style.display = 'none'; return; }
    debounceTipo = setTimeout(() => buscarTipo(q), 300);
});

async function buscarTipo(texto) {
    const res = await fetch('/api/restauraciones/tipo/buscar?texto=' + encodeURIComponent(texto));
    const lista = await res.json();

    resultadosTipo.innerHTML = '';
    if (lista.length === 0) {
        resultadosTipo.innerHTML = '<div class="list-group-item text-muted small">Sin resultados</div>';
    } else {
        lista.forEach(t => {
            const btn = document.createElement('button');
            btn.type = 'button';
            btn.className = 'list-group-item list-group-item-action w-100 text-start';
            btn.innerHTML = `<span class="badge bg-primary me-2">${t.tipo}</span>${t.descripcion}`;
            btn.onclick = () => {
                inputTipo.value = t.tipo + ' - ' + t.descripcion;
                document.getElementById('inputIdTipoRestauracion').value = t.id;
                resultadosTipo.style.display = 'none';
            };
            resultadosTipo.appendChild(btn);
        });
    }
    resultadosTipo.style.display = 'block';
}

document.addEventListener('click', e => {
    if (inputTipo && !inputTipo.contains(e.target) && !resultadosTipo.contains(e.target)) {
        resultadosTipo.style.display = 'none';
    }
});

// ── Preview fotos ──
// ── Acumulativo de fotos (máx 4) ──
const MAX_FOTOS = 4;
const inputFotos = document.getElementById('inputFotos');
let fotosAcumuladas = [];

function renderPreviewFotos() {
    const preview = document.getElementById('previewFotos');
    preview.innerHTML = '';
    fotosAcumuladas.forEach((f, i) => {
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
                fotosAcumuladas.splice(i, 1);
                renderPreviewFotos();
            });
            preview.appendChild(col);
        };
        reader.readAsDataURL(f);
    });
}

inputFotos?.addEventListener('change', function () {
    const nuevas = Array.from(this.files);
    let ignoradas = 0;
    for (const f of nuevas) {
        if (fotosAcumuladas.length >= MAX_FOTOS) { ignoradas++; continue; }
        fotosAcumuladas.push(f);
    }
    if (ignoradas > 0) {
        mostrarMensajeSistema(
            'Máximo 4 fotos',
            `Solo se permiten hasta ${MAX_FOTOS} fotos. Se ignoraron ${ignoradas} archivo(s).`,
            'warning'
        );
    }
    renderPreviewFotos();
});

// ── Submit ──
document.getElementById('formRestauracion')?.addEventListener('submit', async function (e) {
    e.preventDefault();

    const idTipo = document.getElementById('inputIdTipoRestauracion').value;
    if (!idTipo) {
        mostrarMensajeSistema('Falta el tipo', 'Selecciona un tipo de restauración de la lista.', 'warning');
        return;
    }

    if (!clienteEncontrado) {
        const nombre = document.getElementById('inputNombreCliente').value.trim();
        if (!nombre) {
            mostrarMensajeSistema('Falta el nombre', 'Ingresa el nombre del cliente para continuar.', 'warning');
            return;
        }

        document.getElementById('modalCc').textContent = document.getElementById('inputCcCliente').value;
        document.getElementById('modalNombre').textContent = nombre;
        document.getElementById('modalTelefono').textContent = document.getElementById('inputTelefonoCliente').value || '—';
        document.getElementById('modalCorreo').textContent = document.getElementById('inputCorreoCliente').value || '—';

        new bootstrap.Modal(document.getElementById('modalCrearCliente')).show();
        return;
    }

    await enviarFormulario(false);
});

document.getElementById('btnConfirmarCrearCliente')?.addEventListener('click', async function () {
    bootstrap.Modal.getInstance(document.getElementById('modalCrearCliente')).hide();
    await enviarFormulario(true);
});

async function enviarFormulario(crearCliente) {
    const formData = new FormData();
    formData.append('numeroSpv', document.getElementById('inputSpv').value);
    formData.append('identificacionCliente', document.getElementById('inputCcCliente').value);
    formData.append('idTipoRestauracion', document.getElementById('inputIdTipoRestauracion').value);
    formData.append('articulo', document.getElementById('inputArticulo').value);
    formData.append('descripcion', document.getElementById('inputDescripcion').value || '');
    formData.append('observaciones', document.getElementById('inputObservaciones').value || '');
    formData.append('numeroGuia', document.getElementById('inputGuia').value || '');
    formData.append('transportadora', document.getElementById('inputTransportadora').value || '');

    if (!clienteEncontrado && crearCliente) {
        formData.append('nombreCliente', document.getElementById('inputNombreCliente').value);
        formData.append('telefonoContacto', document.getElementById('inputTelefonoCliente').value || '');
        formData.append('correoContacto', document.getElementById('inputCorreoCliente').value || '');
    }

    for (let i = 0; i < Math.min(fotosAcumuladas.length, 4); i++) {
        formData.append('fotos', fotosAcumuladas[i]);
    }

    try {
        const res = await fetch('/api/restauraciones/crear', { method: 'POST', body: formData });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || 'Error al guardar');
        window.location.href = '/restauraciones/' + data.id;
    } catch (e) {
        mostrarMensajeSistema('Error al guardar', e.message, 'danger');
    }
}