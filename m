Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCnCL-0004lm-6n
 for ath10k@lists.infradead.org; Thu, 31 Jul 2014 10:02:58 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 31 Jul 2014 12:02:09 +0200
Subject: RE : RE : RE : Trouble shooting low rate MCS9 in 802.11ac
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F15C1D803@srvexch01.SODIELEC.local>
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <53C6A1C7.5060004@intec.ugent.be>
 <CA+BoTQ==9HQrPxp3qZGwEm_a3wQY_wMW5ckrbSRu+MkxU1HRgw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EB@srvexch01.SODIELEC.local>
 <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EC@srvexch01.SODIELEC.local>
 <CACKGw+HraUvPSVprRQCEh0=MRaiahpGde9wUj-w5pbDtXSj8Yw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EE@srvexch01.SODIELEC.local>
 <CAJ-Vmon+TC_TouvoAX3kZT5x+crrStHLmcjCfOeGHvC5eszbTA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F5@srvexch01.SODIELEC.local>
 <53D252B4.9070704@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F8@srvexch01.SODIELEC.local>
 <53D6757A.8040803@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7FE@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D800@srvexch01.SODIELEC.local>,
 <CA+BoTQ=QscHgrk5bbWugjdnVGh=T_L-psEPKToYHOdKGcQZi7A@mail.gmail.com>
In-Reply-To: <CA+BoTQ=QscHgrk5bbWugjdnVGh=T_L-psEPKToYHOdKGcQZi7A@mail.gmail.com>
Content-Language: fr-FR
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bartosz Markowski <bartosz.markowski@tieto.com>

>Strange that disabling checksum helped things.  Maybe your ethernet driver
>has issues?

I've no idea about this. Do you have any suggest how to check it? :D

>Looks like removing netfilter (and maybe ebtables?) would
>also help your performance...

I don't enable ebtables in my kernel config, so it shoud not be built in my kernel

>tx status is needed for bookkeping at least, even if you don't
>get useful status info in stock firmware.
>
>CT firmware will give you proper status if you apply some of the
>ath10k driver patches from my tree, but that is unlikely to help
>performance.

>This accounts for 76.58% of CPU usage. You've most likely trimmed down
>the remaining entries accounting for 24% before posting.

I saw there is option -a when running perf top but I did it and still, it doesn't 
print all processes :(

>By the looks of it you might be able to strip down netfilter
>(iptables) rules to none on all chains and tables if you just want to
>max out the performance at the cost of having no firewall whatsoever.

I'd cleaned all rules of iptables and removed all modules of iptables from kernel by command modprobe -r
But there's still some process of netfilter process running. I disabled netfilter on bridge interface by writing 0 to these files:
/proc/sys/net/bridge/bridge-nf-call-arptables
/proc/sys/net/bridge/bridge-nf-call-iptables
/proc/sys/net/bridge/bridge-nf-call-ip6tables

and the performance increases from 500 to 550 Mbps (iperf in tcp reports between 530 ~ 570Mbps). 
There is no more process like  "br_nf_pre_routing" and "br_nf_forward_ip".
Do you think I can do anything more to strip down netfilter?
Now the processor of my AP (about 20% idle)  is no more exhausted but not the same on STA (about 4.5 % idle)
Here is my perf top result on AP:

PerfTop:      99 irqs/sec  kernel:96.0%  exact:  0.0% [1000Hz cycles],  (all, 1 CPU)
-------------------------------------------------------------------------------

    24.40%  [kernel]       [k] armadaxp_enter_idle
     6.04%  [mac80211]     [k] ieee80211_tx_status
     5.07%  [kernel]       [k] memcpy
     3.38%  [kernel]       [k] mv_eth_poll
     3.38%  [mac80211]     [k] $a
     2.66%  [kernel]       [k] __memzero
     2.54%  [ath10k_pci]   [k] ath10k_ce_send_nolock
     2.17%  [ath10k_core]  [k] ath10k_txrx_tx_unref
     2.05%  [kernel]       [k] dev_queue_xmit
     2.05%  [kernel]       [k] br_handle_frame
     1.69%  [kernel]       [k] local_bh_enable
     1.69%  [kernel]       [k] eth_type_trans
     1.69%  [ath10k_core]  [k] ath10k_htt_tx
     1.69%  ld-2.13.so     [.] 0xf120  
     1.69%  [ath10k_pci]   [k] ath10k_ce_completed_send_next
     1.57%  [kernel]       [k] __netif_receive_skb
     1.45%  [kernel]       [k] dev_hard_start_xmit
     1.45%  [kernel]       [k] nf_iterate
     1.33%  [kernel]       [k] dev_gro_receive                                  
     1.21%  [kernel]       [k] kfree                                            
     1.21%  [kernel]       [k] __kfree_skb 

And on STA:

PerfTop:      51 irqs/sec  kernel:94.1%  exact:  0.0% [1000Hz cycles],  (all, 1 CPU)
-------------------------------------------------------------------------------

     7.51%  [kernel]       [k] memcpy
     6.65%  [ath10k_core]  [k] ath10k_htt_rx_amsdu_pop
     5.49%  [kernel]       [k] mv_eth_tx
     4.91%  [kernel]       [k] kfree
     4.91%  [kernel]       [k] __memzero
     4.05%  [kernel]       [k] armadaxp_enter_idle
     4.05%  [kernel]       [k] __kmalloc_track_caller
     4.05%  [kernel]       [k] dev_queue_xmit
     4.05%  [kernel]       [k] ip_rcv
     3.76%  [mac80211]     [k] ieee80211_rx
     3.76%  [kernel]       [k] __kfree_skb
     3.76%  [ath10k_core]  [k] $a
     2.89%  [mac80211]     [k] ieee80211_rx_handlers
     2.60%  [mac80211]     [k] $a
     2.60%  [kernel]       [k] ip_forward
     2.60%  [cfg80211]     [k] ieee80211_data_to_8023
     2.60%  [ath10k_pci]   [k] ath10k_ce_completed_send_next
     2.31%  ld-2.13.so     [.] 0x9d8c  
     2.31%  [cfg80211]     [k] ieee80211_hdrlen
     2.02%  [mac80211]     [k] $a

>You also might want to change qdisc (`tc` command) on all interfaces
>involved to pfifo in case you're using codel to further reduce CPU
>load at the cost of buffer bloating the system.

I installed tc from package iproute2 and did : tc qdisc but it doesn't improve the performance :D

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
