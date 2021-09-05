'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "93032701065bfdc9bf52b6b48b3faffe",
"assets/assets/fonts/Gilroy/Gilroy-Bold.ttf": "b381c2abd2972024a6a7e3d882208d9b",
"assets/assets/fonts/Gilroy/Gilroy-ExtraBold.ttf": "b487bfc69e2a1cb0578fe2a910da8b2b",
"assets/assets/fonts/Gilroy/Gilroy-Light.ttf": "4b236c6cb4c59d66b80dde6f9c614ebd",
"assets/assets/fonts/Gilroy/Gilroy-Medium.ttf": "c83281ae1ca703d0741a770ee7e7c091",
"assets/assets/fonts/Gilroy/Gilroy-Regular.ttf": "31ff7c1a62a300dbbf9656b4ba14a0d5",
"assets/assets/fonts/Gilroy/Gilroy-SemiBold.ttf": "a5cf732b15078843b237bd58f3ed44cd",
"assets/assets/fonts/Gilroy/Gilroy-Thin.ttf": "437d0d08a241c1d07517909f70c8ef11",
"assets/assets/fonts/Gilroy/Gilroy-UltraLight.ttf": "f5bd9c00f2cc7353bfc80031dd5d9394",
"assets/assets/images/sallaty-users/1.jpg": "558535c8da715a11257c76b275235f9c",
"assets/assets/images/sallaty-users/10.png": "340dbf473dbc0f99795d43156cf551af",
"assets/assets/images/sallaty-users/11.png": "b924ffb781f01d92075df7a32e7ab8ae",
"assets/assets/images/sallaty-users/12.png": "b4c81dc580c8e6487fe6768658fbbb88",
"assets/assets/images/sallaty-users/13.png": "45a6d087fae1485431bd0143df362ef1",
"assets/assets/images/sallaty-users/14.jpg": "b3ffa2d8030ebd3bfcd4473f5a2fdf54",
"assets/assets/images/sallaty-users/15.jpg": "b63c5c7671581d0b21de2fdcd79d3235",
"assets/assets/images/sallaty-users/2.jpg": "9e7a4dadbb42d114ed3249ac5593c316",
"assets/assets/images/sallaty-users/3.jpg": "d565c3515ea935fae20c9ae3c6b9379a",
"assets/assets/images/sallaty-users/4.jpg": "e508e883d804ed4f6287055d79555e8e",
"assets/assets/images/sallaty-users/5.jpg": "2b952db1e214ecbd2c42295b67212604",
"assets/assets/images/sallaty-users/6.jpg": "92f44af5f922176ecf8f36429abcee7b",
"assets/assets/images/sallaty-users/7.png": "9b0e0a9eea1009f65f0a4474b4c5b0e6",
"assets/assets/images/sallaty-users/8.jpg": "26ff9fa8cd4a8ec85b2a2145a84bdb65",
"assets/assets/images/sallaty-users/9.jpg": "7b29289cdcb4f58ca8117f24b7f5d7f7",
"assets/assets/images/timeplus/1.png": "396757b39d2b9a8b84fb5cadd016046e",
"assets/assets/images/timeplus/2.png": "eeec333f9e299e362c604fceb3ee0635",
"assets/assets/images/timeplus/3.png": "8c22c7cec5209cf3b7fdf9c0b4818ebd",
"assets/assets/images/timeplus/4.png": "4d0cc8fc3be7db5d139efa31a560bac9",
"assets/assets/images/timeplus/5.png": "2d0f75e6e0c503f07a57d8dc6dee1905",
"assets/assets/images/timeplus/6.png": "39723dd5a12ea4b296a2ffc5560a6f61",
"assets/assets/images/timeplus/7.png": "3a48a8a2e9e8590bd8a1c605cfc24501",
"assets/assets/resume/resume.pdf": "6d130ac0309e1b1a93b4e524d333b366",
"assets/FontManifest.json": "578d482f7aa8ae49d49fe79adc27d194",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "a343d01e8cc8e460d0526fb92f70b5f9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/resume/resume.pdf": "3dab4b0cd0a4f429e182dfff8e86264d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "1ebe5b580c171e07788a1d52df1c232c",
"/": "1ebe5b580c171e07788a1d52df1c232c",
"main.dart.js": "ef7281597b51dd087dd6394cac817c2d",
"manifest.json": "5a2c0526f1fe73e6f211bc7a9d15c210",
"version.json": "426313f2f3133c2f20415344c4a22df3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
