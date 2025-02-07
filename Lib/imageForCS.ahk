#Include %A_ScriptDir%\Lib\FindText.ahk


pick_card := "|<>*135$22.zzzzzzzzw7zz03zs07z00Ds00TUy1w3w3kTsD1zUs7y3UTsC1zUs7y3UTsC1zUw7y3kTkD0z1y1s7s00zk03zU0zzU7zzzzs"

new_path := "|<>**80$96.01k00000Ts0001w0z3s00000zy003t60Xa800000U3U06N60Va800000U1U04960Uq800000U0k04960US9zzjjUVkrzwD7sUS/UstsUXsSAs16CUCC0MssUXMM0s106U6A08kkUXss0M103X2AC8EFUU0k0QD03X0ASA01UU1lsQD3VXUA0A010U3lsI96VXkA0w030UDlsID6VXMADy230Xwk0ID6VXMA0+660X0M0K36VXAC0/760X0Q0q36VX6/UPDA0X0CAnX6ny3tztxw0y07zVzwz0000000000000000U"

health1 := "|<health1>*136$64.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTtzzzzbbzztnbzbzySTzzbCTyTzttxzyMtztzzbb1k90UTbzy0M60Y21yTzs161WMtXtzzbY169naDbzySNy0bCMyTzttUM2A9Xtzzbb1k8tbDbzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
health2 := "|<health2>*137$63.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzDwzzzzbbzztnbzaTwwzzzCQzwnzbbrztXbzaTwwsC1843wnzU61U90UTaTw0X0lAQlwnzbY169naDaTwwnw1CQlwnzba1U8kaDaTwwsC17Atwnzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
health3 := "|<health3>*121$45.vvzztzbyCDzyAMzllzzlX7yCAC2887k10UF00S01U2AM3lk06FX6SC1sWAMnll0UMl6TCQ636Anzzzzzzzzzzzzzzzzzzzzzzw"


regen := "|<regen123>**90$43.Ts00000M600000A1D0Qw06QzzzzzvCQ71kM7bA30kA3k6MaNWMs30nA3CQlbs6TbCQkA30nb+Q7dkNmxvzwzzj000UM00000MM000007s004"
regen1 := "|<regen1>*135$57.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw3zzzzzzbzUDzzzzzwzwlxzzrzzbzbC3UMA3wzwlUM21UTbzU8kA34lwzw10FU1aDbzaAz0HwlwzwtUM21aDbzbC3UMAtwzzzzxbzzzzzzzz0zzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
regen2 := "|<regen2>*135$62.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy1zzzzzznDzUDzzzzzwnztXvzzjzzAzyQsC1UkDnDzaA30EA3wnzs2A30lATAzy0U8k0n7nDzaAz0Hwlwnztn0k43ATAzyQsC1UnbnDzzzzgzzzzzzzzzkDzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
regen3 := "|<regen3>*136$65.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0zzzzzztaTy0zzzzzznAzwlxzzrzzaNztnUs630zAnzn61U861yNbzU8kA34lwnDz0E4M0NXtaTyMnw1Dn7nAzwtUM21aDaNztnUs63CTAnzzzzqTzzzzzzzzz0zzzzzzzzzz3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"


speed := "|<speed123>**90$42.000000DTs0000PM80000Fk80S7UFnzzzzvllw7UsC1EA30kA1QAlAH4lz4l0kAln43DnwFkA30kA1MQjUsC/Dwwzjvz0AU00000AU000007U0000U"
speed1 := "|<speed1>*134$57.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzrzzy3zzzzwTDzUTzzzzXtzwrzyzjwTDzXs71kQ3tzw30kA30TDzs9UM69XtzzlA082ATDz682Tbs3tzw30kA30TDzksD1kQ3tzzzDzzzzzzzztzzzzzzzzzDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
speed2 := "|<speed2>*134$58.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzvzzzUzzzzz7nDw3zzzzwTAznTzvyzlwnz7kC3Us7nDw30kA30TAzw4kA34lwnzwH020X7nDsl0Hwz0TAzkA30kA1wnzVkS3Us7nDzzDzzzzzzzzwzzzzzzzzznzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
speed3 := "|<speed3>*135$64.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzrzzzz1zzzzyDaNzs7zzzzsyNbzazzrxzXtaTyDUQ71kDaNzs61UM60yNbzs9UM69XtaTzsa0416DaNzlW0bty0yNbzUM61UM3taTz3Uw71kDaNzzyTzzzzzzzzztzzzzzzzzzzbzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"

boss := "|<boss>**40$91.Tk0000z00000000Ty0000zw0000000A30000MD000000060rntwA1bzzlyTbnCTzzz6QTzzzzzzxbC71UXDC317UsC7m61bnlZa1U1UM69tnCHtwmnAnAnAnAwtbAC6NtbNaNqNUSQnDbnAtnAnAnAnz0M631a0s6Na1kM5Uz7Xln1rPQnqzj3zxzzzlzlzzzzzbz00000000000043C0000000000003700000000000001zU2"
boss1 := "|<boss1>**40$98.Tk0000z000000003jz0000Ty00000001z0k00063k0000000Nk6yTDVUAzzyDnwy6QtzzzwNlzzzzzzzlbCQC316SQ62D1kQCNm61bnlZa1U1UM69aQtb9wyNNaNaNaNaNbCNn3VaSNqNaRaM6NnaNwyNbCNaNaNaTaQ1UMA6M3UNaM71UFb1yD7Xa3iqtbhzS6Pzxzzzlzlzzzzzbz7k0000000000021b00000000000000lk00000000000000Dw008"
boss2 := "|<boss2>**40$102.Tk0000z000000003izw0001zs00000007zkA0001Uw00000006Nk6yTDVUAzzyDnwy6Nnbzzzlb7zzzzzzz6Nnb3UkFbb1UXkQ73aNm61bnlZa1U1UM69aNnaQbntZaNaNaNaNaNnaQksNbaRaNbNa1aNnaNwyNbCNaNaNaTaNk61UkNUC1aNUQ616NkTXlstUvhiNvTrVavzxzzzlzlzzzzzbz7z00000000000086Q00000000000000AQ000000000000000Dw000U"

explosive_death12 := "|<explosive12>**50$101.0001k03U000000701zk07k0DU03z003z03Vk0BU0P006D00Dq061vzPTDrbyA7yDvgDBzzzrzzzzyPbzzbTzNyv3j73Pq6ra73272kQ63Qayn9Bj9A6A6xbwRqvYRamPSGPivgTTsthrCPVbqtbrRrSS1YkNUorbBA3BUtiow3RjvXXjT2MT3ZvRXzzzSzzzvrwzrzzzzy006k000000000000000DU000000000000000T00000000000004"
explosive_death1 := "|<explosive1>**50$66.00000000000U0000007000k01zU01zU0yk01Xk03xU0ywzlUzlzRVsqzztiTzyRzwqrgBjAC64C4qn9Bj9A6A6wqnNBj9BrRqCqsNxiNxrRraqwtdUNg7Bqaqxw9VwCLhqCqrjtzjzzzzwy00000000000U"
explosive_death2 := "|<explosive2>**50$69.00000000000000000000000U0000007000600Dw00Dw07yk01Xk03xU0zrbyA7yDvgD6qzztiTzyRzwqqxVhtVkkVkaqn9Bj9A6A6wqqP9ht9ivilqqsNxiNxrRraqrbBA3BUtioqqxw9VwCLhqCqqxzDxzzzzzby00000000000000000000000U"
explosive_death3 := "|<explosive3>**50$69.000C00s00007z03s0DU07y0kM0P01g00ks63zzTvzvza3zrzzvvtzzirDS793Q6hikKxUkwP/gngamrhazXNRr5lnqtbkMMNUoiCSkQy3TLCCBvsq7lzzvzzzzvyzrs03M0000000000T00000000001k00000000U"

range := "|<range>**40$64.Tw000000003zw0000000080s00000000U1U00000002030000001w8yBzzzsTzTwXsyAwnnWDUuBXk3U3Q0s1cyC0C07U3U3U0kks8QAACC077XXllslss0QSCB37X03VllssqASADyDX13XMk0kzcqC0CBXU3U6XMQ0sqD0C0/AnxnnNjsy1jnxzzxyzXTy0000006AAT0000000M1U00000001kC000000003zk02"
range1 := "|<range1>**40$74.Tw0000000007jzk000000003y0C000000000XU1U000000008s0A0000007k2CDXTzzy7zrz0XXsyAwnnWDUs8sqD0C0Bk3U62CDXU3U1s0s0kXU0kks8QAACA8s0QSCD77X7X2C077XXElsk0kXVllssqASADw8syA4CBX033y2CBXU3XMs0s1UXXMQ0sqD0C088wnDrDBazXs63DwzTzzTjsrzUz0000006AAT000000001U60000000000Q3U0000000003zk0008"
range2 := "|<range2>**30$79.zw000000000DzTzU000000007zs1s000000006AQ0A0000000036C030000001w1X77ljzzz3zvzUlXXsyAwnnbDUsMllgS0Q0TU7UCAMsyC0C07U3U36AQ066733VVVlX6C077XXllslslX703XllgMwM0MlXVllssqASATwMllwMMQP606DwAMsqC0CBXU3U66AQP3U76ls1s136DArxnnNjsy1VnbyTjzzjzwPzkTz0000006AATU0000000030A00000000001kC00000000000Ty000000000007y00001"
range3 := "|<range3>**40$84.Tw0000000007jSzz000000000DzzU3U000000008lXU1U000000008lXU0k000000T08lXXsrzzzVzxzk8lXXsyAwnnWDUs8lXXMw0s0r0C0M8lXXss0s0S0C0A8lXU0kks8QAACA8lXU1lsswQSASA8lXU1lssoASA0A8lXVllssqASADw8lXXskEsqA0ADs8lXXMs0sqC0C0M8lXXMQ0sqD0C088lXnAzQwqPyDUMAtnzDrzzrvyBzsDzz0000006AAT000000000060M0000000000070s000000000003zk000000000001z000000U"

attack := "|<attack>**40$70.0000000001k01s0000000Dk0DkDns0000X00n0zTU0002A06635W00008k0MMAK80000X030nlswzyTyDkA3A00T6PVszVU6k01s1w1Xa6AP00707U6A8kky7XsMQAs1X33wSDXllzUCM06lMaD76y1lU0P7XswQTs3gDkwSDUVknU7lzXkMD07U6AD66D1ky0T0MsysQr7nStj7nnT0zDzwzyTvzu"
attack1 := "|<attack1>**20$80.0000000001s0007U0000000z03s3w3xy0000Mk0z0nUzTk0006A0MkMMAqA0001X06A667BXUL0SMk1X30nnswzyTyDkMkkAk03ytj7Xy6AM1g00S0T0MtlX6AP00707U6AAMn33wSDVVknU76AlszDXswQTs3VXQ06nMqD77y1kMq01gSDXllzUC6DXwT7XsMQAsVlXlzXkMD07U6AAMwMMy73s1w1XX6Di7Rtwrivlxxlrz0zDzwzyTzzwDnU700000000002"
attack2 :="|<attack2>**40$85.0000000001k0000D00000001y03rUDkDns0000X03zs6M7vw0000FU16A6635W00008k0X6331Wl00004M0FX30nlswzyTyDk8lVUNU03snQD7w4MlU6k01s1w1Xa2AMlXM00s0w0lV16Akky7XsMQAs1UX6MMTXlwSCDw1kFXM06lMaD76y1k8lg03MwT7XXz0Q4MwDkwSDUVknU72ASDwS31s0w0lVV6D66D1ky0T0MskX7r3asyPrBsySMNnT0zDzwzyTvzsDzk"
attack3 := "|<attack3>**40$90.0000000001k00000S00000003w07jS0z0zDU0002A0Dzz0n0zTU0002A08lX1VUlMU0002A08lX1VUlMU0002A08lX30nlswzyTyDk8lX30n007lasSDs8lX60P007U7k6CM8lX6AP00707U6A88lXAADVsy673C0M8lXAADlsyD77y0s8lXM06lMaD76y1k8lXM06lsyD77y0s8lXkz3lsy273C0Q8lXlzXkMD07U6AA8lXlVXkQDU7k6CA8lXvVnQTBvawTDAAtnT0zDzwzyTvzsDzzU"

cooldown := "|<cooldown>**80$91.000000y0S0000000zk000P0TU000001kQ0008U8k000001U30004E4M000001U1U00282A000000ksryDx4T6zrjjzwkzq3g7WQXkSSwl7Mk60w1lM1k76A81gE20A0Mc0k1X6A0S8372C4Q8MsF166D61Xl7WCCASA0773VzlsXl776D603WlMQMsllXV37311FMg0A0M0kE1U3kVcgH070S0sA0s38soK8sCsRkyDaT3aQm/ADyDwTtyztzVvtwz"
cooldown1 := "|<cooldown1>**80$101.000000y0S000000003z0001g1y0000001wQ7000282A00000029U30004E4M0000004K060008U8k0000008gCBzXzF7ljxvvzz0Fkzq3g7WQXkSSwl70XX0M3k75U70QMkU61740U306+0A0MlX062C8372C4Q8MsF166A4QM6D4S8sslsk0QQ88sTwS8wFllXlU0sgEFMQMsllXV37311FMUWk0k1U31060D26Wl14k1k7UC30C0mCB5W28sCsRkyDaT3aQm/A4Ezszlzbvzby7jbnsDk"
cooldown2 := "|<cooldown2>**40$102.0w0001w1w000000003zU003g1g000000DzD1k003414000000NnQ0k003414000000MlM0rwDv4T4zjSzz0MlkzzyTz4z5zzzzzkMllrw7sD5k7UtnW0sMlnUs3k75U70Nla0MMln0lVX3726A8V648MlnUnlbX776SA06CAMllznlbX7D6SA0CCAMlsyllXX776CA4C+AMlM0k3U73060SAS+AMlQ0s3k73U70SAS+AMlD3yCwRntjlnSyPQNn3zjwTtzTxzXznvsDzU"
cooldown3 := "|<cooldown3>**40$98.3w000TUTU00000TzXzk006M6M00000DzxkA001a1a000003Ans1000NUNU00000nAwQryTyNyTzzzzwAnCDzVy7axbVtrgnXAnbCkD0tg1kCMl0QnAtUM1U6S0M1aAk3AnCM6SNtbX6SMVAQnAnXTbaSNttbb03DAnAszttbaSANtkVnnAnD060M1XU60SAQwnAns1kD0sQ1kDXDDAnArVz7wT7qT7RvnnAnAztzbyzTzzXzrrlzzU"

shield := "|<shield123>**40$43.7zXs3sDjzlw1w7y78m0m3S1bzDt7jDnzzwjrbsCQCK3sQ3AHC1j6RaNbAznCH0nbSNb9btnD0nYkAQ7kvqy7DPTzzzzzzk"
shield1 := "|<shield1>*134$58.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbtztzjzzw6TbzbwTDzUNyzyTlwzyPbzxtz7nzsy1b1bUTDzUM6M6Q1wzzUa969n7nzzWMY1aATDz69WNyQ1wzy1a9UMk7nzwCQb1XUTDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
shield2 := "|<shield2>*136$61.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTbzbyzzzy3DnznyDaTy1bvztz7nDzBnzywzXtbzXs6Q6S1wnzkA3A3C0yNzy2MYMbATAzzlAG0n6DaTwMa9btk7nDz0n4kAM3tbzktmQ6C1wnzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
shield3 := "|<shield3>*136$65.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzznwzwzrzzzz1btztz7nAzw3DrznyDaNztiTzrbwTAnzlw3C3D0yNbzUM6M6Q1wnDzkH4X4tXtaTzsa90NX7nAzslAHDnUDaNzs6Ma1X0TAnzsQtC370yNbzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"


blessing1 := "|<blessing>**50$104.0000C00007000C000Dw007k00Dzs007k003bU01g0033q001g000kPzsvyzskRbbbvyDjBnzzyzzzBnTzzzzzzvQkkwCC4PQrVVVgD32n8A639U6qBmPvv1Yrg6vRir/BhnQaCCrPgTBir/hmnPQrDtthmnnr8Bq31gqkAnOOPRUoxv/Rmsvhg7i6CCrTgTzzzzzzzvzzzzzzzny000000000000000Uk000000000000000Ds0000000000000001w0U"
blessing2 := "|<blessing2>*200$111.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzwzzzsRzzyzzzyrzUzzzbzzz1jzzzzzzqzxrzzwxzzvhvnbzzwyrzikMQ630TNg5vq71Tqzw6nNgqP9vhgbCqP9yrzUqPhavPDQgyAKvNXqzxq3RUkPNsAbdGrM+SrzitPiL7PD3aAMqvt7qzzzzzzzzzzzzzzzzDzzzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzzzzzzzw"


yen := "|<yen>**40$38.D1s000Dkz00036Qk000lq4000AD3T001VkzxzwQMS3tbX2C0Q0MM3U30371kskEkkwSASA6D036l1WkzlgEMgDwP469U76l1WM0lgENXUSPA7sTzyzU"
yen1 := "|<yen1>**40$49.D1s0000DTVy0000DwNn00004SCkU0002D3krk0016ksTyzy0XQMS3tbUFa4Q0s0k8lUC0A0A4MsC76262AAD7X7X1637U1XMUX1WkzlgEFUlMTsq88kMa0QP44MAH06BW2A6Ms7an1a3wDzzTUzU"
yen2 := "|<yen2>**40$54.D1s0000DSz3w0000TzlbA0000FXlq40000FXkwBw000FXMQDzTz0FXQMS3tbUFXA8s1k1UFX60s0k0kFX71kskEkFX33lslskFX1Xk0lcEFX1WkzlgEFX1WkzlgEFX1WM1lgEFX1WM0lgEFX1aC1tgkNn1y7zzjkTzU"




global textCards := Map(
    "new_path", new_path,
    "health1", health1,
    "health2", health2,
    "health3", health3,
    "regen1", regen1,
    "regen2", regen2,
    "regen3", regen3,
    "speed1", speed1,
    "speed2", speed2,
    "speed3", speed3,
    "explosive_death12", explosive_death12,
    "explosive_death3", explosive_death3,
    "range3", range3,
    "range2", range2,
    "range1", range1,
    "attack3", attack3,
    "attack2", attack2,
    "attack1", attack1,
    "cooldown3", cooldown3,
    "cooldown2", cooldown2,
    "cooldown1", cooldown1,
    "shield1", shield1,
    "shield2", shield2,
    "shield3", shield3,
    "yen", yen,
    "blessing1", blessing1,
    "blessing2", blessing2
)