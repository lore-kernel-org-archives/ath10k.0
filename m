Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyAnw-0008An-IL
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 09:12:49 +0000
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [RFC 0/7] Add support to process rx packets in thread
Date: Wed, 22 Jul 2020 09:12:42 +0000
Message-ID: <9fb3d3bd8d944a649cbe828fddca1bc1@AcuMS.aculab.com>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch>
In-Reply-To: <20200721172514.GT1339445@lunn.ch>
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
To: 'Andrew Lunn' <andrew@lunn.ch>, Rakesh Pillai <pillair@codeaurora.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "dianders@chromium.org" <dianders@chromium.org>, "evgreen@chromium.org" <evgreen@chromium.org>, "kuba@kernel.org" <kuba@kernel.org>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>

From: Andrew Lunn
> Sent: 21 July 2020 18:25
> 
> On Tue, Jul 21, 2020 at 10:44:19PM +0530, Rakesh Pillai wrote:
> > NAPI gets scheduled on the CPU core which got the
> > interrupt. The linux scheduler cannot move it to a
> > different core, even if the CPU on which NAPI is running
> > is heavily loaded. This can lead to degraded wifi
> > performance when running traffic at peak data rates.
> >
> > A thread on the other hand can be moved to different
> > CPU cores, if the one on which its running is heavily
> > loaded. During high incoming data traffic, this gives
> > better performance, since the thread can be moved to a
> > less loaded or sometimes even a more powerful CPU core
> > to account for the required CPU performance in order
> > to process the incoming packets.
> >
> > This patch series adds the support to use a high priority
> > thread to process the incoming packets, as opposed to
> > everything being done in NAPI context.
> 
> I don't see why this problem is limited to the ath10k driver. I expect
> it applies to all drivers using NAPI. So shouldn't you be solving this
> in the NAPI core? Allow a driver to request the NAPI core uses a
> thread?

It's not just NAPI the problem is with the softint processing.
I suspect a lot of systems would work better if it ran as
a (highish priority) kernel thread.

I've had to remove the main locks from a multi-threaded application
and replace them with atomic counters.
Consider what happens when the threads remove items from a shared
work list.
The code looks like:
	mutex_enter();
	remove_item_from_list();
	mutex_exit().
The mutex is only held for a few instructions, so while you'd expect
the cache line to be 'hot' you wouldn't get real contention.
However the following scenarios happen:
1) An ethernet interrupt happens while the mutex is held.
   This stops the other threads until all the softint processing
   has finished.
2) An ethernet interrupt (and softint) runs on a thread that is
   waiting for the mutex.
   (Or on the cpu that the thread's processor affinity ties it to.)
   In this case the 'fair' (ticket) mutex code won't let any other
   thread acquire the mutex.
   So again everything stops until the softints all complete.

The second one is also a problem when trying to wake up all
the threads (eg after adding a lot of items to the list).
The ticket locks force them to wake in order, but
sometimes the 'thundering herd' would work better.

IIRC this is actually worse for processes running under the RT
scheduler (without CONFIG_PREEMPT) because the they are almost
always scheduled on the same cpu they ran on last.
If it is busy, but cannot be pre-empted, they are not moved
to an idle cpu.
   
To confound things there is a very broken workaround for broken
hardware in the driver for the e1000 interface on (at least)
Ivy Bridge cpu that can cause the driver to spin for a very
long time (IIRC milliseconds) whenever it has to write to a
MAC register (ie on every transmit setup).

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
