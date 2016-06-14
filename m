Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCmvF-0007D3-2i
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 11:54:21 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix some of the macro definitions of HTT_RX_IND
 message
Date: Tue, 14 Jun 2016 11:53:53 +0000
Message-ID: <87wpls2dgv.fsf@kamboji.qca.qualcomm.com>
References: <1464870025-4557-1-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1464870025-4557-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Thu, 2 Jun 2016 17:50:25	+0530")
Content-Language: en-US
Content-ID: <16B087AE1C71BE45ADC6122A481D3DCE@qualcomm.com>
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
To: "Thiagarajan, Vasanthakumar" <vthiagar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> Only five bits are defined to pass tid information in HTT_RX_IND
> message, so the mask which can be used to extract tid should be 0x1f
> instead of the current 0x3f. Also, macros which can be used to extract
> flush_valid and release_valid bits have to be left shifted one bit less
> because these information follow the tid right after. This patch does
> not really fix anything functionally because these macros are not used
> currently.
>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Applied to ath.git, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
