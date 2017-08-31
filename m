Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnOOI-0005tI-Ce
 for ath10k@lists.infradead.org; Thu, 31 Aug 2017 12:16:12 +0000
MIME-Version: 1.0
Subject: Re: ath10k: activate user space firmware loading again
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170824210641.19595-1-hauke@hauke-m.de>
References: <20170824210641.19595-1-hauke@hauke-m.de>
Message-ID: <9a6c90a6d5dd431d8e940f619baf7b0c@euamsexm01a.eu.qualcomm.com>
Date: Thu, 31 Aug 2017 14:15:41 +0200
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
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Hauke Mehrtens <hauke@hauke-m.de> wrote:

> In commit 9f5bcfe93315 ("ath10k: silence firmware file probing
> warnings") the firmware loading was changed from request_firmware() to
> request_firmware_direct() to silence some warnings in case it fails.
> request_firmware_direct() directly searches in the file system only and
> does not send a hotplug event to user space in case it could not find
> the firmware directly.
> In LEDE we use a user space script to extract the calibration data from
> the flash memory which gets triggered by the hotplug event. This way the
> firmware gets extracted from some vendor specific partition when the
> driver requests this firmware. This mechanism does not work any more
> after this change.
> 
> Fixes: 9f5bcfe93315 ("ath10k: silence firmware file probing warnings")
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

c0cc00f250e1 ath10k: activate user space firmware loading again

-- 
https://patchwork.kernel.org/patch/9920973/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
