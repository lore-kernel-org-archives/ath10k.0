Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEBT8-0005Yg-Ql
 for ath10k@lists.infradead.org; Mon, 04 Aug 2014 06:10:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv5 0/2] ath10k spectral scan support
References: <1406899034-13473-1-git-send-email-sw@simonwunderlich.de>
Date: Mon, 4 Aug 2014 09:09:29 +0300
In-Reply-To: <1406899034-13473-1-git-send-email-sw@simonwunderlich.de> (Simon
 Wunderlich's message of "Fri, 1 Aug 2014 15:17:12 +0200")
Message-ID: <877g2o6b1i.fsf@kamboji.qca.qualcomm.com>
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, linux-wireless@vger.kernel.org, sven@narfation.org, ath10k@lists.infradead.org

Simon Wunderlich <sw@simonwunderlich.de> writes:

> This is the fifth "PATCH" patchset iteration for the ath10k spectral
> scan feature. It includes a small change compared to Kalles PATCHv4
> series: the parameter initialization has been moved to
> ath10k_spectral_start() so that the parameters also get reset when the
> firmware crashes.
>
> To view the samples, please have a look at the fft_eval tool [1] which
> now supports both ath9k and ath10k formats.
>
> The count issue is still open: Even when a count is specified, the
> hardware seems to send endless samples. It seems to work most of the
> time in VHT80 mode though, but in HT20 and HT40 the count value seems
> to be ignored. To reproduce this, start hostapd with the desired
> channel width and do:
>
> echo 8 > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_count
> echo manual > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> echo trigger > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> cat /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan0 >> /tmp/fft.dump
>
> Repeating the last line and checking the filesize will easily show
> whether ath10k still sends samples or not. We would expect 8 samples in
> this configuration.
>
> Please see the patches for more information on the changes.
>
> Cheers,
>     Simon
>
> [1] https://github.com/simonwunderlich/FFT_eval
>
> Simon Wunderlich (1):
>   ath10k: add spectral scan feature
>
> Sven Eckelmann (1):
>   ath: Move spectral debugfs structs to shared header

Thanks, both patches applied.

And thanks for fixing a bug I introduced!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
