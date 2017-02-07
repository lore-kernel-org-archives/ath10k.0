Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb1Sl-0005wa-Qv
 for ath10k@lists.infradead.org; Tue, 07 Feb 2017 08:49:25 +0000
MIME-Version: 1.0
Subject: Re: [1/3] ath10k: prefer unsigned int over just unsigned
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <148603246555.7275.3348416808167032391.stgit@potku.adurom.net>
References: <148603246555.7275.3348416808167032391.stgit@potku.adurom.net>
Message-ID: <e88995d698ce4db08821046ec9b462ba@eusanexr01a.eu.qualcomm.com>
Date: Tue, 7 Feb 2017 00:48:54 -0800
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
> Fixes new checkpatch warnings:
> 
> drivers/net/wireless/ath/ath10k/htt.h:1639: Prefer 'unsigned int' to bare use of 'unsigned'
> drivers/net/wireless/ath/ath10k/htt.h:1660: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

3 patches applied to ath-next branch of ath.git, thanks.

b2d604156846 ath10k: prefer unsigned int over just unsigned
019e4280fac9 ath10k: use names in function definition arguments
39bfe9f7c0c9 ath10k: few whitespace fixes

-- 
https://patchwork.kernel.org/patch/9551583/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
