Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddERq-0001yJ-Sf
 for ath10k@lists.infradead.org; Thu, 03 Aug 2017 11:37:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2,
 1/3] ath10k: extend wmi service map to accommodate new services
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1500379094-2373-2-git-send-email-mpubbise@qti.qualcomm.com>
References: <1500379094-2373-2-git-send-email-mpubbise@qti.qualcomm.com>
Message-ID: <13b5ffdef43a4561b3cd123114cd0b8f@euamsexm01a.eu.qualcomm.com>
Date: Thu, 3 Aug 2017 13:37:18 +0200
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

> Though there is room to accommodate 512 services in wmi service
> ready event, target uses only first 4-bits of each 32-bit word for
> advertising wmi services thereby limiting max wmi services to 64.
> 
> TDLS implementation for 10.4 firmwares introduces new wmi services by
> making use of remaining unused bits of each 32-bit word, therefore the
> wmi service mapping in host needs to be extended.
> 
> This patch adds the logic to extend the wmi SVCMAP to accommodate new
> wmi services.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

3 patches applied to ath-next branch of ath.git, thanks.

810fe818d6a1 ath10k: extend wmi service map to accommodate new services
add6cd8d5ab7 ath10k: add tdls support for 10.4 firmwares
be5b4f4002a6 ath10k: push peer type to target for TDLS peers

-- 
https://patchwork.kernel.org/patch/9848157/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
