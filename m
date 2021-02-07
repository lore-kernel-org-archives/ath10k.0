Return-Path: <SRS0=F+kR=HJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB2C433E0
	for <ath10k@archiver.kernel.org>; Sun,  7 Feb 2021 17:13:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F1E64DDC
	for <ath10k@archiver.kernel.org>; Sun,  7 Feb 2021 17:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89F1E64DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yHTtFqq2L4h2U5l7D0hzQld5UGIJhOmmu6ejZ0NdR4g=; b=LMsNPlkquls4/EnAg03mKkDtU
	DKsJirvDueuCYSBvfHNd+cLUJhUbJIyXhP/DObYGAmvjZPSG8+lsJNPWKTk/Pe558ymwIacbN6nMH
	YsfLaK6XFpVTsK4ZQs5Z0+8SoZW5JAIyUa/j9NyIhUwDJTb3dF+4/l29p2ng+o4TaVkwUbixvV0mH
	auFY+Xb/SbIpbH5WOVWhUebJUanTCKPfZB5+0mXRQKTJ9d+O2AIgPN1gFmrhUxx6keA8hj+coAmcu
	cwCQ3iU0Tp0Pjs7/+nqALeN9btg4gIzMhiIsm0EmpOyFjyugtfLflcKMN7+vASa0tiyWpTPBPgu1U
	psVNItJnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8ncj-0002NJ-Iq; Sun, 07 Feb 2021 17:13:25 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8nch-0002Mz-4b
 for ath10k@lists.infradead.org; Sun, 07 Feb 2021 17:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1612717999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CzkymDKrqn6DjeONU6A34KgBz8bQkPJ427kQB8Fe0/Q=;
 b=XmKrsAZdnyA/cHCW+Adpzv+sAYggRaq9BgD+tAfE5qKNTzdvQWwiFr1ziWAJCIh4Q071Fx
 eO/revopUCQdiWcTEzt0osyFy31H+mE9h/YzXt7mlcHCJq9Kkd3RDWk4mR+Uzy3vQ2AJ03
 3h5BRm6I5PgNM12yu8PXZHg2Ug76Oo4=
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Sun, 07 Feb 2021 18:13:16 +0100
Message-ID: <2516016.JH6pyVjoBS@sven-edge>
In-Reply-To: <1d04209b-f7dd-41e8-b290-cc82ec43186a@candelatech.com>
References: <268706864.fOQeQAt3TZ@ripper> <3442403.JAWNrhsyWg@ripper>
 <1d04209b-f7dd-41e8-b290-cc82ec43186a@candelatech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_121323_431942_980D2D32 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Content-Type: multipart/mixed; boundary="===============1685421723788119274=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============1685421723788119274==
Content-Type: multipart/signed; boundary="nextPart42447848.HHpJprNhdI"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart42447848.HHpJprNhdI
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Sun, 07 Feb 2021 18:13:16 +0100
Message-ID: <2516016.JH6pyVjoBS@sven-edge>
In-Reply-To: <1d04209b-f7dd-41e8-b290-cc82ec43186a@candelatech.com>
References: <268706864.fOQeQAt3TZ@ripper> <3442403.JAWNrhsyWg@ripper> <1d04209b-f7dd-41e8-b290-cc82ec43186a@candelatech.com>

On Sunday, 7 February 2021 17:50:11 CET Ben Greear wrote:
> Here are the images:
> 
> http://www.candelatech.com/downloads/ath10k-4019-10-4b/bisect/

Thanks, will try to have look at them tomorrow evening. Can you confirm which 
QCA ath10k version was used as the base for this one? I've read somewhere on 
your page 10.4.3.3-25 - which doesn't seem to be in Kalles' repository. And my 
original plan was to test the relevant QCA firmware first and check if the 
problem might already be in the base version which you've used for your 
builds. But maybe I will just start with the oldest one in you tree and check 
if the problem is also there and based on the result decide how to continue.

Kind regards,
	Sven

--nextPart42447848.HHpJprNhdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmAgH6wACgkQXYcKB8Em
e0aNsw/+MugmzaIBsOWIoraVsZcKfBc3Nwq8ZBR1Tl5XY0lSbrB6RQFJVSvK77cV
XzGGADjzYX6wfxzwrSzSbT+kzwbW8JJ3KLvZQne/D2sFvs5S3NnSVN+IOjtdhi/L
GIIKrqFi19JWZddqXtq5bc9KZByQolv8Rf/w0A2EgP4QaNdPDZXOuAJj+EgSJZfB
P2nclOXwp4blpJijyMv21e9sS6OQAMiULktmsBnptl5k1z/m9mOFe7FWnM4M8oIt
mPvyWuTHyBvS0tJ0PM4zoS7qwdzMguCAKZjjt7766NXjUa2DAiken3qwhDwOOP45
oxTtp2ws30y2q4fIKQJzMjT2wspPj6FEgi7I/03PoYIkAzszzJCDmlbAUXGnjQbu
eqZZhaVmI32COho4HFMs4SYILTfkvZnuBZjF/k2KzBZkFCbv+TtGTnwPhCk0JZA8
ecoMgUqMyOmqFPFSsCoUjgioS4cUvdz1fJc2ETA2QfmIwPwQwuQng/CWD6Q+GpgZ
4bpdfxWJHLO+tXGD7PfXAbVdesjgQuN8LshwlM/cq9Gi/N7NtoY5lKJgoZ/JFytQ
vuHN+mfzUuxh2oOwQ3kAKC58VGKtWbW4g+iPWUZFrokrNI93n1FUtSMbaZM4ZZVm
udYhkdjAZn8kHOO7WHhGYJwEQ0cMf/Yx+fHpeaLvurFLP3oJ5/A=
=ZVS0
-----END PGP SIGNATURE-----

--nextPart42447848.HHpJprNhdI--





--===============1685421723788119274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1685421723788119274==--




