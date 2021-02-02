Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AEEC433E0
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 13:58:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9CE464F61
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 13:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9CE464F61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JBaLubJF7uCOfgUK4uNzotTCDcuYtz5XeXEpNUC9Qzg=; b=ldhenpnmodpN2oaY+UEtpId85
	oVL5FKaG1oroEnlzQ9rkOSHjfSypwvAW/iELTr+/Sxkn467d80ApH4M1z/jwPl2HP6Y7ajnPdMUVi
	HLjy12Fj1wNZ3g2gQMswm/W7dXbY2Z1XlMOHmzc12yKlqHJnrhKGN+WONkS+ubyb55XvECzfyo6lz
	b26uTZDtMfZPzZKwN+Afv351d1InjQEoaBpy1flXr3ezaNng/NDRJZ+4OO+4zODxKPowrn3M+6Zzj
	1YoN6SXFzBbDJQYu+Llm+MaujQoYLY6zzvbr1L4Hgb4f7YzUL6/q6qznZVGWD2usPOKh4QVcQhlYp
	5TDYGT/Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6wBZ-0005Fm-Cg; Tue, 02 Feb 2021 13:57:41 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6wBW-0005FD-CL
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 13:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1612274254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CGk2mdt691soLYoQ+krHqtVifhe1iQJnHY+vNwNPAY0=;
 b=WwKzcFpXA1Pm1JsSd/trT2cZFrDC3FNdnjBIdU8vRKhZh0EgmfwmnvvJWAitRjIUYphhCn
 B6Xgz5MskJR0P1qbBaQmITzPw+u7IvTgktG+TnH0s+71e+ZYnWlI/8trG13q0NPejQvGdV
 laUMJ4GV+ANKWTX40qcFyqbm+DhBmv0=
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Tue, 02 Feb 2021 14:57:28 +0100
Message-ID: <3442403.JAWNrhsyWg@ripper>
In-Reply-To: <d1f6720d-020f-c5d2-dbff-326ffff95d96@candelatech.com>
References: <268706864.fOQeQAt3TZ@ripper> <2784478.zUthXOmo2V@ripper>
 <d1f6720d-020f-c5d2-dbff-326ffff95d96@candelatech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_085738_571156_00EDFE27 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Ben Greear <greearb@candelatech.com>,
 Sebastian Gottschall <s.gottschall@dd-wrt.com>
Content-Type: multipart/mixed; boundary="===============0924221871902730216=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============0924221871902730216==
Content-Type: multipart/signed; boundary="nextPart5742349.QyWtU6MP4H"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5742349.QyWtU6MP4H
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Ben Greear <greearb@candelatech.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Tue, 02 Feb 2021 14:57:28 +0100
Message-ID: <3442403.JAWNrhsyWg@ripper>
In-Reply-To: <d1f6720d-020f-c5d2-dbff-326ffff95d96@candelatech.com>
References: <268706864.fOQeQAt3TZ@ripper> <2784478.zUthXOmo2V@ripper> <d1f6720d-020f-c5d2-dbff-326ffff95d96@candelatech.com>

On Tuesday, 2 February 2021 14:27:01 CET Ben Greear wrote:
> Sven, I can build you a series of firmware if you have interest in bisecting to see if
> this is a regression?

If it is ok for you then I can go through various firmware builds. But it 
could be that I can only start with the bisect at the end of the week. At 
least today, I will have no time after work.

Kind regards,
	Sven
--nextPart5742349.QyWtU6MP4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmAZWkkACgkQXYcKB8Em
e0a68hAAuPRdnGufn2KSbp8/eG1BFC77sRtUndNRqRwbO6BPtDc0ZYTavkX6y0Ph
Q5kZ4ffCmzQwJTzsuqMTY/07HB821Q98l6WKvDMR5/vXzcLMBfPfF8eEI336ps2Z
7uBUL/VWzcf1bgnac4qtpYwZ/SSUnzhfNK7295kR544fox8c9fGxLnGrhDgxJJwp
a+edElecqo6evLQzElAeQN52cIukkn0pgB3kN2azlC6EdV71PZONRpYdkYXPclG4
Ng/DzMez55mztCpbcHlVJbmOZCm/8OWYVusL9eURu4SkeHc1/hIzg1OzyuoPADgR
olqL9FKQnSTi01KeIbwcJ/g4VAOk9BA/gHSU21JYG98pRcBtT/udUbBiYbOWs+jY
2QlOf/bO4/x4TU3egCyuF0PxHD8aN84K7ZO64uDidUNW8srD+2+F7k+S/nO75KGk
JP95y4BmM4fqMz+356u+KCMAFrQ2kSQad5k48O8KXycB1+Wshegfx+gP9Vpcrdut
FdWKOu08POoZigkwGRocQ6XjU1wOP89ymbY8hvflw+IeAT6ZpCzh3Nj37c26H63Y
Wy0CEVhJPz/c/tZb5TVJ1Fk03AM9I+gVBTuT48zmhfvZDdbCrVDeaxu58bZAXpCZ
tzNyws9cPZmeHCt6CfQiwhh7BY3mD3Yjyl8mGprP+n0vwNkEZDQ=
=a12S
-----END PGP SIGNATURE-----

--nextPart5742349.QyWtU6MP4H--





--===============0924221871902730216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0924221871902730216==--




