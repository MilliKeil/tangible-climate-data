import asyncio
import websockets
import nltk
import json
async def handler(websocket):
    async for message in websocket:
            tokens = nltk.word_tokenize(message)
            analyzed_text = nltk.pos_tag(tokens)
            print(analyzed_text)
            formated = json.dumps(analyzed_text,indent=2)
            await websocket.send(str(formated))

async def main():
    async with websockets.serve(handler,'localhost',8025):
        await asyncio.Future()

asyncio.run(main())