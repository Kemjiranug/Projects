from elasticsearch import Elasticsearch, helpers
import json

es = Elasticsearch(
    "https://localhost:9200",
    basic_auth=("elastic", "C1DKSSdhDGeN_7sAv8eq"),
    verify_certs=False
)

with open('sanrio.json', 'r') as file:
    data = json.load(file)

cleaned_data = []
for record in data:
    fa = record.get("first_appearance", None)
    record["first_appearance"] = int(fa) if str(fa).isdigit() else 0
    cleaned_data.append(record)

actions = [
    {"_index": "sanrio_characters", 
     "_id": record["name"],
     "_source": record} 
    for record in cleaned_data
]

try:
    success, _ = helpers.bulk(es, actions)
    print(f"{success} documents imported successfully.")
except helpers.BulkIndexError as e:
    print("Some documents failed to index.")
    for error in e.errors:
        print(json.dumps(error, indent=2))
