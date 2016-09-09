Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biMoR-0001Om-RL
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 14:29:59 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/4] ath10k: Padding related clean ups in rx
Date: Fri, 9 Sep 2016 14:29:23 +0000
Message-ID: <87a8fhp2nx.fsf@kamboji.qca.qualcomm.com>
References: <1469623006-13178-1-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1469623006-13178-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Wed, 27 Jul 2016 18:06:42	+0530")
Content-Language: en-US
Content-ID: <C040271798FF3F46A481197648569547@qualcomm.com>
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
To: "Thiagarajan, Vasanthakumar" <vthiagar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> This patch set adds abstraction for rx_hw_desc processing so that
> we can make use of newer desc fields notifying padding information
> which is done on rx payload. "ath10k: Properly remove padding from
> the start of rx payload" fixes padding related bug in ethernet decap
> mode for QCA99X0, QCA9984 qnd QCA4019 but even fixing this bug will
> not make ethernet decap mode work, there needs to be some more fix
> wich would follow this patch series.
>
> Vasanthakumar Thiagarajan (4):
>   ath10k: Move ath10k_hw_params definition to hw.h
>   ath10k: Add provision for Rx descriptor abstraction
>   ath10k: Properly remove padding from the start of rx payload
>   ath10k: Remove 4-addr padding related hw_param configuration

As Benjamin has these patches on his own set I'm dropping this one.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
