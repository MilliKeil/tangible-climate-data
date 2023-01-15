import asyncio
import websockets
import nltk
import json
async def main():
    async with websockets.connect('ws://localhost:8025/john') as websocket:
        while True:
            text = await websocket.recv()
            tokens = nltk.word_tokenize(text)
            analyzed_text = nltk.pos_tag(tokens)
            print(analyzed_text)
            formated = json.dumps(analyzed_text,indent=2)
            await websocket.send(str(formated))
if __name__ == "__main__":
   asyncio.run(main())