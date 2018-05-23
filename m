Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLc7F-0006QB-84
 for ath10k@lists.infradead.org; Wed, 23 May 2018 22:20:18 +0000
Received: by mail-wr0-x241.google.com with SMTP id j1-v6so18280192wrm.1
 for <ath10k@lists.infradead.org>; Wed, 23 May 2018 15:20:06 -0700 (PDT)
Date: Thu, 24 May 2018 00:20:02 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v3] ath10k: transmit queued frames after processing rx
 packets
Message-ID: <20180523222002.GA26565@localhost.localdomain>
References: <20180523221508.26391-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180523221508.26391-1-niklas.cassel@linaro.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On Thu, May 24, 2018 at 12:15:08AM +0200, Niklas Cassel wrote:
> This problem cannot be reproduced on low-latency devices, e.g. pci,
> since they call ath10k_mac_tx_push_pending() from
> ath10k_htt_txrx_compl_task(). ath10k_htt_txrx_compl_task() is not called
> on high-latency devices.
> Fix the problem by calling ath10k_mac_tx_push_pending(), after
> processing rx packets, just like for low-latency devices, also in the
> SDIO case. Since we are calling ath10k_mac_tx_push_pending() directly,
> we also need to export it.
> 

Even if we are now calling ath10k_mac_tx_push_pending each time we process rx packets,
the number of packets we actually queue from ath10k_mac_tx_push_pending are quite few:

From running iperf for 20 seconds:

# grep ath10k_mac_tx_push_txq /sys/kernel/debug/tracing/trace | grep -v ath10k_mac_op_wake_tx_queue | wc -l
233
number of times ath10k_mac_tx_push_txq was called, but not from ath10k_mac_op_wake_tx_queue,
i.e. number of times ath10k_mac_tx_push_txq was called from ath10k_mac_tx_push_pending.


# grep ath10k_mac_tx_push_txq /sys/kernel/debug/tracing/trace | grep -v ath10k_mac_tx_push_pending | wc -l
28415
number of times ath10k_mac_tx_push_txq was called, but not from ath10k_mac_tx_push_pending,
i.e number of times ath10k_mac_tx_push_txq was called from ath10k_mac_op_wake_tx_queue.


Regards,
Niklas

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
