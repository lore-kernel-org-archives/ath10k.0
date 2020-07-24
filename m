Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz6rC-00056S-NI
 for ath10k@lists.infradead.org; Fri, 24 Jul 2020 23:12:03 +0000
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <003001d6611e$9afa0cc0$d0ee2640$@codeaurora.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <0d9baad4-fba7-d362-41b7-f0b37446c5ef@intel.com>
Date: Fri, 24 Jul 2020 16:11:57 -0700
MIME-Version: 1.0
In-Reply-To: <003001d6611e$9afa0cc0$d0ee2640$@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>, 'Rajkumar Manoharan' <rmanohar@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, evgreen@chromium.org, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org



On 7/23/2020 11:25 AM, Rakesh Pillai wrote:
> Hi Rajkumar,
> In linux, the IRQs are directed to the first core which is booted.
> I see that all the IRQs are getting routed to CORE0 even if its heavily
> loaded.
> 

You should be able to configure the initial IRQ setup so that they don't
all go on CPU 0 when you create the IRQ. That obviously doesn't help the
case of wanting scheduler to dynamically move the processing around to
other CPUs though.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
