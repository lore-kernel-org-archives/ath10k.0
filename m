Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNB0r-0002QC-7w
 for ath10k@lists.infradead.org; Tue, 29 Sep 2020 08:29:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: qmi: Skip host capability request for Xiaomi Poco
 F1
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600328501-8832-1-git-send-email-amit.pundir@linaro.org>
References: <1600328501-8832-1-git-send-email-amit.pundir@linaro.org>
Message-Id: <20200929082900.67355C433C8@smtp.codeaurora.org>
Date: Tue, 29 Sep 2020 08:29:00 +0000 (UTC)
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k@lists.infradead.org, David S Miller <davem@davemloft.net>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, lkml <linux-kernel@vger.kernel.org>

Amit Pundir <amit.pundir@linaro.org> wrote:

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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Dropped per discussion.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11781801/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
