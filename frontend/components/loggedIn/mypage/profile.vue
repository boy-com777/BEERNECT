<template>
  <v-container>
    <v-card
      v-if="user"
      flat
      width="600"
      color="transparent"
      class="mx-auto"
    >
      <v-layout
        justify-center
      >
        <div>
          <template v-if="user.avatar">
            <v-avatar
              size="250"
            >
              <v-img
                :src="user.avatar"
              />
            </v-avatar>
          </template>
          <template v-else>
            <v-avatar
              size="250"
            >
              <v-img
                :src="icon"
              />
            </v-avatar>
          </template>
        </div>
      </v-layout>
      <li class="text-h5">アカウント名</li>
      <h2 class="text-decoration-underline">{{ user.name }}</h2>
      <br>
      <div>
        <template v-if="user.favorite_beer">
          <li class="text-h5">お気に入りのビール</li>
          <h2 class="text-decoration-underline">{{ user.favorite_beer }}</h2>
        </template>
        <template v-else>
          <li class="text-h5">お気に入りのビール</li>
          <h2 class="text-decoration-underline">お気に入りのビールを登録しよう!!</h2>
        </template>
      </div>
      <br>
      <div>
        <template v-if="user.profile">
          <li class="text-h5">自己紹介</li>
          <h2 class="text-decoration-underline">{{ user.profile }}</h2>
        </template>
        <template v-else>
          <li class="text-h5">自己紹介</li>
          <h2 class="text-decoration-underline">自己紹介文を登録しよう!!</h2>
        </template>
      </div>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data () {
    return {
      icon: require("@/assets/images/other/default-user.png")
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
}
</script>