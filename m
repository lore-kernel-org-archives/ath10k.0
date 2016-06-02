Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8SwQ-000441-Os
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 13:45:43 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/2] ath10k: remove duplicate and unused rx rate flags
Date: Thu, 2 Jun 2016 13:45:15 +0000
Message-ID: <87a8j3zout.fsf@kamboji.qca.qualcomm.com>
References: <1464852235-13110-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1464852235-13110-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Thu, 2 Jun 2016 12:53:54	+0530")
Content-Language: en-US
Content-ID: <0006ACB928314F4BA8E213438A48279D@qualcomm.com>
MIME-Version: 1.0
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> All these flags are not used and their use is completely
> covered by 'ath10k_hw_rate_ofdm', 'ath10k_hw_rate_cck',
> and RX_PPDU_START_RATE_FLAG
>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> Patchwork-Id: 9129361
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

I guess you took this patch from the pending branch? :) The Patchwork-Id
line is something which my script adds for patches in the pending
branch, and removes them before applying them to ath-next, but this line
should not be visible when submitting patches.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
