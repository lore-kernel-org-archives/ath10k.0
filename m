Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePVQV-0000bx-5d
 for ath10k@lists.infradead.org; Thu, 14 Dec 2017 15:28:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2, 1/3] ath10k: remove MAC80211_DEBUGFS dependency on
 ath10k_sta_statistics
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1512480685-28471-2-git-send-email-akolli@qti.qualcomm.com>
References: <1512480685-28471-2-git-send-email-akolli@qti.qualcomm.com>
Message-ID: <7f4e7c29cceb41cd83a8aaa8188f4d0a@euamsexm01a.eu.qualcomm.com>
Date: Thu, 14 Dec 2017 16:27:15 +0100
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

> Remove CONFIG_MAC80211_DEBUGFS dependency on ath10k_sta_statistics().
> ath10k_sta_statistics() has per sta tx/rx stats and this should not
> be dependent on MAC80211_DEBUGFS.
> 
> No changes in functionality.
> 
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

3 patches applied to ath-next branch of ath.git, thanks.

6a7f891178c2 ath10k: remove MAC80211_DEBUGFS dependency on ath10k_sta_statistics
7f9befbb555d ath10k: move pktlog_filter out of ath10k_debug
e8123bb74c4e ath10k: add per peer tx stats support for 10.2.4

-- 
https://patchwork.kernel.org/patch/10092915/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
