Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMCVL-0007nO-Mc
 for ath10k@lists.infradead.org; Sat, 08 Mar 2014 08:21:12 +0000
Received: by mail-vc0-f181.google.com with SMTP id lg15so5096932vcb.40
 for <ath10k@lists.infradead.org>; Sat, 08 Mar 2014 00:20:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87iorpnmlo.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-2NASvnpURqH=LbPMOi8GKHB23Xc3pxwULqnsXMrKHpow@mail.gmail.com>
 <87iorpnmlo.fsf@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Sat, 8 Mar 2014 02:20:28 -0600
Message-ID: <CAHqTa-1BjUQH_zQp=8NEHt7LQ1JQAG5ftzx+u4i4OqEqaG7teg@mail.gmail.com>
Subject: Re: Firmware crash when sending large numbers of forwarded packets
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
Cc: ath10k <ath10k@lists.infradead.org>

On Sat, Mar 8, 2014 at 2:03 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>> I'm having a problem where if I transmit too fast out the ath10k
>> interface in AP mode, I get a near-immediate firmware crash.
>
> [...]
>
>> Versions:
>> - kernel is based on current kvalo/for-linville branch (should I try
>> something else?) but seems to be the same in linux-next-20140114 so I
>> don't think this behaviour has changed lately.
>
> I do not recommend using for-linville branch for anything. As the name
> implies, it's only for John Linville to pull ath10k and ath6kl changes
> to his tree.
>
> What I recommend is to use the master branch of my ath.git tree. That's
> fairly recent wireless-testing (max 2 weeks old) plus latest ath10k +
> ath6kl patches I have (ie. merge of wireless-testing and my ath-next
> branch).

Ok, thanks.  We're using a fairly old kernel on our device right now
(3.2.26) so we're using the ath10k driver from linux-backports.  This
means it's a little tricky to pick an arbitrary version if it has
diverged to far from linux/master or linux-next.  I did try a few
different versions though and they did the same thing.

>> - firmware version 10.1.467.2-1, but also tested with 10.1.467.1-1
>> with no difference.
>>
>> I assume other people are not experiencing this or they would have
>> mentioned it by now.  What can I do to help debug this?
>
> We have reported the issue to the firmware team and got some feedback
> already. Hopefully we know more early next week.

Thanks!

Another update.  On a whim, based on the earlier mention that problems
might be related to extra burstiness of forwarding vs. local traffic
generation, I decided to add a udelay() before transmitting each
packet.  I started with udelay(1000) and the problem went away
(although of course performance was terrible).  I slowly reduced the
delay until I reached ndelay(1), and the problem stayed gone.  So I
tried a mb() instead:

diff --git a/drivers/net/wireless/ath/ath10k/ce.c
b/drivers/net/wireless/ath/ath10k/ce.c
index a79499c..a808d82 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -291,6 +291,7 @@ int ath10k_ce_send_nolock(struct ath10k_ce_pipe *ce_state,
  if (ret)
  return ret;

+ mb();
  if (unlikely(CE_RING_DELTA(nentries_mask,
    write_index, sw_index - 1) <= 0)) {
  ret = -ENOSR;
-- 
1.9.0.279.gdc9e3eb


Somehow this eliminates my firmware crashes.  It's extremely reliable;
add this line and my crashes go away.  Remove this line and my UDP
iperf can crash the firmware in a couple of seconds.

For this particular test I was using a backports built from linux
v3.11.8 merged with your ath10k-stable-3.11-8 tag.

Any idea why this would make any difference?

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
