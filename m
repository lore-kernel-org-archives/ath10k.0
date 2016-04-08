Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoZTo-00020v-5s
 for ath10k@lists.infradead.org; Fri, 08 Apr 2016 16:41:56 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: RE: ath10k performance, master branch from 20160407
Date: Fri, 8 Apr 2016 16:41:27 +0000
Message-ID: <ab762b501abc457aa1dbf965895eb113@aphydexm01b.ap.qualcomm.com>
References: <CACiydb+XMSfC262B6TzuZwx4W+LAbC7627uMKmiK9SjfuFpO4A@mail.gmail.com>
 <1460129643950.46282@qti.qualcomm.com>,
 <CACiydbLHksfB68yOZq3SLuXEw-ucw5FnTDHq_un_Bpeah_5mZQ@mail.gmail.com>
In-Reply-To: <CACiydbLHksfB68yOZq3SLuXEw-ucw5FnTDHq_un_Bpeah_5mZQ@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

That should be fine. Is codel running only for latest backports? Are there any openwrt changes to configure codel? Can you plz try to reset master branch to older commit and validate?

-Rajkumar
________________________________________
From: Roman Yeryomin [leroi.lists@gmail.com]
Sent: Friday, April 8, 2016 9:30 PM
To: Manoharan, Rajkumar
Cc: ath10k@lists.infradead.org; Rajkumar Manoharan
Subject: Re: ath10k performance, master branch from 20160407

Rajkumar,

I took backports from
git://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git,
took latest ath tree from
git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git, generated
backports-output based on ath master branch, refreshed openwrt
patches.
And saw big performance degradation. Am I doing something wrong?

Regards,
Roman

On 8 April 2016 at 18:34, Manoharan, Rajkumar <rmanohar@qti.qualcomm.com> wrote:
> Roman,
>
> Which backports version are you using? I don't see codel changes in ath.git/wireless-drivers.git.
> Hope you are using same firmware.
>
> -Rajkumar
> ________________________________________
> From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Roman Yeryomin <leroi.lists@gmail.com>
> Sent: Friday, April 8, 2016 8:14 PM
> To: ath10k@lists.infradead.org
> Subject: ath10k performance, master branch from 20160407
>
> Hello!
>
> I've seen performance patches were commited so I've decided to give it
> a try (using 4.1 kernel and backports).
> The results are quite disappointing: TCP download (client pov) dropped
> from 750Mbps to ~550 and UDP shows completely weird behavour - if
> generating 900Mbps it gives 30Mbps max, if generating 300Mbps it gives
> 250Mbps, before (latest official backports release from January) I was
> able to get 900Mbps.
> Hardware is basically ap152 + qca988x 3x3.
> When running perf top I see that fq_codel_drop eats a lot of cpu.
> Here is the output when running iperf3 UDP test:
>
>     45.78%  [kernel]       [k] fq_codel_drop
>      3.05%  [kernel]       [k] ag71xx_poll
>      2.18%  [kernel]       [k] skb_release_data
>      2.01%  [kernel]       [k] r4k_dma_cache_inv
>      1.73%  [kernel]       [k] eth_type_trans
>      1.24%  [kernel]       [k] build_skb
>      1.20%  [mac80211]     [k] ieee80211_tx_dequeue
>      1.03%  [kernel]       [k] __delay
>      0.98%  [kernel]       [k] fq_codel_enqueue
>      0.94%  [kernel]       [k] __netif_receive_skb_core
>      0.93%  [kernel]       [k] skb_release_head_state
>      0.88%  [ath10k_core]  [k] ath10k_htt_tx
>      0.87%  [kernel]       [k] __dev_queue_xmit
>      0.84%  [mac80211]     [k] ieee80211_tx_status
>      0.81%  [kernel]       [k] __build_skb
>      0.80%  [mac80211]     [k] __ieee80211_subif_start_xmit
>      0.77%  [kernel]       [k] br_handle_frame_finish
>      0.75%  [kernel]       [k] __qdisc_run
>      0.73%  [kernel]       [k] skb_recycler_consume
>      0.72%  [kernel]       [k] kfree_skb
>      0.72%  [kernel]       [k] get_page_from_freelist
>      0.69%  [kernel]       [k] br_fdb_update
>      0.69%  [kernel]       [k] br_handle_frame
>      0.67%  [kernel]       [k] __copy_user_common
>      0.66%  [kernel]       [k] __skb_flow_dissect
>      0.65%  [ath10k_core]  [k] ath10k_txrx_tx_unref
>      0.60%  [kernel]       [k] kmem_cache_alloc
>      0.60%  [mac80211]     [k] sta_addr_hash
>      0.56%  [kernel]       [k] fq_codel_dequeue
>      0.53%  [kernel]       [k] __local_bh_enable_ip
>      0.50%  [kernel]       [k] __br_fdb_get
>
> What could be the reason?
> I've seen there are some patches from Michal which touch fq_codel,
> would those help or not?
>
>
> Regards,
> Roman
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
