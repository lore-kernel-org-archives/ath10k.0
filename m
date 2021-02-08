Return-Path: <SRS0=uzqH=HK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C39CC433DB
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 20:33:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005B164DE1
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 20:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005B164DE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e1mK+UatoPwebNezdSu19w3auzMoZ/ZOwcSb99AwrSc=; b=mVOk1muA0+qyFmBYup2Zqjxs+
	bo1fOu/gISN1mchRnmvlWMYIc1jeq18SICkRX0sHgZSIUw9Shl600nlD/QtzU6degXTfHvOa6z7cr
	DC5S/j+HarCoUSEQ7RijuWtFkbmtvzQGNkBdHWw1sCm+b/y26p0zoNflAiKu1RBM+SJGmbpBU6unG
	ihVmFtcMhUPyCi9rLlhB6Lgv/7rRuk8LVl7fVXrev8SlHly7NqI1li2OOyHk8IX08PY+fEf6qJvd6
	ExYCxSn6CcbGS7fec9HLlslnsODtvb7LN/05nV8v9tHeNJ0KiAUBHb3vCqBRoe0JyXClo4Ahcx7lk
	YzrDrozHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9DDK-0004HF-Eb; Mon, 08 Feb 2021 20:32:54 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9DDH-0004GQ-10
 for ath10k@lists.infradead.org; Mon, 08 Feb 2021 20:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1612816367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZeX+1nRVkTtatkoqoliQSHp6GweixUw102p4M2aRY5w=;
 b=2W+rj/GNjs2DXMYjTI6cRNN+xtm7fR0aHbFTOjh+dsFH37EzXs7u0+XCsCSEQPYQDLmRdD
 yhn5U86iB1ajHj3kJw/YBG8QodJ4Piusz/4szEs3TqNGUXz0QEX47AL9O+tynM7H1nNgQ/
 NEZw0fMUtHt7N2vFxJdGd8Fu4mTTaM8=
From: Sven Eckelmann <sven@narfation.org>
To: Ben Greear <greearb@candelatech.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Mon, 08 Feb 2021 21:32:44 +0100
Message-ID: <1794774.apFX3RtQK2@ripper>
In-Reply-To: <fe6fa272-30ac-9588-d2a2-c89647beefbb@candelatech.com>
References: <268706864.fOQeQAt3TZ@ripper> <2516016.JH6pyVjoBS@sven-edge>
 <fe6fa272-30ac-9588-d2a2-c89647beefbb@candelatech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_153251_445228_8ED681E9 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: ath10k@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1723620728824417118=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============1723620728824417118==
Content-Type: multipart/signed; boundary="nextPart5052363.WKsIXgSJQm"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5052363.WKsIXgSJQm
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Mon, 08 Feb 2021 21:32:44 +0100
Message-ID: <1794774.apFX3RtQK2@ripper>
In-Reply-To: <fe6fa272-30ac-9588-d2a2-c89647beefbb@candelatech.com>
References: <268706864.fOQeQAt3TZ@ripper> <2516016.JH6pyVjoBS@sven-edge> <fe6fa272-30ac-9588-d2a2-c89647beefbb@candelatech.com>

On Sunday, 7 February 2021 18:42:42 CET Ben Greear wrote:
> Somewhere along the way I fixed up raw transmit in my firmware, so possibly
> only then will vlans really have a chance of working.

The first step was to disable the check which enables AP_VLAN conditional and 
just enable it all the time.

I've started testing with firmware-5-full-community-commit-0317-cf4991294.bin 
but it doesn't provide the raw support + per packet swcrypto. So I've tried to 
switch to firmware-5-full-community-commit-1187-774502ee5.bin but it has 
exactly the same with the raw mode - but at least advertises 
WMI_SERVICE_PER_PACKET_SW_ENCRYPT.

So my first target was to figure out what was the first firmware with 
WMI_SERVICE_PER_PACKET_SW_ENCRYPT. So you would guess that bisect would be 
suitable for this - but no, the first step directly found a crashing version.
I should not complain so much -- just have to skip more and have no extra test
results regarding the mcast support for them. Here is the log until I found the
first one which is supposed to support WMI_SERVICE_PER_PACKET_SW_ENCRYPT:

# has_sw_encrypt:              firmware-5-full-community-commit-1187-774502ee5.bin
# no_sw_encrypt:               firmware-5-full-community-commit-0317-cf4991294.bin
# skip:                        firmware-5-full-community-commit-0775-bb7462f22.bin
# skip:                        firmware-5-full-community-commit-0782-c66b3495b.bin
# no_sw_encrypt:               firmware-5-full-community-commit-0533-4597878a6.bin
# no_sw_encrypt:               firmware-5-full-community-commit-0885-2d9cfe00b.bin
# no_sw_encrypt:               firmware-5-full-community-commit-1045-817be3ee8.bin
# has_sw_encrypt:              firmware-5-full-community-commit-1112-68b46f73e.bin
# no_sw_encrypt:               firmware-5-full-community-commit-1077-44c74a25a.bin
# has_sw_encrypt:              firmware-5-full-community-commit-1093-3c7065550.bin
# no_sw_encrypt:               firmware-5-full-community-commit-1085-c1d37213a.bin
# no_sw_encrypt:               firmware-5-full-community-commit-1089-1fbfebf26.bin
# has_sw_encrypt:              firmware-5-full-community-commit-1091-3aa26dbdd.bin
# no_sw_encrypt:               firmware-5-full-community-commit-1090-7cfbf3e6a.bin
# first has_sw_encrypt commit: firmware-5-full-community-commit-1091-3aa26dbdd.bin

None of the firmware version seem to have working multicast tx.


And here are some (not so random) picked ones (just so nobody can say that I 
didn't check in the other direction):

# no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0425-a422b044f.bin
# no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0371-157623ac0.bin
# no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0344-8b9e4442a.bin
# no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0331-5259fada9.bin
# no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0324-e6723f0f6.bin
# no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0321-814d9dc06.bin
# no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0319-ef95e743e.bin
# no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0318-51cd44bdd.bin

I didn't do a complete sweep of the builds but at the moment it looks a 
little bit like there might not be a single one which supports multicast over 
this setup. If you think there is a specific firmware version which I should
test then just say which version.

So I've decided to try the ath10k firmware blobs from Kalle's repository to 
provide at least something useful for someone who also has this problem
and searches for a compatible version:

firmware blob                                 | works | PER_PACKET_SW_ENCRYPT
----------------------------------------------+-------+----------------------
3.2/firmware-5.bin_10.4-3.2-00080             | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00004         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00005         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00007         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00015         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00018         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00023         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00024         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00026         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00028         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00029         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00031         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00033         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00037         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00042         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00044         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00047         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00050         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00051         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00053         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00058         | N     | N
3.2.1/firmware-5.bin_10.4-3.2.1-00060         | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00009     | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00017     | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00019     | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00021     | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00022     | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00025     | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00028     | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00031     | N     | N
3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00032     | N     | N
3.4/firmware-5.bin_10.4-3.4-00074             | N     | N
3.4/firmware-5.bin_10.4-3.4-00082             | N     | N
3.4/firmware-5.bin_10.4-3.4-00104             | N     | N
3.5.3/firmware-5.bin_10.4-3.5.3-00053         | N     | N
3.5.3/firmware-5.bin_10.4-3.5.3-00057         | Y     | Y
3.5.3/firmware-5.bin_10.4-3.5.3-00078         | Y     | Y
3.6/firmware-5.bin_10.4-3.6-00140             | Y     | Y

Kind regards,
	Sven

--nextPart5052363.WKsIXgSJQm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmAhn+wACgkQXYcKB8Em
e0aEkw//U3cKaMrgNRcspygQtjjUdsQ3nVAWWs6LVwgyikTjeLutIaU44krQ+4xk
xKIhwPTqwA7fKY7pjArIJ4eBbImIkZRhy1zL8mS0S8VFzsTj/MAfBEgDF9Gx1kvK
LnPxubXaytKni865ckv5IghoCArXZ/B1CY5GNBSOywOocF0p3DABxWP3dY+4wii9
GY2gxo+o8Ctbafnmyli8WO0m3tKVsoK/qM2rwl/ug3kqLSoGkAyqGvGzLDg90nFe
HUoicElBBIYCeyxLL+Uf6nISXS8GOs7aZHgpThKyfm98nhN2pufzH3TLsJUIjbNx
ZBN8uygzMyIF7K7ZQ4YlZcSVKms15rR3xWx78BhC7Wcb9mcXa0OxpzAbPcCxu6p3
ZHp5t597+orrVLxOoBJJP7dAIqAebnz82nicp7n2VwBsRS4q7boJ/JMNoxPC7Eie
BKGrtX/5/TB7dx8ip5L44ReIJlcPqyAzz0r92DXd8Vbs4vHdnMKwsQJE5MhIIfJg
pZgGZmzeSVwRMh/+153EBZJbdWE5WkldXQoqjkSqq7PEf7XouzRjCAkDATpY+jLl
xHbeixCi8llmnn1X6Mic8ErdwlHgVyzY83X9GCddzgl7tQnzL1+yRMoeBE8HZTkq
dEUlFBU6fR/nB6sjZlX1CARiRRkZx/dfIvRYeeER9Y131qQyXrU=
=x5B3
-----END PGP SIGNATURE-----

--nextPart5052363.WKsIXgSJQm--





--===============1723620728824417118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1723620728824417118==--




