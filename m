Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiFml-0004EY-41
 for ath10k@lists.infradead.org; Mon, 08 Jun 2020 11:17:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] wireless: ath10k: Return early in
 ath10k_qmi_event_server_exit() to avoid hard crash on reboot
References: <20200602052533.15048-1-john.stultz@linaro.org>
Date: Mon, 08 Jun 2020 14:17:31 +0300
In-Reply-To: <20200602052533.15048-1-john.stultz@linaro.org> (John Stultz's
 message of "Tue, 2 Jun 2020 05:25:33 +0000")
Message-ID: <877dwhkdro.fsf@codeaurora.org>
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
To: John Stultz <john.stultz@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, Govind Singh <govinds@codeaurora.org>, Rakesh Pillai <pillair@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, lkml <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>

John Stultz <john.stultz@linaro.org> writes:

> Ever since 5.7-rc1, if we call
> ath10k_qmi_remove_msa_permission(), the db845c hard crashes on
> reboot, resulting in the device getting stuck in the usb crash
> debug mode and not coming back up wihthout a hard power off.
>
> This hack avoids the issue by returning early in
> ath10k_qmi_event_server_exit().
>
> A better solution is very much desired!
>
> Feedback and suggestions welcome!
>
> Cc: Rakesh Pillai <pillair@qti.qualcomm.com>
> Cc: Govind Singh <govinds@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Niklas Cassel <niklas.cassel@linaro.org>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Brian Norris <briannorris@chromium.org>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: ath10k@lists.infradead.org
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Just so you know: as you didn't CC linux-wireless it's not on patchwork
and hence not on my radar. But hopefully we find a better solution to
fix this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
