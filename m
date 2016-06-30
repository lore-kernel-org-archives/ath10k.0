Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIZT8-0002Ck-Gj
 for ath10k@lists.infradead.org; Thu, 30 Jun 2016 10:45:15 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: Fix 10.4 extended peer stats update
Date: Thu, 30 Jun 2016 10:44:47 +0000
Message-ID: <87vb0r5529.fsf@kamboji.qca.qualcomm.com>
References: <1464851602-12969-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1464851602-12969-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Thu, 2 Jun 2016 12:43:22	+0530")
Content-Language: en-US
Content-ID: <55A91B5CC46F73468E8BE43CCF1F91EC@qualcomm.com>
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
> 10.4 'extended peer stats' will be not be appended with normal peer stats
> data and they shall be coming in separate chunks. Fix this by maintaining
> a separate linked list 'extender peer stats' for 10.4 and update
> rx_duration for per station statistics. Also parse through beacon filter
> (if enabled), to make sure we parse the extended peer stats properly.
> This issue was exposed when more than one client is connected and
> extended peer stats for 10.4 is enabled
>
> The order for the stats is as below
> S - standard peer stats, E- extended peer stats, B - beacon filter stats
>
> {S1, S2, S3..} -> {B1, B2, B3..}(if available) -> {E1, E2, E3..}
>
> Fixes: f9575793d44c ("ath10k: enable parsing per station rx duration for 10.4")
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> ---
> [v1: addressed line wrap around comment from Kalle]
> [v2: fixed ; in dummy inline function definition - thanks Sven Eckelmann]
> [v3: removed wmi-op-version suggested by Kalle, introduced fw specifi hw param for extd_stats]

I was sure I replied to this, but I can't find my reply anywhere. So I
guess I didn't, sorry about that.

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -181,6 +181,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  			.board = QCA99X0_HW_2_0_BOARD_DATA_FILE,
>  			.board_size = QCA99X0_BOARD_DATA_SZ,
>  			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
> +			.extd_peer_stats = true,
>  		},
>  	},
>  	{
> @@ -203,6 +204,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  			.board = QCA9984_HW_1_0_BOARD_DATA_FILE,
>  			.board_size = QCA99X0_BOARD_DATA_SZ,
>  			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
> +			.extd_peer_stats = true,
>  		},
>  	},
>  	{
> @@ -261,6 +263,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  			.board = QCA4019_HW_1_0_BOARD_DATA_FILE,
>  			.board_size = QCA4019_BOARD_DATA_SZ,
>  			.board_ext_size = QCA4019_BOARD_EXT_DATA_SZ,
> +			.extd_peer_stats = true,
>  		},
>  	},
>  };

This is not a hardware feature so hw_params is not really the right
place to handle this. In the pending branch I tried to solve this a bit
differently:

https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=ecf4daadc7677518ec7185dbddab959ac6e2db96

I added a bool "extended" to struct ath10k_fw_stats which is used to
detect if extended stats are used. Would that work? Please note that I
have only compile tested the patch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
