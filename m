Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cS21i-0001be-NO
 for ath10k@lists.infradead.org; Fri, 13 Jan 2017 13:36:21 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix Tx legacy rate reporting
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1484063603-13652-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1484063603-13652-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <cbac3fa290ef42358b6717b801afbb2d@euamsexm01a.eu.qualcomm.com>
Date: Fri, 13 Jan 2017 14:35:51 +0100
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Tx legacy rate is reported 10 fold, as below
> 
> iw dev wlan#N station dump | grep "tx bitrate"
>         tx bitrate:     240.0 MBit/s
> 
> This is because by mistake we muliply by the hardware reported
> rate twice by 10, fix this.
> 
> Fixes: cec17c382140 ("ath10k: add per peer htt tx stats support for 10.4")
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

cd59102779ac ath10k: fix tx legacy rate reporting

-- 
https://patchwork.kernel.org/patch/9508075/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
