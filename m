Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fueA3-0000VZ-Gq
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 13:36:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] ath10k: add extended per sta tx statistics support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1533561223-342-4-git-send-email-akolli@codeaurora.org>
References: <1533561223-342-4-git-send-email-akolli@codeaurora.org>
Message-Id: <20180828133516.D401C60541@smtp.codeaurora.org>
Date: Tue, 28 Aug 2018 13:35:16 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> This patch adds per station tx statistics support.
> 
> Per station tx stats include
>  - pkts/bytes transmitted at all possible rates(mcs/nss/bw/gi).
>  - ACK fails count
>  - ampdu bytes/pkts transmitted at all possible rates(mcs/nss/bw/gi).
>  - BA fails count
> 
> Tested on QCA9984/QCA4019/QCA988x
> Firmware: 10.4-3.5.3-00057
> 	  10.2.4-1.0-00037
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

kbuild bot found a new warning:

   drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_sta_state':
>> drivers/net/wireless/ath/ath10k/mac.c:6335:9: error: 'struct ath10k' has no member named 'debug'
      if (ar->debug.enable_extd_tx_stats)
            ^~

-- 
https://patchwork.kernel.org/patch/10557073/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
