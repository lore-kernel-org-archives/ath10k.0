Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yv3Kp-0008Ix-GS
 for ath10k@lists.infradead.org; Wed, 20 May 2015 12:42:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: handle cycle count wrap around
References: <CACZoB699sLr1gu1qSM1N01FQ5RNX41wDoOeCYd6A+sjyDRRU0A@mail.gmail.com>
Date: Wed, 20 May 2015 15:42:27 +0300
In-Reply-To: <CACZoB699sLr1gu1qSM1N01FQ5RNX41wDoOeCYd6A+sjyDRRU0A@mail.gmail.com>
 (Srinivasa Duvvuri's message of "Fri, 15 May 2015 15:29:49 -0700")
Message-ID: <87iobna098.fsf@kamboji.qca.qualcomm.com>
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
To: Srinivasa Duvvuri <sduvvuri@chromium.org>
Cc: ath10k@lists.infradead.org

Srinivasa Duvvuri <sduvvuri@chromium.org> writes:

> This patch addresses
>  couple of issues related to survey data that results   in a random/large
>  values in the out put of iw dev wlan0 surevey dump.
>
>   These are the 2 changes that address the issue.
>
>   1) Handle Cycle count wrap around.
>      When the cycle counts part of wmi_ch_info_ev_arg reach max value of
>      0xffffffff. The HW/FW right shifts all the counteirs by 1 . The cycle
>      count will be reset to 0x7fffffff and starts counting from 0x7fffffff and
>      the other counters will have their value right shifted by 1 (divided by 2).
>      There is no way to handle this odd wrap around. Detect and ignore the wrap
>      around case.
>
>   2) Handle Back to back channel info events from FW with
>      WMI_CHAN_INFO_FLAG_COMPLETE.
>      Between 2 scans FW sends back to back events with
>      WMI_CHAN_INFO_FLAG_COMPLETE flag set. One at the end of first scan
>      and the second at the beginning of scan. Depending on the time
>      between 2 scans , the cycle counts could have wrapped around several
>      timesi. Fix is detect and to ignore such events.
>
> Signed-off-by: Srinivasa Duvvuri <sduvvuri@chromium.org>

Please CC linux-wireless when sending ath10k patches.

Did you use git-send-email? There seems to be some kind of corruption:

patch -p1 < srini-1.mbox 
patching file drivers/net/wireless/ath/ath10k/core.h
Hunk #1 FAILED at 688.
1 out of 1 hunk FAILED -- saving rejects to file drivers/net/wireless/ath/ath10k/core.h.rej
patching file drivers/net/wireless/ath/ath10k/wmi.c
patch: **** malformed patch at line 131: *ar, struct sk_buff *skb)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
