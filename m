Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B557C4345F
	for <ath10k@archiver.kernel.org>; Sun, 14 Apr 2024 00:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:To:From:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lBa1nG96yDw/SidFzySUWtqZQlmALT7ZQA05J6hfDUk=; b=ptMiy5xCL9JB8gDkbN5xakYXyp
	atKhtiDUhf7MIkhdSEQxs9/h5dheN/vmMVvolY7hOAu5Qx+olIZuZU2R0+3aAVT/9wr0xgSPhM9FR
	8aIt+yvrDcRiUXYWg0TNt+48xxxDMdnRHxfPz61BN1I4bDKfjM4dnUdKCMJi8uFVGveLZaYoOp6Oa
	FNsfB5N7HynK2otCrY+I85Vqp3K9WKCoOqvPRc5OiRd+Z9eY1yFTHrPRFa+n8jsfVd/lvww/65hCu
	YfW0oLPaFmsSpaj8qO65Wti/7ytoSiePNmBwUuU7fictvpscDbkEjn4ByupvhM/wj91RLRlAYbHZ/
	GGhXwAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvnMN-00000004EWf-0kkv;
	Sun, 14 Apr 2024 00:04:39 +0000
Received: from v160-251-215-124.kpp1.static.cnode.jp ([2400:8500:2002:3179:160:251:215:124] helo=vm-805d5b38-61.novalocal)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvnMK-00000004EVy-0Vex
	for ath10k@lists.infradead.org;
	Sun, 14 Apr 2024 00:04:37 +0000
Received: from owzhtesk (unknown [64.176.47.47])
	by vm-805d5b38-61.novalocal (Postfix) with ESMTPA id 33CB6A39DF
	for <ath10k@lists.infradead.org>; Sun, 14 Apr 2024 07:09:32 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 vm-805d5b38-61.novalocal 33CB6A39DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wjhnt.com;
	s=default; t=1713049772;
	bh=lBa1nG96yDw/SidFzySUWtqZQlmALT7ZQA05J6hfDUk=;
	h=From:To:Subject:Date:From;
	b=KyrpvXvM/Oxz2F0L8BR9r8Xu9JMUPF2lNjWyPDo8pXYERfp05qhPWT6K4IJH3fXe0
	 vpXX6gMWLV3xK8Z2ebPmdRioqfsVh68uH7URWEmzgETSa1kaw4dcbXzOE1y0ED2ylL
	 8DVK7kqVM6L/V89fwJnQ6WoylWIR+uQe48bjul1A=
Message-ID: <d7f7e62119701230b80fa10219945abc@wjhnt.com>
From: =?utf-8?B?44Kz44Kk44Oz44OB44Kn44OD44Kv5qCq5byP5Lya56S+?= <notification@wjhnt.com>
To: ath10k <ath10k@lists.infradead.org>
Subject: =?utf-8?B?44CQQ29p4oGhbmNo4oGkZWNr44CR77yc4oGk6YeN6KaB77ye?=
	=?utf-8?B?4oGk44Ki44Kr44Km44Oz44OI77iJ44Gu5Yip55So44KS5LiA5pmC5Yi2?=
	=?utf-8?B?6ZmQ44GX4oGh44CB5YaN6ZaL5omL57aa44GN44Gu77iJ6Kit5a6a44KS?=
	=?utf-8?B?6KGM4oGk44GE44G+44GX44Gf77iJ44CC?=
Date: Sun, 14 Apr 2024 08:09:30 +0900
X-Priority: 3
X-Mailer: Jwdgz Ibltr 3.8
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_170436_386893_9E29788A 
X-CRM114-Status: UNSURE (   0.25  )
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

Coinc=E2=81=A1he=E2=81=A1ck=E3=82=92=E3=81=94=E5=88=A9=E2=81=A1=E7=94=A8=E3=
=81=84=E2=81=A4=E3=81=9F=E3=81=A0=E3=81=8D=E3=81=82=E3=82=8A=E3=81=8C=E3=81=
=A8=E3=81=86=E3=81=94=E3=81=96=E2=81=A4=E3=81=84=E3=81=BE=E2=81=A4=E3=81=99=
=E3=80=82=0D=0A=0D=0A=E3=81=8A=E5=AE=A2=E6=A7=98=E3=81=8C Coinc=E2=81=A1hec=
k =E5=88=A9=E7=94=A8=E3=82=92=E5=88=B6=E9=99=90=E2=81=A4=E3=81=97=E3=81=BE=
=E2=81=A4=E3=81=97=E3=81=9F=E2=81=A4=E3=80=81=E3=81=8A=E7=9F=A5=E3=82=89=EF=
=B8=89=E3=81=9B=E3=81=84=EF=B8=89=E3=81=9F=E3=81=97=E3=81=BE=E3=81=99=E3=80=
=82=0D=0A=0D=0A=E2=96=A0=E3=81=8A=E5=95=8F=E3=81=84=E5=90=88=E3=82=8F=E3=81=
=9B=E3=83=95=E2=81=A1=E3=82=A9=E3=83=BC=E3=83=A0=E2=81=A1=0D=0Ahttps://coin=
check.buopd.com/?onetoken=3D31SFsmFI61eLcaRwi&token=3DNTGd7WWD5F7CKcidfO=0D=
=0A=0D=0A=E2=96=A0=E7=B7=8A=E6=80=A5=EF=B8=89=E5=AF=BE=E5=BF=9C=E7=AA=93=E5=
=8F=A3=0D=0ATE=E2=81=A1L: =EF=B8=890570-0262=E2=81=A100=0D=0A=E5=B9=B3=E6=
=97=A5=EF=B8=89=EF=BC=9A=E3=80=8024=E6=99=82=E9=96=93=E5=8F=97=E4=BB=98=EF=
=B8=89=0D=0A=E5=9C=9F=E6=97=A5=E2=81=A1=E7=A5=9D=EF=BC=9A=E5=A4=9C=E9=96=93=
=E3=81=AE=E3=81=BF=E5=8F=97=E4=BB=98=EF=BC=88=E2=81=A118:00=EF=B8=89=EF=BD=
=9E=E7=BF=8C09:00=EF=BC=89=0D=0A=0D=0A----------=EF=B8=89--=EF=B8=89------=
=E2=81=A4----------=EF=B8=89---------=E2=81=A1--------=E2=81=A1----=E2=81=
=A4------=E2=81=A4----=E2=81=A1-----=E2=81=A4--=E2=81=A4-----=E2=81=A4--=EF=
=B8=89----------=EF=B8=89------=E2=81=A4=0D=0A=E3=82=B3=E3=82=A4=E3=83=B3=
=E3=83=81=E3=82=A7=E3=83=83=EF=B8=89=E3=82=AF=E6=A0=AA=E5=BC=8F=E4=BC=9A=E7=
=A4=BE=0D=0A=E3=80=92150-=E2=81=A40044 =E6=9D=B1=E4=BA=AC=EF=B8=89=E9=83=BD=
=E6=B8=8B=E8=B0=B7=E5=8C=BA=E5=86=86=E5=B1=B1=EF=B8=89=E7=94=BA3-6 E=EF=B8=
=89=E3=83=BB=E3=82=B9=E3=83=9A=E3=83=BC=E3=82=B9=E3=82=BF=E3=83=AF=E3=83=BC=
1=E2=81=A40F=0D=0AURL=EF=BC=9Ahttps://coincheck.buopd.com/?faq=3DojOYLM77VL=
IZ2=0D=0A=E3=83=98=E3=83=AB=E2=81=A1=E3=83=97=E3=82=BB=E3=83=B3=E3=82=BF=E3=
=83=BC=E2=81=A1=EF=BC=9Ahttps://coincheck.buopd.com/?faq=3Dc4Ly0352=0D=0A=
=E6=9A=97=E5=8F=B7=E8=B3=87=E7=94=A3=E4=BA=A4=E6=8F=9B=E6=A5=AD=E7=99=BB=E9=
=8C=B2=E3=80=80=EF=B8=89=E9=96=A2=E6=9D=B1=E8=B2=A1=E5=8B=99=E5=B1=80=E9=95=
=B7 =E2=81=A1=E7=AC=AC000=E2=81=A414=E5=8F=B7=0D=0A=E5=8A=A0=E5=85=A5=E5=8D=
=94=E4=BC=9A=E3=80=80=E4=B8=80=E8=88=AC=E7=A4=BE=E5=9B=A3=E2=81=A4=E6=B3=95=
=E4=BA=BA=E2=81=A4=E6=97=A5=E6=9C=AC=E6=9A=97=E5=8F=B7=E8=B3=87=E7=94=A3=E5=
=8F=96=EF=B8=89=E5=BC=95=E6=A5=AD=E5=8D=94=E4=BC=9A=0D=0A---------=E2=81=A1=
-----=EF=B8=89--=EF=B8=89----=E2=81=A4----------=EF=B8=89--=E2=81=A1-----=
=E2=81=A4-------=E2=81=A1---------=E2=81=A4------=E2=81=A4--------=EF=B8=89=
---=E2=81=A4-------=E2=81=A1--------=E2=81=A4----=EF=B8=89


