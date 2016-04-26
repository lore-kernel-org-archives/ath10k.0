Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1av1Zt-0003BM-LG
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 11:54:54 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/4] ath10k: update bss channel survey information
Date: Tue, 26 Apr 2016 11:53:57 +0000
Message-ID: <87r3dsy4a4.fsf@kamboji.qca.qualcomm.com>
References: <1461303992-9913-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1461303992-9913-4-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1461303992-9913-4-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Fri, 22 Apr 2016 11:16:32 +0530")
Content-Language: en-US
Content-ID: <4CC807872B29124CB8D22BB115E2E7DC@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> During hw scan, firmware sends two channel information events (pre-
> complete, complete) to host for each channel change. The snap shot of cycle
> counters (rx_clear and total) between these two events are given for
> survey dump. In order to get latest survey statistics of all channels, a
> scan request has to be issued. In general, an AP DUT is brought up, it
> won't leave BSS channel except few cases like overlapping bss or radar
> detection. So survey statistics of bss channel is always referring to
> older data that are collected before starting AP (either ACS/OBSS scan).
>
> To collect latest survey information from target, firmware provides WMI
> interface to read cycle counters from hardware. For each survey dump
> request, BSS channel cycle counters are read and cleared in hardware.
> This makes sure that behavior is in align with ath9k survey report.
> So survey dump always gives snap shot of cycle counters b/w two survey
> requests.
>
> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

This patch adds new sparse warnings:

drivers/net/wireless/ath/ath10k/wmi.c:4824:33: warning: incorrect type in argument 2 (different base types)
drivers/net/wireless/ath/ath10k/wmi.c:4824:33:    expected int [signed] freq
drivers/net/wireless/ath/ath10k/wmi.c:4824:33:    got restricted __le32 [usertype] freq
drivers/net/wireless/ath/ath10k/wmi.c:4833:27: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/wmi.c:4833:27:    expected signed char [signed] [usertype] [explicitly-signed] noise
drivers/net/wireless/ath/ath10k/wmi.c:4833:27:    got restricted __le32 [usertype] noise_floor

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
