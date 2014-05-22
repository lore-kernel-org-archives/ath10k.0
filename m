Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnW3T-00072H-IL
 for ath10k@lists.infradead.org; Thu, 22 May 2014 16:41:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: make core registering async
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
Date: Thu, 22 May 2014 19:40:50 +0300
In-Reply-To: <1400767955-16313-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 22 May 2014 16:12:35 +0200")
Message-ID: <87tx8hwyul.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> If ath10k was built into the kernel it could stall
> booting for 120 seconds by default (60 seconds for
> each firmware API variant) waiting for firmware
> files before userspace was ready or filesystems
> mounted.
>
> Fix this by making the core registering
> asynchronous.
>
> This also shoves off about 1 second from boot time
> on most systems since the driver is now mostly
> initialized in a worker and modprobe takes very
> little time to complete.
>
> As a side effect there's no way to propagate
> registering errors to the pci subsystem but this
> probably isn't really necessary.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I see a new sparse warning with this patch:

drivers/net/wireless/ath/ath10k/core.c:956:6: warning: symbol 'ath10k_core_register_work' was not declared. Should it be static?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
