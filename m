Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMxN3-00079S-DA
 for ath10k@lists.infradead.org; Thu, 07 Dec 2017 14:41:55 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix invalid STS_CAP_OFFSET_MASK.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1510679819-24115-1-git-send-email-greearb@candelatech.com>
References: <1510679819-24115-1-git-send-email-greearb@candelatech.com>
Message-ID: <b186e066fba046d592be1d29008ffad6@euamsexm01a.eu.qualcomm.com>
Date: Thu, 7 Dec 2017 15:41:25 +0100
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:

> The 10.4 firmware defines this as a 3-bit field, as does the
> mac80211 stack.  The 4th bit is defined as CONF_IMPLICIT_BF
> at least in the firmware header I have seen.  This patch
> fixes the ath10k wmi header to match the firmware.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

8cec57f5277e ath10k: fix invalid STS_CAP_OFFSET_MASK

-- 
https://patchwork.kernel.org/patch/10057943/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
