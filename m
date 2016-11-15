Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6fLU-00044m-29
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 15:08:25 +0000
MIME-Version: 1.0
Subject: Re: [1/1] ath10k: use the right length of "background"
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20161029111737.19034-1-nicolas.iooss_linux@m4x.org>
References: <20161029111737.19034-1-nicolas.iooss_linux@m4x.org>
Message-ID: <67898e02d2c1489b84cd0c85517445dc@euamsexm01a.eu.qualcomm.com>
Date: Tue, 15 Nov 2016 16:07:56 +0100
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
To: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Nicolas Iooss <nicolas.iooss_linux@m4x.org> wrote:
> The word "background" contains 10 characters so the third argument of
> strncmp() need to be 10 in order to match this prefix correctly.
> 
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
> Fixes: 855aed1220d2 ("ath10k: add spectral scan feature")

Patch applied to ath-next branch of ath.git, thanks.

31b239824ece ath10k: use the right length of "background"

-- 
https://patchwork.kernel.org/patch/9403561/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
