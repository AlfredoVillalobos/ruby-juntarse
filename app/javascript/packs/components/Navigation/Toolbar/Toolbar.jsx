import React from "react";

const toolbar = () => (
  <div className="navbar-perfil">
    <button className="hamburger hamburger--squeeze js-hamburger" type="button">
      <span className="hamburger-box">
        <span className="hamburger-inner"></span>
      </span>
    </button>
    <div className="hamburger-perfil">
      <ul>
        <a href="<%= edit_profile_pages_path %>"><li>Editar Perfil</li></a>
        <a href="<%= destroy_user_session_path %>" data-method="delete"><li>Cerrar Sesión</li></a>
      </ul>
    </div>
  </div>
)

export default toolbar;