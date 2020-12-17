import React, { Component } from "react";

let classes = require("./SidebarOption.module.scss");

export default class SidebarOption extends Component {
  render() {
    const { active, text, Icon } = this.props;
    return (
      <div
        className={[
          classes.sidebarOption,
          active && classes.sidebarOptionActive,
        ].join(" ")}
      >
        <Icon className={classes.sidebarOptionIcon} />
        <h4>{text}</h4>
      </div>
    );
  }
}
