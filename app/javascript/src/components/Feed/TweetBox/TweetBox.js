import React, { Component } from "react";
import { Avatar, Button, TextField } from "@material-ui/core";

let classes = require("./TweetBox.module.scss");

export default class TweetBox extends Component {
  constructor(props) {
    super(props);
    this.state = {
      message: "",
    };
  }
  setTweetMessage = (value) => {
    this.setState({ message: value });
  };

  render() {
    return (
      <div className={classes.tweetBox}>
        <form>
          <div className={classes.inputIconSection}>
            <Avatar src="https://kajabi-storefronts-production.global.ssl.fastly.net/kajabi-storefronts-production/themes/284832/settings_images/rLlCifhXRJiT0RoN2FjK_Logo_roundbackground_black.png" />
            <TextField
              onChange={(e) => this.setTweetMessage(e.target.value)}
              value={this.state.message}
              placeholder="What's happening?"
              type="text"
              className={classes.input}
              multiline
              variant="outlined"
            />
          </div>
          <Button className={classes.tweetButton} type="submit">
            Tweet
          </Button>
        </form>
      </div>
    );
  }
}
