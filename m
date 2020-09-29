Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNKz5-0002Ys-Oi
 for ath10k@lists.infradead.org; Tue, 29 Sep 2020 19:08:20 +0000
Received: by mail-oi1-f193.google.com with SMTP id a3so6701832oib.4
 for <ath10k@lists.infradead.org>; Tue, 29 Sep 2020 12:08:19 -0700 (PDT)
Date: Tue, 29 Sep 2020 14:08:17 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap
 QMI requests
Message-ID: <20200929190817.GA968845@bogus>
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
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
Cc: devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, David S Miller <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Fri, Sep 25, 2020 at 11:59:41PM +0530, Amit Pundir wrote:
> There are firmware versions which do not support host capability
> QMI request. We suspect either the host cap is not implemented or
> there may be firmware specific issues, but apparently there seem
> to be a generation of firmware that has this particular behavior.
> 
> For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> 
> If we do not skip the host cap QMI request on Poco F1, then we
> get a QMI_ERR_MALFORMED_MSG_V01 error message in the
> ath10k_qmi_host_cap_send_sync(). But this error message is not
> fatal to the firmware nor to the ath10k driver and we can still
> bring up the WiFi services successfully if we just ignore it.
> 
> Hence introducing this DeviceTree quirk to skip host capability
> QMI request for the firmware versions which do not support this
> feature.

So if you change the WiFi firmware, you may force a DT change too. Those 
are pretty independent things otherwise.

Why can't you just always ignore this error? If you can't deal with this 
entirely in the driver, then it should be part of the WiFi firmware so 
it's always in sync.

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
