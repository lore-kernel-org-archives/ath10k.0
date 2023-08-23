Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68479EE4993
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSg/qGaM9Uuye/rzrMce5tPQZgBAlPTKEz1pYUff+4o=; b=iPdBWfRWYkqiMb
	w18z9CkouXf2lLNtOwDsvx4Ov+O7DLpaKj10UXRS4AgV8wkfA0fEBaFE8O8ZV/xtdCU4bmSMBAWB9
	1Rb7ENngI0B4wgWiNPwdO4tz6pHFtugCCsYjiruGKDOCWxqdfAeW6Qpbtks/oRa/5KKkykWg7jKPn
	Xja+xvDMcRDiVUnA5Lrk9EcRsnKM1vH9VM5xoXZ5SqR61u55qyHLed267hrbW+JqBjsRgM/uI66IM
	RLmmldrlTU/fXpTIJ/x+XP54ENEoHIwwgAF0S6XY4k9Utsd2e/HWfgw+q+2NBBVMJCZnWW6luKwzl
	IAtGTqGrajl8k6lzAViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkrW-0008zA-0f;
	Wed, 23 Aug 2023 10:13:18 +0000
Received: from mailczh03.softline.com ([5.43.230.125])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkrR-0008xm-1G
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 10:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=softline.com;
	s=relay; t=1692785582;
	bh=ho5GwbroPrqdyAO5X5qAzdsCtznJL8BYTYk6DLlts2k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=TwsS13qUU9otzSgJvjCs9MyQ5/ZNEdS5k5D9AprS5dR7fkxEfOMfPQHizjOteUHa/
	 1qKPI1uWrKqWvlN443F/F1wp1ODB0yX2OjDAyvZ8rQPAMjvsxDwT0Wip0Ms68GD2lq
	 3Vfb/t1Hq8EOUOn4Hx1/+puZCPHK97riwLuIr/3NdIP1uRYFjNsE/WTFhMJVLZLudH
	 Bm4SoZn9kfiZPchsPxCaGQLUWtkRkk7eroGvTIam9/dMjFph21r2IT7zXfywvnTbdO
	 JJodgg6Y28MraATGEBfahagVTaZnKCkAtmFBI2/8DJH75g/jhgjoYGThF2z+s4icgw
	 O+rLm5yPh+UTw==
X-AuditID: 0a02150b-b29a1700000026cc-28-64e5dbaecb73
From: "Antipov, Dmitriy" <Dmitriy.Antipov@softline.com>
To: "khoroshilov@ispras.ru" <khoroshilov@ispras.ru>, "dmantipov@yandex.ru"
	<dmantipov@yandex.ru>, "quic_jjohnson@quicinc.com"
	<quic_jjohnson@quicinc.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org"
	<ath10k@lists.infradead.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: Re: [lvc-project] [PATCH] [v2] wifi: ath10k: cleanup CE
 initialization
Thread-Topic: [lvc-project] [PATCH] [v2] wifi: ath10k: cleanup CE
 initialization
Thread-Index: AQHZ1ac/rdoMqZkRDE2ght1O8khBXK/3dGaAgAACzIA=
Date: Wed, 23 Aug 2023 10:13:01 +0000
Message-ID: <0eed7a68c03555cc815959b9fa32b37657f8aeda.camel@softline.com>
References: <20230823095008.50515-1-dmantipov@yandex.ru>
	 <fb14be76-c3af-8ede-38aa-8b88f3cea7b7@ispras.ru>
In-Reply-To: <fb14be76-c3af-8ede-38aa-8b88f3cea7b7@ispras.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-ID: <A1B4236430DD94448C63B917F4606D6D@softline.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_031314_164976_07967E97 
X-CRM114-Status: UNSURE (   6.56  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2023-08-23 at 13:03 +0300, Alexey Khoroshilov wrote:

> > v2: adjust to match series
> 
> Do mean that nothing has been changed in the patch regarding the
> previous version?

Usually it is, including the cases where some patch of the series
is changed so the following ones are applied with offsets and thus
better to be regenerated.

And should say sorry for an inconsistent title of the first one.

Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
