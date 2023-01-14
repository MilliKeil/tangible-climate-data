#following tutorial for extracting tokens in text https://www.nltk.org/book/ch03.html
from pdfminer.high_level import extract_text #package for extracting raw text data from the PDFs
import nltk
text = extract_text('/Users/proff/Documents/Paper/tiqqun-the-cybernetic-hypothesis.pdf')#example PDF of Tiqqun
tokens = nltk.word_tokenize(text)
analyzed_text = nltk.Text(tokens)

def find_similars(word):
    return analyzed_text.similar(word)
