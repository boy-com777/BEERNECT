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
            :counter="max"
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
  data () {
    const max = 200
    return {
      name: '',
      favorite_beer: '',
      profile: '',
      max,
      profileRules: [
        v => !!v || '',
        v => (!!v && max >= v.length) || `${max}文字以内で入力してください`
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