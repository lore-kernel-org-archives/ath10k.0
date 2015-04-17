Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yj01c-0006Gj-5l
 for ath10k@lists.infradead.org; Fri, 17 Apr 2015 06:45:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: use MAC clock rate same as FW uses for survey
 accuracy
References: <6a113cdb1b0dbbb6d98ab6b363b4912474c32bac.1428701627.git.poh@qca.qualcomm.com>
Date: Fri, 17 Apr 2015 09:44:43 +0300
In-Reply-To: <6a113cdb1b0dbbb6d98ab6b363b4912474c32bac.1428701627.git.poh@qca.qualcomm.com>
 (Peter Oh's message of "Mon, 13 Apr 2015 11:01:20 -0700")
Message-ID: <87egnj45k4.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> WLAN survey data provides several informative values on each channels
> such as noise, active time, transmit time, and etc.
> Regarding the channel activity time data, it is reported from firmware
> in different form which is number of cycles instead of time itself.
> Hence host driver converts it to time unit by dividing it by clock rate
> that is used at baseband MAC.
>
> Using difference clock rate from that actual HW is using will result in
> inaccurate survey data. For instance, channel active time can be reported
> with bigger than 150ms even though we set Dwell time to 150ms.
> Therefore set the clock rate to 88000 (88 MHz) which is ath10k baseband
> MAC is using.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
