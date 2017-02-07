Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb1WN-0007hS-Sf
 for ath10k@lists.infradead.org; Tue, 07 Feb 2017 08:53:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv3] ath10k: fix boot failure in UTF mode/testmode
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1485838569-1027-1-git-send-email-c_traja@qti.qualcomm.com>
References: <1485838569-1027-1-git-send-email-c_traja@qti.qualcomm.com>
Message-ID: <8a5a900974d44581a42675f4977064c7@eusanexr01a.eu.qualcomm.com>
Date: Tue, 7 Feb 2017 00:52:43 -0800
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
To: c_traja@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, tamizhchelvam@codeaurora.org, stable@vger.kernel.org, ath10k@lists.infradead.org

c_traja@qti.qualcomm.com wrote:
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
> 
> Rx filter reset and the dynamic tx switch mode (EXT_RESOURCE_CFG)
> configuration are causing the following errors when UTF firmware
> is loaded to the target.
> 
> Error message 1:
> [ 598.015629] ath10k_pci 0001:01:00.0: failed to ping firmware: -110
> [ 598.020828] ath10k_pci 0001:01:00.0: failed to reset rx filter: -110
> [ 598.141556] ath10k_pci 0001:01:00.0: failed to start core (testmode): -110
> 
> Error message 2:
> [ 668.615839] ath10k_ahb a000000.wifi: failed to send ext resource cfg command : -95
> [ 668.618902] ath10k_ahb a000000.wifi: failed to start core (testmode): -95
> 
> Avoiding these configurations while bringing the target in
> testmode is solving the problem.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

cb4281528b62 ath10k: fix boot failure in UTF mode/testmode

-- 
https://patchwork.kernel.org/patch/9546451/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
