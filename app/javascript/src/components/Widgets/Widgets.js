import React, { Component } from "react";
import SearchIcon from "@material-ui/icons/Search";

let classes = require("./Widgets.module.scss");
export default class Widgets extends Component {
  render() {
    return (
      <div className={classes.widgets}>
        <div className={classes.widgets_input}>
          <SearchIcon className={classes.widgets_searchIcon} />
          <input placeholder="Search Twitter" type="text" />
        </div>

        <div className={classes.widgets_widgetContainer}>
          <h2>What's happening</h2>
        </div>
      </div>
    );
  }
}
