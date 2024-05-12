'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "7563afc98450e8272d87655c522deade",
"manifest.json": "ee6b0836d54ca4b57b380461595e00dc",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "654a8786f693b25143f3469844ea841b",
"/": "654a8786f693b25143f3469844ea841b",
"canvaskit/canvaskit.js.symbols": "bfe5b35e2e324e98853299399ad9098e",
"canvaskit/skwasm.js": "f17a293d422e2c0b3a04962e68236cc2",
"canvaskit/canvaskit.wasm": "3e05c126f3b05d3e58cfacfbdbbc2efb",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/chromium/canvaskit.js.symbols": "5781e1286bd92ff76563a7c4743348c6",
"canvaskit/chromium/canvaskit.wasm": "82387ece3381c2b46a0629fd9de50f00",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/skwasm.wasm": "b8708f0f4a96eeb9b841e8dbc9e66f9c",
"canvaskit/skwasm.js.symbols": "016a880a747a593960785246eab4d7b9",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "c09a1b96dae5a89639b2ed0ea879925a",
"assets/NOTICES": "47b23699453559eaf5dd3b212e9487b3",
"assets/assets/a11.png": "c0cc063e5affaebdf99fc9efe7756951",
"assets/assets/Wearver.jpg": "73694a4d19a3ca130a840736b2e6d2e9",
"assets/assets/a15.png": "b49ea33bdf7718670cab6dbe1f2279c9",
"assets/assets/new.png": "9c6c1ea928fb55689620f293e9ba9dfa",
"assets/assets/a17.png": "e8e5dabd3b5b400fc47213ec9a032a42",
"assets/assets/a18.png": "02bb9cf295122bb91fa0f1f8096124f8",
"assets/assets/a3.png": "9311bd808b33087b3ce7cb08c391d9f3",
"assets/assets/a5.png": "325d8f134f11f79c162eaa2ea7dc4607",
"assets/assets/apple.otf": "1bff169d536b12e9ae57cd6f088d53d3",
"assets/assets/a6.png": "d76dd117659739931ad9fe5c14a6561b",
"assets/assets/backgr.png": "20f1333354d7e420edd4d39c8503eae0",
"assets/assets/commercial.jpg": "089c186c4edce265090bb8d342dbdd0e",
"assets/assets/logo.png": "16f156b41eab077732b332eb31e8615a",
"assets/assets/exotic.png": "4b6edb18f001d6c27e089f9d8ce53dee",
"assets/assets/street.png": "54f4859d4a8fb42b64793e6699d402d9",
"assets/assets/a14.png": "c34b9123668e86902af9d52e207dc3dd",
"assets/assets/Capture%2520d%25E2%2580%2599%25C3%25A9cran%25202023-09-08%2520%25C3%25A0%252014.56.05.png": "4c96c1ef7d6f3c7dccf867d03d916c12",
"assets/assets/a9.png": "9ffc0c89f040f8cc5959e7f972e81d68",
"assets/assets/classic.png": "591fdc630823801e656068519252c90f",
"assets/assets/logo2.gif": "feaa7ab70f5f7f6458f9122afa2a9b37",
"assets/assets/tshirt.png": "1acf580af3063a0938ebd5f6f6ea8524",
"assets/assets/art.png": "27b900007de3c0488e12e9da7509c30b",
"assets/assets/banner.png": "fd894a661c75241d954f041915c751c3",
"assets/assets/a13.png": "5bfaddd6c77fe4c3af1320ec8e113812",
"assets/assets/a8.png": "e46818ee25acdc71564683525f9aa022",
"assets/assets/bold.otf": "8daf0546ac7662756f96d34988f75b4d",
"assets/assets/top1.png": "cbccfbbd0e90d7d320dd337f437dda61",
"assets/assets/a16.png": "8fb44f34ac4af0377a74c0345ee71df1",
"assets/assets/a12.png": "27ef11317500985f5ad5d5e92dd230cf",
"assets/assets/font.otf": "a50f39909e4d957de812f82fcdaf1bd7",
"assets/assets/a1.png": "39f7837e771edb8bad30765fca640a91",
"assets/assets/test.gif": "d9f7a369d2d94a7d87c4f6969860887d",
"assets/assets/banniere.jpg": "164ad9351561cd507c58dba881c642dd",
"assets/assets/a2.png": "47fadc65d5c3aece8474ad10ce7730fb",
"assets/assets/a4.png": "692f4b65ff0ff231e8ec1ca9c86fc80b",
"assets/assets/backgr.jpg": "0ef2d62ab08a4208c2e21d713dbd6e08",
"assets/assets/bag.png": "828e90af928e6a81cb07b72f2921acb0",
"assets/assets/wearver_icon.jpg": "e0a392b3c968ab51cbdd2d673b9a6048",
"assets/assets/Wearver.png": "b6efb25bc361c11254909476050e8796",
"assets/assets/celebrate.gif": "e74b102bbf6907ab94b495749062b916",
"assets/assets/a10.png": "2d787a81be33c7fa228bf0613e0c947a",
"assets/assets/a7.png": "99fbbdc9101883a85b2df6aa49d37f0c",
"assets/assets/background.png": "924b7576fe65e97026310c49f913d946",
"assets/assets/apple2.otf": "ac3db9f731cd4f679fd329a5d41c8bd3",
"assets/AssetManifest.bin.json": "a462cb4687ca3d219e83cbec8986bc5c",
"assets/fonts/MaterialIcons-Regular.otf": "a56e182d9b0a25edbee4f37a302fc6e1",
"assets/AssetManifest.bin": "110a561daabca78370d167b94ca4a1e2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/FontManifest.json": "f49ed79208f9664bd5a5f49a8cd7fe9b",
"version.json": "761ecd3e342c39fa724e5026ac3073df",
"main.dart.js": "a6938bc55b2b029f3d79dd6043f54c8a"};
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
