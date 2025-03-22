#!/usr/bin/env python3

import json
import pandas as pd

with open('../data/schacon.repos.json', 'r') as file:
    data = json.load(file)

repos = []
for repo in data[:5]:   # First 5 entries only
    repos.append([
        repo['name'],
        repo['html_url'],
        repo['updated_at'],
        repo['visibility']
    ])

df = pd.DataFrame(repos, columns=['name', 'html_url', 'updated_at', 'visibility'])

df.to_csv('/home/barbarauzun24/DS2002-json-practice/lab5/lab5.csv', index=False, header=False)

print("Output written to lab5.csv")

