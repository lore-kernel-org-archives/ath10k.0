Return-Path: <SRS0=JqiT=NN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86864C4338F
	for <ath10k@archiver.kernel.org>; Sun, 22 Aug 2021 16:50:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A066127B
	for <ath10k@archiver.kernel.org>; Sun, 22 Aug 2021 16:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42A066127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/shsmQSnHL/DlCKDL+6bgb6keF9JvwuOawjos0RdTU=; b=AjJ178Q1dKFOgz
	8tKv1VIqMgQhkiwyhkG+9me3E5uew0Z0IZ9PCqzDZNl7Yj0v7TkCsNL6E1pRQYsClL42MmL4TIRJN
	SXHdCrvY8mhK3jtELe3uwRp0E9VV2skeC6goxQ4VOaRGPxhoCYhzoA32yaSYqCkzkiNlmkdISdYuF
	rtPGzLlhzcM/bd6eirGalEmPNFOC4QHY+mWm8ff38T7GNJUhJPpAlemMLZCAx+nhpGxJ5DMikeUq+
	kRleN10UP7PXa1zhx8dRArRGCni6h2IjC/Nd8j2ZNC8WPg0/GeFYTK4PtV+nEB9qMhiaAdCiSAvVp
	mD77UESR+KRojERw4afQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHqek-00EMXE-CB; Sun, 22 Aug 2021 16:49:10 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHqeh-00EMWW-5F
 for ath10k@lists.infradead.org; Sun, 22 Aug 2021 16:49:08 +0000
Received: by mail-lj1-x233.google.com with SMTP id l18so19305475lji.12
 for <ath10k@lists.infradead.org>; Sun, 22 Aug 2021 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=kj+F/iivvvpon61c7DD9W/irW+je8k1Oa5+INDP5Jrk=;
 b=L6OCr7wdb7keKFej8krtdy0G1ItcZxQTdGV9XqIBAdNfiWHdVnUDP0c2cxH0/fOhr5
 KgXzwR8nrvmz34cS8iGEbd7ciKVMlJG4KNaM5ChmpvqJM1/eHuWm+Pq9eYLDvW4DnTv4
 w1XODFFGLWFw39llHUk7ypbnUOqglJ/AgglXt26eUsvyFn/WifNnYzt3+llmD8/0zKtV
 OZv4HmnWQ59EOeRScfCdyC6Btl0qIuDxC/YGekPOYX2+m/bhAE6DqCGcek6sniT7hhQf
 w20/cvPNRig+/EdjYuSJlbf6ptkMlr8eGx2wOYhfVh7ulwbmf0KPihkD0dlqJlvuOJWN
 e2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=kj+F/iivvvpon61c7DD9W/irW+je8k1Oa5+INDP5Jrk=;
 b=VqDqZyxfeIr3hz6xUBqQUF8pL55sTXfL7zsNyEcibflbQnFJYRde4y3JS0tpgHIHD3
 DwG5HICjzWVY16UaPOn3HegPAKQrCrbSjG4LFJHGD4V4IjBtHukEq6ENahk53q1xegqp
 YA7z8XyfYhIABwYEShuJhmd8hxGoi5JZMl4itOIQ0m9ppJHL39BuJ39CuvsGG+tzh75I
 sdTMcTf9D3afbtKriLCrGYksLInJOltuYKBxJo4nisOlVJanYLhwCGI/7P47LDJwpcmG
 WNhOpg5G9IBx9R5bW/4J706ca7hMdKlaPH9O4ffEv8mJEgBk+YV1Ngpa9Q018X+GewsC
 /Dew==
X-Gm-Message-State: AOAM530YpZ7qjzGg/QqfA4iizcA26T1k15c6GoBzYTKk6ay8tKN4iljn
 uDzDHXNIOTPPen/cGtjX+Zk=
X-Google-Smtp-Source: ABdhPJzWplplqm5odJS3im829yPVY/Ppj/Hl+97zaQRmiJ+EMwyujosNwE9vDyKw8KtVzUJfjK6lIA==
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr24643290ljo.436.1629650943638; 
 Sun, 22 Aug 2021 09:49:03 -0700 (PDT)
Received: from localhost ([94.19.228.143])
 by smtp.gmail.com with ESMTPSA id a22sm1230098lfl.259.2021.08.22.09.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 09:49:02 -0700 (PDT)
Date: Sun, 22 Aug 2021 19:49:02 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Brian Norris <briannorris@chromium.org>,
 Julian Calaby <julian.calaby@gmail.com>, svp <svpm@yandex.ru>,
 felix+debian@gueux.org, Massimo Maggi <me@massimo-maggi.eu>
Subject: Revert: ath: add support for special 0x0 regulatory domain
Message-ID: <YSJ//ki/A1EgfLga@skv.local>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_094907_252725_7672E5A2 
X-CRM114-Status: GOOD (  10.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

this patch broke several 5GHz AP in my home based on different Atheros
cards (ath9k and ath10k). Both of them have FCC ID and were purchased from
different suppliers (EU and non-EU) in 2020 and in 2018. I know many other
users are affected as well.

I know this problem was discussed several times already. But I have a
couple of questions.

1) Current behaviour maps 0x0 regulatory domain to the most restrictive
world domain. According to the wiki (probably based on Atheros
documentation) 0x0 means US. Does wiki contain wrong information?

2) If I understand correctly, 0x0 is always replaced with 0x64 and that
makes the following code useless, because it will never be executed. Is it
ok?

drivers/net/wireless/ath/regd.c:703:708

if (reg->country_code == CTRY_DEFAULT &&
        regdmn == CTRY_DEFAULT) {
            printk(KERN_DEBUG "ath: EEPROM indicates default "
                "country code should be used\n");
            reg->country_code = CTRY_UNITED_STATES;
}

3) Previously it was possible to get regulatory information using 'iw reg
get', but now it doesn't work anymore. Is it expected behavior?

[--------------------4.19 ---------------------------------]
# iw reg get
global
country 98: DFS-UNSET
(2400 - 2483 @ 40), (N/A, 20), (N/A)
(5150 - 5250 @ 100), (N/A, 20), (N/A), NO-OUTDOOR
(5250 - 5350 @ 100), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
(5650 - 5730 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
(5730 - 5850 @ 80), (N/A, 20), (N/A), NO-OUTDOOR
(57240 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR

phy#0
country US: DFS-FCC
(2400 - 2483 @ 40), (N/A, 30), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
(5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
(5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
(5730 - 5850 @ 80), (N/A, 30), (N/A)
(57240 - 71000 @ 2160), (N/A, 40), (N/A)

phy#1
country US: DFS-FCC
(2400 - 2483 @ 40), (N/A, 30), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
(5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
(5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
(5730 - 5850 @ 80), (N/A, 30), (N/A)
(57240 - 71000 @ 2160), (N/A, 40), (N/A)


[--------------------- 5.10 --------------------------------]
#iw reg get
global
country RU: DFS-UNSET
(2400 - 2483 @ 40), (N/A, 20), (N/A)
(5150 - 5350 @ 160), (N/A, 20), (N/A), NO-OUTDOOR
(5650 - 5850 @ 160), (N/A, 20), (N/A), NO-OUTDOOR
(57000 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR

[-----------------------------------------------------------]

4) As many users are affected by this problem and maintainers don't really
want to revert the problematic patch, is there any other solution to make
AP work again using a clean mainline kernel? Firmware upgrade or any other
solution? What should we do with non-working hardware now?

1. https://wireless.wiki.kernel.org/en/users/drivers/ath#the_0x0_regulatory_domain

P.S. sorry, I've resent the message using other MTA, because it wasn't delivered to MLs.

-- 
Best regards,
Andrey Skvortsov

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
