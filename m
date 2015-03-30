Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcYfW-00042f-Jm
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 12:19:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/9] ath10k: cleanups 2015-03-20
References: <1426859655-11797-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 30 Mar 2015 15:19:19 +0300
In-Reply-To: <1426859655-11797-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 20 Mar 2015 13:54:06 +0000")
Message-ID: <87zj6u4r08.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Here's a bunch of cleanups and fixes associated
> with tx/rx rate code.
>
> Feel free to squash some of the patches if you
> think it makes sense or let me know which ones you
> want me to squash.
>
> There are a few checkpatch warnings for going over
> 80 chars. I decided to leave them be to avoid code
> wrapping which would make the code less readable
> than it is now in my opinion.
>
> I have 2 more patches for .set_bitrate_mask()
> callback which depend on this patchset. Once you
> apply this patchset to your `pending` branch let
> me know, please, so I can push the rest with git
> indexes your git repo will recognize.

Sorry, I had missed this comment and didn't realise to tell you when I
applied the patches to pending branch. The bad part with patchwork is
that it doesn't show the cover letter at all :(

> Michal Kazior (9):
>   ath10k: move rate definitions to file start
>   ath10k: derive rate from bitrate
>   ath10k: drop RATETAB_ENT macro
>   ath10k: add hw rate definitions
>   ath10k: use hw rate definitions for fixed rate
>   ath10k: simplify fixed rate selection
>   ath10k: rework legacy rx rate decoding
>   ath10k: deduplicate bitrate to rate idx conversion
>   ath10k: document ofdm/5ghz rate offset with a macro

Thanks, all patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
