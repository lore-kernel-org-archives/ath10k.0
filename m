Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCoiG-0002kV-6q
 for ath10k@lists.infradead.org; Mon, 22 May 2017 14:53:39 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Initialize nbytes to 0
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1483653641-8377-1-git-send-email-greearb@candelatech.com>
References: <1483653641-8377-1-git-send-email-greearb@candelatech.com>
Message-ID: <0fa10cfb9e514244a0c39fa2688574e4@euamsexm01a.eu.qualcomm.com>
Date: Mon, 22 May 2017 16:53:06 +0200
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> ath10k firmware checks nbytes == 0 as part of determining if DMA
> has completed successfully.  To help make this work more often,
> have the driver initialize nbytes to zero when freeing the descriptor
> slot.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>

This patch was in linux-wireless patchwork instance but not in ath10k instance,
which means that the patch was not delivered to ath10k list. I guesss mailing
list problems?

But anyway, I didn't see any comments. Is this still valid?

-- 
https://patchwork.kernel.org/patch/9499733/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
