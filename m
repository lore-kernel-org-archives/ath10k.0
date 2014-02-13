Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE2xs-00040F-Jl
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 20:32:57 +0000
Message-ID: <52FD2BE2.50706@candelatech.com>
Date: Thu, 13 Feb 2014 12:32:34 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k:  do not ratelimit ath10k_warn messages
References: <1392318562-32440-1-git-send-email-greearb@candelatech.com>
 <1392318562-32440-2-git-send-email-greearb@candelatech.com>
 <87fvnm7pml.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fvnm7pml.fsf@kamboji.qca.qualcomm.com>
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

On 02/13/2014 11:56 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> These are too important to miss, and if we ever do have some
>> that are overly verbose
> 
> The thing is that in some platforms excessive amount log messages will
> cause watchdog to forcefully reboot the device. So I'm hesitant to
> remove this.
> 
> First of all, the goal is that ath10k will never issue even a single
> warning message. So even if you see just one, it means something is
> wrong. And just seeing the first few warnings should give you a pretty
> good hint what's going on.

I see lots of EAGAIN (-11) warnings sometime, and they come in bunches
in my scenario (with lots of vifs).

> Secondly, it's not like net_ratelimit() will hide all the warning
> messages. It will still show some of the messages even if it starts to
> throttle them.

In my case, it hid exactly the messages I needed to see in a hard
to reproduce bug, so I was a bit peeved :P

>> could ratelimit the call to ath10k_warn instead of doing the ratelimit
>> inside of ath10k_warn.
> 
> Not sure if I got this idea. Only to ratelimit some of the warnings or
> what do you mean by ratelimiting it outside ath10k_warn()?

If there are warnings that are likely to spam continuously,
then ratelimit only those, so something like:

if (netratelimit()) {
  ath10k_warn(...)
}


But, this is an easy patch for me to carry, so no worries if it
doesn't go upstream.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
