from flask import Flask, render_template, request
from elasticsearch import Elasticsearch

app = Flask(__name__)

es = Elasticsearch(
    "https://localhost:9200",
    basic_auth=("elastic", "C1DKSSdhDGeN_7sAv8eq"),
    verify_certs=False
)

INDEX_NAME = "sanrio_characters"

# search template ID
TEMPLATE_ONE_WORD = "sanrio_one_word_search"
TEMPLATE_MULTI_WORD = "sanrio_multi_word_search"

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/search")
def search():
    q = request.args.get("q", "").strip()
    if not q:
        return render_template("searchpage.html", q=q, results=[])

    try:
        words = q.split()
        
        # determine which template to use
        if len(words) == 1:
            template_id = TEMPLATE_ONE_WORD
            print("=" * 80)
            print(f"ONE-WORD SEARCH: '{q}'")
            print(f"Using template: {template_id}")
            print("=" * 80)
        else:
            template_id = TEMPLATE_MULTI_WORD
            print("=" * 80)
            print(f"MULTI-WORD SEARCH: '{q}'")
            print(f"Using template: {template_id}")
            print("=" * 80)
        
        # using search template
        res = es.search_template(
            index=INDEX_NAME,
            id=template_id,
            params={
                "query_string": q,
                "size": 20
            }
        )
        
        # check results on console
        print("RAW ELASTICSEARCH RESULTS:")
        print(f"Total hits: {res['hits']['total']['value']}")
        print(f"Max score: {res['hits'].get('max_score', 'N/A')}")
        print("-" * 80)
        
        for i, hit in enumerate(res["hits"]["hits"][:10], 1):
            print(f"{i}. {hit['_source']['name']} (Score: {hit['_score']:.2f})")
        print("=" * 80)
        
        results = [
            {**hit["_source"], "score": round(hit["_score"], 2)}
            for hit in res["hits"]["hits"]
        ]
        
    except Exception as e:
        print(f"Search error: {e}")
        import traceback
        traceback.print_exc()
        results = []
    
    return render_template("searchpage.html", q=q, results=results)

@app.route("/character/<name>")
def character_detail(name):
    try:
        res = es.search(
            index=INDEX_NAME,
            body={
                "query": {
                    "term": {
                        "name.keyword": name
                    }
                }
            }
        )

        if not res["hits"]["hits"]:
            return "Character not found", 404

        character = res["hits"]["hits"][0]["_source"]
        return render_template("resultpage.html", character=character)
    
    except Exception as e:
        print(f"Character detail error: {e}")
        return "Error loading character", 500

if __name__ == "__main__":
    app.run(debug=True)