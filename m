Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW2ib-00018i-4V
 for ath10k@lists.infradead.org; Thu, 12 Mar 2015 13:00:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix PMG by using AES-CMAC/IGTK software crypto
References: <1425994339-15864-1-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 12 Mar 2015 14:59:32 +0200
In-Reply-To: <1425994339-15864-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Tue, 10 Mar 2015 14:32:19 +0100")
Message-ID: <87lhj2v0az.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> While testing with older supplicant, .drv_set_key() was failing due to
> higher than ath10k firmware could handle key_index (WMI_MAX_KEY_INDEX == 3).
>
> --
> wpa_driver_nl80211_set_key: ifindex=15 alg=4 addr=0x7f02b129fbe3 key_idx=4 set_tx=0 seq_len=6 key_len=16
>     broadcast key
> nl80211: set_key failed; err=-22 Invalid argument)
> wlan0: WPA: Failed to configure IGTK to the driver
> wlan0: RSN: Failed to configure IGTK
> --
>
> In order to fix this case (PMF: AES-CMAC/IGTK) force the AES_CMAC cipher to
> be handled by software.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, applied. I just did s/PMG/PMF/.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
