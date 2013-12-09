Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp2.dhosting.pl ([195.88.50.26])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vpxgi-0001K3-Ue
 for ath10k@lists.infradead.org; Mon, 09 Dec 2013 10:03:42 +0000
Received: from [10.0.8.60] (89-76-223-119.dynamic.chello.pl [89.76.223.119])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: tt@elnovel.com)
 by smtp.dpoczta.pl (smtp.dpoczta.pl) with ESMTPSA id D21055FC83
 for <ath10k@lists.infradead.org>; Mon,  9 Dec 2013 11:03:10 +0100 (CET)
Message-ID: <52A5955E.2060106@elnovel.com>
Date: Mon, 09 Dec 2013 11:03:10 +0100
From: Tomasz Tajmajer <tt@elnovel.com>
MIME-Version: 1.0
Subject: Re: [BUG] QWLE900V5-18 - cannot achievie 3 spatial streams link
References: <52A1FC69.7080901@elnovel.com>	<CALhHN=qPRgc-FaKbazdAmmxvi+YXxoFOp2Ax=x0iDp0LXknjHA@mail.gmail.com>
 <874n6i1jk7.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874n6i1jk7.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org


On 09.12.2013 10:04, Kalle Valo wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> On 6 December 2013 17:33, Tomasz Tajmajer <tt@elnovel.com> wrote:
>>> Hi,
>>>
>>> Recently, I've been making quite a lot of tests with two QWLE900V5-18 cards.
>>> I had some issues with the drivers (e.g. regarding the regulatory domain),
>>> but I've managed to fix them on my own. However, there is one issue that I
>>> cannot deal with.
>>> I'm trying to get the highest throughput possible using 3x3 MIMO. The
>>> problem is that the wifi card does not set higher rates than 2x433.3Mbps
>>> (MCS 9, VHT-NSS 2). The specification says that it should be possible to
>>> have 3 spatial streams.
>>> First, I thought it is a problem with some options of hostapd, but hostapd
>>> even does not allows me to set the [RX-STBC-12] or [RX-STBC-123] options.
>>> Only [RX-STBC-1] may be set in the configuration (what in fact, does not
>>> disallows the 2x433.3Mbps link, which is another issue).
>>> Driver info shows that the driver should support 3 spatial streams.
>>> I am not sure where is the problem, is it some bug in hostapd, which forces
>>> the card to use 2 spatial streams only or is it the driver, which does not
>>> enable 3 streams when it is possible. The physical connectivity (antennas
>>> etc.) is not the problem AFAIK.
>>>
>> When sta assoc to ap you will get dbg mesg (you can enable this eg.
>> when loading ath10k_core module with param - debug_mask).
>> "mac ht peer %pM mcs cnt %d nss %d\n" - nss is interesting here
> This debug message is enabled with ATH10K_DBG_MAC. More info here:
>
> http://wireless.kernel.org/en/users/Drivers/ath10k/debug
>
>> Also rx_mcs_set for STA from ath10k_peer_assoc_h_vht() could be
>> interesting - unfortunetly we don't print this. But you can print
>> this.
> Indeed, we should include that to the message as well.
>

I've enabled dbg messages and added rx_mcs_set and tx_mcs_set as you 
suggested.
Here is the output for STA:

[ 2278.320312] ath10k: htt target version 2.1
[ 2278.320455] ath10k: mac vdev create 0 (add interface) type 2 subtype 0
[ 2278.320741] ath10k: mac vdev 0 cts_prot 0
[ 2278.320765] ath10k: mac vdev 0 slot_time 1
[ 2278.320801] ath10k: mac vdev 0 preamble 1n
[ 2278.321320] ath10k: mac config channel 5180 mhz
[ 2278.321353] ath10k: mac vdev 0 psmode disable
[ 2278.321448] IPv6: ADDRCONF(NETDEV_UP): wlan1: link is not ready
[ 2278.321458] ath10k: mac vdev 0 psmode disable
[ 2282.499925] wlan1: authenticate with 04:f0:21:0c:a2:3a
[ 2282.499946] ath10k: mac config channel 5180 mhz
[ 2282.499962] ath10k: mac vdev 0 beacon_interval 100
[ 2282.499968] ath10k: mac vdev 0 create peer 04:f0:21:0c:a2:3a
[ 2282.500109] ath10k: mac vdev 0 start 04:f0:21:0c:a2:3a
[ 2282.500115] ath10k: mac vdev 0 start center_freq 5180 phymode 11ac-vht80
[ 2282.506711] wlan1: direct probe to 04:f0:21:0c:a2:3a (try 1/3)
[ 2282.708052] wlan1: send auth to 04:f0:21:0c:a2:3a (try 2/3)
[ 2282.709096] wlan1: authenticated
[ 2282.712122] wlan1: associate with 04:f0:21:0c:a2:3a (try 1/3)
[ 2282.713907] wlan1: RX AssocResp from 04:f0:21:0c:a2:3a (capab=0x1 
status=0 aid=1)
[ 2282.714331] ath10k: mac vdev 0 dtim_period 2
[ 2282.714367] ath10k: mac vdev 0 slot_time 2
[ 2282.714415] ath10k: mac ht peer 04:f0:21:0c:a2:3a mcs cnt 24 nss 3
[ 2282.714421] ath10k: mac vht peer 04:f0:21:0c:a2:3a max_mpdu 65535 
flags 0x601b001 rx_mcs_set 0000ffea tx_mcs_set 0000ffea
[ 2282.714427] ath10k: mac peer 04:f0:21:0c:a2:3a phymode 11ac-vht80
[ 2282.714435] ath10k: mac vdev 0 up (associated) bssid 
04:f0:21:0c:a2:3a aid 1
[ 2282.714822] ath10k: mac vdev 0 psmode enable
[ 2282.714869] wlan1: associated

And for AP:
[ 9460.458700] ath10k: htt target version 2.1
[ 9460.458874] ath10k: mac vdev create 0 (add interface) type 1 subtype 0
[ 9460.459120] ath10k: mac vdev 0 cts_prot 0
[ 9460.459155] ath10k: mac vdev 0 slot_time 1
[ 9460.459156] ath10k: mac vdev 0 preamble 1n
[ 9460.459385] ath10k: mac config channel 5180 mhz
[ 9460.459434] IPv6: ADDRCONF(NETDEV_UP): wlan2: link is not ready
[ 9461.562262] ath10k: mac vdev 0 rts threshold -1
[ 9461.562292] ath10k: mac vdev 0 fragmentation threshold -1
[ 9461.564900] ath10k: mac config channel 5180 mhz
[ 9461.564919] ath10k: mac vdev 0 beacon_interval 100
[ 9461.564923] ath10k: vdev 0 set beacon tx mode to staggered
[ 9461.564931] ath10k: mac vdev 0 start center_freq 5180 phymode 11ac-vht80
[ 9461.571970] ath10k: mac vdev 0 up
[ 9461.572108] ath10k: mac vdev 0 cts_prot 0
[ 9461.572117] ath10k: mac vdev 0 slot_time 2
[ 9461.572241] IPv6: ADDRCONF(NETDEV_CHANGE): wlan2: link becomes ready
[ 9461.572192] ath10k: mac vdev 0 preamble 1n
[ 9549.331556] ath10k: vdev 0 set beacon tx mode to staggered
[ 9549.331637] ath10k: mac vdev 0 cts_prot 0
[ 9549.331644] ath10k: mac vdev 0 preamble 1n
[ 9549.332425] ath10k: mac vdev 0 peer create 04:f0:21:0c:a2:3b (new sta)
[ 9549.332628] ath10k: mac sta 04:f0:21:0c:a2:3b associated
[ 9549.332637] ath10k: mac ht peer 04:f0:21:0c:a2:3b mcs cnt 24 nss 3
[ 9549.332643] ath10k: mac vht peer 04:f0:21:0c:a2:3b max_mpdu 1048575 
flags 0x601b001 rx_mcs_set 0000ffea tx_mcs_set 0000ffea
[ 9549.332648] ath10k: mac peer 04:f0:21:0c:a2:3b phymode 11ac-vht80


As you can see, the "nss" value is set to 3, but I've never observed 
VHT-NSS 3 reported by "iw DEV station dump". Also the maximum throughput 
for UDP measured by iperf was ~630Mbps, which seems to be the netto 
value for 2x433 Mbps PHY throughput.
Do you have any idea what may be wrong ?

Br,

-- 
Tomasz Tajmajer,
Embedded Systems Engineer,
Elnovel Sp. z o.o. [Ltd.] (elnovel.com)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
