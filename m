Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vqpoj-0006fI-5n
 for ath10k@lists.infradead.org; Wed, 11 Dec 2013 19:51:34 +0000
Received: by mail-la0-f51.google.com with SMTP id ec20so4115986lab.38
 for <ath10k@lists.infradead.org>; Wed, 11 Dec 2013 11:51:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALhHN=oBnJG61UPQ9PYHAJd9cRAOBabYwVs=nKUTRCLaEy9YfA@mail.gmail.com>
References: <52A1FC69.7080901@elnovel.com>
 <CALhHN=qPRgc-FaKbazdAmmxvi+YXxoFOp2Ax=x0iDp0LXknjHA@mail.gmail.com>
 <874n6i1jk7.fsf@kamboji.qca.qualcomm.com>
 <52A5955E.2060106@elnovel.com>
 <CA+BoTQk95VmU=e1cLOtzcX8Y_j6YjFFw1STOT=r7NSHTd2vuJA@mail.gmail.com>
 <52A5A98A.3000102@elnovel.com> <52A5B33D.7010006@elnovel.com>
 <52A85844.3080009@elnovel.com>
 <CALhHN=oBnJG61UPQ9PYHAJd9cRAOBabYwVs=nKUTRCLaEy9YfA@mail.gmail.com>
Date: Wed, 11 Dec 2013 20:51:10 +0100
Message-ID: <CALhHN=qT=5H9qc8oqB_sZARzJvCoQ7wTwY09nB9HsyJTXx0ZEg@mail.gmail.com>
Subject: Re: [BUG] QWLE900V5-18 - cannot achievie 3 spatial streams link
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Tomasz Tajmajer <tt@elnovel.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On 11 December 2013 20:43, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrot=
e:
> On 11 December 2013 13:19, Tomasz Tajmajer <tt@elnovel.com> wrote:
>>
>> On 09.12.2013 13:10, Tomasz Tajmajer wrote:
>>>
>>>
>>> On 09.12.2013 12:29, Tomasz Tajmajer wrote:
>>>>
>>>>
>>>> On 09.12.2013 11:13, Michal Kazior wrote:
>>>>>
>>>>> On 9 December 2013 11:03, Tomasz Tajmajer <tt@elnovel.com> wrote:
>>>>>>
>>>>>> On 09.12.2013 10:04, Kalle Valo wrote:
>>>>>>>
>>>>>>> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>>>>>>>
>>>>>>>> On 6 December 2013 17:33, Tomasz Tajmajer <tt@elnovel.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> Recently, I've been making quite a lot of tests with two
>>>>>>>>> QWLE900V5-18
>>>>>>>>> cards.
>>>>>>>>> I had some issues with the drivers (e.g. regarding the regulatory
>>>>>>>>> domain),
>>>>>>>>> but I've managed to fix them on my own. However, there is one iss=
ue
>>>>>>>>> that
>>>>>>>>> I
>>>>>>>>> cannot deal with.
>>>>>>>>> I'm trying to get the highest throughput possible using 3x3 MIMO.
>>>>>>>>> The
>>>>>>>>> problem is that the wifi card does not set higher rates than
>>>>>>>>> 2x433.3Mbps
>>>>>>>>> (MCS 9, VHT-NSS 2). The specification says that it should be
>>>>>>>>> possible to
>>>>>>>>> have 3 spatial streams.
>>>>>>>>> First, I thought it is a problem with some options of hostapd, but
>>>>>>>>> hostapd
>>>>>>>>> even does not allows me to set the [RX-STBC-12] or [RX-STBC-123]
>>>>>>>>> options.
>>>>>>>>> Only [RX-STBC-1] may be set in the configuration (what in fact, d=
oes
>>>>>>>>> not
>>>>>>>>> disallows the 2x433.3Mbps link, which is another issue).
>>>>>>>>> Driver info shows that the driver should support 3 spatial stream=
s.
>>>>>>>>> I am not sure where is the problem, is it some bug in hostapd, wh=
ich
>>>>>>>>> forces
>>>>>>>>> the card to use 2 spatial streams only or is it the driver, which
>>>>>>>>> does
>>>>>>>>> not
>>>>>>>>> enable 3 streams when it is possible. The physical connectivity
>>>>>>>>> (antennas
>>>>>>>>> etc.) is not the problem AFAIK.
>>>>>>>>>
>>>>>>>> When sta assoc to ap you will get dbg mesg (you can enable this eg.
>>>>>>>> when loading ath10k_core module with param - debug_mask).
>>>>>>>> "mac ht peer %pM mcs cnt %d nss %d\n" - nss is interesting here
>>>>>>>
>>>>>>> This debug message is enabled with ATH10K_DBG_MAC. More info here:
>>>>>>>
>>>>>>> http://wireless.kernel.org/en/users/Drivers/ath10k/debug
>>>>>>>
>>>>>>>> Also rx_mcs_set for STA from ath10k_peer_assoc_h_vht() could be
>>>>>>>> interesting - unfortunetly we don't print this. But you can print
>>>>>>>> this.
>>>>>>>
>>>>>>> Indeed, we should include that to the message as well.
>>>>>>>
>>>>>> I've enabled dbg messages and added rx_mcs_set and tx_mcs_set as you
>>>>>> suggested.
>>>>>> Here is the output for STA:
>>>>>>
>>>>>> [ 2278.320312] ath10k: htt target version 2.1
>>>>>> [ 2278.320455] ath10k: mac vdev create 0 (add interface) type 2 subt=
ype
>>>>>> 0
>>>>>> [ 2278.320741] ath10k: mac vdev 0 cts_prot 0
>>>>>> [ 2278.320765] ath10k: mac vdev 0 slot_time 1
>>>>>> [ 2278.320801] ath10k: mac vdev 0 preamble 1n
>>>>>> [ 2278.321320] ath10k: mac config channel 5180 mhz
>>>>>> [ 2278.321353] ath10k: mac vdev 0 psmode disable
>>>>>> [ 2278.321448] IPv6: ADDRCONF(NETDEV_UP): wlan1: link is not ready
>>>>>> [ 2278.321458] ath10k: mac vdev 0 psmode disable
>>>>>> [ 2282.499925] wlan1: authenticate with 04:f0:21:0c:a2:3a
>>>>>> [ 2282.499946] ath10k: mac config channel 5180 mhz
>>>>>> [ 2282.499962] ath10k: mac vdev 0 beacon_interval 100
>>>>>> [ 2282.499968] ath10k: mac vdev 0 create peer 04:f0:21:0c:a2:3a
>>>>>> [ 2282.500109] ath10k: mac vdev 0 start 04:f0:21:0c:a2:3a
>>>>>> [ 2282.500115] ath10k: mac vdev 0 start center_freq 5180 phymode
>>>>>> 11ac-vht80
>>>>>> [ 2282.506711] wlan1: direct probe to 04:f0:21:0c:a2:3a (try 1/3)
>>>>>> [ 2282.708052] wlan1: send auth to 04:f0:21:0c:a2:3a (try 2/3)
>>>>>> [ 2282.709096] wlan1: authenticated
>>>>>> [ 2282.712122] wlan1: associate with 04:f0:21:0c:a2:3a (try 1/3)
>>>>>> [ 2282.713907] wlan1: RX AssocResp from 04:f0:21:0c:a2:3a (capab=3D0=
x1
>>>>>> status=3D0 aid=3D1)
>>>>>> [ 2282.714331] ath10k: mac vdev 0 dtim_period 2
>>>>>> [ 2282.714367] ath10k: mac vdev 0 slot_time 2
>>>>>> [ 2282.714415] ath10k: mac ht peer 04:f0:21:0c:a2:3a mcs cnt 24 nss 3
>>>>>> [ 2282.714421] ath10k: mac vht peer 04:f0:21:0c:a2:3a max_mpdu 65535
>>>>>> flags
>>>>>> 0x601b001 rx_mcs_set 0000ffea tx_mcs_set 0000ffea
>>>>>> [ 2282.714427] ath10k: mac peer 04:f0:21:0c:a2:3a phymode 11ac-vht80
>>>>>> [ 2282.714435] ath10k: mac vdev 0 up (associated) bssid
>>>>>> 04:f0:21:0c:a2:3a
>>>>>> aid 1
>>>>>> [ 2282.714822] ath10k: mac vdev 0 psmode enable
>>>>>> [ 2282.714869] wlan1: associated
>>>>>>
>>>>>> And for AP:
>>>>>> [ 9460.458700] ath10k: htt target version 2.1
>>>>>> [ 9460.458874] ath10k: mac vdev create 0 (add interface) type 1 subt=
ype
>>>>>> 0
>>>>>> [ 9460.459120] ath10k: mac vdev 0 cts_prot 0
>>>>>> [ 9460.459155] ath10k: mac vdev 0 slot_time 1
>>>>>> [ 9460.459156] ath10k: mac vdev 0 preamble 1n
>>>>>> [ 9460.459385] ath10k: mac config channel 5180 mhz
>>>>>> [ 9460.459434] IPv6: ADDRCONF(NETDEV_UP): wlan2: link is not ready
>>>>>> [ 9461.562262] ath10k: mac vdev 0 rts threshold -1
>>>>>> [ 9461.562292] ath10k: mac vdev 0 fragmentation threshold -1
>>>>>> [ 9461.564900] ath10k: mac config channel 5180 mhz
>>>>>> [ 9461.564919] ath10k: mac vdev 0 beacon_interval 100
>>>>>> [ 9461.564923] ath10k: vdev 0 set beacon tx mode to staggered
>>>>>> [ 9461.564931] ath10k: mac vdev 0 start center_freq 5180 phymode
>>>>>> 11ac-vht80
>>>>>> [ 9461.571970] ath10k: mac vdev 0 up
>>>>>> [ 9461.572108] ath10k: mac vdev 0 cts_prot 0
>>>>>> [ 9461.572117] ath10k: mac vdev 0 slot_time 2
>>>>>> [ 9461.572241] IPv6: ADDRCONF(NETDEV_CHANGE): wlan2: link becomes re=
ady
>>>>>> [ 9461.572192] ath10k: mac vdev 0 preamble 1n
>>>>>> [ 9549.331556] ath10k: vdev 0 set beacon tx mode to staggered
>>>>>> [ 9549.331637] ath10k: mac vdev 0 cts_prot 0
>>>>>> [ 9549.331644] ath10k: mac vdev 0 preamble 1n
>>>>>> [ 9549.332425] ath10k: mac vdev 0 peer create 04:f0:21:0c:a2:3b (new
>>>>>> sta)
>>>>>> [ 9549.332628] ath10k: mac sta 04:f0:21:0c:a2:3b associated
>>>>>> [ 9549.332637] ath10k: mac ht peer 04:f0:21:0c:a2:3b mcs cnt 24 nss 3
>>>>>> [ 9549.332643] ath10k: mac vht peer 04:f0:21:0c:a2:3b max_mpdu 10485=
75
>>>>>> flags
>>>>>> 0x601b001 rx_mcs_set 0000ffea tx_mcs_set 0000ffea
>>>>>> [ 9549.332648] ath10k: mac peer 04:f0:21:0c:a2:3b phymode 11ac-vht80
>>>>>>
>>>>>>
>>>>>> As you can see, the "nss" value is set to 3, but I've never observed
>>>>>> VHT-NSS
>>>>>> 3 reported by "iw DEV station dump". Also the maximum throughput for
>>>>>> UDP
>>>>>> measured by iperf was ~630Mbps, which seems to be the netto value for
>>>>>> 2x433
>>>>>> Mbps PHY throughput.
>>>>>
>>>>> I wouldn't rely on station dump Tx/Rx stats (especially Tx stats which
>>>>> are broken due to FW limitation).
>>>>>
>>>>> You can create a monitor interface on the receiver side and run
>>>>> wireshark in non-promiscuous mode and check radiotap headers to
>>>>> confirm whether 3 spatial streams are used or not.
>>>>>
>>>>>
>>>>> Micha=B3
>>>>>
>>>> I've attached the output from wireshark.
>>>>
>>>>  Bandwidth: 80 MHz (4)
>>>>         User 0: MCS 9
>>>>             1001 .... =3D MCS index 0: 9 (256-QAM 5/6)
>>>>             .... 0010 =3D Spatial streams 0: 2
>>>>             Space-time streams 0: 2
>>>>             Coding 0: BCC (0)
>>>>             [Data Rate: 866,6 Mb/s]
>>>>
>>>> Unfortunately, it confirms that only 2 spatial streams are used.
>>>>
>>>>
>>>> TomaszT
>>>>
>>> I thought that maybe one of the card is physically damaged and the third
>>> spatial link cannot be established. I've checked that using a 802.11ac
>>> router, which I also have (and it supports 3 streams). Both cards conne=
cted
>>> with it using only 2 spatial streams. Its unlikely that both cards have=
 a
>>> malfunction, so its rather a software problem.
>>>
>>> TomaszT
>>
>> Hi,
>>
>> Are there any chances, that this issue would be investigated and hopeful=
ly
>> fixed before the end of the year ?
>>
> Seems from driver we configure everything correctly. Rate Control is
> in FW - so FW will decide what NSS/MCS to use. Here we see our devices
> works fine with 3x3.
>
> BTW.
> You can try to use fixed_rate setting. You will have to apply some
> patches from mac80211-next/group:
>
> Kernel:
> 1) nl80211: don't clear bitrate_mask twice
> 2) nl80211: back to default bitrate_mask correctly
> 3) nl80211/cfg80211: bitrate_mask, rename mcs to ht_mcs
> 4) nl80211: add VHT support for set_bitrate_mask
> 5) ath10k: add set_bitrate_mask callback - this I will send in few minutes
>
> iw:
> 1) iw: add VHT MCS/NSS set support to set bitrates
>
> After that just run ap and: iw wlanX set bitrates legacy-5 ht-mcs-5
> vht-mcs-5 3:0
>
> You should send frames from AP with NSS=3D3, MCS=3D0
>
BTW Do you have same problem with HT, or only with VHT?

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
