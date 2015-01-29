Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGoTM-0002xX-91
 for ath10k@lists.infradead.org; Thu, 29 Jan 2015 12:45:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: enable qca6174 hw3.2
References: <1422534273-18427-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 29 Jan 2015 14:44:49 +0200
In-Reply-To: <1422534273-18427-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 29 Jan 2015 13:24:33 +0100")
Message-ID: <87r3ud21tq.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> The 3.2 revision has a different target BMI
> version so it wasn't recognized by ath10k (despite
> the chip_id rev being on the supported list
> already).
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

But uses the same binaries as hw3.0?

> +	{
> +		.id = QCA6174_HW_3_2_VERSION,
> +		.name = "qca6174 hw3.2",
> +		.patch_load_addr = QCA6174_HW_3_0_PATCH_LOAD_ADDR,
> +		.uart_pin = 6,
> +		.fw = {
> +			.dir = QCA6174_HW_3_0_FW_DIR,
> +			.fw = QCA6174_HW_3_0_FW_FILE,
> +			.otp = QCA6174_HW_3_0_OTP_FILE,
> +			.board = QCA6174_HW_3_0_BOARD_DATA_FILE,
> +			.board_size = QCA6174_BOARD_DATA_SZ,
> +			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
> +		},
> +	},
>  };

I added this in pending branch to avoid people wondering why it uses 3.0
binaries:

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 36a8fcf349fa..310e12bc078a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -91,6 +91,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
                .patch_load_addr = QCA6174_HW_3_0_PATCH_LOAD_ADDR,
                .uart_pin = 6,
                .fw = {
+                       /* uses same binaries as hw3.0 */
                        .dir = QCA6174_HW_3_0_FW_DIR,
                        .fw = QCA6174_HW_3_0_FW_FILE,
                        .otp = QCA6174_HW_3_0_OTP_FILE,


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
