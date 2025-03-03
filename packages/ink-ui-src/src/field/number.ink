<script observe="autocomplete,disabled,max,min,name,pattern,placeholder,readonly,required,step,type,value">
  import StyleSet from '@stackpress/ink/dist/style/StyleSet';
  import setAlign from '../utilities/style/align';
  import setColor from '../utilities/style/color';
  import setDisplay from '../utilities/style/display';
  import setPadding from '../utilities/style/padding';
  import setSize from '../utilities/style/size';
  import { getProps, setDefaultStyles } from '../utilities/input';
  import signal from '@stackpress/ink/dist/client/api/signal';
  import { 
    padDecimals,
    getFormats, 
    getFormatsFromInput
  } from '../utilities/number';
  //expand props
  const { 
    //listeners
    change, update, 
    //sub props
    background, border, 
    //others
    error,
    //for input
    attributes: props, 
  } = getProps(this);
  const {
    name, value,
    min, max, step, 
    separator = ',', 
    decimal = '.', 
    absolute = false,
    //for input
    ...attributes
  } = props;
  //override default styles
  const styles = new StyleSet();
  this.styles = () => styles.toString();
  //set default styles
  //determine display
  setDisplay(this.props, styles, 'inline-block', ':host');
  //determine background colors
  if (background) {
    setColor(background, styles, 'var(--white)', ':host', 'background-color');
  } else {
    styles.add(':host', 'background-color', 'var(--white)');
  }
  //determine border colors
  styles.add(':host', 'border-width', '1px');
  styles.add(':host', 'border-style', 'solid');
  if (error) {
    styles.add(':host', 'border-color', 'var(--error)');
  } else if (border) {
    setColor(border, styles, 'var(--black)', ':host', 'border-color');
  } else {
    styles.add(':host', 'border-color', 'var(--black)');
  }
  //default input styles
  styles.add('input', 'background', 'transparent');
  styles.add('input', 'border', '0');
  styles.add('input', 'box-sizing', 'border-box');
  styles.add('input', 'display', 'block');
  styles.add('input', 'height', '100%');
  styles.add('::slotted(input:focus)', 'outline', 'none');
  styles.add('input', 'width', '100%');
  styles.add('::host([error]) input', 'color', 'var(--error)');
  styles.add('::host([error]) input', 'border-color', 'var(--error)');
  //determine align
  setAlign(props, styles, 'left', 'input');
  //determine font size
  setSize(props, styles, 'inherit', 'input', 'font-size');
  //determine font color
  setColor(props, styles, 'var(--black)', 'input', 'color');
  //determine padding
  const pad = setPadding(props, styles, 'input');
  if (!pad) {
    styles.add('input', 'padding', '7px');
  }

  const decimals = step? String(step).split('.')[1]?.length || -1: -1;
  const options = { 
    min: Number(min) || undefined, 
    max: Number(max) || undefined, 
    separator, 
    decimal, 
    decimals, 
    absolute 
  };
  const initial = getFormats(String(value || ''), options);
  //set initital state
  const state = signal({
    hiddenValue: initial.value,
    displayValue: initial.display,
    cursor: 0
  });
  //handers
  const handlers = {
    change: (e: ChangeEvent<HTMLInputElement>) => {
      const { value, display } = getFormatsFromInput(e.target, options);
      let { cursor, displayValue, hiddenValue } = state.value;
      const pointer = e.target.selectionStart || 0;
      let change = false;
      
      if (Number(state.value.hiddenValue) !== Number(value)) {
        change && change(e);
        update && update(String(Number(value)));
        hiddenValue = value;
        change = true;
      }
      
      if (displayValue !== display) {
        if (display.length > displayValue.length) {
          cursor = pointer + (display.length - displayValue.length) - 1;
        } else if (display.length < displayValue.length) {
          cursor = pointer - (displayValue.length - display.length) + 1;
        } else {
          cursor = pointer;
        }
        displayValue = display;
        change = true;
      }
      if (change) {
        state.value = { cursor, displayValue, hiddenValue };
      }
    },
    blur: () => {
      console.log('blur');
      state.value = { ...state.value, displayValue: padDecimals(
        state.value.displayValue, 
        decimal, 
        decimals
      )};
    }
  };
</script>
<template type="light">
  <if true={name}>
    <input type="hidden" {name} value={state.value.hiddenValue} />
  </if>
</template>
<template type="shadow">
  <input
    {...attributes}
    change={handlers.change} 
    blur={handlers.blur} 
    value={state.value.displayValue}  
  />
</template>

