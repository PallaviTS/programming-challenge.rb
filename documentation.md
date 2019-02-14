# TODO API documentation

### GET /todos
- Format
```
{
	"type": "array",
	"required": ["id", "title", "read", "created_at", "updated_at", "items"],
	"properties": {
		"id": {
			"type": "integer"
		},
		"title": {
			"type": "string"
		},
		"read": {
			"type": "boolean"
		},
		"created_at": {
			"type": "string",
			"format": "date-time"
		},
		"updated_at": {
			"type": "string",
			"format": "date-time"
		},
		"items": {
			"type": "array",
			"required": ["id", "title", "read", "created_at", "updated_at"],
			"properties": {
				"id": {
					"type": "integer"
				},
				"title": {
					"type": "string"
				},
				"read": {
					"type": "boolean"
				},
				"created_at": {
					"type": "string",
					"format": "date-time"
				},
				"updated_at": {
					"type": "string",
					"format": "date-time"
				}
			}
		}
	}
}
```
- Example GET /todos
```
[
    {
        "id": 2,
        "title": "welcome",
        "read": false,
        "created_at": "2019-02-14T07:04:49.776Z",
        "updated_at": "2019-02-14T07:04:49.776Z",
        "items": [
            {
                "id": 4,
                "title": "welcome",
                "read": true,
                "created_at": "2019-02-14T07:04:58.564Z",
                "updated_at": "2019-02-14T07:05:16.622Z"
            }
        ]
    }
]
```
### GET /todos/:id
- Format
```
{
	"type": "object",
	"required": ["id", "title", "read", "created_at", "updated_at", "items"],
	"properties": {
		"id": {
			"type": "integer"
		},
		"title": {
			"type": "string"
		},
		"read": {
			"type": "boolean"
		},
		"created_at": {
			"type": "string",
			"format": "date-time"
		},
		"updated_at": {
			"type": "string",
			"format": "date-time"
		},
		"items": {
			"type": "array",
			"required": ["id", "title", "read", "created_at", "updated_at"],
			"properties": {
				"id": {
					"type": "integer"
				},
				"title": {
					"type": "string"
				},
				"read": {
					"type": "boolean"
				},
				"created_at": {
					"type": "string",
					"format": "date-time"
				},
				"updated_at": {
					"type": "string",
					"format": "date-time"
				}
			}
		}
	}
}
```
- Example GET /todos/2
```
{
    "id": 2,
    "title": "welcome",
    "read": false,
    "created_at": "2019-02-14T07:04:49.776Z",
    "updated_at": "2019-02-14T07:04:49.776Z",
    "items": [
        {
            "id": 4,
            "title": "welcome",
            "read": true,
            "created_at": "2019-02-14T07:04:58.564Z",
            "updated_at": "2019-02-14T07:05:16.622Z"
        }
    ]
}
```
### POST /todos
- Example Payload
```
{
	"read": true,
	"title": "welcome"
}
```
### PUT /todos/:id
- Example /todos/2
```
{
	"read": true,
	"title": "welcome"
}
```
### DELETE /todos/:id
- Example
``` delete /todos/2 ```

================================================================================
### GET /todos/:todo_id/items
- Format

```
{
  "type": "array",
  "required": ["id", "title", "read", "created_at", "updated_at"],
  "properties": {
  	"id": {
  		"type": "integer"
  	},
  	"title": {
  		"type": "string"
  	},
  	"read": {
  		"type": "boolean"
  	},
  	"created_at": {
  		"type": "string",
  		"format": "date-time"
  	},
  	"updated_at": {
  		"type": "string",
  		"format": "date-time"
  	}
  }
}

```
- Example todos/2/items

```
[
    {
        "id": 4,
        "title": "welcome",
        "read": true,
        "created_at": "2019-02-14T07:04:58.564Z",
        "updated_at": "2019-02-14T07:05:16.622Z"
    }
]
```
### GET /todos/:todo_id/items/:id
- Format

```
{
  "type": "object",
  "required": ["id", "title", "read", "created_at", "updated_at"],
  "properties": {
  	"id": {
  		"type": "integer"
  	},
  	"title": {
  		"type": "string"
  	},
  	"read": {
  		"type": "boolean"
  	},
  	"created_at": {
  		"type": "string",
  		"format": "date-time"
  	},
  	"updated_at": {
  		"type": "string",
  		"format": "date-time"
  	}
  }
}

```
- Example GET /todos/2/items/4

```
{
    "id": 4,
    "title": "welcome",
    "read": true,
    "created_at": "2019-02-14T07:04:58.564Z",
    "updated_at": "2019-02-14T07:05:16.622Z"
}
```
### POST /todos/:todo_id/items
- Example Payload
```
{
	"read": true,
	"title": "welcome"
}
```
### PUT /todos/:todo_id/items/:id
- Example /todos/2/items/4
```
{
	"read": true,
	"title": "welcome"
}
```
### DELETE /todos/:todo_id/items/:id
- Example
``` delete /todos/2/items/4 ```
