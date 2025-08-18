'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "94a10984b185becc9a5734ff42578dcd",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "cce8baa62a1964f8b44065076ca33a3a",
"main.dart.js_2.part.js": "4ce307321660fea3df8fda0108b296d8",
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
"main.dart.js_1.part.js": "d3e4be0394080d6170eb27c2fedd3433",
"main.dart.js": "81b9ef2252c4e1615cd42aeeb3a9880e",
"index.html": "4a2b726dfda27a60a5570f7634ca3041",
"/": "4a2b726dfda27a60a5570f7634ca3041",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "57605af40fbfabd6d78ce18a7fdcf747",
"assets/AssetManifest.json": "07533865adbddcab30277e5b75dab995",
"assets/AssetManifest.bin": "1783781b031bcd8a82e1907e10f16218",
"assets/AssetManifest.bin.json": "2f9903113cfc974b2889b29ce0b50471",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "1194e89a04e1626fca86c95d1a6d7071",
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
"assets/assets/pdfs/ciberseguridad_teletrabajo.pdf": "917ec34301c1aacce5366772e71e9676",
"assets/assets/pdfs/intro_sql_server.pdf": "1a01f1db6b75a156191306e04c02f96d",
"assets/assets/pdfs/mule1.pdf": "e86e1ec427d80d0aff30e6d28d991b8b",
"assets/assets/pdfs/flutter_avanzado_udemy.pdf": "26e756451359fb7504599f7ee9e9d0dd",
"assets/assets/pdfs/intermediate_sql_server.pdf": "b15482ec31e8720ff07cf07a43fc42d3",
"assets/assets/pdfs/cv_esp.pdf": "be31c86a89e218a7979bdd37d8a8fc92",
"assets/assets/pdfs/intro_mcp.pdf": "fa4f7764655a8485572e07a276dcd140",
"assets/assets/pdfs/functions_manipul_sql.pdf": "8d31431e5eea81ad636c41ceaa0dc657",
"assets/assets/pdfs/flutter_desde_cero_udemy.pdf": "54c59bfe29090eb55f772ffd8b9c1721",
"assets/assets/pdfs/cv_en.pdf": "f6c9b190c5d5b846cc9b57d05b419420",
"assets/assets/pdfs/desarrollo_apps.pdf": "3a129e5e7adf7c76c7a04d1624f51639",
"assets/assets/pdfs/intro_db_sql.pdf": "b32218698002a22764ecb2f698dbca8a"};
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
