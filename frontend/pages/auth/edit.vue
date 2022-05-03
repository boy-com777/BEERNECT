<template>
  <v-container
    fluid
  >
    <v-row
      align="center"
      justify="center"
    >
      <v-col
        cols="12"
        class="my-8 text-center"
      >
        <h1 class="text-h5 font-weight-bold">
          アカウント編集
        </h1>
      </v-col>
      <v-card
        flat
        width="80%"
        max-width="320"
        color="transparent"
        justify="center"
      >
        <v-form>
          <v-text-field
            v-model="name"
            :counter="nameMax"
            :rules="nameRules"
            label="アカウント名"
            prepend-icon="mdi-account-circle"
            placeholder="表示されるアカウント名"
            outlined
          />
          <v-text-field
            v-model="favorite_beer"
            label="お気に入りのビール"
            prepend-icon="mdi-liquor"
            outlined
          />
          <v-textarea
            v-model="profile"
            :counter="profileMax"
            :rules="profileRules"
            label="自己紹介"
            prepend-icon="mdi-badge-account-horizontal-outline"
            placeholder="200文字以内で入力してください"
            outlined
          />
          <v-btn
            rounded
            outlined
            block
            dark
            color="success"
            class="ml-2 font-weight-bold"
            @click="changeUserProfile"
          >
            プロフィール更新
          </v-btn>
        </v-form>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: 'loggedIn',
  async asyncData({ $axios, store }) {
    const currentUser = store.getters['auth/currentUser']
    const response = await $axios.$get(`/v1/users/${currentUser.id}`)
    return {
      name: response.name,
      favorite_beer: response.favorite_beer,
      profile: response.profile
    }
  },
  data () {
    const nameMax = 12
    const profileMax = 200
    return {
      name: '',
      favorite_beer: '',
      profile: '',
      nameMax,
      profileMax,
      nameRules: [
        v => !!v || '',
        v => (!!v && nameMax >= v.length) || `${nameMax}文字以内で入力してください`
      ],
      profileRules: [
        v => !!v || '',
        v => (!!v && profileMax >= v.length) || `${profileMax}文字以内で入力してください`
      ]
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
  methods: {
    async changeUserProfile() {
      await this.$axios.$patch(`/v1/users/${this.$store.state.auth.currentUser.id}`, {
        user: {
          name: this.name,
          favorite_beer: this.favorite_beer,
          profile: this.profile,
        }
      })
      .then(() => {
        this.$router.push('/auth/mypage')
      })
      .catch((error) => {
        alert(error.message)
      })
    }
  }
}
</script>