Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8D7C433DB
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 08:24:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A76C64EDF
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 08:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A76C64EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c1RMpk7HQC9rbemQv943WvI+1HyFVOQl42oDzOypvtM=; b=KXDm/7Mbb3rY/rPrdWO43WJjk
	tplAlBXgPJouccrPI6hVbH6AoebbZ6w09/jz/FNejnxltfjnpi4bYs1OahgAakmzaUW4lzhOQ695Y
	wJ09F858MdSilZ+i8/rNjiYYAFwJUxCd8HPM+NFf4OuTiJn7l0/Kjtus5O1/kBilrdJ/0BNV+uqdm
	hktYqMhnH+OcAqvWRi+3q0c8Gq110uF7ncss8kN1LGyh/ecUOTc9KMw8NPj1qDULtmD70F4l8Fgwu
	/+GEGm/7+NueETf0ZRB4Z/jvrDbbAyuwcf7LZMyt9zZ9APr1Exi6WZRdP39gDNVPFZOsf8VHh7HeR
	m39LXj4yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qyK-0003lg-OB; Tue, 02 Feb 2021 08:23:40 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qyH-0003l4-Jx
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 08:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1612254214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J0AqwiWPnVk7hZE1P/3mqQ0zgIQV49FCwpP7h7xy2i8=;
 b=ag8iJh1z2o9lpxtg+bce1bxbV0tWa76KLVL9RpPW2BnJMCeN05KM/29kDewta/K1aMsLJ/
 rTYxgNYkBf84PIhU9s1Ie42dgbOHSJEpdF3vJSWhithiQKMx3j4sE2LbzuYJlli9YNqBFP
 f9ypE9pEslgpjhqxvTf+ecIhLVWe60I=
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>,
 Ben Greear <greearb@candelatech.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Tue, 02 Feb 2021 09:23:31 +0100
Message-ID: <6253766.kEHZKgWlQx@ripper>
In-Reply-To: <7759ef6a-2853-5c13-12d9-5cc966b10833@dd-wrt.com>
References: <268706864.fOQeQAt3TZ@ripper>
 <7759ef6a-2853-5c13-12d9-5cc966b10833@dd-wrt.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_032338_066744_4AC3DD00 
X-CRM114-Status: GOOD (  10.42  )
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
Content-Type: multipart/mixed; boundary="===============7764794700637125347=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============7764794700637125347==
Content-Type: multipart/signed; boundary="nextPart3147514.VK3SfaGtxC"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3147514.VK3SfaGtxC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Ben Greear <greearb@candelatech.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Tue, 02 Feb 2021 09:23:31 +0100
Message-ID: <6253766.kEHZKgWlQx@ripper>
In-Reply-To: <7759ef6a-2853-5c13-12d9-5cc966b10833@dd-wrt.com>
References: <268706864.fOQeQAt3TZ@ripper> <7759ef6a-2853-5c13-12d9-5cc966b10833@dd-wrt.com>

On Tuesday, 2 February 2021 08:04:56 CET Sebastian Gottschall wrote:
> the standard ath10k firmware f=FCr qca988x chipsets does filter vlans.

Just to be sure that we are talking about the same thing: I am (or actually=
=20
hostapd is) using NL80211_IFTYPE_AP_VLAN here - not 802.1Q.

> the only option for you is using the CT firmware by candelatech, which=20
> does not suffer from this issue.

Thanks for the interesting hint - but there is a twist :)

I've initially tried ath10k-ct with the candelatech firmware.=20
5.4.93+2021-01-11-9fe1df7d-1 with 10.4b-ct-4019-fW-13-5ae337bb1 to be more=
=20
precise. And later also switched to the ath10k backport from 5.8.18(-1-5).
Sorry for forgetting to mention such details in the first mail.

And I've just noticed that I was always testing with the ath10k-ct firmware=
=20
(which is the default in OpenWrt but never with the official one from Kalle=
's=20
ath10k-firmware tree. So I've just switched to QCA4019 hw1.0 10.4-3.6-00140=
=20
from the official tree and the problem went away.=20

=46or Ben Greear's firmware, the only workaround which I found until now wa=
s to=20
set NL80211_ATTR_MULTICAST_TO_UNICAST_ENABLED to 1 to force mac80211 to sen=
d=20
multicast as unicast.

Kind regards,
	Sven
--nextPart3147514.VK3SfaGtxC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmAZDAMACgkQXYcKB8Em
e0aRrA/+Ibvy4tJKHnmAiiagXely+eOdP99y4kYVWnzQI9wV5I0TM5iSLIHdBPsK
vY418adVvuiGYUQ6Iplm3PnoALwHKh9xj3aj+vTEmLJjxddVFcupIw6TKaiXZnVr
pN3fODPjt5WubGeZGUjGZvwA2fqkw/9TK+zKh+bARljfjHaROhPm3jMAw9O1o7kI
r7CW/NaoqHMZQWKn4nYGwuW1uyiaCAkwKpG07wrbhNigSjCPNzNLvbvGDxCaS2j3
jliYsOq50OU1oxErtk3YDjZH3pQBU3L6HAuB2R8Ut2Q+RTZT4yaiSOoaEdHeNsx1
GFs1cqGYaahtbFYZXAqywaLemR0K6tmh0u9LYtbU2FKXR7i3uR7xzqpGUIPvaDFE
58MXWmiAnuYmCPUwhH4i+7nTNeeWA4JLwjoorMZwupYvxpUGbZS39HPNWaRfA5MB
b+Ml0pNGEvC+zNz1NoBxfrFYCiANCVWWHTlNKw2bx8uwHfXZ9LxbQlpCEXxyNrVO
O8M7kWevZUbzs0jMHuRYhO7MHRTXP74ZWAOR/EWl4o1lwfGKP0IlEcSwtSEPoqBN
k4tfi3oycVbut5zeuiEk0M2RoOlqBR4/fR6ju5bLVYrfx3unNY3OibpDHp9cluKj
Z9Ta6e9+jy5UzxzF+v+074IfxCQrYDgf/3mt+1fAhLui44MNhKA=
=gPQM
-----END PGP SIGNATURE-----

--nextPart3147514.VK3SfaGtxC--





--===============7764794700637125347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7764794700637125347==--




