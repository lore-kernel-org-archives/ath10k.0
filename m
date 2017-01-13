Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cS1tS-0003lL-1v
 for ath10k@lists.infradead.org; Fri, 13 Jan 2017 13:27:48 +0000
MIME-Version: 1.0
Subject: Re: [v2,1/2] ath10k: refactor ath10k_peer_assoc_h_phymode()
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20161014101859.5300.47040.stgit@potku.adurom.net>
References: <20161014101859.5300.47040.stgit@potku.adurom.net>
Message-ID: <ceac78fa3ca848f593955708bed59c0d@euamsexm01a.eu.qualcomm.com>
Date: Fri, 13 Jan 2017 14:27:18 +0100
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> When adding VHT160 support to ath10k_peer_assoc_h_phymode() the VHT mode
> selection code becomes too complex. Simplify it by refactoring the vht part to
> a separate function.
> 
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

2 patches applied to ath-next branch of ath.git, thanks.

06efdbe70f9c ath10k: refactor ath10k_peer_assoc_h_phymode()
bc1efd739b61 ath10k: add VHT160 support

-- 
https://patchwork.kernel.org/patch/9376371/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
