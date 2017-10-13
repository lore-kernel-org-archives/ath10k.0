Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2yKi-0004i1-RA
 for ath10k@lists.infradead.org; Fri, 13 Oct 2017 11:40:54 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: add new cipher suite support
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1506378581-13598-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1506378581-13598-1-git-send-email-rmanohar@qti.qualcomm.com>
Message-ID: <811d6d31474148538799b0eaa0ec3031@euamsexm01e.eu.qualcomm.com>
Date: Fri, 13 Oct 2017 13:40:25 +0200
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: Jouni Malinen <jouni@qca.qualcomm.com>, linux-wireless@vger.kernel.org, rmanohar@codeaurora.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:

> QCA99x0 and QCA4019 family chips support CCMP-256, GCMP-128, and
> GCMP-256 ciphers in hardware, so advertise support for these. As
> firmware does not support group management frame ciphers (BIP),
> handle them in software (mac80211).
> 
> Reviewed-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Cc: Jouni Malinen <jouni@qca.qualcomm.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

2ea9f12cefe4 ath10k: add new cipher suite support

-- 
https://patchwork.kernel.org/patch/9970613/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
