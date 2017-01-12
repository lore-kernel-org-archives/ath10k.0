Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRczn-0001Z2-3l
 for ath10k@lists.infradead.org; Thu, 12 Jan 2017 10:52:42 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: htc: Removal of unused struct members
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1481374721-16354-1-git-send-email-erik.stromdahl@gmail.com>
References: <1481374721-16354-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <cb5a139fbc2440978aa2a66ed2e607a0@euamsexm01a.eu.qualcomm.com>
Date: Thu, 12 Jan 2017 11:52:11 +0100
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
> Removed tx_credits_per_max_message and tx_credit_size
> from struct ath10k_htc_ep since they are not used
> anywhere in the code.
> 
> They are just written, never read.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

2 patches applied to ath-next branch of ath.git, thanks.

7bc7441e4da3 ath10k: htc: removal of unused struct members
d48b62ceeea2 ath10k: htc: simplified credit distribution

-- 
https://patchwork.kernel.org/patch/9469283/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
