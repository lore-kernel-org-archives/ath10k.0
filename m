Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBfAd-0006Ud-LC
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 07:48:48 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21687.29026.962216.812998@gargle.gargle.HOWL>
Date: Thu, 15 Jan 2015 13:20:58 +0530
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
In-Reply-To: <87bnm01ojf.fsf@kamboji.qca.qualcomm.com>
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <87r3uy4t9y.fsf@kamboji.qca.qualcomm.com>
 <21685.35179.110539.780864@gargle.gargle.HOWL>
 <87bnm01ojf.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo wrote:
> Did you read at all what I wrote above? For example, what if we later
> don't actually use ATH10K_HTT_MAX_NUM_REFILL anymore?
> 
> And the fundamental problem is that I still don't know what fill value
> you think is the best to use here, and that means neither will the
> users. That's why the values need to be within ath10k, not expose driver
> internals and use some magic numbers which are not available anywhere.

What magic numbers ?

How is 16 less a magic number than 128 or 96 or the original 1000 ?

> We are not limitting anything more. That's not any different from what
> your patch does, just that the parameter name is different and the user
> doesn't have direct access to the internal parameter. Let me explain a
> bit more how that would work in this HTT fill case:
> 
> profile 0 (auto):
> profile 1 (slow):
>         htt_fill_size = ATH10K_HTT_MAX_NUM_REFILL
>         break:
> profile 2 (fast):
>         htt_fill_size = 77 /* or whatever */
>         break;
> 
> So in this method the user can still choose optimal settings for a
> certain platform, I assume AP148 in this case, and not know about driver
> internals. And if there are more parameters we need to change in the
> future, we can use the same modparam to change that as well.

You seem to be fixated on some imaginary user that is going to be
confused by a module parameter.

I don't see how adding more complexity by adding profiles and such
is going to make a user less confused.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
