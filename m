Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brRgI-0002Eg-Tg
 for ath10k@lists.infradead.org; Tue, 04 Oct 2016 15:30:59 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Cleanup calling ath10k_htt_rx_h_unchain
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1474981314-15987-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1474981314-15987-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <2cb38dba80294e6da1005ac0927d01eb@euamsexm01a.eu.qualcomm.com>
Date: Tue, 4 Oct 2016 17:30:17 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> 'ath10k_htt_rx_h_unchain' is need to be called only if the return
> value from 'ath10k_htt_rx_amsdu_pop' is 1('chained msdu's'), this
> change makes it more explicit and avoids doing a skb_peek, fetching
> rx descriptor pointer, checking rx msdu decap format for the case of
> ret = 0 (unchained msdus). Found this change during code walk through,
> not sure if this addresses any issue.
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Failed to apply to pending branch

error: patch failed: drivers/net/wireless/ath/ath10k/htt_rx.c:1550
error: drivers/net/wireless/ath/ath10k/htt_rx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/9351833/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
