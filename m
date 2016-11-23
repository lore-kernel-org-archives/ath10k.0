Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9Y3N-0001kD-Di
 for ath10k@lists.infradead.org; Wed, 23 Nov 2016 13:57:37 +0000
MIME-Version: 1.0
Subject: Re: ath10k: add spectral scan support to wmi-tlv
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1479130000-11551-1-git-send-email-michal.kazior@tieto.com>
References: <1479130000-11551-1-git-send-email-michal.kazior@tieto.com>
Message-ID: <25cdf457b9db416ebc48d2be28dcdd54@euamsexm01a.eu.qualcomm.com>
Date: Wed, 23 Nov 2016 14:57:10 +0100
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> wrote:
> Command structure and event flow doesn't seem to
> be any different compared to existing
> implementation for other firmware branches.
> 
> This patch effectively adds in-driver support for
> spectral scanning on QCA61x4 and QCA9377.
> 
> Tested QCA9377 w/ WLAN.TF.1.0-00267-1.
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Patch applied to ath-next branch of ath.git, thanks.

5a401f36ba30 ath10k: add spectral scan support to wmi-tlv

-- 
https://patchwork.kernel.org/patch/9427503/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
