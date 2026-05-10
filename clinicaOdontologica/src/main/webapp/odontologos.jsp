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
        <title>Dientitos — Odontólogos</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600;9..144,700&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%= ctx %>/css/dientitos.css">
    </head>
    <body>
        <div class="app">

            <% String activeNav = "odontologos"; %>
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
                        <span style="color:var(--ink);font-weight:500;">Odontólogos</span>
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
                            <div class="page-title">Odontólogos</div>
                            <div class="page-sub">Profesionales del consultorio: especialidad, contacto y color de agenda.</div>
                        </div>
                        <div class="row" style="gap:8px;">
                            <button class="btn btn-primary" data-modal-open="modal-odontologo">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>
                                Nuevo odontólogo
                            </button>
                        </div>
                    </div>

                    <div class="card">
                        <table>
                            <thead>
                                <tr>
                                    <th>Profesional</th>
                                    <th>Especialidad</th>
                                    <th>DNI</th>
                                    <th>Teléfono</th>
                                    <th>Color</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="avatar" style="background:var(--brand);color:var(--brand-ink);">MB</div>
                                            <div>
                                                <div style="font-weight:500;">María Bravo</div>
                                                <div class="dim mono" style="font-size:11px;">O-001</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>Ortodoncia</td>
                                    <td class="mono" style="font-size:12px;">28.115.402</td>
                                    <td class="mono" style="font-size:12px;">+54 11 4501-2233</td>
                                    <td><span style="display:inline-block;width:16px;height:16px;border-radius:4px;background:#1f3a2e;vertical-align:middle;"></span></td>
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
                                            <div class="avatar" style="background:var(--brand);color:var(--brand-ink);">LF</div>
                                            <div>
                                                <div style="font-weight:500;">Lucas Fernández</div>
                                                <div class="dim mono" style="font-size:11px;">O-002</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>General</td>
                                    <td class="mono" style="font-size:12px;">31.420.115</td>
                                    <td class="mono" style="font-size:12px;">+54 11 4602-3344</td>
                                    <td><span style="display:inline-block;width:16px;height:16px;border-radius:4px;background:#4a6b8a;vertical-align:middle;"></span></td>
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
                                            <div class="avatar" style="background:var(--brand);color:var(--brand-ink);">CR</div>
                                            <div>
                                                <div style="font-weight:500;">Camila Roldán</div>
                                                <div class="dim mono" style="font-size:11px;">O-003</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>Odontopediatría</td>
                                    <td class="mono" style="font-size:12px;">33.808.911</td>
                                    <td class="mono" style="font-size:12px;">+54 11 4703-4455</td>
                                    <td><span style="display:inline-block;width:16px;height:16px;border-radius:4px;background:#c9a86b;vertical-align:middle;"></span></td>
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
                                            <div class="avatar" style="background:var(--brand);color:var(--brand-ink);">JS</div>
                                            <div>
                                                <div style="font-weight:500;">Javier Soto</div>
                                                <div class="dim mono" style="font-size:11px;">O-004</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>Endodoncia</td>
                                    <td class="mono" style="font-size:12px;">29.660.318</td>
                                    <td class="mono" style="font-size:12px;">+54 11 4804-5566</td>
                                    <td><span style="display:inline-block;width:16px;height:16px;border-radius:4px;background:#b04a3c;vertical-align:middle;"></span></td>
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

        <%-- Modal: Nuevo odontólogo --%>
        <div class="scrim" data-modal-scrim="modal-odontologo"></div>
        <div class="modal" id="modal-odontologo">
            <div style="padding:20px 24px 6px;display:flex;align-items:center;justify-content:space-between;">
                <div>
                    <div style="font-family:var(--font-serif);font-size:22px;font-weight:500;">Nuevo odontólogo</div>
                    <div class="dim" style="font-size:12.5px;margin-top:2px;">Datos del profesional. Sus horarios se gestionan aparte.</div>
                </div>
                <button class="btn btn-icon btn-ghost" data-modal-close aria-label="Cerrar">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6L6 18M6 6l12 12"/></svg>
                </button>
            </div>
            <form action="#" onsubmit="return false;">
                <div style="padding:18px 24px;">
                    <div class="grid-2">
                        <div class="field">
                            <label for="firstname" class="field-label">Nombre <span style="color:var(--danger);margin-left:3px;">*</span></label>
                            <input class="input" type="text" name="firstname" id="firstname" required placeholder="Marcelo"/>
                        </div>
                        <div class="field">
                            <label for="lastname" class="field-label">Apellido <span style="color:var(--danger);margin-left:3px;">*</span></label>
                            <input class="input" type="text" name="lastname" id="lastname" required placeholder="Sanchez"/>
                        </div>
                        <div class="field">
                            <label for="dni" class="field-label">DNI <span style="color:var(--danger);margin-left:3px;">*</span></label>
                            <input class="input mono" type="text" name="dni" id="dni" required placeholder="44166877"/>
                        </div>
                        <div class="field">
                            <label for="phone" class="field-label">Teléfono</label>
                            <input class="input" type="text" name="phone" id="phone" placeholder="2654325645"/>
                        </div>
                        <div class="field">
                            <label for="speciality" class="field-label">Especialidad <span style="color:var(--danger);margin-left:3px;">*</span></label>
                            <select class="select" id="speciality" name="speciality">
                                <option>General</option>
                                <option>Ortodoncia</option>
                                <option>Odontopediatría</option>
                                <option>Endodoncia</option>
                                <option>Periodoncia</option>
                                <option>Cirugía</option>
                            </select>
                        </div>
                        <div class="field">
                            <label class="field-label">Color identificador</label>
                            <div class="row" data-color-picker style="gap:6px;">
                                <button type="button" style="width:28px;height:28px;border-radius:6px;background:#1f3a2e;border:2px solid var(--ink);cursor:pointer;padding:0;"></button>
                                <button type="button" style="width:28px;height:28px;border-radius:6px;background:#4a6b8a;border:2px solid transparent;cursor:pointer;padding:0;"></button>
                                <button type="button" style="width:28px;height:28px;border-radius:6px;background:#c9a86b;border:2px solid transparent;cursor:pointer;padding:0;"></button>
                                <button type="button" style="width:28px;height:28px;border-radius:6px;background:#b04a3c;border:2px solid transparent;cursor:pointer;padding:0;"></button>
                                <button type="button" style="width:28px;height:28px;border-radius:6px;background:#6a4a7a;border:2px solid transparent;cursor:pointer;padding:0;"></button>
                                <button type="button" style="width:28px;height:28px;border-radius:6px;background:#3c8a6a;border:2px solid transparent;cursor:pointer;padding:0;"></button>
                            </div>
                            <span class="field-hint">Para el calendario</span>
                        </div>
                        <div class="field">
                            <label for="birthdate" class="field-label">Fecha de nacimiento</label>
                            <input class="input" type="date" name="birthdate" id="birthdate"/>
                        </div>
                        <div class="field">
                            <label for="address" class="field-label">Dirección</label>
                            <input class="input" type="text" id="address" name="address" placeholder="Los Patos 454"/>
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
