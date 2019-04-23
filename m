Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIvRh-0000Hv-TD
 for ath10k@lists.infradead.org; Tue, 23 Apr 2019 13:26:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/5] ath10k: add initialization of HTC header
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190417191503.18814-2-erik.stromdahl@gmail.com>
References: <20190417191503.18814-2-erik.stromdahl@gmail.com>
Message-Id: <20190423132649.9903D615AB@smtp.codeaurora.org>
Date: Tue, 23 Apr 2019 13:26:49 +0000 (UTC)
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
Cc: kvalo@qca.qualcomm.com, Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> HTC header carries junk values that may be interpreted by the firmware
> differently. Enable credit update only if flow control is enabled for
> the corresponding endpoint.
> 
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

fbd428a5b828 ath10k: add initialization of HTC header
f91b63b0e3b2 ath10k: sdio: add missing error check

-- 
https://patchwork.kernel.org/patch/10906001/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
