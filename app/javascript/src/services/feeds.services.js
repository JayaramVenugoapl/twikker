import * as axios from "../network/network";
const config = require("../config/apiconfig.json");

class Feeds {
  static list = (params) => {
    return axios.appRequest(
      {
        method: axios.GET,
        url: config.feeds,
        params: params,
      },
      true
    );
  };
}
export default Feeds;
