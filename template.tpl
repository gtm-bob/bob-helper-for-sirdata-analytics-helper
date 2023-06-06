// Copyright 2023 Benoit OBERLE (gtm-bob.com)

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Bob\u0027s Helper for Sirdata Analytics Helper",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Use this template to replay events once Sirdata Analytics Helper\u0027s cookieless UUID is ready.",
  "categories": ["ANALYTICS", "TAG_GESTION"],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "group1",
    "displayName": "Description",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "LABEL",
        "name": "label1",
        "displayName": "All events played before Sirdata Analytics Helper\u0027s cookieless UUID is ready event will be played again once it is. All events pushed in dataLayer after this UUID is ready will continue to trigger your tags."
      },
      {
        "type": "LABEL",
        "name": "label3",
        "displayName": "\u0026nbsp;"
      },
      {
        "type": "LABEL",
        "name": "label2",
        "displayName": "Use this template if :"
      },
      {
        "type": "LABEL",
        "name": "label2_1",
        "displayName": "- you need to be able to fire a given tag several times"
      },
      {
        "type": "LABEL",
        "name": "label2_2",
        "displayName": "- you need to preserve the evenModel structure (which doesn\u0027t work with group of triggers)"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "group1 (5)",
    "displayName": "1) Set the triggers below",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "LABEL",
        "name": "label4",
        "displayName": "First of all, please set below the different events you want this tag to be triggered on : all this events will be triggered again when your main event will be fired, or triggered as usual if your main event has been fired already. DO NOT FORGET to add the \"sdh_UUID_ready\" event trigger."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "group1 (6)",
    "displayName": "2) Modify your current tags trigger to add an exception",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "LABEL",
        "name": "label5",
        "displayName": "Do not forget to modify your GA4 tags and triggers, in order to add a blocker before the main event is ready."
      },
      {
        "type": "LABEL",
        "name": "label7",
        "displayName": "\u0026nbsp;"
      },
      {
        "type": "LABEL",
        "name": "label5 (2)",
        "displayName": "You can use the special Consent Mode signal \"analytics_helper_cookieless_ready\" in the advance settings (in the section \"Require additional consent for tag to fire\") to block and defer tags before cookieless UUID is ready."
      },
      {
        "type": "LABEL",
        "name": "label7 (2)",
        "displayName": "\u0026nbsp;"
      },
      {
        "type": "LABEL",
        "name": "label6",
        "displayName": "Do not use this blocking feature for the GA4 configuration tag, which should be set with the \"sdh_UUID_ready\" trigger only."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
log('Bob\'s Helper for Sirdata Analytics Helper : ', data);
data.ten = 'sdh_UUID_ready';
data.b_k = 'analytics_helper_cookieless_ready';

data.gtmTagId = data.gtmTagId.toString();
const getType = require('getType');
const Object = require('Object');

const in_array = function(a, b) {
  if (getType(a) !== 'string' || getType(b) !== 'array') {
    return false;
  }
  return b.filter(function (v) { return v == a; }).length ? true : false;
};

const in_array_v = function(a, b) {
  return in_array(a, Object.values(b));
};

const in_array_k = function(a, b) {
  return in_array(a, Object.keys(b));
};

const k = 'event';
const copyFromDataLayer = require('copyFromDataLayer');
const copyFromWindow = require('copyFromWindow');
const encodeUriComponent = require('encodeUriComponent');
const r = copyFromWindow('gtm_Bob.er.r');
data.en = copyFromDataLayer(k);
if (in_array(data.gtmTagId, r) || !data.gtmEventId || !data.en) {
  log('Bob\'s Helper for Sirdata Analytics Helper : trigger event fired already');
  data.gtmOnSuccess();
  return;
}

const updateConsentState = require('updateConsentState');
const setInWindow = require('setInWindow');
const getUrl = require('getUrl');
const h = getUrl('host');

var rq = copyFromWindow('gtm_Bob.er.q');
if (!rq) {
  setInWindow('gtm_Bob', {}, false);
  setInWindow('gtm_Bob.er', {}, false);
  rq = [];
  setInWindow('gtm_Bob.er.q', rq, true);
}

var ut = copyFromWindow('gtm_Bob.er.cb') || {};
if (!ut || !ut[data.gtmTagId]) {
  var u = {};
  u[data.b_k] = 'denied';
  updateConsentState(u);
  ut[data.gtmTagId] = data.b_k;
  setInWindow('gtm_Bob.er.cb', ut, true);
}

const isArrayEmptyOrUndefined = function(a) {
  if (getType(a) !== 'array' || a.length === 0) {
    return true;
  }
  return false;
};

const allIdsReady = function(needed, ready) {
  if (getType(needed) !== 'array' || getType(ready) !== 'array') {
    return;
  }
  var missing = needed.filter(function(x){
    return ready.indexOf(x) < 0;
  });
  return missing.length ? false : true;
};

if (data.en && data.en == data.ten) {
  var s1 = isArrayEmptyOrUndefined(r) ? [] : r;
  s1.push(data.gtmTagId);
  setInWindow('gtm_Bob.er.r', s1, true);
  if (data.b_k) {
    const isConsentGranted = require('isConsentGranted');
    if (!isConsentGranted(data.b_k)) {
      var u = {};
      u[data.b_k] = 'granted';
      updateConsentState(u);
    }
  }
  log('Bob\'s Helper for Sirdata Analytics Helper : event has been fired, queue is triggered');
  for (let i in rq) {
    if (typeof(rq[i].cb) == "function" && in_array(data.gtmTagId, rq[i].t)) {
      if (allIdsReady(Object.values(rq[i].t), Object.values(s1))) {
        rq[i].cb();
      }
    }
  }
  data.gtmOnSuccess();
  return;
}

const aliasInWindow = require('aliasInWindow');
const callInWindow = require('callInWindow');
const createArgumentsQueue = require('createArgumentsQueue');
const createQueue = require('createQueue');
const dln = 'dataLayer';
const d = createQueue(dln);
const dl = copyFromWindow(dln);

var e = dl.filter(function (d,v) { return d['gtm.uniqueEventId'] == data.gtmEventId; });
if (e.length == 0 && data.en) {
  e = dl.filter(function (d,v) { return d[k] == data.en; });
}
if (e.length == 0 && data.en) {
  e = dl.filter(function (d,v) { return d[0] == k && d[1] == data.en;});
}

if (e && e[e.length-1] && (e[e.length-1][k] || (typeof(e[e.length-1][0]) == 'string' && e[e.length-1][0] == k))) {
  const type = getType(e[e.length-1]);  
  var cbf = data.gtmOnFailure;
  if (type === 'array') {
    const gtag = createArgumentsQueue('gtm_Bob.er.g', dln);
    if (e[e.length-1].length == 2) {
      cbf = function(result){
        gtag(e[e.length-1][0], e[e.length-1][1]);
      };
    }
    else if (e[e.length-1].length == 3) {
      cbf = function(result){
        gtag(e[e.length-1][0], e[e.length-1][1], e[e.length-1][2]);
      };
    }
  }
  else if (type === 'object') {
    var push = {};
    for (var j in e[e.length-1]) {
      if (e[e.length-1].hasOwnProperty(j) && j !== 'gtm.uniqueEventId') {
        push[j] = e[e.length-1][j];
      }
    }
    cbf = function(result){
      d(push);
    };
  }
  if (rq[data.en] && rq[data.en].t) {  
    if (!in_array(data.gtmTagId, rq[data.en].t)) {
      rq[data.en].t.push(data.gtmTagId);
    }
  }
  else {
    rq[data.en] = {e: data.en, t: [data.gtmTagId], cb: cbf};
  }
  setInWindow('gtm_Bob.er.q', rq, true);
  data.gtmOnSuccess();
  return;
}

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob.er.q"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob.er.g"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob.er.r"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob.er"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob.er.v"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob.er.cb"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob.er.dsq"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_Bob.er.sl"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "gtm.uniqueEventId"
              },
              {
                "type": 1,
                "string": "event"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_bob_trigger_1"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_bob_trigger_2"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_bob_trigger_3"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_bob_trigger_4"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_bob_trigger_5"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_bob_trigger_6"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_bob_trigger_7"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtm_bob_trigger_8"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_helper_cookieless_ready"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 06/06/2023 13:41:34


