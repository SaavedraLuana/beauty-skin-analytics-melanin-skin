from nbformat import read, write, NO_CONVERT
from nbformat.reader import NotJSONError

# Add before/after display cell to the existing notebook file
# We'll read the current notebook, append a new cell, and write it back.

nb_path = 'notebooks/analysis.ipynb'

cell_source = '''# BEFORE/AFTER: display side-by-side images for products (requires pillow)
from IPython.display import display
from PIL import Image
import os

def show_before_after(product, before_fname='before.jpg', after_fname='after.jpg'):
    base = os.path.join('data','images', product)
    before_path = os.path.join(base, before_fname)
    after_path = os.path.join(base, after_fname)
    imgs = []
    for p in (before_path, after_path):
        if os.path.exists(p):
            imgs.append(Image.open(p))
        else:
            print(f'Missing: {p}')
            return
    # display side-by-side
    widths, heights = zip(*(i.size for i in imgs))
    total_width = sum(widths)
    max_height = max(heights)
    new_im = Image.new('RGB', (total_width, max_height))
    x_offset = 0
    for im in imgs:
        new_im.paste(im, (x_offset,0))
        x_offset += im.size[0]
    display(new_im)

# Example usage:
show_before_after('Mixa Cream')   # expects data/images/Mixa Cream/before.jpg and after.jpg
'''

try:
    with open(nb_path, 'r', encoding='utf-8') as f:
        nb = read(f, as_version=4)
except NotJSONError:
    raise

new_cell = {
  "cell_type": "code",
  "execution_count": None,
  "metadata": {},
  "outputs": [],
  "source": cell_source
}

nb['cells'].append(new_cell)

with open(nb_path, 'w', encoding='utf-8') as f:
    write(nb, f)

print('Appended before/after cell to', nb_path)
