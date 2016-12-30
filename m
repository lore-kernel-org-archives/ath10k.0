Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMtJU-00072T-3c
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 09:17:24 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Remove passing unused argument for ath10k_mac_tx
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1482845555-6076-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1482845555-6076-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <b2b7af5ce38243759cfe7a171962c9da@euamsexm01a.eu.qualcomm.com>
Date: Fri, 30 Dec 2016 10:16:56 +0100
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
> 'ath10k_mac_tx' does not seems to use the per station table
> entry pointer 'sta' (struct ieee80211_sta), hence remove passing
> this unused argument
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

a7773b5db155 ath10k: Remove passing unused argument for ath10k_mac_tx

-- 
https://patchwork.kernel.org/patch/9489231/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
