<script>
  import { props } from '@stackpress/ink';
  //define props
  type TodoProps = {
    list: string[];
    count: { value: number };
  };
  //import props
  const { count, list } = props<TodoProps>();
  const add = () => count.value++;
</script>
<if true={count.value > 0}>
  <div class="text-center uppercase text-sm">
    Total Tasks: <strong>{count.value}</strong>
  </div>
</if>

<if true={count.value < list.length}>
  <button class="bg-white text-blue-900 px-8 py-2 rounded-md" click=add>Add TODO</button>
</if>