Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLU9F-0004N2-1q
 for ath10k@lists.infradead.org; Thu, 24 Sep 2020 16:31:10 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: qmi: Skip host capability request for Xiaomi Poco
 F1
References: <1600328501-8832-1-git-send-email-amit.pundir@linaro.org>
Date: Thu, 24 Sep 2020 19:31:02 +0300
In-Reply-To: <1600328501-8832-1-git-send-email-amit.pundir@linaro.org> (Amit
 Pundir's message of "Thu, 17 Sep 2020 13:11:41 +0530")
Message-ID: <87d02bnnll.fsf@codeaurora.org>
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
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, David S Miller <davem@davemloft.net>, lkml <linux-kernel@vger.kernel.org>

Amit Pundir <amit.pundir@linaro.org> writes:

> Workaround to get WiFi working on Xiaomi Poco F1 (sdm845)
> phone. We get a non-fatal QMI_ERR_MALFORMED_MSG_V01 error
> message in ath10k_qmi_host_cap_send_sync(), but we can still
> bring up WiFi services successfully on AOSP if we ignore it.
>
> We suspect either the host cap is not implemented or there
> may be firmware specific issues. Firmware version is
> QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1
>
> qcom,snoc-host-cap-8bit-quirk didn't help. If I use this
> quirk, then the host capability request does get accepted,
> but we run into fatal "msa info req rejected" error and
> WiFi interface doesn't come up.
>
> Attempts are being made to debug the failure reasons but no
> luck so far. Hence this device specific workaround instead
> of checking for QMI_ERR_MALFORMED_MSG_V01 error message.
> Tried ath10k/WCN3990/hw1.0/wlanmdsp.mbn from the upstream
> linux-firmware project but it didn't help and neither did
> building board-2.bin file from stock bdwlan* files.
>
> This workaround will be removed once we have a viable fix.
> Thanks to postmarketOS guys for catching this.
>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

Bjorn, is this ok to take?

> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -651,7 +651,8 @@ static int ath10k_qmi_host_cap_send_sync(struct ath10k_qmi *qmi)
>  
>  	/* older FW didn't support this request, which is not fatal */
>  	if (resp.resp.result != QMI_RESULT_SUCCESS_V01 &&
> -	    resp.resp.error != QMI_ERR_NOT_SUPPORTED_V01) {
> +	    resp.resp.error != QMI_ERR_NOT_SUPPORTED_V01 &&
> +	    !of_machine_is_compatible("xiaomi,beryllium")) { /* Xiaomi Poco F1 workaround */
>  		ath10k_err(ar, "host capability request rejected: %d\n", resp.resp.error);

ath10k-check complained about a too long line, so in the pending branch
I moved the comment before the if statement.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
