Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYYyS-0003Kw-AP
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 11:18:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Possible issue with firmware crash reporting.
References: <5421B67D.8060508@candelatech.com>
 <87wq8m1ydg.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 29 Sep 2014 14:18:05 +0300
In-Reply-To: <87wq8m1ydg.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Mon, 29 Sep 2014 14:04:27 +0300")
Message-ID: <87lhp21xqq.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> If I'm reading this right, uevent_sock_mutex is by both
> platform_bus_init()

"uevent_sock_mutex is held by platform_bus_init()"


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
