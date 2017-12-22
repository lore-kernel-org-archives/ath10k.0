Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSPYA-0007eO-Td
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 15:47:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 09/11] ath10k: add QCA9377 sdio hw_param item
Date: Fri, 22 Dec 2017 15:47:01 +0000
Message-ID: <877eteahoq.fsf@kamboji.qca.qualcomm.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
 <20170917194013.8658-10-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-10-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sun, 17 Sep 2017 21:40:11 +0200")
Content-Language: en-US
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Hardware parameters for QCA9377 sdio devices.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 25 +++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/hw.h   |  1 +
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index b6893254ef53..146a9f61b5f0 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -351,6 +351,31 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  		.bus = ATH10K_BUS_USB,
>  		.start_once = true,
>  	},
> +	{
> +		.id = QCA9377_HW_1_1_DEV_VERSION,
> +		.dev_id = QCA9377_1_0_DEVICE_ID,
> +		.name = "qca9377 hw1.1 sdio",
> +		.patch_load_addr = QCA9377_HW_1_0_PATCH_LOAD_ADDR,
> +		.uart_pin = 19,
> +		.otp_exe_param = 0,
> +		.channel_counters_freq_hz = 88000,
> +		.max_probe_resp_desc_thres = 0,
> +		.cal_data_len = 8124,
> +		.fw = {
> +			.dir = QCA9377_HW_1_0_FW_DIR,
> +			.board = QCA9377_HW_1_0_BOARD_DATA_FILE_SDIO,
> +			.board_size = QCA9377_BOARD_DATA_SZ,
> +			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
> +		},
> +		.hw_ops = &qca6174_ops,
> +		.hw_clk = qca6174_clk,
> +		.target_cpu_freq = 176000000,
> +		.decap_align_bytes = 4,
> +		.max_num_peers = TARGET_QCA9377_HL_NUM_PEERS,
> +		.is_high_latency = true,
> +		.bus = ATH10K_BUS_SDIO,
> +		.start_once = true,
> +	},
>  	{
>  		.id = QCA4019_HW_1_0_DEV_VERSION,
>  		.dev_id = 0,
> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
> index 420851e26a09..77011a6cafa1 100644
> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -128,6 +128,7 @@ enum qca9377_chip_id_rev {
>  #define QCA9377_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA9377/hw1.0"
>  #define QCA9377_HW_1_0_BOARD_DATA_FILE "board.bin"
>  #define QCA9377_HW_1_0_BOARD_DATA_FILE_USB "board-usb.bin"
> +#define QCA9377_HW_1_0_BOARD_DATA_FILE_SDIO "board-sdio.bin"

Similar comment about not sure about having separate board.bin for sdio.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
