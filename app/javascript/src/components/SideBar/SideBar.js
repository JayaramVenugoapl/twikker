import React, { Component } from "react";
import TwitterIcon from "@material-ui/icons/Twitter";
import SidebarOption from "./SidebarOption/SidebarOption";
import HomeIcon from "@material-ui/icons/Home";
import PermIdentityIcon from "@material-ui/icons/PermIdentity";
import { Button } from "@material-ui/core";

let classes = require("./SideBar.module.scss");

export default class SideBar extends Component {
  render() {
    return (
      <div className={classes.sidebar}>
        <TwitterIcon className={classes.sidebar_twitterIcon} />

        <SidebarOption active Icon={HomeIcon} text="Home" />
        <SidebarOption Icon={PermIdentityIcon} text="Profile" />

        <Button variant="outlined" className={classes.sidebar_tweet} fullWidth>
          Tweet
        </Button>
      </div>
    );
  }
}
