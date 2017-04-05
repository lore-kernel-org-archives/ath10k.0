Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvfWV-0000lP-9q
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:38:37 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Enable a HTC debug message during insufficient tx credits
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1490961566-328-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1490961566-328-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <cc825d32e7ce406bb172c9d05bbd22ee@euamsexm01a.eu.qualcomm.com>
Date: Wed, 5 Apr 2017 09:38:00 +0200
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
> Add an ath10k HTC debug message when insufficient tx credits
> are available to send the WMI commands. This is very useful
> in debugging issues like 'tx credit starvation' that could
> possibly happen with multiclient setup with constant roaming
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

03e463a4197a ath10k: enable a HTC debug message during insufficient tx credits

-- 
https://patchwork.kernel.org/patch/9656099/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
