<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getParameter("logout") != null) {
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    if (session.getAttribute("rol") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String ctx = request.getContextPath();
    String nombre = (String) session.getAttribute("nombre");
    String apellido = (String) session.getAttribute("apellido");
    String rol = (String) session.getAttribute("rol");
    String sector = (String) session.getAttribute("sector");
    String iniciales = "";
    if (nombre != null && nombre.length() > 0) {
        iniciales += nombre.substring(0, 1).toUpperCase();
    }
    if (apellido != null && apellido.length() > 0)
        iniciales += apellido.substring(0, 1).toUpperCase();
%>
<!doctype html>
<html lang="es-AR">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Dientitos — Pacientes</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600;9..144,700&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%= ctx %>/css/dientitos.css">
    </head>
    <body>
        <div class="app">

            <% String activeNav = "pacientes"; %>
            <%@ include file="WEB-INF/jspf/_sidebar.jspf" %>

            <div>
                <div class="topbar">
                    <button class="btn btn-icon btn-ghost menu-btn" data-menu-toggle aria-label="Menú">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 6h18M3 12h18M3 18h18"/>
                        </svg>
                    </button>
                    <div class="breadcrumb">
                        <span>Inicio</span>
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M9 6l6 6-6 6"/></svg>
                        <span style="color:var(--ink);font-weight:500;">Pacientes</span>
                    </div>
                    <div style="flex:1;"></div>
                    <div class="search">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/>
                        </svg>
                        <input class="input" placeholder="Buscar paciente, DNI, turno…" />
                    </div>
                    <button class="btn btn-icon btn-ghost" title="Notificaciones">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M6 8a6 6 0 0112 0c0 7 3 7 3 9H3c0-2 3-2 3-9z"/><path d="M10 21a2 2 0 004 0"/>
                        </svg>
                    </button>
                </div>

                <main class="main anim-in">

                    <div class="page-head">
                        <div>
                            <div class="page-title">Pacientes</div>
                            <div class="page-sub">5 pacientes registrados</div>
                        </div>
                        <div class="row" style="gap:8px;">
                            <button class="btn">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8l-6-6z"/><path d="M14 2v6h6"/></svg>
                                Exportar
                            </button>
                            <button class="btn btn-primary" data-modal-open="modal-paciente">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>
                                Nuevo paciente
                            </button>
                        </div>
                    </div>

                    <div class="row" style="gap:10px;margin-bottom:14px;justify-content:space-between;flex-wrap:wrap;">
                        <div class="search" style="flex:1;max-width:380px;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/>
                            </svg>
                            <input class="input" placeholder="Buscar por nombre, DNI, obra social…" />
                        </div>
                        <div class="pill-tabs">
                            <div class="pill-tab active">Todos</div>
                            <div class="pill-tab">Adultos</div>
                            <div class="pill-tab">Menores</div>
                        </div>
                    </div>

                    <div class="card">
                        <table>
                            <thead>
                                <tr>
                                    <th>Paciente</th>
                                    <th>Edad</th>
                                    <th>Teléfono</th>
                                    <th>Obra social</th>
                                    <th>Responsable</th>
                                    <th>Última visita</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="avatar">AM</div>
                                            <div>
                                                <div style="font-weight:500;">Antonella Marín
                                                    <span class="badge badge-accent" style="margin-left:6px;font-size:10px;">menor</span>
                                                </div>
                                                <div class="dim mono" style="font-size:11px;">DNI 47.005.220</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>8 años</td>
                                    <td class="mono" style="font-size:12px;">+54 11 4567-8901</td>
                                    <td>OSDE</td>
                                    <td><span style="font-size:12.5px;">Carla Marín · Madre</span></td>
                                    <td class="mono" style="font-size:12px;">2026-04-22</td>
                                    <td>
                                        <div class="row" style="gap:4px;justify-content:flex-end;">
                                            <button class="btn btn-sm btn-ghost" title="Editar">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z"/></svg>
                                            </button>
                                            <button class="btn btn-sm btn-ghost" title="Eliminar" style="color:var(--danger);">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"/><path d="M19 6l-1 14a2 2 0 01-2 2H8a2 2 0 01-2-2L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4a2 2 0 012-2h2a2 2 0 012 2v2"/></svg>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="avatar">LV</div>
                                            <div>
                                                <div style="font-weight:500;">Lucía Vázquez</div>
                                                <div class="dim mono" style="font-size:11px;">DNI 38.420.715</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>32 años</td>
                                    <td class="mono" style="font-size:12px;">+54 11 5678-9012</td>
                                    <td>Swiss Medical</td>
                                    <td><span class="dim">—</span></td>
                                    <td class="mono" style="font-size:12px;">2026-04-30</td>
                                    <td>
                                        <div class="row" style="gap:4px;justify-content:flex-end;">
                                            <button class="btn btn-sm btn-ghost" title="Editar">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z"/></svg>
                                            </button>
                                            <button class="btn btn-sm btn-ghost" title="Eliminar" style="color:var(--danger);">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"/><path d="M19 6l-1 14a2 2 0 01-2 2H8a2 2 0 01-2-2L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4a2 2 0 012-2h2a2 2 0 012 2v2"/></svg>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="avatar">MG</div>
                                            <div>
                                                <div style="font-weight:500;">Mateo Gómez
                                                    <span class="badge badge-accent" style="margin-left:6px;font-size:10px;">menor</span>
                                                </div>
                                                <div class="dim mono" style="font-size:11px;">DNI 51.220.880</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>11 años</td>
                                    <td class="mono" style="font-size:12px;">+54 11 6789-0123</td>
                                    <td>OSDE</td>
                                    <td><span style="font-size:12.5px;">Pablo Gómez · Padre</span></td>
                                    <td class="mono" style="font-size:12px;">2026-05-02</td>
                                    <td>
                                        <div class="row" style="gap:4px;justify-content:flex-end;">
                                            <button class="btn btn-sm btn-ghost" title="Editar">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z"/></svg>
                                            </button>
                                            <button class="btn btn-sm btn-ghost" title="Eliminar" style="color:var(--danger);">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"/><path d="M19 6l-1 14a2 2 0 01-2 2H8a2 2 0 01-2-2L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4a2 2 0 012-2h2a2 2 0 012 2v2"/></svg>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="avatar">FN</div>
                                            <div>
                                                <div style="font-weight:500;">Felipe Núñez</div>
                                                <div class="dim mono" style="font-size:11px;">DNI 35.118.602</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>40 años</td>
                                    <td class="mono" style="font-size:12px;">+54 11 7890-1234</td>
                                    <td>Particular</td>
                                    <td><span class="dim">—</span></td>
                                    <td class="mono" style="font-size:12px;">2026-03-18</td>
                                    <td>
                                        <div class="row" style="gap:4px;justify-content:flex-end;">
                                            <button class="btn btn-sm btn-ghost" title="Editar">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z"/></svg>
                                            </button>
                                            <button class="btn btn-sm btn-ghost" title="Eliminar" style="color:var(--danger);">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"/><path d="M19 6l-1 14a2 2 0 01-2 2H8a2 2 0 01-2-2L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4a2 2 0 012-2h2a2 2 0 012 2v2"/></svg>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="avatar">JP</div>
                                            <div>
                                                <div style="font-weight:500;">Joaquín Pereyra
                                                    <span class="badge badge-accent" style="margin-left:6px;font-size:10px;">menor</span>
                                                </div>
                                                <div class="dim mono" style="font-size:11px;">DNI 49.880.115</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>14 años</td>
                                    <td class="mono" style="font-size:12px;">+54 11 8901-2345</td>
                                    <td>Galeno</td>
                                    <td><span style="font-size:12.5px;">Marina Pereyra · Tutora legal</span></td>
                                    <td class="mono" style="font-size:12px;">2026-04-10</td>
                                    <td>
                                        <div class="row" style="gap:4px;justify-content:flex-end;">
                                            <button class="btn btn-sm btn-ghost" title="Editar">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 113 3L7 19l-4 1 1-4 12.5-12.5z"/></svg>
                                            </button>
                                            <button class="btn btn-sm btn-ghost" title="Eliminar" style="color:var(--danger);">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"/><path d="M19 6l-1 14a2 2 0 01-2 2H8a2 2 0 01-2-2L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4a2 2 0 012-2h2a2 2 0 012 2v2"/></svg>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </main>
            </div>
        </div>

        <%-- Modal: Nuevo paciente --%>
        <div class="scrim" data-modal-scrim="modal-paciente"></div>
        <div class="modal" id="modal-paciente">
            <div style="padding:20px 24px 6px;display:flex;align-items:center;justify-content:space-between;">
                <div>
                    <div style="font-family:var(--font-serif);font-size:22px;font-weight:500;">Nuevo paciente</div>
                    <div class="dim" style="font-size:12.5px;margin-top:2px;">Registrar un paciente nuevo en el sistema.</div>
                </div>
                <button class="btn btn-icon btn-ghost" data-modal-close aria-label="Cerrar">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6L6 18M6 6l12 12"/></svg>
                </button>
            </div>
            <form action="#" onsubmit="return false;">
                <div style="padding:18px 24px;">
                    <div class="grid-2">
                        <div class="field">
                            <label class="field-label">Nombre <span style="color:var(--danger);margin-left:3px;">*</span></label>
                            <input class="input" required />
                        </div>
                        <div class="field">
                            <label class="field-label">Apellido <span style="color:var(--danger);margin-left:3px;">*</span></label>
                            <input class="input" required />
                        </div>
                        <div class="field">
                            <label class="field-label">DNI <span style="color:var(--danger);margin-left:3px;">*</span></label>
                            <input class="input mono" placeholder="00.000.000" required />
                        </div>
                        <div class="field">
                            <label class="field-label">Fecha de nacimiento <span style="color:var(--danger);margin-left:3px;">*</span></label>
                            <input class="input" type="date" required />
                        </div>
                        <div class="field">
                            <label class="field-label">Teléfono</label>
                            <input class="input" placeholder="+54 11 …" />
                        </div>
                        <div class="field">
                            <label class="field-label">Tipo de sangre</label>
                            <select class="select">
                                <option>A+</option><option>A-</option>
                                <option>B+</option><option>B-</option>
                                <option>AB+</option><option>AB-</option>
                                <option>0+</option><option>0-</option>
                            </select>
                        </div>
                        <div class="field" style="grid-column:span 2;">
                            <label class="field-label">Dirección</label>
                            <input class="input" />
                        </div>
                        <div class="field">
                            <label class="field-label">Obra social</label>
                            <input class="input" placeholder="Particular si no tiene" />
                        </div>
                        <div class="field">
                            <label class="field-label">Responsable (si es menor)</label>
                            <select class="select">
                                <option value="">— Sin responsable —</option>
                                <option>Carla Marín (Madre)</option>
                                <option>Pablo Gómez (Padre)</option>
                                <option>Marina Pereyra (Tutora legal)</option>
                            </select>
                            <span class="field-hint">Requerido si tiene menos de 18 años</span>
                        </div>
                    </div>
                </div>
                <div style="padding:12px 24px;border-top:1px solid var(--line);display:flex;justify-content:flex-end;gap:8px;background:var(--surface-2);border-bottom-left-radius:16px;border-bottom-right-radius:16px;">
                    <button type="button" class="btn" data-modal-close>Cancelar</button>
                    <button type="submit" class="btn btn-primary">
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M20 6L9 17l-5-5"/></svg>
                        Guardar
                    </button>
                </div>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="<%= ctx %>/js/ui.js"></script>
    </body>
</html>
