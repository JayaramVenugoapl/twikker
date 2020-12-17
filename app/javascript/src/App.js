import React, { Component } from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import PrivateRoute from "./PrivateRoute";
import Feeds from "./containers/Feeds/Feeds";
import Authentication from "./containers/Authentication/Authentication";
import "./App.css";
export default class App extends Component {
  render() {
    return (
      <div>
        <BrowserRouter>
          <Switch>
            <Route exact path="/login" component={Authentication} />
            <PrivateRoute path="/" component={Feeds} />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}
