Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyQqt-0005Vg-UQ
 for ath10k@lists.infradead.org; Mon, 16 Nov 2015 20:58:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Adjust the RX packet pad offset at QCA99X0 4addr
 mode
References: <1445575816-4500-1-git-send-email-yanbol@qca.qualcomm.com>
 <877fme40ny.fsf@kamboji.qca.qualcomm.com>
 <2cd04da006cb4f2a8eea859b6aad3e10@nasanexm02e.na.qualcomm.com>
Date: Mon, 16 Nov 2015 22:57:44 +0200
In-Reply-To: <2cd04da006cb4f2a8eea859b6aad3e10@nasanexm02e.na.qualcomm.com>
 (Yanbo Li's message of "Fri, 23 Oct 2015 06:10:17 +0000")
Message-ID: <87si45zmpj.fsf@kamboji.qca.qualcomm.com>
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
To: "Li, Yanbo" <yanbol@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Li, Yanbo" <yanbol@qca.qualcomm.com> writes:

>> > +		/* The padding bytes's location is different on various chips */
>> > +		enum ath10k_loc_4addr_pad loc_4addr_pad;
>> 
>> I think that loc prefix is a bit misleading, it reminds me of
>> locationing/positioning etc. What about ath10k_hw_4addr_pad?
>> 
>
>
> There is already a FW feature defined as
> "ATH10K_FW_FEATURE_NO_NWIFI_DECAP_4ADDR_PADDIND" and the relative
> string is "no-4addr-pad", if we just remove the "loc" prefix, it may
> be confuse with this FW feature.
>
> How about we change the loc to offset in this case or any better suggestion?

I did some naming changes in the pending branch:

https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=42cd3832cd7c78bfeabb639a4086c7838fda5b57

Please review and let me know what you think.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
