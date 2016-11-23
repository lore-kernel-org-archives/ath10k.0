Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9Y03-000074-8Q
 for ath10k@lists.infradead.org; Wed, 23 Nov 2016 13:54:11 +0000
MIME-Version: 1.0
Subject: Re: ath10k: advertize hardware packet loss mechanism
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160906070841.4266-1-rmanohar@qti.qualcomm.com>
References: <20160906070841.4266-1-rmanohar@qti.qualcomm.com>
Message-ID: <53adc90b02a842499170bf3324e4645c@euamsexm01a.eu.qualcomm.com>
Date: Wed, 23 Nov 2016 14:53:43 +0100
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
To: Rajkumar Manoharan <rmanohar@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, rmanohar@codeaurora.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> Indicate hardware (or firmware) supports that CQM packet-loss report
> will be generated based on station kickout algorithm. As of now mac80211
> tracks connection loss by missing msdu counts (50) whereas ath10k
> firmware tracks them by missing ppdus (+ BAR tries). While firmware is
> trying to adapt its rate table, mac80211 might send out low_ack event to
> hostapd. This is causing frequent connect and disconnect iteration under
> noisy environment or when station is roaming around.
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

ff32eeb86aa1 ath10k: advertize hardware packet loss mechanism

-- 
https://patchwork.kernel.org/patch/9315811/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
