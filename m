Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1p2-0003wi-Nb
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:09:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/2] ath10k: fix peer stats null pointer dereference
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1544497705-21593-1-git-send-email-zhichen@codeaurora.org>
References: <1544497705-21593-1-git-send-email-zhichen@codeaurora.org>
Message-Id: <20181220170910.6FE9660736@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 17:09:10 +0000 (UTC)
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
To: zhichen@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

zhichen@codeaurora.org wrote:

> There was a race condition in SMP that an ath10k_peer was created but its
> member sta was null. Following are procedures of ath10k_peer creation and
> member sta access in peer statistics path.
> 
>     1. Peer creation:
>         ath10k_peer_create()
>             =>ath10k_wmi_peer_create()
>                 =>ath10k_wait_for_peer_created()
>                 ...
> 
>         # another kernel path, RX from firmware
>         ath10k_htt_t2h_msg_handler()
>         =>ath10k_peer_map_event()
>                 =>wake_up()
>                 # ar->peer_map[id] = peer //add peer to map
> 
>         #wake up original path from waiting
>                 ...
>                 # peer->sta = sta //sta assignment
> 
>     2.  RX path of statistics
>         ath10k_htt_t2h_msg_handler()
>             =>ath10k_update_per_peer_tx_stats()
>                 =>ath10k_htt_fetch_peer_stats()
>                 # peer->sta //sta accessing
> 
> Any access of peer->sta after peer was added to peer_map but before sta was
> assigned could cause a null pointer issue. And because these two steps are
> asynchronous, no proper lock can protect them. So both peer and sta need to
> be checked before access.
> 
> Tested: QCA9984 with firmware ver 10.4-3.9.0.1-00005
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

2d3b55853b12 ath10k: fix peer stats null pointer dereference
386f97e3b201 ath10k: fix tx_stats memory leak

-- 
https://patchwork.kernel.org/patch/10722983/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
