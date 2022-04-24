<template>
  <v-card
    flat
    width="800"
    class="mx-auto"
    color="transparent"
    cols="12"
    sm="12"
    md="12"
    lg="12"
  >
    <v-list>
      <v-list-group
        v-for="item in items"
        :key="item.title"
        v-model="item.active"
        :prepend-icon="item.action"
        no-action
      >
        <template #activator>
          <v-list-item-content>
            <v-list-item-title v-text="item.title"></v-list-item-title>
          </v-list-item-content>
        </template>
        <v-list-item
          v-for="child in item.items"
          :key="child.title"
        >
          <v-list-item-content>
            <v-list-item-title v-text="child.title"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-card-actions>
          <v-btn
            outlined
            dark
            block
            rounded
            color="myorange"
            class="font-weight-bold"
            :to="item.link"
          >
            {{ item.title }} を検索する
          </v-btn>
        </v-card-actions>
      </v-list-group>
    </v-list>
  </v-card>
</template>

<script>
export default {
  data () {
    return {
      items: [
        {
          action: 'mdi-liquor',
          items: [
            { title: '● スッキリとした喉越しとキレ' },
            { title: '● ホップ由来の苦味も味わえる' },
            { title: '● 注いだときの色は黄金色でクリア' }
          ],
          title: 'ピルスナー (PILSNER)',
          link: 'styles/pilsner'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● 苦味とモルトの優しい甘みとコク' },
            { title: '● 華やかな柑橘を彷彿させるホップの香りと程よい苦味' }
          ],
          title: 'ペールエール (PALE ALE)',
          link: 'styles/paleale'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● パンチのある強烈な苦味' },
            { title: '● 華やかなホップの香り' },
            { title: '● アルコール度数も5~7%と少し高め' },
          ],
          title: 'IPA (INDIA PAlE ALE)',
          link: 'styles/ipa'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● IPAと同様にホップの香りがいい' },
            { title: '● 苦味もあるがしっかりとした甘みが感じられる' },
            { title: '● とろみがあり滑らかな舌触り' }
          ],
          title: 'ヘイジーIPA (HAZY IPA)',
          link: 'styles/hazyipa'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● IPAと同様にホップの香りがいい' },
            { title: '● ライトで飲みやすいIPA' },
            { title: '● アルコール度数は3.5~5%' }
          ],
          title: 'セッションIPA (SESSION IPA)',
          link: 'styles/sessionipa'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● コーヒーやココアのようなローストされた香り' },
            { title: '● 程よい苦味' },
            { title: '● 注いだときの色は濃い茶色' }
          ],
          title: 'ポーター (PORTER)',
          link: 'styles/porter'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● ポーターよりも更に強くローストされた香り' },
            { title: '● 強くローストされても苦味は程よい' },
            { title: '● 注いだときの色は真っ黒' }
          ],
          title: 'スタウト (STOUT)',
          link: 'styles/stout'
        },
        {
          action: 'mdi-liquor',
          items:[
            { title: '● 苦味が少なくまろやかで優しい口当たり' },
            { title: '● バナナや林檎を思わせるフルーティな香り' },
            { title: '● ほのかにクローブのようなスパイシーな香り' }
          ],
          title: 'ヴァイツェン (WEIZEN)',
          link: 'styles/weizen'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● 苦味が少なく爽快な飲み口' },
            { title: '● フルーティ且つスパイシーな香り' },
            { title: '● スッキリとした香りと爽快さの両方を楽しめる' }
          ],
          title: 'ベルジャンホワイト (BELGIAN WHITE)',
          link: 'styles/belgianwhite'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● モルトのコクと甘みをしっかりと感じられる' },
            { title: '● 少し焦げたカラメルのような香り' },
            { title: '● 注いだときの色はキレイな琥珀色' }
          ],
          title: 'アンバーエール (AMBER ALE)',
          link: 'styles/amberale'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● ペールエールよりもホップの香りが穏やか' },
            { title: '● 優しいモルトの甘味' },
            { title: '● アンバーエールよりも甘味は控えめ' },
            { title: '● 注いだときの色は黄金色' }
          ],
          title: 'ゴールデンエール (GOLDEN ALE)',
          link: 'styles/goldenale'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● ライトボディなものが多い' },
            { title: '● スパイシーさとフルーティさの両方を味わえる' },
            { title: '● 様々な特徴が混ざりあった奥行きのある香り' }
          ],
          title: 'セゾン/ファームハウスエール (SAISON/FARMHOUSE ALE)',
          link: 'styles/saison'
        },
        {
          action: 'mdi-liquor',
          items: [
            { title: '● 名前の通り酸味を感じられる' },
            { title: '● 優しい酸味から強い酸味まで幅広くある' }
          ],
          title: 'サワービール (SOUR BEER)',
          link: 'styles/sourbeer'
        }
      ]
    }
  }
}
</script>