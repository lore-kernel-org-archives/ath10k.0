Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eL8bW-0007d4-Ng
 for ath10k@lists.infradead.org; Sat, 02 Dec 2017 14:17:20 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2,1/2] ath10k: update tdls teardown state to target
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1509955772-4941-2-git-send-email-mpubbise@qti.qualcomm.com>
References: <1509955772-4941-2-git-send-email-mpubbise@qti.qualcomm.com>
Message-ID: <a6995e7c81634331a4c7f07d3d5b205b@euamsexm01a.eu.qualcomm.com>
Date: Sat, 2 Dec 2017 15:16:48 +0100
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
To: mpubbise@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

mpubbise@qti.qualcomm.com wrote:

> It is required to update the teardown state of the peer when
> a tdls link with that peer is terminated. This information is
> useful for the target to perform some cleanups wrt the tdls peer.
> 
> Without proper cleanup, target assumes that the peer is connected and
> blocks future connection requests, updating the teardown state of the
> peer addresses the problem.
> 
> Tested this change on QCA9888 with 10.4-3.5.1-00018 fw version.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

2 patches applied to ath-next branch of ath.git, thanks.

424ea0d174e8 ath10k: update tdls teardown state to target
8ed05ed06fca ath10k: handle tdls peer events

-- 
https://patchwork.kernel.org/patch/10042737/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
