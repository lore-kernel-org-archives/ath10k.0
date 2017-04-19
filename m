Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0qIF-0000am-Q8
 for ath10k@lists.infradead.org; Wed, 19 Apr 2017 14:09:22 +0000
MIME-Version: 1.0
Subject: Re: [v2,3/3] ath9k: add noise floor override option
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170323133048.30062-4-sw@simonwunderlich.de>
References: <20170323133048.30062-4-sw@simonwunderlich.de>
Message-ID: <789c82fc5c3b446b8b24c87ec9e45ed5@euamsexm01a.eu.qualcomm.com>
Date: Wed, 19 Apr 2017 16:08:47 +0200
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org

Simon Wunderlich <sw@simonwunderlich.de> wrote:
> Introduce a debugfs option to manually override the noise floor,
> ignoring the automatically tuned noise floor of the driver/hw.
> 
> In my tests with a AR9580 based module and a tx99 5 MHz interferer,
> I could tune the noisefloor to -95 dBm or above to allow communication
> again. The automatic noise floor calibration sometimes could adapt to
> the situation as well, but not reliably and permanently.
> 
> I would consider this "feature" experimental and interesting for people
> debugging the noise floor calibration or other effects of the hardware.
> 
> Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
> Signed-off-by: Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

Patch applied to ath-next branch of ath.git, thanks.

b90189759a7f ath9k: add noise floor override option

-- 
https://patchwork.kernel.org/patch/9641107/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
