Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdBWx-0004zn-C4
 for ath10k@lists.infradead.org; Tue, 18 Jun 2019 10:40:00 +0000
Received: by mail-qk1-x742.google.com with SMTP id s22so8164811qkj.12
 for <ath10k@lists.infradead.org>; Tue, 18 Jun 2019 03:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <1556417825-13713-1-git-send-email-wgong@codeaurora.org>
 <CANEJEGug_YregN5vZq_R=ppUV5ptb4WUq_TB+JApzQ4DEO_AfQ@mail.gmail.com>
 <36950ff25c0747629e60ccb68819e93a@aptaiexm02f.ap.qualcomm.com>
 <87pnour4jg.fsf@codeaurora.org>
 <CAPDyKFrs1rO38yd-yQ50y2Oo1JE=R2hWM-5FWp=Ng_TM1df7ww@mail.gmail.com>
In-Reply-To: <CAPDyKFrs1rO38yd-yQ50y2Oo1JE=R2hWM-5FWp=Ng_TM1df7ww@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 18 Jun 2019 19:39:46 +0900
Message-ID: <CANMq1KD7tjG4dq4YP=oKTs_Ki6Wd1E_VbT7+b7e4UeBGY-KMsw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: remove mmc_hw_reset while hif power down
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
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wen Gong <wgong@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Grant Grundler <grundler@google.com>, Wen Gong <wgong@codeaurora.org>, Claire Chang <tientzu@chromium.org>, Kalle Valo <kvalo@codeaurora.org>

On Tue, May 28, 2019 at 9:46 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
[snip]
>
> In the end, it seems like this needs a more detailed debug study, to
> figure out what exactly happens during the re-initialization of the
> SDIO card, rather than just papering over the problem by removing the
> call to mmc_hw_reset() in the SDIO func driver. Hope this helps.

To close the loop on this, we fixed this on the platform by driving a
reset/enable pin during reset:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1657506
(device tree for this device is not upstream yet).

The problem has to do with the fact that on re-init (without power
cycle or reset/enable pin cycling), the device still sets S18A=1 in
CMD5 response (that's incorrect, the device should set S18A=0 if it's
already using 1.8V), so the host tries to switch voltage using CMD11,
which fails, as the device is already in 1.8V mode (that's correct
according to the specs).

Thanks,

>
> Kind regards
> Uffe

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
