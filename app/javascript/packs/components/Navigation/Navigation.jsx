import React from "react";
import Aux from "../../hoc/Aux";
import Toolbar from "./Toolbar/Toolbar";

const navigation = (props) => (
  <Aux>
    <nav className="nav-bar wrapper bgkWhite">
      <div className="central">
        <div className="logo col">
          <a href={props.edit_profile_pages_path}>  <img src={props.logo_image_path} className="logo-image" alt="logo-image"/></a>
        </div>
        <div className="col1 col">
          <div className="contBlock event">
            <div id="events" className="events">
            </div>
          </div>
          <div className="events-container">
          </div>
        </div>
        <div className="col1 col">
          <div className="contBlock">
            <Toolbar/>
          </div>
        </div>
      </div>
    </nav>
  </Aux>
)

export default navigation;