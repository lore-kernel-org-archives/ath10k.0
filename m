Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpBTb-00057P-BJ
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 09:48:32 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Ignore SWBA event for a vif if its marked for no beacon
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1474359727-6854-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1474359727-6854-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <a4c2bf6fd09a4659bc0901e4f00e3af8@euamsexm01a.eu.qualcomm.com>
Date: Wed, 28 Sep 2016 11:48:03 +0200
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
> Ignore processing further in SWBA event scheduled for a vif, if mac80211
> has marked the particular vif for stop beaconing and brought the vdev
> down in 'ath10k_control_beaconing'. This should potentially avoid ath10k
> warning/error messages while running continuous wifi down/up with max
> number of vaps configured. Found this change during code walk through
> and going through other beacon configuration related functions in ath10k
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

b63b33ecafa5 ath10k: Ignore SWBA event for a vif if its marked for no beacon

-- 
https://patchwork.kernel.org/patch/9341147/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
