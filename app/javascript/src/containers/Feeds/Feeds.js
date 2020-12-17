import React, { Component } from "react";
import Feed from "../../components/Feed/Feed";
import FeedList from "../../services/feeds.services";
const classes = require("./Feeds.module.scss");

export default class Feeds extends Component {
  constructor(props) {
    super(props);
    this.state = {
      feeds: [],
    };
  }
  componentDidMount = () => {
    this.getFeeds();
  };

  navigateDeliveryPage = () => {
    this.props.history.push("/login");
  };

  async getFeeds() {
    await FeedList.list().then((response) => {
      console.log(response);
    });
  }

  render() {
    return (
      <div className={classes.feedsContainer}>
        <Feed />
      </div>
    );
  }
}
