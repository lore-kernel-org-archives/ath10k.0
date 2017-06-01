Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGPgW-0002rK-9a
 for ath10k@lists.infradead.org; Thu, 01 Jun 2017 12:58:41 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Initialize nbytes to 0
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1483653641-8377-1-git-send-email-greearb@candelatech.com>
References: <1483653641-8377-1-git-send-email-greearb@candelatech.com>
Message-ID: <b2a323bda04b475983a58e4c7113a81a@eusanexr01a.eu.qualcomm.com>
Date: Thu, 1 Jun 2017 05:58:16 -0700
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

> ath10k firmware checks nbytes == 0 as part of determining if DMA
> has completed successfully.  To help make this work more often,
> have the driver initialize nbytes to zero when freeing the descriptor
> slot.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

4f40b423339b ath10k: initialize nbytes to 0

-- 
https://patchwork.kernel.org/patch/9499733/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
