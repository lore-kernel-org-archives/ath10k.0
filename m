Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHROu-0002hP-UP
 for ath10k@lists.infradead.org; Sat, 12 May 2018 10:05:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: add fw crash dump support for QCA9888 and QCA99X0
References: <1525781496-14776-1-git-send-email-akolli@codeaurora.org>
Date: Sat, 12 May 2018 13:05:03 +0300
In-Reply-To: <1525781496-14776-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Tue, 8 May 2018 17:41:36 +0530")
Message-ID: <874ljdur3k.fsf@kamboji.qca.qualcomm.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> This patch adds crash dump support for QCA9888 and QCA99X0
>
> Tested On: QCA9888, Firmware Version: 10.4-3.5.3-00053
> Tested on QCA99X0, Firmware Version: 10.4.1.00030-1
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath10k/coredump.c
> +++ b/drivers/net/wireless/ath/ath10k/coredump.c
> @@ -701,6 +701,89 @@
>  	},
>  };
>  
> +static const struct ath10k_mem_region qca99X0_hw20_mem_regions[] = {

In the pending branch I changed X to lower case and also cleaned up the
commit log a bit:

    ath10k: add memory dump support for QCA9888 and QCA99X0
    
    This patch adds firmware crash memory dump support for QCA9888 and QCA99X0.
    
    Tested on:
    
    QCA9888 firmware 10.4-3.5.3-00053
    QCA99X0 firmware 10.4.1.00030-1


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
