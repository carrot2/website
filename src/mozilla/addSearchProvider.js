
/*
 * This JavaScript code reshaped from the Mozilla project.
 * http://mycroft.mozdev.org/default.js
 */

function addEngine(srcURL, iconURL, engineName, categoryName)
{
  if ((typeof window.sidebar == "object") && (typeof window.sidebar.addSearchEngine == "function")) {
    window.sidebar.addSearchEngine(
      srcURL, iconURL, engineName, categoryName);
  } else {
    alert("You will need a browser which supports Sherlock to install this plugin (Mozilla 1.x).");
  }
}

function addOpenSearch(openSearchDescriptorURL)
{
  if ((typeof window.external == "object") && ((typeof window.external.AddSearchProvider == "unknown") || (typeof window.external.AddSearchProvider == "function"))) {
      window.external.AddSearchProvider(openSearchDescriptorURL);
  } else {
    alert("You will need a browser which supports OpenSearch to install this plugin (Mozilla 2.x or IE7+).");
  }
}
