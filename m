Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSPa0-0007ur-Oi
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 15:49:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 08/11] ath10k: add QCA9377 usb hw_param item
Date: Fri, 22 Dec 2017 15:49:33 +0000
Message-ID: <87y3lu9302.fsf@kamboji.qca.qualcomm.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
 <20170917194013.8658-9-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-9-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sun, 17 Sep 2017 21:40:10 +0200")
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

> Hardware parameters for QCA9377 usb devices.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -328,6 +328,29 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  		.vht160_mcs_rx_highest = 0,
>  		.vht160_mcs_tx_highest = 0,
>  	},
> +	{
> +		.id = QCA9377_HW_1_1_DEV_VERSION,
> +		.dev_id = QCA9377_1_0_DEVICE_ID,
> +		.name = "qca9377 hw1.1 usb",
> +		.patch_load_addr = QCA9377_HW_1_0_PATCH_LOAD_ADDR,
> +		.uart_pin = 6,
> +		.otp_exe_param = 0,
> +		.channel_counters_freq_hz = 88000,
> +		.max_probe_resp_desc_thres = 0,
> +		.cal_data_len = 8124,
> +		.fw = {
> +			.dir = QCA9377_HW_1_0_FW_DIR,
> +			.board = QCA9377_HW_1_0_BOARD_DATA_FILE_USB,
> +			.board_size = QCA9377_BOARD_DATA_SZ,
> +			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
> +		},
> +		.hw_ops = &qca988x_ops,
> +		.decap_align_bytes = 4,
> +		.max_num_peers = TARGET_QCA9377_HL_NUM_PEERS,
> +		.is_high_latency = true,
> +		.bus = ATH10K_BUS_USB,
> +		.start_once = true,
> +	},

Oh, forgot to mention that adding hw_params entry should be last in the
patchset and only added once all fixes etc are already in place (eg
patch 10 and 11 should be before this).

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
