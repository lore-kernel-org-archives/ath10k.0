Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yvi99-000600-Ib
 for ath10k@lists.infradead.org; Fri, 22 May 2015 08:17:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix survey information reporting
References: <1430829048-22549-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Fri, 22 May 2015 11:16:48 +0300
In-Reply-To: <1430829048-22549-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Tue, 5 May 2015 18:00:48
 +0530")
Message-ID: <87pp5t58nj.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> Rx clear count reported in wmi_chan_info_event is actually channel_busy_count
> not rx_frame_count. Send rx_clear_count through time_busy of survey_info
> and set SURVEY_INFO_TIME_BUSY in filled.
>
> iw wlan0 survey dump
>
> urvey data from wlan0
>         frequency:                      5180 MHz [in use]
>         noise:                          -103 dBm
>         channel active time:            150 ms
>         channel busy time:              22 ms
> Survey data from wlan0
>         frequency:                      5200 MHz
>         noise:                          -102 dBm
>         channel active time:            146 ms
>         channel busy time:              0 ms
>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, applied.

I actually applied this already on the 11th but apparently forgot to
send an email.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
