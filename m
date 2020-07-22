Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyHTR-0006ri-2E
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 16:20:05 +0000
Date: Wed, 22 Jul 2020 09:20:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [RFC 0/7] Add support to process rx packets in thread
Message-ID: <20200722092001.62f3772c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200721172514.GT1339445@lunn.ch>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch>
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
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, Eric Dumazet <edumazet@google.com>, Rakesh Pillai <pillair@codeaurora.org>, evgreen@chromium.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

On Tue, 21 Jul 2020 19:25:14 +0200 Andrew Lunn wrote:
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

Agreed, this is a problem we have with all drivers today.
We see seriously sub-optimal behavior in data center workloads, 
because kernel overloads the cores doing packet processing.

I think the fix may actually be in the scheduler. AFAIU the scheduler
counts the softIRQ time towards the interrupted process, and on top
of that tries to move processes to the cores handling their IO. In the
end the configuration which works somewhat okay is when each core has
its own IRQ and queues, which is seriously sub-optimal.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
