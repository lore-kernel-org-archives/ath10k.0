Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI5gn-0003Nn-6z
 for ath10k@lists.infradead.org; Tue, 15 Sep 2020 07:47:47 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1593197633-9014-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1593197633-9014-1-git-send-email-pillair@codeaurora.org>
Subject: RE: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
Date: Tue, 15 Sep 2020 13:17:34 +0530
Message-ID: <005d01d68b34$7bfc4960$73f4dc20$@codeaurora.org>
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
To: ath10k@lists.infradead.org, 'Kalle Valo' <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org



> -----Original Message-----
> From: Rakesh Pillai <pillair@codeaurora.org>
> Sent: Saturday, June 27, 2020 12:24 AM
> To: ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org; Rakesh
> Pillai <pillair@codeaurora.org>
> Subject: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
> 
> This patch series includes some fixes when the device
> is in recovery mode, i.e. when the firmware goes down.
> 
> - Pausing TX queues when FW goes down
> - Removed unwanted/extra error logging in pkt TX path
> - Skipping wait for FW response for delete cmds
> - Handling the -ESHUTDOWN error code in case of SSR.
> 
> Rakesh Pillai (2):
>   ath10k: Pause the tx queues when firmware is down
>   ath10k: Skip wait for delete response if firmware is down
> 
>  drivers/net/wireless/ath/ath10k/core.h |  1 +
>  drivers/net/wireless/ath/ath10k/mac.c  | 36 ++++++++++++++++++++++---
> ---------
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  3 files changed, 28 insertions(+), 12 deletions(-)

Hi Kalle,
I see that this patch series is in Deferred state. Is there something
missing or blocking this ?


> 
> --
> 2.7.4



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
