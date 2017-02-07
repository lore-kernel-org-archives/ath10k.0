Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb1VN-0007WR-Q6
 for ath10k@lists.infradead.org; Tue, 07 Feb 2017 08:52:07 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Add debugfs support to get per peer tids log via tracing
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1485756147-13762-1-git-send-email-c_mkenna@qti.qualcomm.com>
References: <1485756147-13762-1-git-send-email-c_mkenna@qti.qualcomm.com>
Message-ID: <6f8d8b25a8d443eabd8f3b6ceb51e24e@eusanexr01a.eu.qualcomm.com>
Date: Tue, 7 Feb 2017 00:51:41 -0800
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
To: c_mkenna@qti.qualcomm.com
Cc: mkenna@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

c_mkenna@qti.qualcomm.com wrote:
> From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
> 
> This patch provides support to get per peer tids log.
> 
> echo 1 > /sys/kernel/debug/ieee80211/phyX/netdev\:wlanX/stations/
> XX:XX/peer_debug_trigger
> 
> These logs will be the part of FWLOGS which we collect the logs
> via tracing interface. Here we will get the peer tigd logs only
> once(not repeatedly) when we write 1 to the debugfs file.
> 
> Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

ee8b08a1be82 ath10k: add debugfs support to get per peer tids log via tracing

-- 
https://patchwork.kernel.org/patch/9544499/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
