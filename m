Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A76606A31F
	for <ath10k@archiver.kernel.org>; Sun, 15 Nov 2026 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mmCXmsT5;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=II6YJ4R9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:In-Reply-To:References:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PoYGPxB2i0uKWFraLX5C0mUL7s/KPNhZ0wsY+qncz/4=; b=mmCXmsT55/eIke
	oL3VcajfAxNZIFEFDV+PtSSkD/4yHZnI8P96+lqrELDXl6r1/VRgOIt1E9GIgHONjVs3fkuQoVPYL
	hWFDrerXfCLJQCM8iZDgZMXRK/0ya2NTLYT2zcxxZdz8qu0kKKP71Gdk8uiV/5LwOLpibmYjaEl+p
	eB5K6xR0+X2r4RdMxkbwntwIJpK28N0b9BHGWa28CAzxIZsKSHlW4g1OMU3J4WXJYtZ48pqJ94JBX
	9JXI+5Y3lp8vCbf74WfBWdUYJg9AXljL7PnuWHiqllL/1G70OKyXwMZid0QC7UrcaeLS2qYLWao9A
	mxrzeXQdFUlVX7+UJ1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYey-0000000HTOq-2fme;
	Sun, 15 Nov 2026 11:44:36 +0000
Received: from mxe-1-ab7.seznam.cz ([2a02:598:128:8a00::1000:ab7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYev-0000000HTLu-0zQW
	for ath10k@lists.infradead.org;
	Sun, 15 Nov 2026 11:44:35 +0000
Received: from email.seznam.cz
	by smtpc-mxe-5988798c85-lmdnl
	(smtpc-mxe-5988798c85-lmdnl [2a02:598:128:8a00::1000:ab7])
	id 29bef5e7d74a474d29307bff;
	Sun, 15 Nov 2026 12:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794743034; bh=PoYGPxB2i0uKWFraLX5C0mUL7s/KPNhZ0wsY+qncz/4=;
	h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=II6YJ4R9ZokmVQ1tRWD2X0i2k5GpluL17iiE92nMZHm35/4amQBFrZoXFUIHCtqah
	 hdJCukyZjtTNr76GW/CJTgr9sBsIJKJaTUTl9RL55VIoeghgKAGuuVvHJHFNSrEChZ
	 yKFa2zFySWE973WDrVkTv3z4JI+86bW1gzb3QSCyNqe077GUFMqwksMUDjOKFCoNxp
	 oir8/RKqC/R5vqtwvDtt+x3PR8XC9Mg8K8RW0kA2myVariLgnm1+MrlpANdkLVjI6r
	 1x5QNRLL3r+RHtwkYEXukCM4JNry5ifDCjtdO34KzQDDlJbh2F1IlzLQB6d+drWjsd
	 OoTRsMu++EjLg==
Received: from 184-143.ktuo.cz (184-143.ktuo.cz [82.144.143.184])
	by email.seznam.cz (szn-email-ebox-5.1.30) with HTTP;
	Sun, 15 Nov 2026 12:43:44 +0100 (CET)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "David Heidelberg" <david@ixit.cz>
Cc: <linux-wireless@vger.kernel.org>,
	<ath10k@lists.infradead.org>,
	"phone-devel" <phone-devel@vger.kernel.org>,
	"Felix Kaechele" <felix@kaechele.ca>,
	<jjohnson@kernel.org>
Subject: =?utf-8?q?Re=3A_=5BPATCH_ath-next_1/6=5D_wifi=3A_ath10k=3A_usb=3A?=
	=?utf-8?q?_fix_group_key_installation?=
Date: Sun, 15 Nov 2026 12:43:44 +0100 (CET)
Message-Id: <5Nd.ZqDG.68CtbqKyNmY.1g{Phm@seznam.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
	<20261114090737.64348-2-tomaspaukrt@email.cz>
	<7e36cb20-7752-4778-b068-56d41819f670@kaechele.ca>
	<dfae62c8-6fd0-40da-bc4c-65d4d6594cd0@ixit.cz>
In-Reply-To: <dfae62c8-6fd0-40da-bc4c-65d4d6594cd0@ixit.cz>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (szn-mime-2.2.19)
X-Mailer: szn-email-ebox-5.1.30
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_034434_016544_C7E1D4C4 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Hello.
>
> I'm pretty sure it's not related to the USB bus, but related to the devi=
ce firmware.
>
> Check what firmware you use, add the `.no_pairwise_key_del_ind =3D true`=
 and 
> report if that solves your issue, I'm happy to send v2 with your usecase=
 covered.
>
> David
>
> P.S. Felix, thanks for Ccing me here :)

Hi David and Felix,

I tested David's patch with .no_pairwise_key_del_ind =3D true on QCA9377-7=

against my patch, 30 minutes of disconnect/reconnect cycles each.

You are right that the firmware sends no HTT security indication for
the pairwise key removal, and David's patch fixes that part here too.

But QCA9377-7 has a second problem: the indication for the group key
installation comes late, from 47 ms up to 4 s. With David's patch 64
of 184 group key installations (35%) still timed out and mac80211
deauthenticated.

WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID arrives within 1 ms for every
installation and removal. Completing install_key_done on it gave no
timeout in 211 connections.

So David's patch alone does not fix QCA9377-7. I agree the issue is
not USB specific. Without the bus check, the wait would be completed
on the WMI event for all WMI-TLV targets. Could you check if my patch
without the bus check also works on WCN3990 and QCA9379 SDIO?

Thanks

Tomas

