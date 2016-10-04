Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brRFH-0007W9-DX
 for ath10k@lists.infradead.org; Tue, 04 Oct 2016 15:03:07 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath: export alpha2 helper
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1470140454-3899-2-git-send-email-bartosz.markowski@tieto.com>
References: <1470140454-3899-2-git-send-email-bartosz.markowski@tieto.com>
Message-ID: <7569987251e5403ebe0c30061dd7db5c@euamsexm01a.eu.qualcomm.com>
Date: Tue, 4 Oct 2016 17:02:36 +0200
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> wrote:
> From: Michal Kazior <michal.kazior@tieto.com>
> 
> This will be helpful for drivers that can acquire
> alpha2 regulatory codes.
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

2 patches applied to ath-next branch of ath.git, thanks.

d291d8e0592a ath: export alpha2 helper
209b2a68de76 ath10k: add platform regulatory domain support

-- 
https://patchwork.kernel.org/patch/9256535/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
