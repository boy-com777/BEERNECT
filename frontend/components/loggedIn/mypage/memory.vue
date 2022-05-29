<template>
  <v-container>
    <v-card
      v-if="user"
      width="450"
      height="300"
      class="mx-auto"
    >
      <v-toolbar
        color="myorange lighten-1"
        dark
        flat
      >
        <v-toolbar-title>{{ user.name }} が飲んだビールを登録する</v-toolbar-title>
      </v-toolbar>
      <v-row
        justify="center"
      >
        <v-col
          cols="12"
          sm="4"
        >
          <v-subheader>ビール一覧</v-subheader>
        </v-col>
        <v-col
          cols="12"
          sm="7"
        >
          <v-select
            v-model="beerSelect"
            item-text="beer_name"
            :items="beers"
            label="Select"
            hint="飲んだビールを選択してください"
            prepend-icon="mdi-liquor"
            persistent-hint
          ></v-select>
        </v-col>
      </v-row>
      <v-row
        justify="center"
      >
        <v-col
          cols="12"
          sm="4"
        >
          <v-subheader right>リピート度合い</v-subheader>
        </v-col>
        <v-col
          cols="12"
          sm="7"
        >
          <v-select
            v-model="repeatSelect"
            :items="repeats"
            label="Select"
            hint="リピート度合いを選択してください"
            prepend-icon="mdi-repeat"
            persistent-hint
          />
        </v-col>
      </v-row>
      <v-card
        width="320"
        flat
        color="transparent"
        class="mx-auto"
      >
        <v-card-actions>
          <v-btn
            rounded
            outlined
            dark
            block
            color="success"
            class="white--text"
            @click="memorySubmit"
          >
            登録する
            <v-icon
              right
            >
              mdi-book-open-variant
            </v-icon>
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data () {
    return {
      beerSelect: '',
      repeatSelect: '',
      beers: [],
      repeats: [
        { text: 'また購入する', value: 'また購入する' },
        { text: 'もしかしたら購入するかも', value: 'もしかしたら購入するかも' },
        { text: '悩み中', value: '悩み中' }
      ],
    }
  },
  async fetch () {
    const beers = await this.$axios.$get('/v1/beers')
    this.beers = beers
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
  methods: {
    memorySubmit() {
      const memory = {
        beer_name: this.beerSelect,
        repeat: this.repeatSelect,
        user_id: this.user.id
      }
      this.$emit('submit', memory)
    }
  }
}
</script>

<style>
</style>