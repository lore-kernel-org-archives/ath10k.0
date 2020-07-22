Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyDqv-0006ZW-Sr
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 12:28:06 +0000
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
Date: Wed, 22 Jul 2020 14:27:42 +0200
MIME-Version: 1.0
In-Reply-To: <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
Content-Language: en-US
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, evgreen@chromium.org, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

On 2020-07-21 23:53, Rajkumar Manoharan wrote:
> On 2020-07-21 10:14, Rakesh Pillai wrote:
>> NAPI instance gets scheduled on a CPU core on which
>> the IRQ was triggered. The processing of rx packets
>> can be CPU intensive and since NAPI cannot be moved
>> to a different CPU core, to get better performance,
>> its better to move the gist of rx packet processing
>> in a high priority thread.
>> 
>> Add the init/deinit part for a thread to process the
>> receive packets.
>> 
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
I'm beginning to think that the main problem with NAPI here is that the
work done by poll functions on 802.11 drivers is significantly more CPU
intensive compared to ethernet drivers, possibly more than what NAPI was
designed for.

I'm considering testing a different approach (with mt76 initially):
- Add a mac80211 rx function that puts processed skbs into a list
instead of handing them to the network stack directly.
- Move all rx processing to a high priority thread, keep a driver
internal queue for fully processed packets.
- Schedule NAPI poll on completion.
- NAPI poll function pulls from the internal queue and passes to the
network stack.

With this approach, the network stack retains some control over the
processing rate of rx packets, while the scheduler can move the CPU
intensive processing around to where it fits best.

What do you think?

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
