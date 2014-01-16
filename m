Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3jEl-0000PQ-2U
 for ath10k@lists.infradead.org; Thu, 16 Jan 2014 09:27:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: set the AP keepalive timer
References: <1389863904-7159-1-git-send-email-yeohchunyeow@gmail.com>
Date: Thu, 16 Jan 2014 11:27:10 +0200
In-Reply-To: <1389863904-7159-1-git-send-email-yeohchunyeow@gmail.com>
 (Chun-Yeow Yeoh's message of "Thu, 16 Jan 2014 17:18:24 +0800")
Message-ID: <877ga0uvip.fsf@kamboji.qca.qualcomm.com>
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
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Chun-Yeow Yeoh <yeohchunyeow@gmail.com> writes:

> Set the AP keepalive timer as following:
> ap_keepalive_min_idle_inactive_time_secs to 60 seconds
> ap_keepalive_max_idle_inactive_time_secs to 120 seconds
> ap_keepalive_max_unresponsive_time_secs to 300 seconds
>
> This ensure that the WMI_PEER_STA_KICKOUT_EVENTID is triggered
> by the FW only once the unresponsive timer is expired.
>
> Tested with firmware version 999.999.0.636 but the timer
> is still default to 100 seconds. Tested with firmware 
> version 10.1.467-1, the timer is set according to 
> ap_keepalive_max_unresponsive_time_secs.
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

Heh, bad timing. Yesterday I implemented STA quick kickout and in that
patch I set the same parameters as you did. I just used longer values to
avoid inactivity timeouts triggering in the firmware. We have the same
functionality in hostapd, so there's no need to use the one in firmware.

I'll send my patch after lunch, please take a look at that and see if
it's ok.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
