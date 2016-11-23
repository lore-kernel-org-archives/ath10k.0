Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9dRG-0001nU-7M
 for ath10k@lists.infradead.org; Wed, 23 Nov 2016 19:42:39 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix monitor vdev for receiving other bss frames
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1479510658-8326-1-git-send-email-rmanohar@qca.qualcomm.com>
References: <1479510658-8326-1-git-send-email-rmanohar@qca.qualcomm.com>
Message-ID: <8167e14b023b48af8cf8f277c36415d3@euamsexm01a.eu.qualcomm.com>
Date: Wed, 23 Nov 2016 20:42:10 +0100
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
To: "Manoharan, Rajkumar" <rmanohar@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, rmanohar@codeaurora.org

"Manoharan, Rajkumar" <rmanohar@qca.qualcomm.com> wrote:
> In order to receive other BSS entries in mesh mode, Monitor vdev
> is created whenever filter flag is set with OTHER_BSS. Recently
> it is root caused that setting promisc filter for Mesh interface
> is causing performance and stability issues. To fix this issue,
> firmware will configure appropriate rxfilters by default for mesh
> vdev during vdev creation. This change fixes monitor vdev creation
> based on firmware IE
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

705d7aa06220 ath10k: fix monitor vdev for receiving other bss frames

-- 
https://patchwork.kernel.org/patch/9437519/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
