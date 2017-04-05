Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvfWw-0008DC-AC
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:43:54 +0000
MIME-Version: 1.0
Subject: Re: ath10k: cancel coverage class work during stop and restart
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1490961521-32746-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1490961521-32746-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <9e55afd425de43178dd528ad242451a5@euamsexm01a.eu.qualcomm.com>
Date: Wed, 5 Apr 2017 09:37:06 +0200
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
> It seems set_coverage_class_work is not cancelled anywhere,
> though I could not find a crash/warning  with this existing
> design, its safer to cancel it during stop() and also before
> restarting the hardware.
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

d94475c2f95c ath10k: cancel coverage class work during stop and restart

-- 
https://patchwork.kernel.org/patch/9656095/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
