Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyfu7-0004zT-Cq
 for ath10k@lists.infradead.org; Thu, 23 Jul 2020 18:25:16 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
In-Reply-To: <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
Subject: RE: [RFC 2/7] ath10k: Add support to process rx packet in thread
Date: Thu, 23 Jul 2020 23:55:06 +0530
Message-ID: <003001d6611e$9afa0cc0$d0ee2640$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Rajkumar Manoharan' <rmanohar@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, evgreen@chromium.org, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org



> -----Original Message-----
> From: Rajkumar Manoharan <rmanohar@codeaurora.org>
> Sent: Wednesday, July 22, 2020 3:23 AM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; linux-
> kernel@vger.kernel.org; kvalo@codeaurora.org; johannes@sipsolutions.net;
> davem@davemloft.net; kuba@kernel.org; netdev@vger.kernel.org;
> dianders@chromium.org; evgreen@chromium.org; linux-wireless-
> owner@vger.kernel.org
> Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
> 
> On 2020-07-21 10:14, Rakesh Pillai wrote:
> > NAPI instance gets scheduled on a CPU core on which
> > the IRQ was triggered. The processing of rx packets
> > can be CPU intensive and since NAPI cannot be moved
> > to a different CPU core, to get better performance,
> > its better to move the gist of rx packet processing
> > in a high priority thread.
> >
> > Add the init/deinit part for a thread to process the
> > receive packets.
> >
> IMHO this defeat the whole purpose of NAPI. Originally in ath10k
> irq processing happened in tasklet (high priority) context which in
> turn push more data to net core even though net is unable to process
> driver data as both happen in different context (fast producer - slow
> consumer)
> issue. Why can't CPU governor schedule the interrupts in less loaded CPU
> core?
> Otherwise you can play with different RPS and affinity settings to meet
> your
> requirement.
> 
> IMO introducing high priority tasklets/threads is not viable solution.

Hi Rajkumar,
In linux, the IRQs are directed to the first core which is booted.
I see that all the IRQs are getting routed to CORE0 even if its heavily
loaded.

IRQ and NAPI are not under the scheduler's control, since it cannot be
moved.
NAPI is scheduled only on the same core as IRQ. But a thread can be moved
around by the scheduler based on the CPU load.
This is the reason I went ahead with using thread.

Affinity settings are static, and cannot be done runtime without any
downstream userspace entity.


> 
> -Rajkumar


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
