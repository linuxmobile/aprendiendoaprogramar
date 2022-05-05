/*! markdown-it-inline-text-color 1.0.1-1 https://github.com//GerHobbelt/markdown-it-inline-text-color @license MIT */

// Process ~subscript~
let COLOR_OPEN_REGEX = /{color:(#?\w+)}/;
let COLOR_CLOSE_REGEX = /{color}/;
let TOKEN_TYPE = 'color_text';
let MARKUP = '{color}';

function getColor(attrs) {
  if (!attrs || attrs.length < 1) {
    return null;
  }

  for (let ii = 0; ii < attrs.length; ii++) {
    let att = attrs[ii];

    if (att && att.length > 1) {
      if (att[0] === 'color') {
        return att[1];
      }
    }
  }

  return null;
}

function color(state, silent) {
  let content,
      token,
      startResult,
      endResult,
      result,
      nesting = 1,
      isOpen = true,
      max = state.posMax,
      start = state.pos;

  if (state.src.charCodeAt(start) !== 0x7B
  /* ~ */
  ) {
      return false;
    }

  if (silent) {
    return false;
  } // don't run any pairs in validation mode


  content = state.src.slice(start);
  startResult = COLOR_OPEN_REGEX.exec(content);
  endResult = COLOR_CLOSE_REGEX.exec(content);

  if (!startResult && !endResult) {
    return false;
  }

  if (startResult && endResult) {
    if (startResult.index < endResult.index) {
      result = startResult;
    } else {
      nesting = -1;
      result = endResult;
    }
  } else if (startResult) {
    result = startResult;
  } else {
    result = endResult;
    nesting = -1;
  }

  isOpen = result.length === 2;
  state.posMax = start + result[0].length;
  token = state.push(TOKEN_TYPE, 'span', nesting);
  token.markup = MARKUP;

  if (isOpen) {
    token.attrPush(['color', result[1]]);
  }

  state.pos = state.posMax;
  state.posMax = max;
  return true;
}

function renderDefault(tokens, idx, _options, env, self) {
  let token = tokens[idx];
  let result = ['<'];

  if (token.nesting === -1) {
    result.push('/');
  }

  result.push('span');

  if (token.nesting === 1) {
    let color = getColor(token.attrs);

    if (color) {
      result.push(' style="color:', color, ';"');
    }
  }

  result.push('>');
  return result.join('');
}

module.exports = function sub_plugin(md, name, options) {
  options = options || {};
  md.inline.ruler.after('emphasis', 'span', color);
  md.renderer.rules[TOKEN_TYPE] = options.render || renderDefault;
};
//# sourceMappingURL=markdownItAbbr.mjs.map
