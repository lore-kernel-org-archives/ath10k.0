Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YN1Ty-0006UI-Ed
 for ath10k@lists.infradead.org; Sun, 15 Feb 2015 15:51:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix AP/IBSS CSA with template based fw
References: <1423749198-11346-1-git-send-email-michal.kazior@tieto.com>
Date: Sun, 15 Feb 2015 17:51:14 +0200
In-Reply-To: <1423749198-11346-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 12 Feb 2015 14:53:18 +0100")
Message-ID: <87mw4fgolp.fsf@kamboji.qca.qualcomm.com>
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

> qca6174 with wmi-tlv firmware uses offloaded
> beaconing scheme (i.e. templates). This requires a
> little different approach when implementing CSA.
>
> Add missing code to update CS count and report CSA
> completion to mac80211. Without it channel switch
> was never finished.
>
> To avoid races during interface teardown data_lock
> has been used to protect is_up and is_started so
> they can be compared against before scheduling
> count down work.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>
> @Kalle: I'm deferring the chanctx patchset v4
> until this gets applied. I'd like to avoid posting
> patches without a valid parent id and leaving you
> with some weird conflicts and implicit depndencies
> in the code to deal with.

Ok.

I actually had strange conflicts already with this patch (in mac.c). As
I'm travelling, please check my resolution from the pending branch very
carefully. I might have done something stupid.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
