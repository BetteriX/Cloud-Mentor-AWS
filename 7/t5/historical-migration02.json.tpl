{
    "rules": [
      {
        "rule-type": "selection",
        "rule-id": "1",
        "rule-name": "1",
        "object-locator": {
          "schema-name": "imdb",
          "table-name": "title_akas",
          "table-type": "table"
        },
        "rule-action": "include",
        "filters": [
          {
            "filter-type": "source",
            "column-name": "titleId",
            "filter-conditions": [
		{ "filter-operator": "eq", "value": "tt0027125" },
            	{ "filter-operator": "eq", "value": "tt0036855" },
            	{ "filter-operator": "eq", "value": "tt0037382" },
            	{ "filter-operator": "eq", "value": "tt0038109" },
            	{ "filter-operator": "eq", "value": "tt0038355" },
            	{ "filter-operator": "eq", "value": "tt0038787" },
            	{ "filter-operator": "eq", "value": "tt0049189" },
           	{ "filter-operator": "eq", "value": "tt0050419" },
            	{ "filter-operator": "eq", "value": "tt0050976" },
            	{ "filter-operator": "eq", "value": "tt0050986" },
            	{ "filter-operator": "eq", "value": "tt0053137" },
            	{ "filter-operator": "eq", "value": "tt0054452" },
            	{ "filter-operator": "eq", "value": "tt0056404" },
            	{ "filter-operator": "eq", "value": "tt0057345" },
            	{ "filter-operator": "eq", "value": "tt0069467" },
            	{ "filter-operator": "eq", "value": "tt0072308" },
            	{ "filter-operator": "eq", "value": "tt0072562" },
            	{ "filter-operator": "eq", "value": "tt0075213" },
            	{ "filter-operator": "eq", "value": "tt0077975" },
            	{ "filter-operator": "eq", "value": "tt0078723" },
            	{ "filter-operator": "eq", "value": "tt0080455" },
            	{ "filter-operator": "eq", "value": "tt0083922" },
            	{ "filter-operator": "eq", "value": "tt0117057" }
           ]
          }
        ]
      },
      {
        "rule-type": "object-mapping",
        "rule-id": "2",
        "rule-name": "2",
        "rule-action": "map-record-to-record",
        "object-locator": {
          "schema-name": "imdb",
          "table-name": "title_akas",
          "table-type": "table"
        },
        "target-table-name": "movies",
        "mapping-parameters": {
          "partition-key-name": "mpkey",
          "sort-key-name": "mskey",
          "exclude-columns": [],
          "attribute-mappings": [
            {
              "target-attribute-name": "mpkey",
              "attribute-type": "scalar",
              "attribute-sub-type": "string",
              "value": "${titleId}"
            },
            {
              "target-attribute-name": "mskey",
              "attribute-type": "scalar",
              "attribute-sub-type": "string",
              "value": "REGN|${region}"
            }
          ]
        }
      }
    ]
  }
