Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDOQP-0003bI-3l
 for ath10k@lists.infradead.org; Wed, 02 Sep 2020 08:47:28 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Use bdf calibration variant for snoc targets
References: <1593193990-30366-1-git-send-email-pillair@codeaurora.org>
Date: Wed, 02 Sep 2020 11:47:16 +0300
In-Reply-To: <1593193990-30366-1-git-send-email-pillair@codeaurora.org>
 (Rakesh Pillai's message of "Fri, 26 Jun 2020 23:23:10 +0530")
Message-ID: <87y2ls4lbf.fsf@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> writes:

> Board Data File (BDF) is loaded upon driver boot-up procedure.
> The right board data file is identified using bus and qmi-board-id.
>
> The problem, however, can occur when the (default) board data
> file cannot fulfill with the vendor requirements and it is
> necessary to use a different board data file.
>
> Add the support to get the variant field from DTSI and
> use tht information to load the vendor specific BDF.
>
> The device tree requires addition strings to define the variant name
>
>     wifi@a000000 {
>             status = "okay";
>             qcom,ath10k-calibration-variant = "xyz-v2";
>     };
>
>     wifi@a800000 {
>             status = "okay";
>             qcom,ath10k-calibration-variant = "xyz-v1";
>     };
>
> This would create the boarddata identifiers for the board-2.bin search
>
>  *  bus=snoc,qmi-board-id=16,qmi-chip-id=0,variant=xyz-v1
>  *  bus=snoc,qmi-board-id=17,qmi-chip-id=0,variant=xyz-v2

You mention nothing about qmi-chip-id in the commit log. Please document
what it is and also give some examples what kind of values there can be.

> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -576,6 +576,8 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>  	if (resp->chip_info_valid) {
>  		qmi->chip_info.chip_id = resp->chip_info.chip_id;
>  		qmi->chip_info.chip_family = resp->chip_info.chip_family;
> +	} else {
> +		qmi->chip_info.chip_id = 0xFF;
>  	}

So you hard code chip_id to 0xff if it's not valid. Is it 100%
guaranteed that there never will be a chip id with 0xff?

>  
>  	if (resp->board_info_valid)
> @@ -817,12 +819,18 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  static int ath10k_qmi_fetch_board_file(struct ath10k_qmi *qmi)
>  {
>  	struct ath10k *ar = qmi->ar;
> +	int ret;
>  
>  	ar->hif.bus = ATH10K_BUS_SNOC;
>  	ar->id.qmi_ids_valid = true;
>  	ar->id.qmi_board_id = qmi->board_info.board_id;
> +	ar->id.qmi_chip_id = qmi->chip_info.chip_id;

To me a safer, and cleaner, option would be to have
ar->id.qmi_chip_id_valid, and only add qmi-chip-id=%x to the board id if
qmi_chip_id_valid is true. That way there's not this magic 0xff value
hardcoded anywhere.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
