#!/usr/bin/env python

from __future__ import print_function
from flask import Flask

# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Flask - Is it tested?
#      You betcha.  Run `python setup.py test` to see
#      the tests pass.

# [START app]

app = Flask(__name__)

@app.route('/')

def hello():
    """Return a friendly HTTP greeting."""
    return 'Hello World!'


if __name__ == '__main__':
    #print("app.route-->%s" %(@app.route('/')))
    print("marko djukic")
    app.run(host='127.0.0.1', port=8080)

# [END app]
