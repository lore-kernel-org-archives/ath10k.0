Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIqTK-00035t-G7
 for ath10k@lists.infradead.org; Fri, 11 Oct 2019 08:40:28 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC PATCH 2/2] ath10k: regularly fetch survey counters
References: <20190918124259.17804-1-sven@narfation.org>
 <20190918124259.17804-3-sven@narfation.org>
Date: Fri, 11 Oct 2019 11:40:20 +0300
In-Reply-To: <20190918124259.17804-3-sven@narfation.org> (Sven Eckelmann's
 message of "Wed, 18 Sep 2019 14:42:59 +0200")
Message-ID: <87r23jznd7.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>, ath10k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> From: Sven Eckelmann <seckelmann@datto.com>
>
> The survey counters from firmwares like 10.2.4 are not actually using the
> full 64 bit. Instead, they only use the lower 31 bit and overflow ever
> 14-30s. The driver must frequently fetch the survey data and add it to the
> survey data storage to avoid this problem and to present meaningful values
> to the caller of .get_survey.
>
> It is assumed for now that only the current rx_channel retrieves relevant
> updates for the survey data. This should avoid that the bss channel survey
> request times out too often.

Please clarify in the commit log on which hardware this workaround is
enabled. It should be all hardware with ATH10K_HW_CC_WRAP_SHIFTED_ALL
enabled so both QCA988X versions and QCA9887, right?

> Tested on QCA988x hw2.0 10.2.4-1.0-00043
>
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/mac.h
> +++ b/drivers/net/wireless/ath/ath10k/mac.h
> @@ -40,6 +40,9 @@ void ath10k_offchan_tx_purge(struct ath10k *ar);
>  void ath10k_offchan_tx_work(struct work_struct *work);
>  void ath10k_mgmt_over_wmi_tx_purge(struct ath10k *ar);
>  void ath10k_mgmt_over_wmi_tx_work(struct work_struct *work);
> +void ath10k_survey_dwork(struct work_struct *work);
> +int ath10k_survey_start(struct ath10k *ar);
> +void ath10k_survey_stop(struct ath10k *ar);

Please use ath10k_mac_ prefix for all functions you are adding to mac.c.
Yeah, I know not all the existing one even have that, should fix it at
some point.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
