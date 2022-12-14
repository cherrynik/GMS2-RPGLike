{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 144713361056071918,
  "extensionVersion": "2.0.1",
  "packageId": "",
  "productId": "ACBD3CFF4E539AD869A0E8E3B4B022DD",
  "author": "",
  "date": "2019-04-18T01:48:08",
  "license": "Free to use, also for commercial games.",
  "description": "",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"filename":"GMAssert.gml","origname":"extensions\\GMAssert.gml","init":"","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"__gma_assert_error__","kind":11,"help":"__gma_assert_error__(message, expected, got)","hidden":false,"returnType":2,"argCount":3,"args":[
            1,
            2,
            2,
          ],"resourceVersion":"1.0","name":"__gma_assert_error__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_assert_error_simple__","kind":11,"help":"__gma_assert_error_simple__(message, got)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"__gma_assert_error_simple__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_assert_error_raw__","kind":11,"help":"__gma_assert_error_raw__(message, expected, got)","hidden":false,"returnType":2,"argCount":3,"args":[
            1,
            2,
            2,
          ],"resourceVersion":"1.0","name":"__gma_assert_error_raw__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_equal__","kind":11,"help":"__gma_equal__(got, expected)","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"__gma_equal__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_equalish__","kind":11,"help":"__gma_equalish__(got, expected)","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"__gma_equalish__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_greater_than__","kind":11,"help":"__gma_greater_than__(got, expected)","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"__gma_greater_than__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_less_than__","kind":11,"help":"__gma_less_than__(got, expected)","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"__gma_less_than__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_greater_than_or_equal__","kind":11,"help":"__gma_greater_than_or_equal__(got, expected)","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"__gma_greater_than_or_equal__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_less_than_or_equal__","kind":11,"help":"__gma_less_than_or_equal__(got, expected)","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"__gma_less_than_or_equal__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_debug_value__","kind":11,"help":"__gma_debug_value__(val, [noprefix])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"__gma_debug_value__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"__gma_debug_list_value__","kind":11,"help":"__gma_debug_list_value__(val)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"__gma_debug_list_value__","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert","kind":11,"help":"assert(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_fail","kind":11,"help":"assert_fail(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_fail","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_operation","kind":11,"help":"assert_operation(got, expected, op, invert, [msg], [debug_got], [debug_expected])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_operation","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_equal","kind":11,"help":"assert_equal(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_equal","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_equalish","kind":11,"help":"assert_equalish(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_equalish","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_is","kind":11,"help":"assert_is(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_is","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_not_equal","kind":11,"help":"assert_not_equal(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_not_equal","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_not_equalish","kind":11,"help":"assert_not_equalish(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_not_equalish","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_isnt","kind":11,"help":"assert_isnt(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_isnt","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_greater_than","kind":11,"help":"assert_greater_than(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_greater_than","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_less_than","kind":11,"help":"assert_less_than(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_less_than","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_greater_than_or_equal","kind":11,"help":"assert_greater_than_or_equal(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_greater_than_or_equal","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_less_than_or_equal","kind":11,"help":"assert_less_than_or_equal(got, expected, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_less_than_or_equal","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_is_string","kind":11,"help":"assert_is_string(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_is_string","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_is_real","kind":11,"help":"assert_is_real(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_is_real","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_is_array","kind":11,"help":"assert_is_array(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_is_array","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_is_defined","kind":11,"help":"assert_is_defined(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_is_defined","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_isnt_string","kind":11,"help":"assert_isnt_string(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_isnt_string","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_isnt_real","kind":11,"help":"assert_isnt_real(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_isnt_real","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_isnt_array","kind":11,"help":"assert_isnt_array(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_isnt_array","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_isnt_defined","kind":11,"help":"assert_isnt_defined(got, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_isnt_defined","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_in_range","kind":11,"help":"assert_in_range(got, lower, upper, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_in_range","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_not_in_range","kind":11,"help":"assert_not_in_range(got, lower, upper, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_not_in_range","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_contains","kind":11,"help":"assert_contains(got, content, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_contains","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_contains_exact","kind":11,"help":"assert_contains_exact(got, content, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_contains_exact","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_doesnt_contain","kind":11,"help":"assert_doesnt_contain(got, content, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_doesnt_contain","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"assert_doesnt_contain_exact","kind":11,"help":"assert_doesnt_contain_exact(got, content, [msg])","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"assert_doesnt_contain_exact","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":9223372036854775807,"order":[
        {"name":"__gma_assert_error__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_assert_error_simple__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_assert_error_raw__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_equal__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_equalish__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_greater_than__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_less_than__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_greater_than_or_equal__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_less_than_or_equal__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_debug_value__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"__gma_debug_list_value__","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_fail","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_operation","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_equal","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_equalish","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_is","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_not_equal","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_not_equalish","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_isnt","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_greater_than","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_less_than","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_greater_than_or_equal","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_less_than_or_equal","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_is_string","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_is_real","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_is_array","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_is_defined","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_isnt_string","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_isnt_real","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_isnt_array","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_isnt_defined","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_in_range","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_not_in_range","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_contains","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_contains_exact","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_doesnt_contain","path":"extensions/GMAssert/GMAssert.yy",},
        {"name":"assert_doesnt_contain_exact","path":"extensions/GMAssert/GMAssert.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"GMAssert.ext","origname":"extensions\\GMAssert.ext","init":"","final":"","kind":4,"uncompress":false,"functions":[],"constants":[
        {"value":"true","hidden":true,"resourceVersion":"1.0","name":"GMASSERT_ENABLED","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0.000001","hidden":true,"resourceVersion":"1.0","name":"GMASSERT_TOLERANCE","tags":[],"resourceType":"GMExtensionConstant",},
      ],"ProxyFiles":[],"copyToTargets":9223372036854775807,"order":[],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [
    "Scripts\\GMAssert\\__GMA_BREAKPOINT__.gml",
  ],
  "androidPermissions": [],
  "copyToTargets": 144713361056071918,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "GMAssert",
  "tags": [],
  "resourceType": "GMExtension",
}