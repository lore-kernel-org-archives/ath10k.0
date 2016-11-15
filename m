Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6eqm-0004Xq-Mf
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 14:36:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2,1/2] ath10k: add per peer htt tx stats support for 10.4
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1476783085-10724-2-git-send-email-akolli@qti.qualcomm.com>
References: <1476783085-10724-2-git-send-email-akolli@qti.qualcomm.com>
Message-ID: <82cc2d18b1e747068ea6a10ca47b212a@euamsexm01a.eu.qualcomm.com>
Date: Tue, 15 Nov 2016 15:36:12 +0100
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
To: akolli@qti.qualcomm.com
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

akolli@qti.qualcomm.com wrote:
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

I see a new sparse warning:

drivers/net/wireless/ath/ath10k/htt_rx.c:2290:17: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/htt_rx.c:2290:17:    expected int [signed] peer_id
drivers/net/wireless/ath/ath10k/htt_rx.c:2290:17:    got restricted __le16 [usertype] peer_id

2 patches set to Changes Requested.

9381691 [PATCHv2,1/2] ath10k: add per peer htt tx stats support for 10.4
9381693 [PATCHv2,2/2] ath10k: add support for per sta tx bitrate

-- 
https://patchwork.kernel.org/patch/9381691/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
