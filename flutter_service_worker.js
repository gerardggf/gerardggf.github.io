'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5afbad15e128be2a027c58989583738f",
"assets/AssetManifest.json": "341d055eeaf46e9815b0561df6274aa6",
"assets/assets/certifications/ciber_telecommute.png": "cacd6f6f0d977470723ddc8be25e0b10",
"assets/assets/certifications/csharp.jpg": "e1bbd6ac2a4163208cd005997f47d2c1",
"assets/assets/certifications/flutter_desde_cero.png": "e1843a57e62fbe2f270d0ee3a28f0794",
"assets/assets/certifications/functions_manipulating_sql.png": "b361cbaa3ec8f8f00704d45c3222f0b6",
"assets/assets/certifications/html.jpg": "5c727c23b4dddf9c4a871386f186efd9",
"assets/assets/certifications/intermediate_sql.png": "3d17d5e391435e7fdd5197e2883f014c",
"assets/assets/certifications/intro_relational_sql.png": "27e1cbc0364fa8716bb91589b3f92192",
"assets/assets/certifications/intro_sql_server.png": "16dbbae4f266f8474c34c95fc5759788",
"assets/assets/certifications/kotlin.jpg": "87d51754aabce323cd4957d01b728e3e",
"assets/assets/certifications/machine_learning.png": "d2c362a71d876b740cb44f03b3746641",
"assets/assets/certifications/manipulador_alimentos.png": "1e7de1b5044c95e880195b92ca4c1c15",
"assets/assets/certifications/mcd_level1.png": "53e92e773a6851f557f76b771521f7e9",
"assets/assets/certifications/mobile_apps_dev.png": "cc7765bd37f45df46cbca446cb92c404",
"assets/assets/certifications/php.jpg": "ab7229e969fb3cb5161118203eb69ee0",
"assets/assets/cv_english.pdf": "f43e118800ed3100b4497693106bb968",
"assets/assets/cv_espanol.pdf": "874cd4ccc4c77c474013d8c44f9fba1a",
"assets/assets/icons/cambridge.png": "44c6f2d4779745b648be7ce5af834253",
"assets/assets/icons/datacamp.png": "01812e3ccf69b4b335f775fc3cf820dc",
"assets/assets/icons/edx.png": "340e835715e5bfbd70e14928badda289",
"assets/assets/icons/github.png": "ec3a60c8c6539a07eb70b52f6737ea6e",
"assets/assets/icons/google_activate.png": "536172541b0ce957cb011406a3d95942",
"assets/assets/icons/linkedin.png": "1df3a3449ae046b9754318d373d5bc84",
"assets/assets/icons/mulesoft.png": "8a7c2f5137626dbe0e3803eefabf18e6",
"assets/assets/icons/programming_hub.png": "637dda7bd5c867f3c1ce70aa7a4d73e0",
"assets/assets/icons/sololearn.png": "0fdf6bf7f31750106b2e08d9d773ba8e",
"assets/assets/icons/uab.png": "b29a91d8626c9b8d126337348b4e44a0",
"assets/assets/icons/udemy.png": "1e387f37c71689e30ebd489db7e27b2e",
"assets/assets/img/bg.jpg": "36e84a75caf3962a486b292856a6e987",
"assets/assets/img/gerardggf_logo.jpg": "6ae3629c1383edf7bd1c6b684c974a65",
"assets/assets/img/projects/concolegas_1.jpg": "f4c9b34aded77a8e6fa82f303b5893ee",
"assets/assets/img/projects/concolegas_2.jpg": "d8b4df7fa9e37fd162b310bee1552749",
"assets/assets/img/projects/concolegas_3.jpg": "3a0f7b3c54715c3db775c110d5e0abd9",
"assets/assets/img/projects/concolegas_4.jpg": "2f633374b10e634a9c12a846dc3840d9",
"assets/assets/img/projects/cubetis_1.jpg": "ece12344c208fd25f674e08ad5a7900c",
"assets/assets/img/projects/cubetis_2.jpg": "bd3df71c040974fc858b3b23bd879e30",
"assets/assets/img/projects/cubetis_3.jpg": "7d63a742b5cde3d47fa9bb21ebf1c156",
"assets/assets/img/projects/cubetis_4.jpg": "7bf04b55195639ad340b88dd4d8c99d2",
"assets/assets/img/projects/cubets_1.jpg": "661beb37ef5d398a8206f20096ccd97a",
"assets/assets/img/projects/cubets_2.jpg": "a4498ac5639ce86639bb614b4f51be4c",
"assets/assets/img/projects/cubets_3.jpg": "bd2930eb6040794a173ef2da1df875c3",
"assets/assets/img/projects/cubets_4.jpg": "5022242987b4fd0a3fb28cea29365583",
"assets/assets/img/projects/ebntz_1.jpg": "4c22491612b5d0f01ff15f72732e6237",
"assets/assets/img/projects/ebntz_2.jpg": "97b17368452d53de5530e9cc1c4cac9c",
"assets/assets/img/projects/ebntz_3.jpg": "d49aa45d740bdef8fcb4f47594c9e0dd",
"assets/assets/img/projects/ebntz_4.jpg": "b0c23d7b80c8ca78f045e7ab74441dbf",
"assets/assets/img/projects/fluttertranslations.png": "9eff2984dc8b68a673fcfa910d07ad63",
"assets/assets/img/projects/llocs_1.jpg": "34bb37e0f08e925fe9e6624aa22a32cd",
"assets/assets/img/projects/llocs_2.jpg": "f8ba4759dd207a78d3866a05c0fef464",
"assets/assets/img/projects/llocs_3.jpg": "2cf54673b096da53971a3ab96795c926",
"assets/assets/img/projects/llocs_4.jpg": "3494c28e78dd41446e93b1be7ff2cef2",
"assets/assets/img/projects/mboard.png": "9e92b17197439155ebe6de55add81c07",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c8e1f72e0755d6f6974ea2e70d3e7e7b",
"assets/NOTICES": "da523cdd974ec4b833beb56580bcca73",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "7c4a2df28f03b428a63fb10250463cf5",
"canvaskit/canvaskit.wasm": "77b527da2c9f0d9b997ae4e36fd621b1",
"canvaskit/chromium/canvaskit.js": "2236901a15edcdf16e2eaf18ea7a7415",
"canvaskit/chromium/canvaskit.wasm": "3699c97bf8fa2d0f2d3ca56efeb66a24",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "7833daee1cacf363c56384e9a7506981",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a96e4cac3d2da39d86bf871613180e7b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a4bf8a477220c6c00862f19a74078414",
"/": "a4bf8a477220c6c00862f19a74078414",
"main.dart.js": "a8d6a650c4f11052b1568da60f9a4352",
"manifest.json": "a7fdcbeababa93713fc77cc92147015d",
"version.json": "38ad45ef2bcec833db1e1e8a2460399d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
