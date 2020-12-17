/*
 * Project          : RadYes
 * Source filename  : network.js
 * Copyright        : Copyright © 2019, One Click Digital Engine,
 *                    Written under contract by Robosoft Technologies Pvt. Ltd.
 */

import axios from "axios";

const apiConfig = require("../config/apiconfig.json");
const env = process.env.NODE_ENV;
console.log(process.env.NODE_ENV);
const baseURL =
  env === "development"
    ? apiConfig.baseURLs.development
    : apiConfig.baseURLs.production;

/**
 * Create an Axios Client with defaults
 */

export const GET = "GET";
export const POST = "POST";
export const DELETE = "DELETE";
export const PATCH = "PATCH";
export const PUT = "PUT";

const appClient = axios.create({
  baseURL: baseURL,

  headers: {
    Accept: "application/json",
    "Content-Type": "application/json",
  },
});

appClient.interceptors.request.use(function (request) {
  request.headers["Authorization"] = localStorage.getItem("AuthToken");
  return request;
});

appClient.interceptors.response.use(
  function (response) {
    return response;
  },
  function (error) {
    return Promise.reject(error);
  }
);

/**
 * Request Wrapper with base url set to _baseUrl.
 */
const appRequest = function (options) {
  const onSuccess = function (response) {
    if (response && response.data.meta && response.data.meta) {
      return response.data;
    } else {
      return false;
    }
  };

  const onError = function (error) {
    if (error.response) {
      errorHandling(error.response);
      return Promise.reject(error.response || error.message);
    } else {
      console.log("Error Message:", error.message);
    }
    return Promise.reject(error.response);
  };

  const errorHandling = (response) => {
    if (response.data && response.status === 401) {
      console.log("Error Message:", response);
    }
  };
  return appClient(options).then(onSuccess).catch(onError);
};

export { appRequest, baseURL };
