Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgCOg-0005Ci-A4
 for ath10k@lists.infradead.org; Tue, 02 Jun 2020 19:16:27 +0000
Received: by mail-lf1-x142.google.com with SMTP id h188so6870072lfd.7
 for <ath10k@lists.infradead.org>; Tue, 02 Jun 2020 12:16:24 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id o2sm894830lfc.85.2020.06.02.12.16.21
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 12:16:21 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id d7so6837629lfi.12
 for <ath10k@lists.infradead.org>; Tue, 02 Jun 2020 12:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052533.15048-1-john.stultz@linaro.org>
In-Reply-To: <20200602052533.15048-1-john.stultz@linaro.org>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 2 Jun 2020 12:16:09 -0700
Message-ID: <CA+ASDXMbNvbBdsC11dzUPX7RkMFYhJev2npPsRD_SnGQB+1hag@mail.gmail.com>
Subject: Re: [PATCH] wireless: ath10k: Return early in
 ath10k_qmi_event_server_exit() to avoid hard crash on reboot
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Govind Singh <govinds@codeaurora.org>, Rakesh Pillai <pillair@qti.qualcomm.com>, lkml <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Kalle Valo <kvalo@codeaurora.org>

+ Sibi

On Mon, Jun 1, 2020 at 10:25 PM John Stultz <john.stultz@linaro.org> wrote:
>
> Ever since 5.7-rc1, if we call
> ath10k_qmi_remove_msa_permission(), the db845c hard crashes on
> reboot, resulting in the device getting stuck in the usb crash
> debug mode and not coming back up wihthout a hard power off.
>
> This hack avoids the issue by returning early in
> ath10k_qmi_event_server_exit().
>
> A better solution is very much desired!

Any chance you can bisect what caused this? There are a lot of
non-ath10k pieces involved in this stuff.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
