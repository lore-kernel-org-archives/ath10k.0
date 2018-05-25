Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fM9ma-0002KQ-Ty
 for ath10k@lists.infradead.org; Fri, 25 May 2018 10:17:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2,
 1/2] ath: Add support to get the detected radar specifications
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1526375389-7106-2-git-send-email-srirrama@codeaurora.org>
References: <1526375389-7106-2-git-send-email-srirrama@codeaurora.org>
Message-Id: <20180525101702.2493460C55@smtp.codeaurora.org>
Date: Fri, 25 May 2018 10:17:02 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> This enables ath10k/ath9k drivers to collect the specifications of the
> radar type once it is detected by the dfs pattern detector unit.
> Usage of the collected info is specific to driver implementation.
> For example, collected radar info could be used by the host driver
> to send to co-processors for additional processing/validation.
> 
> Note: 'radar_detector_specs' data containing the specifications of
> different radar types which was private within dfs_pattern_detector/
> dfs_pri_detector is now shared with drivers as well for making use
> of this information.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

f40105e67478 ath: add support to get the detected radar specifications
6f6eb1bcbeff ath10k: DFS Host Confirmation

-- 
https://patchwork.kernel.org/patch/10400505/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
