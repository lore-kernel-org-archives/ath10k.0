Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1db3l5-0002Xu-Me
 for ath10k@lists.infradead.org; Fri, 28 Jul 2017 11:48:45 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2,2/3] ath10k: add tdls support for 10.4 firmwares
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1500379094-2373-3-git-send-email-mpubbise@qti.qualcomm.com>
References: <1500379094-2373-3-git-send-email-mpubbise@qti.qualcomm.com>
Message-ID: <777f86a7a19e42989d1e11cb522fa5e5@euamsexm01a.eu.qualcomm.com>
Date: Fri, 28 Jul 2017 13:48:12 +0200
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

> This patch adds the support of TDLS feature for 10.4 firmware
> versions.
> 
> A new WMI service is added to advertise the support of TDLS for
> 10.4 firmwares.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

This added new warnings, I fixed them in the pending branch:

drivers/net/wireless/ath/ath10k/wmi.c:654:10: warning: Initializer entry defined twice
drivers/net/wireless/ath/ath10k/wmi.c:738:10:   also defined here
drivers/net/wireless/ath/ath10k/wmi.h:2881: line over 90 characters

-- 
https://patchwork.kernel.org/patch/9848159/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
