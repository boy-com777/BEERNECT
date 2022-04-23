<template>
  <v-container fluid>
    <v-row
      align="center"
      justify="center"
    >
      <v-col
        cols="12"
        class="my-8 text-center"
      >
        <h1 class="text-h5 font-weight-bold">
          メールアドレスでアカウントを登録する
        </h1>
      </v-col>
        <v-card
          flat
          width="80%"
          max-width="320"
          color="transparent"
          justify="center"
        >
        <v-form
          v-model="isValid"
        >
          <v-text-field
            v-model="name"
            :rules="nameRules"
            :counter="max"
            label="ユーザー名"
            prepend-icon="mdi-account-circle"
            placeholder="表示されるユーザー名"
            outlined
          />
          <v-text-field
            v-model="email"
            :rules="emailRules"
            label="メールアドレス"
            prepend-icon="mdi-email"
            :placeholder="emailForm.placeholder"
            outlined
          />
          <v-text-field
            v-model="password"
            :rules="passwordForm.rules"
            :counter="!noValidation"
            :hint="passwordForm.hint"
            :type="showPassword ? 'text' : 'password'"
            label="パスワード"
            prepend-icon="mdi-lock"
            :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
            :placeholder="passwordForm.placeholder"
            outlined
            @click:append="showPassword = !showPassword"
          />
          <v-text-field
            v-model="passwordConfirmation"
            :rules="rules"
            :type="showPasswordConfirmation ? 'text' : 'password'"
            label="パスワード確認"
            prepend-icon="mdi-lock"
            :append-icon="showPasswordConfirmation ? 'mdi-eye' : 'mdi-eye-off'"
            placeholder="半角英数8文字以上"
            outlined
            @click:append="showPasswordConfirmation = !showPasswordConfirmation"
          />
          <v-btn
            :disabled="!isValid"
            rounded
            block
            color="myorange"
            class="white--text"
            @click="signUp"
          >
              アカウント登録
          </v-btn>
          <v-card-actions>
            <nuxt-link
              to="/auth/signin"
              class="body-2 text-decoration-none"
            >
              アカウントをお持ちの方はこちら
            </nuxt-link>
          </v-card-actions>
        </v-form>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import firebase from '~/plugins/firebase'
export default {
  layout: 'beforeLogin',
  data () {
    const max = 12
    return {
      isValid: false,
      noValidation: false,
      showPassword: false,
      showPasswordConfirmation: false,
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',
      error: '',
      max,
      nameRules: [
        v => !!v || '',
        v => (!!v && max >= v.length) || `${max}文字以内で入力してください`
      ],
      emailRules: [
        v => !!v || '',
        v => /.+@.+\..+/.test(v) || ''
      ]
    }
  },
  computed: {
    emailForm () {
      const placeholder = this.noValidation ? undefined : 'sample@sample.com'
      return { placeholder }
    },
    passwordForm () {
      const min = '8文字以上'
      const msg = `${min}。半角英数・ハイフン・アンダーバーが使えます。`
      const required = v => !!v || ''
      const format = v => /^[\w-]{8,16}$/.test(v) || msg
      const rules = this.noValidation ? [required] : [format]
      const hint = this.noValidation ? undefined : min
      const placeholder = this.noValidation ? undefined : min
      return { rules, hint, placeholder }
    },
    rules () {
      const rules = []
      if (this.password) {
        const rule =
          v => (!!v && v) === this.password ||
            'パスワードが一致していません!!'
        rules.push(rule)
      }
      return rules
    }
  },
  methods: {
    async signUp() {
      const response = await firebase
        .auth()
        .createUserWithEmailAndPassword(this.email, this.password)
        .catch(error => {
          this.error = (code => {
            switch(code) {
              case 'auth/email-already-in-use':
                return '既にそのメールアドレスは使われています'
              default:
                return 'メールアドレスとパスワードをご確認ください'
            }
          })(error.code)
        })
      const user = {
        name: this.name,
        email: response.user.email,
        uid: response.user.uid
      }
      await this.$axios.$post('/v1/users', {user})
      this.$router.push('/auth/mypage')
    }
  }
}
</script>