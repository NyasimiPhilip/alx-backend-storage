#!/usr/bin/env python3
"""
Python function that returns the list of school having a specific topic
"""


def schools_by_topic(mongo_collection, topic):
    """
    Python function that returns the list of school
    having a specific topic
    """
    items = mongo_collection.find({"topics": {"$in": [topic]}})
    return items