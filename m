Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097CFC433F5
	for <ath10k@archiver.kernel.org>; Sat, 26 Feb 2022 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uowzbGX+zvY+fIJfyGPPxeCJ9OpUPWr4O27bkdtgiQ8=; b=RaX4emY49dB80ZTTCpFVEoxAZ0
	7l4z7Maw3KsuBLpO2JxQobHyhXoDg68ZLPz2q+E0/2yosEGZ33HYgtHW2beEYpg5mpMaGCxQfgWUR
	L6H+hkbmofk1jHPjcf+jD1xCR5T82l6IYwiFgsWpvKeKjzVMScdWcjqOidYa22bRB+X7vq0UbTrme
	slhYpPXimIv6KZyLDtShCsJfrG6FBlZPOm69097ccObP6nsnneyHSLVzh/Nysc5B6hvtpjl5PaKMG
	6ugbAck8cFK8c3DrF1Cxe21BPGOJf0cLZSrYiQ9ci7ey/0uAsxaSFQA1ns7SQQ0vhjr+KZKm3Get6
	4nAXW3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nO0Pc-008Gwa-3C; Sat, 26 Feb 2022 16:59:16 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nO0PZ-008GwB-05
 for ath10k@lists.infradead.org; Sat, 26 Feb 2022 16:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1645894751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aPq4Bg1djp0vQcUxtOmioMxeqdr22zUIpHx6asNYff0=;
 b=GSRTz4zoqis2QjwP0xdpm17Y9Qe3euT+zeQ6lD1jeSogvzlYkS+b2Xgl6gbbPUPdwgiXef
 eGM6x7tRLyM4yV56cHg38U7Fq0kb9PwGNZvZxsUu5kIN9FxsEthU2/p0Zul32cnfOZd9I6
 dru1nqEQUxwJFIhDUkl26bThXdyDYWA=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, Josh Boyer <jwboyer@kernel.org>,
 ath10k@lists.infradead.org
Cc: Linux Firmware <linux-firmware@kernel.org>, ath10k@lists.infradead.org,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Kalle Valo <kvalo@qca.qualcomm.com>, Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v2 1/5] ath10k: QCA4019 hw1.0: update board-2.bin
Date: Sat, 26 Feb 2022 17:59:09 +0100
Message-ID: <28878626.nLntd5uNke@ripper>
In-Reply-To: <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com>
 <87sfs5squm.fsf@kernel.org> <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_085913_254636_6792267E 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Type: multipart/mixed; boundary="===============1520889888143199049=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============1520889888143199049==
Content-Type: multipart/signed; boundary="nextPart3589107.JqdcrgG4eF"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3589107.JqdcrgG4eF
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, Josh Boyer <jwboyer@kernel.org>, ath10k@lists.infradead.org
Cc: Linux Firmware <linux-firmware@kernel.org>, ath10k@lists.infradead.org, Linux Wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v2 1/5] ath10k: QCA4019 hw1.0: update board-2.bin
Date: Sat, 26 Feb 2022 17:59:09 +0100
Message-ID: <28878626.nLntd5uNke@ripper>
In-Reply-To: <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com> <87sfs5squm.fsf@kernel.org> <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>

On Saturday, 26 February 2022 17:39:23 CET Christian Lamparter wrote:
> The current situation is: OpenWrt has those board files (as ~40 separate
> files) all lined up in:
> <https://github.com/openwrt/openwrt/tree/master/package/firmware/ipq-wifi>
> Once the board-2.bin in linux-firmware.git is updated and a new release is
> made, those files can simply be deleted.)

Minor remark about the OpenWrt part: Keep in mind that some of these files are 
newer than the ones in Kalle's repository because the " Update ... BDFs" mails 
were not yet processed. I haven't checked all of them but it seems to be at 
least the case for the PA1200 BDFs. [1]

Kind regards,
	Sven

[1] https://lore.kernel.org/all/2931430.FNKZsP7sFK@sven-l14/
--nextPart3589107.JqdcrgG4eF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmIaXF0ACgkQXYcKB8Em
e0ZG2xAAyvrGe6w9svqIbMmTDYl2J1+a6ba0e6ETC45G4xWjZfQRCrTLoXzlhlmu
9jcCnYWVkb1fNs/Zf3+FZFtyZnI+76A2bn2QnvIhTxYI05zYcnvQ4c2qeJFRQ+fl
a/osHJrBs2egvD2LE3jH/7Eb3FoeyJzfd/3UU7zbl3YOU+KrnnkjHGIuBuPMN9AS
2Tp9QbI4UPkLURRVScdMlXaeqk4HsY5zclDo+YF1bdV/MOVHk1bCyMwbzuH9YZq3
mZPnunxzORf4/J6/BaX9NLmPPWC2aZ25vOBVu+TBBxCeMcLwPEo2KQWOWCo6rOoJ
eCwbmDfpTQwNSH65pBk1JtIx032JHr6Qmiy1Rpr6ub+gglAmpE8gRB6o+oz0hrzL
nlvgUI3uNi8RpIiQDjXJXAZaFfSym/d1ZWGz9AqCzfQQxVRYK5K2i5Vr7CAQ70hQ
b2wEGyqiOPZpztRgOeswaJZQEjp6Ik6fUBNwzXYwL5DLkj+XMir28eex0YP4JxPJ
TvRkAyxmeWEwrgKMIAb9biyugOWqnN6Agzef53LIlMzeubxuvI1138sfy7ddba93
yKvkI/S+7eJM3wH0jVHIHoliKzmIReqE953Nli8vT8VJyaKgl2qjwld/B0KiS/tU
foAUAIjJDvIoBwhY8fbA74pLDjrkQ74fy92XhjG48xqBYP2wVns=
=VsSo
-----END PGP SIGNATURE-----

--nextPart3589107.JqdcrgG4eF--





--===============1520889888143199049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1520889888143199049==--




