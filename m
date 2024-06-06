Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E257C27C52
	for <ath10k@archiver.kernel.org>; Thu,  6 Jun 2024 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8mnSEIYqggUWcHFTXPju1sHa37nDth3iQjJCYgWd7es=; b=OgkZoXyOpLAlQYpx+VqVQ3BGVk
	XIj72tJQMTEHW1lT292T+qxgn5v77hR218Zygs8cJbZ08QskdnV8ZuyOYRo5qXSgpNeJGXy9IIrHM
	V5S/cNLDAs8R/fsdGXTJs13cyykwv4j8tCCbYlRfTNH1OLT3TpQnVkCbMAqUmGfF6uD7eUIHTR7PQ
	FQpWfD8qvcRQUW+/caGKeAiDttuUA5awCA2jxtx6IzsTOkuwX5gM45I6pLJsdM9UwdB538WTGy+ho
	sRtsOuY0OYzAVjl/mWzYbW5wOFe83jEZgovP08RwFwsgYPY6bUc3DI3nkTnC0F6eQoDGrjJ/9VTfx
	1MuY+M+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFIJA-0000000B2Th-1mTF;
	Thu, 06 Jun 2024 18:57:56 +0000
Received: from [137.220.228.123] (helo=mail0.alpqx.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFIJ6-0000000B2ST-23ns
	for ath10k@lists.infradead.org;
	Thu, 06 Jun 2024 18:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=alpqx.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=no-reply@alpqx.com;
 bh=8mnSEIYqggUWcHFTXPju1sHa37nDth3iQjJCYgWd7es=;
 b=gObgXT37yaGpVIhJ0I2Ir0ddRSyusF8Cqo5nao8B3KD0E27pMDOfN6dHsnt6qplaJjR79uXn92JH
   49Ps3Xdg9mxyoNmqH+uUynZxI4orSF9jxVA1hjLTXkohnojsvCbtKOO2qynFzIhTQ7TidQlOTju9
   q8x+3UxcZ7qQvT2TVew=
From: =?utf-8?Q?=E8=87=AA=E5=8B=95=E3=83=A1=E3=83=BC=E3=83=AB=E9=80=9A=E7=9F=A5?= <no-reply@alpqx.com>
To: "=?utf-8?Q?ath10k@lists.infradead.org?=" <ath10k@lists.infradead.org>
Subject: =?utf-8?Q?=E3=80=90_=E4=B8=89=E4=BA=95=E4=BD=8F=E5=8F=8B?=
	=?utf-8?Q?=E3=82=AB=E3=83=BC=E3=83=89_=E3=80=91=E6=B1=BA=E6=B8=88?=
	=?utf-8?Q?=E5=AE=8C=E4=BA=86=E3=81=AE=E3=81=8A=E7=9F=A5=E3=82=89?=
	=?utf-8?Q?=E3=81=9B?=
Date: Fri, 07 Jun 2024 02:47:38 +0800
Message-ID: <OOFIPIGPOHLJOEBPGODJMKMEHKGJ.no-reply@alpqx.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MSMail-Priority: Normal
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_115753_012998_C68AC0BD 
X-CRM114-Status: UNSURE (  -0.24  )
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

=E4=B8=89=E4=BA=95=E4=BD=8F=E5=8F=8B=E3=82=AB=E3=83=BC=E3=83=89=E3=82=AF=E3=
=83=A9=E3=82=B7=E3=83=83=E3=82=AF=E2=80=BB=E4=BC=9A=E5=93=A1=0D=0A=0D=0A=E3=
=81=93=E3=81=AE=E3=81=9F=E3=81=B3=E3=81=AF=E4=B8=89=E4=BA=95=E4=BD=8F=E5=8F=
=8B=E3=82=AB=E3=83=BC=E3=83=89=E3=82=92=E3=81=94=E5=88=A9=E7=94=A8=E3=81=84=
=E3=81=9F=E3=81=A0=E3=81=8D=E3=80=81=E8=AA=A0=E3=81=AB=E3=81=82=E3=82=8A=E3=
=81=8C=E3=81=A8=E3=81=86=E3=81=94=E3=81=96=E3=81=84=E3=81=BE=E3=81=99=E3=80=
=82=0D=0A=E6=98=A8=E6=97=A5=E3=80=81=E3=81=8A=E5=AE=A2=E6=A7=98=E3=81=AE=E3=
=82=AF=E3=83=AC=E3=82=B8=E3=83=83=E3=83=88=E3=82=AB=E3=83=BC=E3=83=89=E3=81=
=A7=E6=B6=88=E8=B2=BB=E6=94=AF=E5=87=BA=E3=81=8C=E7=99=BA=E7=94=9F=E3=81=97=
=E3=81=9F=E3=81=93=E3=81=A8=E3=82=92=E3=81=8A=E7=9F=A5=E3=82=89=E3=81=9B=E3=
=81=84=E3=81=9F=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=0D=0A=E3=81=9D=E3=81=AE=
=E6=94=AF=E6=89=95=E3=81=84=E3=81=AE=E8=A9=B3=E7=B4=B0=E3=81=AF=E6=AC=A1=E3=
=81=AE=E3=81=A8=E3=81=8A=E3=82=8A=E3=81=A7=E3=81=99=E3=80=82=0D=0A  =E3=81=
=94 =E5=88=A9 =E7=94=A8 =E6=97=A5 =E6=99=82 =EF=BC=9A 2024=E5=B9=B46=E6=9C=
=886=E6=97=A5 18:49=0D=0A  =E3=81=94 =E5=88=A9 =E7=94=A8 =E5=A0=B4 =E6=89=
=80 =EF=BC=9A =E5=8D=83=E4=BB=A3=E7=94=B0=E4=B8=80=E3=83=84=E6=A9=8B 3 =E4=
=B8=81=E7=9B=AE=E5=BA=97 ( =E3=82=BB =E3=83=96 =E3=83=B3 =E3=82=A4 =E3=83=
=AC =E3=83=96 =E3=83=B3 )=0D=0A  =E3=81=94 =E5=88=A9 =E7=94=A8 =E9=87=91 =
=E9=A1=8D =EF=BC=9A 17530 =E5=86=86=0D=0A=0D=0A=E3=82=AB=E3=83=BC=E3=83=89=
=E3=82=92=E4=BD=BF=E7=94=A8=E3=81=97=E3=81=9F=E8=A6=9A=E3=81=88=E3=81=8C=E3=
=81=AA=E3=81=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E4=BB=A5=E4=B8=8B=E3=81=
=AE=E3=83=AA=E3=83=B3=E3=82=AF=E3=82=92=E3=82=AF=E3=83=AA=E3=83=83=E3=82=AF=
=E3=81=97=E3=81=A6=E3=82=AF=E3=83=AC=E3=82=B8=E3=83=83=E3=83=88 =E3=82=AB=
=E3=83=BC=E3=83=89=E6=94=AF=E6=89=95=E3=81=84=E3=81=AE=E6=89=BF=E8=AA=8D=E3=
=82=92=E3=82=AD=E3=83=A3=E3=83=B3=E3=82=BB=E3=83=AB=E3=81=97=E3=81=A6=E3=81=
=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=0D=0Ahttps://annarborhealthcare.com=
=0D=0A=0D=0A=E4=B8=89 =E4=BA=95 =E4=BD=8F =E5=8F=8B NET=E3=81=AB=E3=81=94=
=E7=99=BB=E9=8C=B2=E3=81=84=E3=81=9F=E3=81=A0=E3=81=84=E3=81=A6=E3=81=84=E3=
=82=8B=E3=83=A1=E3=83=BC=E3=83=AB=E3=82=A2=E3=83=89=E3=83=AC=E3=82=B9=E3=81=
=B8=E3=81=8A=E7=9F=A5=E3=82=89=E3=81=9B=E3=81=99=E3=82=8B=E3=82=B5=E3=83=BC=
=E3=83=93=E3=82=B9=E3=81=A7=E3=81=99=E3=80=82=0D=0A------------------------=
-----------=0D=0A=E2=96=A0 =E7=99=BA =E8=A1=8C =E8=80=85 =E2=96=A0=0D=0A=E4=
=B8=89=E4=BA=95=E4=BD=8F=E5=8F=8B=E3=82=AB=E3=83=BC=E3=83=89=E6=A0=AA =E5=
=BC=8F =E4=BC=9A =E7=A4=BE=0D=0A=E3=80=92135-0061 =E6=9D=B1=E4=BA=AC=E9=83=
=BD=E6=B1=9F=E6=9D=B1=E5=8C=BA=E8=B1=8A=E6=B4=B22=E4=B8=81=E7=9B=AE2=E7=95=
=AA31=E5=8F=B7


