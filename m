Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLFaL-0001iq-Gn
 for ath10k@lists.infradead.org; Tue, 22 May 2018 22:16:51 +0000
MIME-Version: 1.0
Date: Tue, 22 May 2018 15:16:37 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: transmit queued frames after waking queues
In-Reply-To: <20180522211521.GA26123@localhost.localdomain>
References: <20180521204359.23884-1-niklas.cassel@linaro.org>
 <8195be7603a8cd659d25a9c3d898b891@codeaurora.org>
 <20180522211521.GA26123@localhost.localdomain>
Message-ID: <a57b21c3e2f23ef2b7e6a6ffbabe111b@codeaurora.org>
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, erik.stromdahl@gmail.com, Kalle Valo <kvalo@qca.qualcomm.com>, "David S. Miller" <davem@davemloft.net>

On 2018-05-22 14:15, Niklas Cassel wrote:
> On Mon, May 21, 2018 at 04:11:38PM -0700, Rajkumar Manoharan wrote:
>> On 2018-05-21 13:43, Niklas Cassel wrote:
>> > The following problem was observed when running iperf:
[...]
>> 
>> Sorry for the late response. ath10k_mac_tx_push_pending is already 
>> called
>> at the end of NAPI handler. Isn't that enough to process pending 
>> frames?
> 
> This is true for e.g. ATH10K_BUS_PCI and ATH10K_BUS_SNOC,
> but not for e.g. ATH10K_BUS_SDIO and ATH10K_BUS_USB.
> 
> While there is some SDIO code merged in Kalle's tree already,
> this problem was found when merging
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/?h=ath10k-pending-sdio-usb
> with Kalle's ath-next branch.
> 
>> 
>> Earlier we observed performance issues in calling push_pending from 
>> each
>> tx completion. IMHO this change may introduce the same problem again.
> 
> I prefer functional TX over performance issues,
> but I agree that it is unfortunate that SDIO doesn't use
> ath10k_htt_txrx_compl_task().
> Erik, is there a reason for this?
> 
Thanks for details. Now I see your problem. In case of low latency 
devices (PCI/SNOC/AHB),
all CE rings interrupts are serviced first and later consolidated data 
processing done
from ath10k_htt_txrx_compl_task and then ath10k_mac_tx_push_pending is 
called from NAPI Poll.

In case of high latency devices (USB/SDIO), each endpoints are serviced 
and all tx/rx jobs
are completed from the same context. Hence no need of consolidated 
processing.

> Perhaps it would be possible to call ath10k_mac_tx_push_pending()
> from the equivalent to ath10k_htt_txrx_compl_task(),
> but from SDIO's point of view.
> 
> Another solution might be to change so that we only call
> ath10k_mac_tx_push_pending() from ath10k_txrx_tx_unref()
> if (htt->num_pending_tx == 0). That should decrease the number
> of calls to ath10k_mac_tx_push_pending(), while still avoiding
> a "TX deadlock" scenario for SDIO.
> 
This issue is specific to HL devices. But your change is common which 
will impact LL devices.
I would prefer to call ath10k_mac_tx_push_pending after processing all 
received mbox/urb messages.
Export ath10k_mac_tx_push_pending API and call it from USB/SDIO irq 
handler. Any thoughts?

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
