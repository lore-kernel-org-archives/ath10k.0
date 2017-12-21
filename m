Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eS1OC-0007LM-2G
 for ath10k@lists.infradead.org; Thu, 21 Dec 2017 14:00:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] Core changes for wcn3990
Date: Thu, 21 Dec 2017 13:57:26 +0000
Message-ID: <87tvwkchfe.fsf@kamboji.qca.qualcomm.com>
References: <1513854887-10759-1-git-send-email-pillair@qti.qualcomm.com>
In-Reply-To: <1513854887-10759-1-git-send-email-pillair@qti.qualcomm.com>
 (Rakesh Pillai's message of "Thu, 21 Dec 2017 16:44:44 +0530")
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
To: Rakesh Pillai <pillair@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rakesh Pillai <pillair@qti.qualcomm.com> writes:

> This patchset includes the core changes for wcn3990 to
> - Add SNOC bus type used for wcn3990 target
> - Add the debug mask for SNOC bus type
> - Adding fw feature flag for non-bmi firmware load, since wcn3990
>   firmware is not loaded by bmi
>
> Govind Singh (2):
>   ath10k: Add SNOC bus type for WCN3990 target
>   ath10k: Add debug mask for SNOC bus type
>
> Rakesh Pillai (1):
>   ath10k: Add fw feature flag for non-bmi firmware load

What did you use as the baseline for these patches? While I was trying
to get these to the pending branch for build testing I noticed they
don't apply to any of ath.git branches and git can't even find the
baseline sha1 information:

$ git am -s -3 10127467.mbox
Applying: ath10k: Add SNOC bus type for WCN3990 target
Applying: ath10k: Add debug mask for SNOC bus type
Applying: ath10k: Add fw feature flag for non-bmi firmware load
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/core.c).
error: could not build fake ancestor
Patch failed at 0003 ath10k: Add fw feature flag for non-bmi firmware load
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
