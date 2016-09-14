Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkB2y-0003Ri-Mo
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 14:20:24 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 10/21] ath10k: support logging ath10k_info as KERN_DEBUG
Date: Wed, 14 Sep 2016 14:19:55 +0000
Message-ID: <87k2eeef79.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-11-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-11-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 11 May 2016 10:02:22	-0700")
Content-Language: en-US
Content-ID: <597BE7189D93FE42B8BE9BAA0EC89516@qualcomm.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Helps keep messages off of (serial) console when
> that is desired.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Isn't /proc/sys/kernel/print exactly for this purpose? At least I recall
using it.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
