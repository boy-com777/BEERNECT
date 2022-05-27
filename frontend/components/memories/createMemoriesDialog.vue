<template>
  <v-dialog
    v-model="createMemoriesDialog"
    width="500"
  >
    <v-card>
      <!-- <div>
        {{ beers }}
      </div> -->
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: {
    beers: {
      type: Array,
      default: () => {}
    }
  },
  data: () => ({
    createMemoriesDialog: false
  })
}
</script>