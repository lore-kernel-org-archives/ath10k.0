Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2277FC433F5
	for <ath10k@archiver.kernel.org>; Sat, 27 Nov 2021 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:References:To:From:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gauZ3UmSTlWArb2I1xlRWba57byUTiWqXQocIviY7LI=; b=3TOIVj1rsqbR4QDTkAtqTZFeZL
	J+p32QarldozZybqfD77wsarvoSs0ozpfy8anltUS8Twlbl5XyCkUBCrabeZ0vSoTjAaCx1wnX7Rn
	7fcDYiZDvRPK1KHc+ox2ZPBNsys4MCEqvJ3aJz//6nfNGNpo5nSE2G408XmcbQwaGSxGTSNa+wcJT
	cT4YwTAgwrxIUoUac8X4qvunzEopYMVxILDGMQJ0Xa0lUL8MG5utv0B5TtIVrTNOnXVUPo1ZTMaDh
	vhOYTO6UtAfQWATgpcvEBl/7U8Q/I9/W0Fv2YmwLIzZ1D/0ApumUd+pKTCu5bppkQM4H00ve0I0VS
	X4VorO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqxiH-00DiMm-Js; Sat, 27 Nov 2021 13:25:57 +0000
Received: from midgard.reox.at ([2a01:4f8:151:1288::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqxiE-00DiLv-KD
 for ath10k@lists.infradead.org; Sat, 27 Nov 2021 13:25:56 +0000
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by midgard.reox.at (Postfix) with ESMTPSA id 42A181200E8
 for <ath10k@lists.infradead.org>; Sat, 27 Nov 2021 14:25:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=reox.at; s=mail;
 t=1638019549; bh=gdzODIOqpM8kUTJzkhb9XxyN73ECkGIJ+5J3brumWpI=;
 h=Date:From:To:References:Subject:In-Reply-To:From;
 b=mCDeG/gRjixwn27Jr2D6YX3EtEflriUC3tIdcSoZ0UHcmAbcN9i5YHw5tceifvU+e
 jv/pGgFGxJz3dwJZyRGqLrDG8IAsXqylWo+BCYdHri6U8tTFPjM9R4Vss/S1EdFcL7
 Pn2b9WVY/rjbIpnpFsxwy4yl+8L3bZSWwuV4B1M5Ll8fG+H8Ehw6ORLiXB2ij7jT4u
 DSeTeT3LgzZXmyI/cQ0nbmGf2M05+/ZFA3V+EkKzmWpdoL+ziMxr7gbVRsCnc17qch
 q1BC+UMV7J9iAjdV8zPXPjWa9k04N13m9dWE7M7lOVu8B17SzBBmt7l8hKCmuw5Ab0
 Y+4i1jxytRJ/A==
Message-ID: <9fca928a-522e-8fc7-69c0-454cb434cf13@reox.at>
Date: Sat, 27 Nov 2021 14:25:48 +0100
MIME-Version: 1.0
From: Sebastian Bachmann <hello@reox.at>
Content-Language: en-GB
To: ath10k@lists.infradead.org
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
 <YaIix40KaVlxT+XG@eq.uc.pt>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
In-Reply-To: <YaIix40KaVlxT+XG@eq.uc.pt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_052555_016791_487F1E43 
X-CRM114-Status: GOOD (  21.44  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 27.11.2021 13:21, Nuno Oliveira wrote:
> After June 2020 there were other users also affected by this change (see 
> e.g., 
> https://lists.infradead.org/pipermail/ath10k/2021-August/012802.html).
> Users were complaining that this change was too restrictive since it 
> meant that the intersection of restrictions for regdomains 0x00, 0x64,
> US, and their local domain, together with a cumulative mode of applying 
> these constraints meant that, in practice, they would not be able to use 
> their world domain cards anymore as APs in the 5GHz band, for certain 
> regdomains where they were located.

Thanks for hinting me to this thread, I have not seen that before. I 
read in this thread and the linked ones and understand the issue now a 
bit better.
It seems like that basically many (all ?) Compex cards are affected by 
this, and probably many pcengines users (like me).

Reading also this: 
https://web.archive.org/web/20150117040022/http://article.gmane.org/gmane.linux.kernel.wireless.general/38410
gives me the impression that in this case, I would have to ask 
pcengines/compex for a custom regulatory.bin. Has anyone tried that already?
It also sounds like that many vendors have used this value completely 
wrong. Does anyone know if new Compex cards have the same issue?
Or in other words: what would be the correct value to put there, because 
it seems there are only two options: ship a custom regulatory.bin or 
ship the card with the country burned in it, where the card shall be used.

> A more robust option would be to go the OpenWRT way, and use their 
> patches to make this country selection a parameter for the kernel 
> module. This way, you would just reload the kernel module to change to a 
> new regdomain, subject to the restrictions of your hardware / firmware. 
> I have not looked into that. Please let me know if you isolate these 
> patches.

There is this patch: 
https://github.com/openwrt/openwrt/blob/master/package/kernel/mac80211/patches/ath/402-ath_regd_optional.patch
However, it simply disables it completely.
I have not found the patch, which would enable a parameter to set it 
during loading of the module so far though.

> 
> In any case it seems difficult to escape a kernel recompile, due to this 
> small, entirely legitimate, yet remarkable decision by the driver 
> maintainers.

Yes, for me this is sad. My setup worked for over seven years and broke 
because of an update. Of course I can now start to build kernels every 
time...
It sounds like I should throw away the Compex card and buy an 
off-the-shelf access point... I was thinking about buying a new card, 
but as there are so many reports regarding Compex cards, I have no hope 
that it will work then.

Regards,
Sebastian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
