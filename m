Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLPdR-0008DE-9x
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 06:51:37 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: remove unused member in ath10k_hw_regs
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1466488088-20961-1-git-send-email-akolli@qti.qualcomm.com>
Message-ID: <d4ea57a3ffc1429f9e1a2df3220f54ec@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 08:51:10 +0200
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
To: akolli@qti.qualcomm.com
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

akolli@qti.qualcomm.com wrote:
> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
> 
> rtc_state_cold_reset_mask is unused in ath10k_hw_regs.
> instead fixed delays are used.
> 
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>

Thanks, 2 patches applied to ath-next branch of ath.git:

2225378d840c ath10k: remove unused member in ath10k_hw_regs
e565c3125e03 ath10k: enable support for QCA9888

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9189535/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
