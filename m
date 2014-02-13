Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE2PN-00034M-4w
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 19:57:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k:  do not ratelimit ath10k_warn messages
References: <1392318562-32440-1-git-send-email-greearb@candelatech.com>
 <1392318562-32440-2-git-send-email-greearb@candelatech.com>
Date: Thu, 13 Feb 2014 21:56:50 +0200
In-Reply-To: <1392318562-32440-2-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 13 Feb 2014 11:09:22
 -0800")
Message-ID: <87fvnm7pml.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> These are too important to miss, and if we ever do have some
> that are overly verbose

The thing is that in some platforms excessive amount log messages will
cause watchdog to forcefully reboot the device. So I'm hesitant to
remove this.

First of all, the goal is that ath10k will never issue even a single
warning message. So even if you see just one, it means something is
wrong. And just seeing the first few warnings should give you a pretty
good hint what's going on.

Secondly, it's not like net_ratelimit() will hide all the warning
messages. It will still show some of the messages even if it starts to
throttle them.

Thirdly, if you think net_ratelimit() is throttling too much you can
always tune it yourself:

DEFINE_RATELIMIT_STATE(net_ratelimit_state, 5 * HZ, 10);

> could ratelimit the call to ath10k_warn instead of doing the ratelimit
> inside of ath10k_warn.

Not sure if I got this idea. Only to ratelimit some of the warnings or
what do you mean by ratelimiting it outside ath10k_warn()?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
