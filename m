Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XA08P-0005vm-2i
 for ath10k@lists.infradead.org; Wed, 23 Jul 2014 17:15:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3 0/2] ath10k spectral scan support
References: <1406130837-10353-1-git-send-email-sw@simonwunderlich.de>
Date: Wed, 23 Jul 2014 20:14:53 +0300
In-Reply-To: <1406130837-10353-1-git-send-email-sw@simonwunderlich.de> (Simon
 Wunderlich's message of "Wed, 23 Jul 2014 17:53:55 +0200")
Message-ID: <87mwc0ro8i.fsf@kamboji.qca.qualcomm.com>
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

> This is the third "PATCH" patchset iteration for the ath10k spectral
> scan feature. It includes quite a few style fixes, the compile issues
> were fixed when debugfs were disabled, and sending WMI commands after
> a firmware crash should not happen any more. Thanks to Michal, Chun-Yeow
> and Kalle for reviewing!
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

This one had conflicts so I'm dropping it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
