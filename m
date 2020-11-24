Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcSY-0006Mg-6c
 for ath10k@lists.infradead.org; Tue, 24 Nov 2020 17:50:36 +0000
Received: by mail-ot1-x342.google.com with SMTP id z24so6150972oto.6
 for <ath10k@lists.infradead.org>; Tue, 24 Nov 2020 09:50:33 -0800 (PST)
Date: Tue, 24 Nov 2020 11:50:29 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] ath10k: qmi: Skip host capability request for Xiaomi
 Poco F1
Message-ID: <20201124175029.GF185852@builder.lan>
References: <1606127329-6942-1-git-send-email-amit.pundir@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606127329-6942-1-git-send-email-amit.pundir@linaro.org>
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
Cc: lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k@lists.infradead.org, David S Miller <davem@davemloft.net>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, phone-devel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Kalle Valo <kvalo@codeaurora.org>, Joel S <jo@jsfamily.in>

On Mon 23 Nov 04:28 CST 2020, Amit Pundir wrote:

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
> ---
> We dropped this workaround last time in the favor of
> a generic dts quirk to skip host cap check. But that
> is under under discussion for a while now,
> https://lkml.org/lkml/2020/9/25/1119, so resending
> this short term workaround for the time being.
> 

I still want the quirk, because we have this on other machines as well.

> v2: ath10k-check complained about a too long line last
>     time, so moved the comment to a new line.
>     
>  drivers/net/wireless/ath/ath10k/qmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index ae6b1f402adf..1c58b0ff1d29 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -653,7 +653,9 @@ static int ath10k_qmi_host_cap_send_sync(struct ath10k_qmi *qmi)
>  
>  	/* older FW didn't support this request, which is not fatal */
>  	if (resp.resp.result != QMI_RESULT_SUCCESS_V01 &&
> -	    resp.resp.error != QMI_ERR_NOT_SUPPORTED_V01) {
> +	    resp.resp.error != QMI_ERR_NOT_SUPPORTED_V01 &&
> +	    /* Xiaomi Poco F1 workaround */

If we go with a temporary approach this comment should describe why this
is here. (And it probably shouldn't be in the middle of the expression
list in the conditional.

Regards,
Bjorn

> +	    !of_machine_is_compatible("xiaomi,beryllium")) {
>  		ath10k_err(ar, "host capability request rejected: %d\n", resp.resp.error);
>  		ret = -EINVAL;
>  		goto out;
> -- 
> 2.7.4
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
