'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "91a102f29092d4799a8c2b556976b305",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "cce8baa62a1964f8b44065076ca33a3a",
"main.dart.js_2.part.js": "752cc23e1b0194ca3b55a5188740259f",
"version.json": "38ad45ef2bcec833db1e1e8a2460399d",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"main.dart.js_1.part.js": "2bc6bc73a1368b48c7c0d285894291fe",
"main.dart.js": "35953f174dba9c1c0e6642fe6d1b2931",
"index.html": "5a025b6a5fce939d727d047dcf7e4de8",
"/": "5a025b6a5fce939d727d047dcf7e4de8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "57605af40fbfabd6d78ce18a7fdcf747",
"assets/AssetManifest.json": "6a0ee92cd91a63f5fef1c051b087de66",
"assets/AssetManifest.bin": "74b30d456b9dfeda74e3787cb8a122fb",
"assets/AssetManifest.bin.json": "1970c6d86ed29e7dc714f8e585d3a1b1",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "e2e341dee44a16b406570720e07b8243",
"assets/assets/img/gerardggf_logo.jpg": "6ae3629c1383edf7bd1c6b684c974a65",
"assets/assets/img/projects/cubetis_1.jpg": "819ef4773aa34f17403dd5662984538f",
"assets/assets/img/projects/cubetis_3.jpg": "bb6cefb1cf251b9147fbbe0ee5da243f",
"assets/assets/img/projects/concolegas_2.jpg": "d8b4df7fa9e37fd162b310bee1552749",
"assets/assets/img/projects/ebntz_4.jpg": "3beb3c54510e5207171c19f72f30376a",
"assets/assets/img/projects/ebntz_1.jpg": "797523bc3fd64fdca3651ceec0e905d2",
"assets/assets/img/projects/cubets_3.jpg": "bd2930eb6040794a173ef2da1df875c3",
"assets/assets/img/projects/llocs_4.jpg": "3494c28e78dd41446e93b1be7ff2cef2",
"assets/assets/img/projects/fluttertranslations.PNG": "9eff2984dc8b68a673fcfa910d07ad63",
"assets/assets/img/projects/cubetis_4.jpg": "15b16282ceb3e15c08b323905370fc7b",
"assets/assets/img/projects/cubets_1.jpg": "661beb37ef5d398a8206f20096ccd97a",
"assets/assets/img/projects/cubets_2.jpg": "a4498ac5639ce86639bb614b4f51be4c",
"assets/assets/img/projects/llocs_2.jpg": "f8ba4759dd207a78d3866a05c0fef464",
"assets/assets/img/projects/concolegas_3.jpg": "3a0f7b3c54715c3db775c110d5e0abd9",
"assets/assets/img/projects/concolegas_1.jpg": "f4c9b34aded77a8e6fa82f303b5893ee",
"assets/assets/img/projects/ebntz_2.jpg": "294b47b8868dffc1568b1f7579bb2e0c",
"assets/assets/img/projects/cubetis_2.jpg": "32df8a97ab49fdb770c5289d4b0edd68",
"assets/assets/img/projects/llocs_3.jpg": "2cf54673b096da53971a3ab96795c926",
"assets/assets/img/projects/llocs_1.jpg": "34bb37e0f08e925fe9e6624aa22a32cd",
"assets/assets/img/projects/cubets_4.jpg": "5022242987b4fd0a3fb28cea29365583",
"assets/assets/img/projects/mboard.PNG": "9e92b17197439155ebe6de55add81c07",
"assets/assets/img/projects/concolegas_4.jpg": "2f633374b10e634a9c12a846dc3840d9",
"assets/assets/img/projects/ebntz_3.jpg": "3af3623daa56688a48880ae6825c1f65",
"assets/assets/img/bg.jpg": "36e84a75caf3962a486b292856a6e987",
"assets/assets/cv_esp.pdf": "be31c86a89e218a7979bdd37d8a8fc92",
"assets/assets/certificates/csharp.jpg": "e1bbd6ac2a4163208cd005997f47d2c1",
"assets/assets/certificates/manipulador_alimentos.PNG": "1e7de1b5044c95e880195b92ca4c1c15",
"assets/assets/certificates/intro_sql_server.PNG": "16dbbae4f266f8474c34c95fc5759788",
"assets/assets/certificates/php.jpg": "ab7229e969fb3cb5161118203eb69ee0",
"assets/assets/certificates/machine_learning.PNG": "d2c362a71d876b740cb44f03b3746641",
"assets/assets/certificates/intro_relational_sql.PNG": "27e1cbc0364fa8716bb91589b3f92192",
"assets/assets/certificates/mobile_apps_dev.PNG": "cc7765bd37f45df46cbca446cb92c404",
"assets/assets/certificates/flutter_desde_cero.PNG": "e1843a57e62fbe2f270d0ee3a28f0794",
"assets/assets/certificates/javascript.jpg": "a62589bcd0732d845107260364cb29fa",
"assets/assets/certificates/html.jpg": "5c727c23b4dddf9c4a871386f186efd9",
"assets/assets/certificates/mcd_level1.PNG": "53e92e773a6851f557f76b771521f7e9",
"assets/assets/certificates/intermediate_sql.PNG": "3d17d5e391435e7fdd5197e2883f014c",
"assets/assets/certificates/ciber_telecommute.PNG": "cacd6f6f0d977470723ddc8be25e0b10",
"assets/assets/certificates/functions_manipulating_sql.PNG": "b361cbaa3ec8f8f00704d45c3222f0b6",
"assets/assets/certificates/kotlin.jpg": "87d51754aabce323cd4957d01b728e3e",
"assets/assets/cv_en.pdf": "f6c9b190c5d5b846cc9b57d05b419420"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
