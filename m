Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpBsp-00070Y-CZ
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 10:14:36 +0000
MIME-Version: 1.0
Subject: Re: ath10k: add support for controlling tx power to a station
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1465925914-6404-1-git-send-email-arnagara@qti.qualcomm.com>
References: <1465925914-6404-1-git-send-email-arnagara@qti.qualcomm.com>
Message-ID: <fe7a1510cce94c579623a0742d72a656@euamsexm01a.eu.qualcomm.com>
Date: Wed, 28 Sep 2016 12:14:07 +0200
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, arnagara@codeaurora.org, ath10k@lists.infradead.org

Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> wrote:
> This patch will add the support to control the transmit power for traffic
> to a station associated with the AP. Userspace provide the transmit power
> value in mBm units and the allowed range is from 0 to 70. Underlying FW
> will enforce that the maximum tx power will be based on the regulatory
> requirements. If the user given transmit power is greater than the allowed
> tx power in the given channel, then the FW will use the maximum tx power
> in the same channel.
> 
> When 0 is sent to the FW as tx power, it will revert to the automatic tx
> power for the station.
> 
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

No development on the dependency patches. I'm dropping this for now,
please resend once mac80211 patches are accepted.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/9176353/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
