Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arvjb-0004M5-4d
 for ath10k@lists.infradead.org; Sun, 17 Apr 2016 23:04:08 +0000
Received: by mail-oi0-x236.google.com with SMTP id x201so10268079oif.3
 for <ath10k@lists.infradead.org>; Sun, 17 Apr 2016 16:03:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1460905574286.42282@qti.qualcomm.com>
References: <CACiydb+XMSfC262B6TzuZwx4W+LAbC7627uMKmiK9SjfuFpO4A@mail.gmail.com>
 <1460129643950.46282@qti.qualcomm.com>
 <CACiydbLHksfB68yOZq3SLuXEw-ucw5FnTDHq_un_Bpeah_5mZQ@mail.gmail.com>
 <ab762b501abc457aa1dbf965895eb113@aphydexm01b.ap.qualcomm.com>
 <CACiydbL3-QoC=muZf4aJOaUWZN-tpA3h1SwNfYU3+LnY_FHF+g@mail.gmail.com>
 <1460174525702.66744@qti.qualcomm.com>
 <CACiydbLh+X540MrnvS5MGm8Bd3QnnWmdFyon8H5khJiFtGK85w@mail.gmail.com>
 <1460905574286.42282@qti.qualcomm.com>
Date: Mon, 18 Apr 2016 02:03:43 +0300
Message-ID: <CACiydb+AaTc2wWzVeJNwPzA+PH9FcrqWzx3nW2RmKxaiaHwg-w@mail.gmail.com>
Subject: Re: ath10k performance, master branch from 20160407
From: Roman Yeryomin <leroi.lists@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar,

ok, I've ended up resolving (seems to be trivial) conflicts in revert
list you provided (see comments inlined).
Performance restored and codel symbols are gone from perf top.
Will try reverting "ath10k: combine txrx and replenish task" alone and
then, if that doesn't help, resetting reverts by patch sets.

Regards,
Roman

On 17 April 2016 at 18:06, Manoharan, Rajkumar
<rmanohar@qti.qualcomm.com> wrote:
> Roman,
>
> Hmm.. I just listed ath10k changes alone. So there might be some dependencies.

there were ath10k conflicts, please see below

> In your earlier mail fq_codel_drop was consuming 45% cpu. Have you observed any
> improvement after switching off NET_SCH_FQ_CODEL? Had CPU usage gone down?

CPU usage didn't go down after simply turning off
CPTCFG_NET_SCH_FQ_CODEL under compat wireless (and yes, I verified it
was off in the config after recompilation).
But still I'm not sure it's really off. Turning it off both in kernel
config and compat-wireless doesn't seem to have effect. I didn't dig
deeper into this but it looks I didn't find a correct way to turn it
off completely.

Not sure if I stated it correctly: after resetting to
89ef41bfaa46f24a14b776f1cd78c0e0b39e54ce I got same (good enough)
performance as with latest compat-wireless release (20160110).

> Please try to revert the commit "ath10k: combine txrx and replenish task" alone. If you still
> see same behavior (lower numbers), reset master branch to till "ath10k: fix pull-push tx
> threshold handling" and generate backports.
>
> Please make sure that codel is switched off always until regression point is root caused.
>
> -Rajkumar
>
> ________________________________________
> From: Roman Yeryomin <leroi.lists@gmail.com>
> Sent: Sunday, April 17, 2016 2:58 PM
> To: Manoharan, Rajkumar
> Cc: ath10k@lists.infradead.org; Rajkumar Manoharan
> Subject: Re: ath10k performance, master branch from 20160407
>
> Rajkumar,
>
> Somehow unseting CPTCFG_NET_SCH_FQ_CODEL didn't change anything and
> the patches you listed didn't revert cleanly, I gave up on 3rd
> dependent patch somewhere in the middle and just reset master to
> 89ef41bfaa46f24a14b776f1cd78c0e0b39e54ce, which is the last commit
> just before "ath10k: refactor tx code", and generated new backports.
> The result is that it has same performance as before. But I guess it
> is not a very good test as there were many changes to mac80211 too.
>
> So what do you want me to try next? Maybe you could provide a more
> precise list to revert?
>
>
> Regards,
> Roman
>
> On 9 April 2016 at 07:02, Manoharan, Rajkumar <rmanohar@qti.qualcomm.com> wrote:
>> Roman,
>>
>> Need your help to bisect regression point. Can you try w/o CPTCFG_NET_SCH_FQ_CODEL?
>> If it does not help, try reverting below commits which are major changes in data path.
>> Instead of generating backports, apply revert commit on top your backports.
>>
>> ath10k: combine txrx and replenish task
>> ath10k: reuse copy engine 5 (htt rx) descriptors
>> ath10k: cleanup copy engine receive next completion
>> ath10k: register ath10k_htt_htc_t2h_msg_handler
>> ath10k: speedup htt rx descriptor processing for rx_ind

this depends on 689de38e37179c6f524dd003e1dae92042f8f5cd

>> ath10k: cleanup amsdu processing for rx indication
>> ath10k: remove unused fw_desc processing
>> ath10k: copy tx fetch indication message
>> ath10k: speedup htt rx descriptor processing for tx completion
>> ath10k: fix null deref if device crashes early
>> ath10k: fix pull-push tx threshold handling
>> ath10k: fix tx hang
>> ath10k: move mgmt descriptor limit handle under mgmt_tx

error: could not revert cac0855... ath10k: move mgmt descriptor limit
handle under mgmt_tx
Not even sure why it fails here, pretty trivial to resolve but still...

>> ath10k: change htt tx desc/qcache peer limit config

error: could not revert 99ad1cb... ath10k: change htt tx desc/qcache
peer limit config
ook, resolved, hope correctly

>> ath10k: fix HTT Tx CE ring size
>> ath10k: implement push-pull tx
>> ath10k: keep track of queue depth per txq
>> ath10k: store txq in skb_cb
>> ath10k: implement updating shared htt txq state
>> ath10k: implement wake_tx_queue

depends on 9d71d47eed20f34620e54e29bcc90f959d5873b8 and
750eeed89cf3c466df302e4707491b015531e26c
all three fail to revert cleanly

>> ath10k: add new htt message generation/parsing logic

fails to revert cleanly

>> ath10k: add fast peer_map lookup
>> ath10k: maintain peer_id for each sta and vif
>> ath10k: refactor tx pending management
>> ath10k: unify txpath decision
>> ath10k: refactor tx code
>>
>> -Rajkumar
>> ________________________________________
>> From: Roman Yeryomin <leroi.lists@gmail.com>
>> Sent: Friday, April 8, 2016 10:49 PM
>> To: Manoharan, Rajkumar
>> Cc: ath10k@lists.infradead.org; Rajkumar Manoharan
>> Subject: Re: ath10k performance, master branch from 20160407
>>
>> Latest backports (compat-wireless) released (20160110) has codel
>> enabled (CPTCFG_NET_SCH_FQ_CODEL=y) and there are no openwrt patches
>> or special configuration for codel. And it runs ok.
>> How old commit do you want me to try?
>>
>> Regards,
>> Roman
>>
>> On 8 April 2016 at 19:41, Manoharan, Rajkumar <rmanohar@qti.qualcomm.com> wrote:
>>> That should be fine. Is codel running only for latest backports? Are there any openwrt changes to configure codel? Can you plz try to reset master branch to older commit and validate?
>>>
>>> -Rajkumar
>>> ________________________________________
>>> From: Roman Yeryomin [leroi.lists@gmail.com]
>>> Sent: Friday, April 8, 2016 9:30 PM
>>> To: Manoharan, Rajkumar
>>> Cc: ath10k@lists.infradead.org; Rajkumar Manoharan
>>> Subject: Re: ath10k performance, master branch from 20160407
>>>
>>> Rajkumar,
>>>
>>> I took backports from
>>> git://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git,
>>> took latest ath tree from
>>> git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git, generated
>>> backports-output based on ath master branch, refreshed openwrt
>>> patches.
>>> And saw big performance degradation. Am I doing something wrong?
>>>
>>> Regards,
>>> Roman
>>>
>>> On 8 April 2016 at 18:34, Manoharan, Rajkumar <rmanohar@qti.qualcomm.com> wrote:
>>>> Roman,
>>>>
>>>> Which backports version are you using? I don't see codel changes in ath.git/wireless-drivers.git.
>>>> Hope you are using same firmware.
>>>>
>>>> -Rajkumar
>>>> ________________________________________
>>>> From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Roman Yeryomin <leroi.lists@gmail.com>
>>>> Sent: Friday, April 8, 2016 8:14 PM
>>>> To: ath10k@lists.infradead.org
>>>> Subject: ath10k performance, master branch from 20160407
>>>>
>>>> Hello!
>>>>
>>>> I've seen performance patches were commited so I've decided to give it
>>>> a try (using 4.1 kernel and backports).
>>>> The results are quite disappointing: TCP download (client pov) dropped
>>>> from 750Mbps to ~550 and UDP shows completely weird behavour - if
>>>> generating 900Mbps it gives 30Mbps max, if generating 300Mbps it gives
>>>> 250Mbps, before (latest official backports release from January) I was
>>>> able to get 900Mbps.
>>>> Hardware is basically ap152 + qca988x 3x3.
>>>> When running perf top I see that fq_codel_drop eats a lot of cpu.
>>>> Here is the output when running iperf3 UDP test:
>>>>
>>>>     45.78%  [kernel]       [k] fq_codel_drop
>>>>      3.05%  [kernel]       [k] ag71xx_poll
>>>>      2.18%  [kernel]       [k] skb_release_data
>>>>      2.01%  [kernel]       [k] r4k_dma_cache_inv
>>>>      1.73%  [kernel]       [k] eth_type_trans
>>>>      1.24%  [kernel]       [k] build_skb
>>>>      1.20%  [mac80211]     [k] ieee80211_tx_dequeue
>>>>      1.03%  [kernel]       [k] __delay
>>>>      0.98%  [kernel]       [k] fq_codel_enqueue
>>>>      0.94%  [kernel]       [k] __netif_receive_skb_core
>>>>      0.93%  [kernel]       [k] skb_release_head_state
>>>>      0.88%  [ath10k_core]  [k] ath10k_htt_tx
>>>>      0.87%  [kernel]       [k] __dev_queue_xmit
>>>>      0.84%  [mac80211]     [k] ieee80211_tx_status
>>>>      0.81%  [kernel]       [k] __build_skb
>>>>      0.80%  [mac80211]     [k] __ieee80211_subif_start_xmit
>>>>      0.77%  [kernel]       [k] br_handle_frame_finish
>>>>      0.75%  [kernel]       [k] __qdisc_run
>>>>      0.73%  [kernel]       [k] skb_recycler_consume
>>>>      0.72%  [kernel]       [k] kfree_skb
>>>>      0.72%  [kernel]       [k] get_page_from_freelist
>>>>      0.69%  [kernel]       [k] br_fdb_update
>>>>      0.69%  [kernel]       [k] br_handle_frame
>>>>      0.67%  [kernel]       [k] __copy_user_common
>>>>      0.66%  [kernel]       [k] __skb_flow_dissect
>>>>      0.65%  [ath10k_core]  [k] ath10k_txrx_tx_unref
>>>>      0.60%  [kernel]       [k] kmem_cache_alloc
>>>>      0.60%  [mac80211]     [k] sta_addr_hash
>>>>      0.56%  [kernel]       [k] fq_codel_dequeue
>>>>      0.53%  [kernel]       [k] __local_bh_enable_ip
>>>>      0.50%  [kernel]       [k] __br_fdb_get
>>>>
>>>> What could be the reason?
>>>> I've seen there are some patches from Michal which touch fq_codel,
>>>> would those help or not?
>>>>
>>>>
>>>> Regards,
>>>> Roman
>>>>
>>>> _______________________________________________
>>>> ath10k mailing list
>>>> ath10k@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
