Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eS3Vg-0003Eo-VE
 for ath10k@lists.infradead.org; Thu, 21 Dec 2017 16:15:57 +0000
From: Rakesh Pillai <pillair@qti.qualcomm.com>
Subject: RE: [PATCH 0/3] Core changes for wcn3990
Date: Thu, 21 Dec 2017 16:14:35 +0000
Message-ID: <7cf8b9f490ca47c4958d1bb5df439b04@aphydexm01b.ap.qualcomm.com>
References: <1513854887-10759-1-git-send-email-pillair@qti.qualcomm.com>
 <87tvwkchfe.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87tvwkchfe.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Kalle,

I have rebased the patchset on the latest ath.git and sent v2 for the change.

Thanks,
Rakesh Pillai

> -----Original Message-----
> From: Kalle Valo
> Sent: Thursday, December 21, 2017 7:27 PM
> To: Rakesh Pillai <pillair@qti.qualcomm.com>
> Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org
> Subject: Re: [PATCH 0/3] Core changes for wcn3990
> 
> Rakesh Pillai <pillair@qti.qualcomm.com> writes:
> 
> > This patchset includes the core changes for wcn3990 to
> > - Add SNOC bus type used for wcn3990 target
> > - Add the debug mask for SNOC bus type
> > - Adding fw feature flag for non-bmi firmware load, since wcn3990
> >   firmware is not loaded by bmi
> >
> > Govind Singh (2):
> >   ath10k: Add SNOC bus type for WCN3990 target
> >   ath10k: Add debug mask for SNOC bus type
> >
> > Rakesh Pillai (1):
> >   ath10k: Add fw feature flag for non-bmi firmware load
> 
> What did you use as the baseline for these patches? While I was trying
> to get these to the pending branch for build testing I noticed they
> don't apply to any of ath.git branches and git can't even find the
> baseline sha1 information:
> 
> $ git am -s -3 10127467.mbox
> Applying: ath10k: Add SNOC bus type for WCN3990 target
> Applying: ath10k: Add debug mask for SNOC bus type
> Applying: ath10k: Add fw feature flag for non-bmi firmware load
> fatal: sha1 information is lacking or useless
> (drivers/net/wireless/ath/ath10k/core.c).
> error: could not build fake ancestor
> Patch failed at 0003 ath10k: Add fw feature flag for non-bmi firmware load
> The copy of the patch that failed is found in: .git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
