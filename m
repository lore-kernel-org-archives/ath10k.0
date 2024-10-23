Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6265ED2E010
	for <ath10k@archiver.kernel.org>; Wed, 23 Oct 2024 05:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NC38qqP7TKURG9n79Pn8DyU7Viyzv6WG83fehDaId38=; b=kuaCd+tBI+sA0potCWwQFgQbYh
	v6wqcLUBgPHzaLO0J5lG667+FFhwZ2hi51+dYjE60+s6DpQiSt22WWDwB9Pj9C0hGgmyZuCrt1HH3
	krdj1awgpuPu+JfOBRQ36X8P4caKuvl2LsdkZoMZYgfdi1y2EZmU5mg1jquXjVPCeXep3opiOOMQV
	iNutLRA7fyswwm0y5mWCo0ndNse62mlPRD4n6ZfgD+wUyo7hBi8H+DzGiETIvRwlgODPgn2icHbX6
	wau41uXIj0Fjj3Sp+tOpQnZXOxAXZSNcObFxho8MD7m6cygbXDjKNI+LWQDlTXlefseCPOfi7O40y
	Fk8ZuKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Tk4-0000000D1Ke-1MoZ;
	Wed, 23 Oct 2024 05:17:08 +0000
Received: from mail.adityaniwas.com ([160.251.233.111] helo=vm-4a4be56b-ae)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3TVC-0000000CzDk-2Rsl
	for ath10k@lists.infradead.org;
	Wed, 23 Oct 2024 05:01:48 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 vm-4a4be56b-ae 543B6FAB67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adityaniwas.com;
	s=default; t=1729658414;
	bh=NC38qqP7TKURG9n79Pn8DyU7Viyzv6WG83fehDaId38=;
	h=From:To:Subject:Date:From;
	b=li73xwEiePOyUNaLpuglVeWabrz29QWFs+5jha6g2JKlnEw0PPUU09/oQPrLBCYMu
	 iyTL3SPtywe5sJ1D98wAEdTT/OUMjZWGo92UPSt8TGxI4bI8f5nTdWjE7dTKSZAC7p
	 oV5qVvFooQfAQt4GRv1kGWqb4LrOCONn+plbFxls=
Received: from ouxpxq.in (unknown [45.77.176.251])
	by vm-4a4be56b-ae (Postfix) with ESMTPA id 543B6FAB67
	for <ath10k@lists.infradead.org>; Wed, 23 Oct 2024 13:40:14 +0900 (JST)
Message-ID: <70861a00ffdb611bfb2c80e4312e06a1@adityaniwas.com>
From: =?utf-8?B?5L2P5L+hU0JJ44ON44OD44OI6YqA6KGM?= <warning@adityaniwas.com>
To: ath10k <ath10k@lists.infradead.org>
Subject: =?utf-8?B?44CQ6YeN6KaB4oGk44CR5Luj6KGo5Y+j5bqn5LiA5pmC4oGk?=
	=?utf-8?B?5Yip55So5YGc5q2i44CB5YaN77iJ6ZaL44Gu44GK5omL57aa44GN77iJ?=
	=?utf-8?B?44Gu6Kit5a6a44GX44Gm44GP44Gg44GV44GE4oGh44CCKO+4ieS9jw==?=
	=?utf-8?B?5L+hU0JJ44ON44OD44OI6YqA6KGM4oGhKQ==?=
Date: Wed, 23 Oct 2024 13:40:12 +0900
X-Priority: 3
X-Mailer: Mkgpwdii Bagqt 2.8
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_001_NextPart362904415833_=----"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_220146_780350_B023F644 
X-CRM114-Status: UNSURE (   0.73  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.

------=_001_NextPart362904415833_=----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=E3=81=84=E3=81=A4=E3=82=82=E4=BD=8F=E4=BF=A1SBI=EF=B8=89=E3=83=8D=E3=83=83=
=E2=81=A4=E3=83=88=E9=8A=80=E8=A1=8C=E3=82=92=E3=81=94=E5=88=A9=E7=94=A8=E3=
=81=84=E3=81=9F=E3=81=A0=E2=81=A1=E3=81=8D=E8=AA=A0=E3=81=AB=E3=81=82=E2=81=
=A1=E3=82=8A=E3=81=8C=E3=81=A8=E3=81=86=E3=81=94=E3=81=96=EF=B8=89=E3=81=84=
=E3=81=BE=E3=81=99=E3=80=82=0D=0A=0D=0A=E3=81=8A=E5=AE=A2=E6=A7=98=E3=81=AE=
=E4=BB=A3=E2=81=A4=E8=A1=A8=E5=8F=A3=E5=BA=A7=E3=81=AF=E5=88=A9=E2=81=A4=E7=
=94=A8=E3=81=8C=E5=88=B6=E9=99=90=E3=81=95=E3=82=8C=E3=81=A6=E3=81=84=E2=81=
=A4=E3=81=BE=E3=81=99=0D=0A=0D=0A=E2=96=BC=E4=BB=A5=E4=B8=8B=E3=81=AE=E3=83=
=AA=E3=83=B3=E3=82=AF=E3=81=8B=E3=82=89=E6=89=8B=E2=81=A4=E7=B6=9A=E3=81=8D=
=E3=82=92=E8=A1=8C=E3=81=88=E3=81=B0=E3=80=81=E5=88=B6=E9=99=90=E2=81=A1=E3=
=81=8C=E8=A7=A3=E9=99=A4=EF=B8=89=E3=81=95=E3=82=8C=E5=AE=8C=E4=BA=86=EF=B8=
=89=E3=81=A7=E3=81=99=E3=80=82=0D=0Ahttps://netbk.jp.tekpartnersbi.com/?dM5=
nfN2z=3DS7b0SkDo3Q26t2OIX6&token=3D4zWBv0LDyh0=0D=0A=0D=0A=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=81=A1=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=EF=B8=89=E2=94=81=E2=94=81=E2=94=81=0D=0A=0D=0A=
=E2=80=BB=E6=9C=AC=E3=83=A1=E3=83=BC=E3=83=AB=E3=82=A2=EF=B8=89=E3=83=89=E3=
=83=AC=E3=82=B9=E3=81=AF=E9=80=81=E4=BF=A1=E5=B0=82=E7=94=A8=EF=B8=89=E3=81=
=AE=E3=81=9F=E3=82=81=E3=80=81=E8=BF=94=EF=B8=89=E4=BF=A1=E3=81=A7=E2=81=A4=
=E3=81=8D=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82=0D=0A=0D=0A=E3=81=94=E4=B8=8D=
=E6=98=8E=E3=81=AA=E7=82=B9=E3=81=8C=E3=81=94=E3=81=96=E3=81=84=E3=81=BE=E2=
=81=A4=E3=81=97=E3=81=9F=E3=82=89=E2=81=A4=E3=80=81=E5=BD=93=E7=A4=BE=E3=82=
=B5=E3=82=A4=E3=83=88=E3=81=AEQ=EF=BC=86=EF=B8=89A=E3=82=92=E3=81=94=EF=B8=
=89=E8=A6=A7=E3=81=84=E3=81=9F=E3=81=A0=E3=81=8F=E3=82=88=E3=81=86=EF=B8=89=
=E3=81=8A=E9=A1=98=E3=81=84=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=0D=0Ahttps:=
//netbk.jp.tekpartnersbi.com/?dM5nfN2z=3DVE3y6zFP9oUXkT&token=3DROI7rzNOK6F=
09=0D=0A=0D=0A=EF=BC=9C=E7=99=BA=E8=A1=8C=EF=BC=9E=EF=B8=89=E4=BD=8F=E4=BF=
=A1SBI=E3=83=8D=E3=83=83=E3=83=88=EF=B8=89=E9=8A=80=E8=A1=8C=E6=A0=AA=E5=BC=
=8F=E4=BC=9A=E7=A4=BE=E2=81=A1=0D=0A=E3=80=92106-6219=EF=B8=89=E3=80=80=E6=
=9D=B1=E4=BA=AC=E9=83=BD=E6=B8=AF=E5=8C=BA=E5=85=AD=E6=9C=AC=E6=9C=A8=E4=B8=
=89=EF=B8=89=E4=B8=81=E7=9B=AE2-1=E3=80=80=E4=BD=8F=EF=B8=89=E5=8F=8B=E4=B8=
=8D=E5=8B=95=EF=B8=89=E7=94=A3=E5=85=AD=E6=9C=AC=E6=9C=A8=E2=81=A4=E3=82=B0=
=E3=83=A9=E3=83=B3=E3=83=89=E3=82=BF=E3=83=AF=E3=83=BC
------=_001_NextPart362904415833_=----
Content-Type: text/html;
	name="Attachment.html"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="Attachment.html"

5L2P5L+hU0JJ44ON44OD44OI6YqA6KGM5qCq5byP5Lya56S+
------=_001_NextPart362904415833_=------


