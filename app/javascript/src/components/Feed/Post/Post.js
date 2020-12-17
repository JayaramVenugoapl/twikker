import React, { Component } from "react";
import { Avatar } from "@material-ui/core";
import VerifiedUserIcon from "@material-ui/icons/VerifiedUser";
import ChatBubbleOutlineIcon from "@material-ui/icons/ChatBubbleOutline";
import RepeatIcon from "@material-ui/icons/Repeat";
import FavoriteBorderIcon from "@material-ui/icons/FavoriteBorder";
import PublishIcon from "@material-ui/icons/Publish";

let classes = require("./Post.module.scss");

export default class Post extends Component {
  render() {
    const { displayName, username, verified, text, image, avatar } = this.props;
    return (
      <div className={classes.post}>
        <div className={classes.post_avatar}>
          <Avatar src={avatar} />
        </div>
        <div className={classes.post_body}>
          <div className={classes.post_header}>
            <div className={classes.post_headerText}>
              <h4>
                {displayName}{" "}
                <span className={classes.post_headerSpecial}>
                  {verified && (
                    <VerifiedUserIcon className={classes.post_badge} />
                  )}{" "}
                  @{username}
                </span>
              </h4>
            </div>
            <div className={classes.post_headerDescription}>
              <p>{text}</p>
            </div>
          </div>
          <img src={image} alt="" />
          <div className={classes.post_footer}>
            <ChatBubbleOutlineIcon fontSize="small" />
            <RepeatIcon fontSize="small" />
            <FavoriteBorderIcon fontSize="small" />
            <PublishIcon fontSize="small" />
          </div>
        </div>
      </div>
    );
  }
}
