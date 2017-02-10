Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccA8U-00031C-QD
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 12:17:13 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: Fix crash during rmmod when probe firmware
 fails
Date: Fri, 10 Feb 2017 12:16:42 +0000
Message-ID: <1486729001850.80243@qti.qualcomm.com>
References: <1482221351-24029-1-git-send-email-mohammed@qca.qualcomm.com>
 <8760l38dz0.fsf@kamboji.qca.qualcomm.com>
 <871svr8d83.fsf@kamboji.qca.qualcomm.com>
 <20170206100448.GA13894@atheros-ThinkPad-T61>,
 <87lgteidii.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87lgteidii.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-IN
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@codeaurora.org> writes:

> the change suggested by you helps, and the device probe, scan
> is successful as well. Still good to have this change part of your
> basic sanity and regression testing !

Sure. I was sort of expecting that you would send v4 but I haven't seen
one so I guess you assumed I send that? :) I'll then submit v4.

[shafi] thanks Kalle, just saw your patch.

regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
