Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e850J-0005Gk-Kp
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 13:48:57 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix sending wmi cmd during the tdls teardown
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1507183926-711-1-git-send-email-akolli@qti.qualcomm.com>
References: <1507183926-711-1-git-send-email-akolli@qti.qualcomm.com>
Message-ID: <d0abf2d53d544745b0e845314e13e045@euamsexm01a.eu.qualcomm.com>
Date: Fri, 27 Oct 2017 15:48:27 +0200
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

> The current firmware 10.4-3.5.1-00035 on QCA9888 supports
> TDLS explicit mode, it expects WMI_TDLS_ENABLE_PASSIVE
> for tdls setup and WMI_TDLS_DISABLE for tdls teardown.
> 
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

e5b6853e9922 ath10k: fix sending wmi cmd during the tdls teardown

-- 
https://patchwork.kernel.org/patch/9986455/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
