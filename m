Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNsIC-0007YR-HN
 for ath10k@lists.infradead.org; Tue, 07 May 2019 05:05:30 +0000
Subject: RE: [PATCH] ath10k: remove mmc_hw_reset while hif power down
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Tue, 7 May 2019 05:05:21 +0000
Message-ID: <36950ff25c0747629e60ccb68819e93a@aptaiexm02f.ap.qualcomm.com>
References: <1556417825-13713-1-git-send-email-wgong@codeaurora.org>
 <CANEJEGug_YregN5vZq_R=ppUV5ptb4WUq_TB+JApzQ4DEO_AfQ@mail.gmail.com>
In-Reply-To: <CANEJEGug_YregN5vZq_R=ppUV5ptb4WUq_TB+JApzQ4DEO_AfQ@mail.gmail.com>
Content-Language: en-US
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
To: Grant Grundler <grundler@google.com>, Wen Gong <wgong@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Grant
> Grundler
> Sent: Saturday, May 4, 2019 2:01 AM
> To: Wen Gong <wgong@codeaurora.org>
> Cc: linux-wireless@vger.kernel.org; ath10k@lists.infradead.org
> Subject: [EXT] Re: [PATCH] ath10k: remove mmc_hw_reset while hif power
> down
> 
> [repeating comments I made in the gerrit review for Chrome OS :
> https://chromium-
> review.googlesource.com/c/chromiumos/third_party/kernel/+/1585667
> ]
> 
> On Sat, Apr 27, 2019 at 7:17 PM Wen Gong <wgong@codeaurora.org> wrote:
> >
> > For sdio 3.0 chip, the clock will drop from 200M Hz to 50M Hz after load
> > ath10k driver, it is because mmc_hw_reset will reset the sdio's power,
> > then mmc will consider it as sdio 2.0 and drop the clock.
> 
> Wen,
> 5468e784c0600551ca03263f5255a375c05f88e7 commit message gives
> reasons
> for adding the mmc_hw_reset() call. The commit message for removing
> gives different reason for removal. Both are good but second one is
> incomplete.
> 
> The commit message for removal should ALSO explain why adding this
> call wasn't necessary in the first place OR move the call to a
> different code path.
> 
> > Remove mmc_hw_reset will avoid the drop of clock.
> 
> This commit message makes it clear the original patch introduced a new
> problem. But the original patch fixed a different problem and that
> this proposed change seems likely to re-introduce and the commit
> message should explain why that isn't true (or how the original was
> fixed differently)
Hi Grant,
The mmc_hw_reset's effect depends on the hardware layout/configure
software's behavior, recently it will effect the clock of sdio for the platform
I used. And it will still work well without mmc_hw_reset for the platform I
Used currently. 
If sdio cannot work on other platform, I think it can add flag in 
ath10k_hw_params_list for the platform to call the mmc_hw_reset depends
on the flag.
> 
> cheers,
> grant


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
