Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F88BC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 09:58:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 449F96108E
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 09:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 449F96108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqqV+BONFGwLzZOwFZcWkaAooluu/iQReL0l6/wVc2A=; b=B5TeF8oZrNmDTSpiU9cTLFvPpm
	M1ixKfMzIRHkQwJ0p+ieoIlCfJESClMmhs1aweBQq4fEilj3orBj+UYskgf5YaKlrTGFoynLqqP7u
	Sfwat/69tS3KkBTDjfBk20qoOmoHFs7ka7wxLndEc2K6anW7z299FrLz39r3MBkOXnigiVsZ7TZup
	tSvqwwv9C1M1jA3zJjnEjlJtU7u+IedY1foFQE1jYYMX8ihhCPdsTypLfgjlZgxrStMt0wLNCZLdG
	8GlaSSN63J0EO8SLrBmHrm74Y2kVFzyPkgjz9prQYB7WKwuzyTfFqApPlR+O+wTJY2LZlWOd8VqpB
	Jm3z/45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGIKM-0050z5-1F; Wed, 18 Aug 2021 09:57:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGIKG-0050x3-5v
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 09:57:40 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1mGIJV-0003Ak-CF; Wed, 18 Aug 2021 11:56:49 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a02:810a:8940:aa0:ed04:8488:5061:54d4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 08E5E669A16;
 Wed, 18 Aug 2021 09:56:36 +0000 (UTC)
Date: Wed, 18 Aug 2021 11:56:35 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Rohit Maheshwari <rohitm@chelsio.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Luca Coelho <luciano.coelho@intel.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Johannes Berg <johannes.berg@intel.com>,
 Mordechay Goodstein <mordechay.goodstein@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-crypto@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-can@vger.kernel.org,
 bpf@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/5] treewide: Replace open-coded flex arrays in unions
Message-ID: <20210818095635.tm42ctkm6aydjr6g@pengutronix.de>
References: <20210818081118.1667663-1-keescook@chromium.org>
 <20210818081118.1667663-3-keescook@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210818081118.1667663-3-keescook@chromium.org>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_025736_287301_AFC5FCB3 
X-CRM114-Status: GOOD (  14.97  )
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
Content-Type: multipart/mixed; boundary="===============7154049875388448047=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


--===============7154049875388448047==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4irlmrxob7c5btq"
Content-Disposition: inline


--h4irlmrxob7c5btq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18.08.2021 01:11:15, Kees Cook wrote:
> diff --git a/drivers/net/can/usb/etas_es58x/es581_4.h b/drivers/net/can/u=
sb/etas_es58x/es581_4.h
> index 4bc60a6df697..8657145dc2a9 100644
> --- a/drivers/net/can/usb/etas_es58x/es581_4.h
> +++ b/drivers/net/can/usb/etas_es58x/es581_4.h
> @@ -192,7 +192,7 @@ struct es581_4_urb_cmd {
>  		struct es581_4_rx_cmd_ret rx_cmd_ret;
>  		__le64 timestamp;
>  		u8 rx_cmd_ret_u8;
> -		u8 raw_msg[0];
> +		flex_array(u8 raw_msg);
>  	} __packed;
> =20
>  	__le16 reserved_for_crc16_do_not_use;
> diff --git a/drivers/net/can/usb/etas_es58x/es58x_fd.h b/drivers/net/can/=
usb/etas_es58x/es58x_fd.h
> index ee18a87e40c0..3053e0958132 100644
> --- a/drivers/net/can/usb/etas_es58x/es58x_fd.h
> +++ b/drivers/net/can/usb/etas_es58x/es58x_fd.h
> @@ -228,7 +228,7 @@ struct es58x_fd_urb_cmd {
>  		struct es58x_fd_tx_ack_msg tx_ack_msg;
>  		__le64 timestamp;
>  		__le32 rx_cmd_ret_le32;
> -		u8 raw_msg[0];
> +		flex_array(u8 raw_msg[]);
>  	} __packed;

This doesn't look consistent, what's preferred?

u8 raw_msg[0];  -> flex_array(u8 raw_msg);
 - or-
                -> flex_array(u8 raw_msg[]);

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--h4irlmrxob7c5btq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmEc2VEACgkQqclaivrt
76kXUQf/cn+R4mRgon+iBBoNOjSG6Xpa5C1kWsnyfyJAQq9geHgAtcyoTTot+9QH
bjo6l3vIxXSY85B6NbV+TQFuedtSpFYkRQJgWzMG/eIuwHZ7Buuf8uK5C5MESqwm
PJDEl2lZpKA7MtM2gMtvmhElNsv1Nr4FqMEOmCHs5LeQQ8ddsbJ0Ab7X7ffQ4SRu
UgMoqqUUFxReCmF+pmoxDC5uHBbovnw/hYPulDH6AN7jj8ml9/lPLuJKfBnyYGI5
jYTHTlc4+VnN6a7NJ7V9DhTCncLaFjXVFFxoQBWYgpetIV/eWwu2WwrrYhyrvEK0
cORmz7LG97TWWd3NSNNy9j7XKs0y+Q==
=UYoj
-----END PGP SIGNATURE-----

--h4irlmrxob7c5btq--


--===============7154049875388448047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7154049875388448047==--

