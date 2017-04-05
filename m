Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvfSy-00084s-JF
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:39:23 +0000
MIME-Version: 1.0
Subject: Re: ath10k: use octal permission representation
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1487598027-17324-1-git-send-email-marcin.rokicki@tieto.com>
References: <1487598027-17324-1-git-send-email-marcin.rokicki@tieto.com>
Message-ID: <cbcc82a65ec344d6bf413d5c41ed4a94@euamsexm01a.eu.qualcomm.com>
Date: Wed, 5 Apr 2017 09:32:52 +0200
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
To: Marcin Rokicki <marcin.rokicki@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marcin Rokicki <marcin.rokicki@tieto.com> wrote:
> Fix output from checkpatch.pl like:
>  Symbolic permissions 'S_IRUSR' are not preferred.
>  Consider using octal permissions '0400'.
> 
> Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>

This introduced a new checkpatch warning:

drivers/net/wireless/ath/ath10k/debug.c:2494: Alignment should match open parenthesis

I fixed that in the pending branch.

-- 
https://patchwork.kernel.org/patch/9582889/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
