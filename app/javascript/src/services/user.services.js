import * as axios from "../network/network";
const config = require("../config/apiconfig.json");

class User {
  static login = (data) => {
    return axios.appRequest(
      {
        method: axios.POST,
        url: config.user.login,
        data: data,
      },
      true
    );
  };
}
export default User;
