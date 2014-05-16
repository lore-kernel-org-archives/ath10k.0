Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlHHa-0003W1-8i
 for ath10k@lists.infradead.org; Fri, 16 May 2014 12:30:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: support get/set antenna configurations.
References: <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <1400015472-4647-1-git-send-email-apenwarr@gmail.com>
Date: Fri, 16 May 2014 15:30:07 +0300
In-Reply-To: <1400015472-4647-1-git-send-email-apenwarr@gmail.com> (Avery
 Pennarun's message of "Tue, 13 May 2014 17:11:12 -0400")
Message-ID: <87ha4p7vow.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Tested with CT firmware, but should work on standard
> firmware as well.
>
> Verified that target's tx/rx chain register is set appropriately,
> and that the tx rate goes down as number of chains
> decrease, but I did not actually try to verify antenna
> ceased to transmit when disabled.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Avery Pennarun <apenwarr@gmail.com>

I now moved ar->supp_*_chainmask initialisation to
ath10k_mac_register(). Ben & Avery, is that for you two?

Full patch here:

https://github.com/kvalo/ath/commit/8230cdc4f434817d3c929292600fc3582e7dd3a8

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
