Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqNVO-00023p-AL
 for ath10k@lists.infradead.org; Mon, 17 Nov 2014 14:42:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: add modpram 'skip_otp' to ignore empty otp
 error during BMI
References: <1415366205-11672-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 17 Nov 2014 16:41:47 +0200
In-Reply-To: <1415366205-11672-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Fri, 7 Nov 2014 18:46:44 +0530")
Message-ID: <87a93pq47o.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> This patch would help bring up wifi interface with default board
> data in case of failures in otp download. It is useful for initial
> caliberation.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -31,12 +31,15 @@
>  unsigned int ath10k_debug_mask;
>  static bool uart_print;
>  static unsigned int ath10k_p2p;
> +static bool skip_otp;
>  module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
>  module_param(uart_print, bool, 0644);
>  module_param_named(p2p, ath10k_p2p, uint, 0644);
> +module_param(skip_otp, bool, 0644);
>  MODULE_PARM_DESC(debug_mask, "Debugging mask");
>  MODULE_PARM_DESC(uart_print, "Uart target debugging");
>  MODULE_PARM_DESC(p2p, "Enable ath10k P2P support");
> +MODULE_PARM_DESC(skip_otp, "Skip otp failure for calibration in testmode");

I added back the newlines:

--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -32,10 +32,12 @@ unsigned int ath10k_debug_mask;
 static bool uart_print;
 static unsigned int ath10k_p2p;
 static bool skip_otp;
+
 module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
 module_param(uart_print, bool, 0644);
 module_param_named(p2p, ath10k_p2p, uint, 0644);
 module_param(skip_otp, bool, 0644);
+
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 MODULE_PARM_DESC(uart_print, "Uart target debugging");
 MODULE_PARM_DESC(p2p, "Enable ath10k P2P support");

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
