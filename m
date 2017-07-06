Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT5hS-0007nL-84
 for ath10k@lists.infradead.org; Thu, 06 Jul 2017 12:16:04 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix indenting in ath10k_wmi_update_noa()
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <149932333976.15174.4921279022358234069.stgit@potku.adurom.net>
References: <149932333976.15174.4921279022358234069.stgit@potku.adurom.net>
Message-ID: <297be03668124c6caaddbce6431afbae@eusanexr01a.eu.qualcomm.com>
Date: Thu, 6 Jul 2017 05:15:37 -0700
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

> Commit 59ae1d127ac0 ("networking: introduce and use skb_put_data()") introduced
> a new checkpatch warning:
> 
> drivers/net/wireless/ath/ath10k/wmi.c:3308: code indent should use tabs where possible
> 
> Fix that.
> 
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

5784f87df166 ath10k: fix indenting in ath10k_wmi_update_noa()

-- 
https://patchwork.kernel.org/patch/9827511/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
