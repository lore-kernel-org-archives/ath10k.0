Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buBdh-0003fJ-D1
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 04:59:37 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: add per peer htt tx stats support for 10.4
Date: Wed, 12 Oct 2016 04:59:07 +0000
Message-ID: <87vawygo2w.fsf@kamboji.qca.qualcomm.com>
References: <1475852332-18217-1-git-send-email-akolli@qti.qualcomm.com>
 <1475852332-18217-2-git-send-email-akolli@qti.qualcomm.com>
In-Reply-To: <1475852332-18217-2-git-send-email-akolli@qti.qualcomm.com>
 (akolli@qti.qualcomm.com's message of "Fri, 7 Oct 2016 20:28:51	+0530")
Content-Language: en-US
Content-ID: <EDEAC00C13803A449B92CE368C49DAFD@qualcomm.com>
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
To: "Kolli, Anilkumar" <akolli@qti.qualcomm.com>
Cc: "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

<akolli@qti.qualcomm.com> writes:

> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>
> Per peer tx stats are part of 'HTT_10_4_T2H_MSG_TYPE_PEER_STATS'
> event, Firmware sends one HTT event for every four PPDUs.
> HTT payload has success pkts/bytes, failed pkts/bytes, retry
> pkts/bytes and rate info per ppdu.
> Peer stats are enabled through 'WMI_SERVICE_PEER_STATS',
> which are nowadays enabled by default.
>
> Parse peer stats and update the tx rate information per STA.
>
> tx rate, Peer stats are tested on QCA4019 with Firmware version
> 10.4-3.2.1-00028.
>
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>

This and patch 2 add few new warnings:

drivers/net/wireless/ath/ath10k/htt_rx.c: In function 'ath10k_htt_fetch_peer_stats':
drivers/net/wireless/ath/ath10k/htt_rx.c:2279:3: warning: too many arguments for format [-Wformat-extra-args]
drivers/net/wireless/ath/ath10k/htt_rx.c:2285:17: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/htt_rx.c:2285:17:    expected unsigned int [unsigned] [usertype] peer_id
drivers/net/wireless/ath/ath10k/htt_rx.c:2285:17:    got restricted __le16 [usertype] peer_id
drivers/net/wireless/ath/ath10k/debugfs_sta.c:84: space required before the open parenthesis '('

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
