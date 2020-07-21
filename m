Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy0CQ-0007Lm-2u
 for ath10k@lists.infradead.org; Tue, 21 Jul 2020 21:53:23 +0000
MIME-Version: 1.0
Date: Tue, 21 Jul 2020 14:53:19 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
In-Reply-To: <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
Message-ID: <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, evgreen@chromium.org, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

On 2020-07-21 10:14, Rakesh Pillai wrote:
> NAPI instance gets scheduled on a CPU core on which
> the IRQ was triggered. The processing of rx packets
> can be CPU intensive and since NAPI cannot be moved
> to a different CPU core, to get better performance,
> its better to move the gist of rx packet processing
> in a high priority thread.
> 
> Add the init/deinit part for a thread to process the
> receive packets.
> 
IMHO this defeat the whole purpose of NAPI. Originally in ath10k
irq processing happened in tasklet (high priority) context which in
turn push more data to net core even though net is unable to process
driver data as both happen in different context (fast producer - slow 
consumer)
issue. Why can't CPU governor schedule the interrupts in less loaded CPU 
core?
Otherwise you can play with different RPS and affinity settings to meet 
your
requirement.

IMO introducing high priority tasklets/threads is not viable solution.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
