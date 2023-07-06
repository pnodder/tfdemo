import json


def handle(event, context):
    print(json.dumps(event))
    response = {
        'isAuthorized': False,
        'context': {
            'stringKey': 'value',
            'numberKey': 1,
            'booleanKey': True,
            'arrayKey': ['value1', 'value2'],
            'mapKey': {'value1': 'value2'}
        }
    }

    if 'authorization' in event['headers'].keys() and event['headers']['authorization'] == 'yoked':
        response = {
            'isAuthorized': True,
            'context': {
                'stringKey': 'value',
                'numberKey': 1,
                'booleanKey': True,
                'arrayKey': ['value1', 'value2'],
                'mapKey': {'value1': 'value2'}
            }
        }

    return response
