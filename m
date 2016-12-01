Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCPFR-0001Tc-JM
 for ath10k@lists.infradead.org; Thu, 01 Dec 2016 11:09:55 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix TLV set regdomain command
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1480275440-9919-1-git-send-email-erik.stromdahl@gmail.com>
References: <1480275440-9919-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <d72fc1b1dafe443f93e103ae02d8a0a5@euamsexm01a.eu.qualcomm.com>
Date: Thu, 1 Dec 2016 12:09:26 +0100
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
> There is a typo bug in the current implementation of
> ath10k_wmi_tlv_op_gen_pdev_set_rd.
> The conformance test limits are not set up properly.
> 
> The two arguments ctl2g and ctl5g were not used at all.
> Instead, the regdomain arguments rd2g and rd5g were used
> for the ctl settings as well.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

Patch applied to ath-next branch of ath.git, thanks.

4e322f7db51a ath10k: fix TLV set regdomain command

-- 
https://patchwork.kernel.org/patch/9448885/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
