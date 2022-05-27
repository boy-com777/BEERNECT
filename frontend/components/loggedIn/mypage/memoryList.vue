<template>
  <!-- <v-card
    flat
    color="transparent"
    class="mx-auto"
  >
    <v-container>
      <v-row
        dense
      >
        <v-col
          v-for="(memory, i) in memories"
          :key="i"
          cols="12"
        >
          <v-card
            v-if="memory"
            width="450"
            class="mx-auto"
          >
            <v-row
              justify="center"
            >
              <v-col
                cols="12"
                sm="6"
              >
                <li class="text-h5">飲んだビール</li>
                <h4>{{ memory.beer_name }}</h4>
              </v-col>
              <v-col
                cols="12"
                sm="6"
              >
                <li class="text-h6">リピート度</li>
                <h4>{{ memory.repeat }}</h4>
              </v-col>
            </v-row>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-card> -->
  <v-row
    justify="center"
  >
    <v-col
      v-for="(memory, i) in memories"
      :key="i"
      cols="12"
    >
      <v-container>
      <v-card
        v-if="memory"
        width="450"
        class="mx-auto"
      >
        <v-row
          dense
        >
        <v-col
          cos="12"
          sm="6"
        >
          <li class="text-h6">飲んだビール</li>
          <h4>{{ memory.beer_name }}</h4>
        </v-col>
        <v-col
          cols="12"
          sm="6"
        >
          <li class="text-h6">リピート度</li>
          <h4>{{ memory.repeat }}</h4>
        </v-col>
        </v-row>
      </v-card>
      </v-container>
    </v-col>
  </v-row>
</template>

<script>
export default {
  props: {
    memories: {
      type: Array,
      default: () => {}
    }
  },
  data () {
    return {}
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
}
</script>