Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMtLr-0007ZH-Vm
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 09:19:52 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Enable advertising support for channel 169, 5Ghz
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1482852215-6438-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1482852215-6438-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <62f5c79aac6a4a72880cae899ae742e9@euamsexm01a.eu.qualcomm.com>
Date: Fri, 30 Dec 2016 10:19:24 +0100
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
> Enable advertising support for channel 169, 5Ghz so that
> based on the regulatory domain(country code) this channel
> shall be active for use. For example in countries like India
> this channel shall be available for use with latest regulatory updates
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

34c30b0a5e97 ath10k: enable advertising support for channel 169, 5Ghz

-- 
https://patchwork.kernel.org/patch/9489307/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
