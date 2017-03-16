Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coRBD-000490-Dh
 for ath10k@lists.infradead.org; Thu, 16 Mar 2017 08:54:45 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath10k: Update available channel list for 5G radio
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1487855902-32090-1-git-send-email-c_traja@qti.qualcomm.com>
References: <1487855902-32090-1-git-send-email-c_traja@qti.qualcomm.com>
Message-ID: <0ad928ccfaa34e28ba8c2731ff1cc42d@euamsexm01a.eu.qualcomm.com>
Date: Thu, 16 Mar 2017 09:54:16 +0100
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
To: c_traja@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

c_traja@qti.qualcomm.com wrote:
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
> 
> If a 5 GHz radio is calibrated for operation in both
> the low band (channels 36 to 64) and high band(channels 100 to 169),
> hardware allows operations in all the listed channels. However,
> if the chip has been calibrated only for the low/high band and
> a high/low band channel is configured, due to lack of calibration
> there will be potentially invalid signal on those non calibrated channels.
> To avoid this problem this patch sets IEEE80211_CHAN_DISABLED flag for
> those non calibrated channels by using low_5ghz_chan and high_5ghz_chan
> values which we get from target through wmi service ready event.
> 
> Driver initialized flags are getting re initialized in handle_channel
> in cfg80211. So calling the function to disable the non supported channel
> from reg_notifier().
> 
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

523f6701dbab ath10k: update available channel list for 5G radio

-- 
https://patchwork.kernel.org/patch/9588297/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
