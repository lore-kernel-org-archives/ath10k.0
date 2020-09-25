Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpdP-0007Bo-TU
 for ath10k@lists.infradead.org; Fri, 25 Sep 2020 15:27:44 +0000
Received: by mail-oi1-x244.google.com with SMTP id z26so3134112oih.12
 for <ath10k@lists.infradead.org>; Fri, 25 Sep 2020 08:27:43 -0700 (PDT)
Date: Fri, 25 Sep 2020 10:27:39 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ath10k: qmi: Skip host capability request for Xiaomi
 Poco F1
Message-ID: <20200925152739.GE2510@yoga>
References: <1600328501-8832-1-git-send-email-amit.pundir@linaro.org>
 <87d02bnnll.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d02bnnll.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, David S Miller <davem@davemloft.net>

On Thu 24 Sep 11:31 CDT 2020, Kalle Valo wrote:

> Amit Pundir <amit.pundir@linaro.org> writes:
> 
> > Workaround to get WiFi working on Xiaomi Poco F1 (sdm845)
> > phone. We get a non-fatal QMI_ERR_MALFORMED_MSG_V01 error
> > message in ath10k_qmi_host_cap_send_sync(), but we can still
> > bring up WiFi services successfully on AOSP if we ignore it.
> >
> > We suspect either the host cap is not implemented or there
> > may be firmware specific issues. Firmware version is
> > QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1
> >
> > qcom,snoc-host-cap-8bit-quirk didn't help. If I use this
> > quirk, then the host capability request does get accepted,
> > but we run into fatal "msa info req rejected" error and
> > WiFi interface doesn't come up.
> >
> > Attempts are being made to debug the failure reasons but no
> > luck so far. Hence this device specific workaround instead
> > of checking for QMI_ERR_MALFORMED_MSG_V01 error message.
> > Tried ath10k/WCN3990/hw1.0/wlanmdsp.mbn from the upstream
> > linux-firmware project but it didn't help and neither did
> > building board-2.bin file from stock bdwlan* files.
> >
> > This workaround will be removed once we have a viable fix.
> > Thanks to postmarketOS guys for catching this.
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> 
> Bjorn, is this ok to take?
> 

As I wrote in the answer to Amit I think we should introduce a generic
quirk to skip host_cap instead.

So if you pick this up (which is an ok short term workaround) I think we
should revert it once we have a generic mechanism.

Regards,
Bjorn

> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -651,7 +651,8 @@ static int ath10k_qmi_host_cap_send_sync(struct ath10k_qmi *qmi)
> >  
> >  	/* older FW didn't support this request, which is not fatal */
> >  	if (resp.resp.result != QMI_RESULT_SUCCESS_V01 &&
> > -	    resp.resp.error != QMI_ERR_NOT_SUPPORTED_V01) {
> > +	    resp.resp.error != QMI_ERR_NOT_SUPPORTED_V01 &&
> > +	    !of_machine_is_compatible("xiaomi,beryllium")) { /* Xiaomi Poco F1 workaround */
> >  		ath10k_err(ar, "host capability request rejected: %d\n", resp.resp.error);
> 
> ath10k-check complained about a too long line, so in the pending branch
> I moved the comment before the if statement.
> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
