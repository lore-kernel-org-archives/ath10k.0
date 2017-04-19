Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0qFd-0008Bj-G4
 for ath10k@lists.infradead.org; Wed, 19 Apr 2017 14:06:36 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: Fix spectral scan for QCA99X0 family of chipsets
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1491838697-25393-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1491838697-25393-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <27dbd457e54f492897fba1ac6f8722d2@euamsexm01a.eu.qualcomm.com>
Date: Wed, 19 Apr 2017 16:06:05 +0200
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
> spectral_bin length (number of bins per fft sample) is usually
> a value where (2^n = value), n is an integer.  All of the QCA99X0
> family of chipsets seems to report a spectral_bin length of
> 2^n + 'm' bytes, where m = 4, 12 based on the chipset. This 'm'
> bytes seems to carry some radar related info which is currently
> discarded only for 'bin_len = 68' bytes. Extend this discarding of
> irrelevant 'bin_len' for QCA9984, QCA9888, IPQ4019 as well by
> introducing a hardware parameter 'spectral_bin_discard'. Also
> for QCA988X based family of chipsets which doesn't seem to have this
> issue and also for some of the hardware which I have not tested
> like QCA6174/QCA9377 the existing behaviour is retained as it is.
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

a4aab099cc9e ath10k: fix spectral scan for QCA99X0 family of chipsets

-- 
https://patchwork.kernel.org/patch/9672869/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
