Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8Udr-0006Bj-NU
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 15:34:40 +0000
Date: Thu, 2 Jun 2016 21:04:08 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: Bug 119151 - [regression] ath10k no longer authenitcates and
 freezes system
Message-ID: <20160602153408.GA5110@atheros-ThinkPad-T61>
References: <8760trzoiw.fsf@kamboji.qca.qualcomm.com>
 <871t4fzn1x.fsf@kamboji.qca.qualcomm.com>
 <57504F05.3040200@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57504F05.3040200@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "mike@fireburn.co.uk" <mike@fireburn.co.uk>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Jun 02, 2016 at 08:21:41AM -0700, Ben Greear wrote:
> On 06/02/2016 07:24 AM, Valo, Kalle wrote:
> >Kalle Valo <kvalo@qca.qualcomm.com> writes:
> >
> >>there's a regression in ath10k:
> >>
> >>https://bugzilla.kernel.org/show_bug.cgi?id=119151
> >>
> >>Reporter bisected it to this:
> >>
> >>5c86d97bcc1d42ce7f75685a61be4dad34ee8183 is the first bad commit
> >>commit 5c86d97bcc1d42ce7f75685a61be4dad34ee8183
> >>Author: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> >>Date:   Tue Mar 22 17:22:19 2016 +0530
> >>
> >>ath10k: combine txrx and replenish task
> >>
> >>Since tx completion and rx indication processing are moved out
> >>of txrx tasklet and rx ring lock contention also removed from txrx
> >>for rx_ind messages, it would be efficient to combine both replenish
> >>and txrx tasks. Refill threshold is adjusted for both AP135 and AP148
> >>(low and high end systems). With this adjustment in AP135, TCP DL is
> >>improved from 603 Mbps to 620 Mbps and UDP DL is improved from 758 Mbps
> >>to 803 Mbps. Also no watchdog are observed on UDP BiDi.
> >>
> >>Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> >>Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> >
> >Adding Mike, the bug reporter.
> 
> 
> I found a lot of problems with this code as well, and the 5 patches
> starting from the URL below fixed the issues for me.
> 
> They are stuck as 'NA' in patchwork, but I don't know why.
> 
> http://lists.infradead.org/pipermail/ath10k/2016-April/007218.html
> 
> You probably need this patch as well, or ath10k will crash when you
> enable the debug-mask:
> 
> http://permalink.gmane.org/gmane.linux.kernel.wireless.general/151890
> 
> It is also 'NA' in patchwork.

[shafi] i think this is already in the pending branch
https://patchwork.kernel.org/patch/9073471/

> 
> Thanks,
> Ben
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
