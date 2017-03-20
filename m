Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cpyz9-00040s-9F
 for ath10k@lists.infradead.org; Mon, 20 Mar 2017 15:12:42 +0000
MIME-Version: 1.0
Subject: Re: [4.11] ath10k: fix incorrect wlan_mac_base in qca6174_regs
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1489445343-8719-1-git-send-email-ryanhsu@qca.qualcomm.com>
References: <1489445343-8719-1-git-send-email-ryanhsu@qca.qualcomm.com>
Message-ID: <61056b2da2f84bc0bc1def2646729c2c@euamsexm01a.eu.qualcomm.com>
Date: Mon, 20 Mar 2017 16:12:09 +0100
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
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ryan Hsu <ryanhsu@qca.qualcomm.com> wrote:
> From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
> 
> In the 'commit ebee76f7fa46 ("ath10k: allow setting coverage class")',
> it inherits the design and the address offset from ath9k, but the address
> is not applicable to QCA6174, which leads to a random crash while doing the
> resume() operation, since the set_coverage_class.ops will be called from
> ieee80211_reconfig() when resume() (if the wow is not configured).
> 
> Fix the incorrect address offset here to avoid the random crash.
> 
> Verified on QCA6174/hw3.0 with firmware WLAN.RM.4.4-00022-QCARMSWPZ-2.
> 
> Fixes: ebee76f7fa46 ("ath10k: allow setting coverage class")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>

Patch applied to ath-current branch of ath.git, thanks.

6be3b6cce1e2 ath10k: fix incorrect wlan_mac_base in qca6174_regs

-- 
https://patchwork.kernel.org/patch/9622251/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
